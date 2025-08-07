import { login, Status, MastoClient } from 'masto';
import { fromEvent } from 'rxjs';
import { BASICParser, BASICProgram } from '../basic/compiler';
import { BASICRuntime, InputResponse } from '../basic/runtime';
import { htmlToText } from 'html-to-text';

// need a file tokens.json with { "apitoken": "..." }
const TOKEN = JSON.parse(require('fs').readFileSync('tokens.json')).apitoken;

const MAX_ITERS = 1000000;
const MAX_CHARS = 450;
const MAX_LINES = 5;

function splitURL(url: string) {
  // e.g.: https://botsin.space/@basicbot
  let arr = url.split('/');
  return `${arr[3]}@${arr[2]}`;
}

function extractText(status: Status) {
  var data = htmlToText(status.content);
  var pos = data.indexOf(']');
  if (pos > 0) {
    data = data.substring(pos + 1).trim();
  }
  return data;
}

var waitingIds : {[id: string] : ProgramSession} = {};

class ProgramSession {
  runtime = new BASICRuntime();
  filename = 'program.bas'; // TODO?
  program: BASICProgram | null;
  output: string = '';
  lastRecv: Status = null;
  lastSent: Status = null;
  inputPromise = null;
  inputCallback: (value: InputResponse) => void = null;

  constructor(
    public masto: MastoClient,
    public initialStatus: Status) {
      this.lastRecv = initialStatus;
  }

  getCurrentLabel() {
    var loc = this.runtime.getCurrentSourceLocation();
    return loc ? loc.label : "?";
  }

  runProgram(text: string) {
    var parser = new BASICParser();
    try {
      this.program = parser.parseFile(text, this.filename);
    } catch (e) {
      console.log(e);
    }
    if (!this.program || parser.errors.length) {
      var errmsg = '?ERROR\n';
      parser.errors.forEach((err) => errmsg += (`${err.msg} (line ${err.label})\n`));
      this.send(this.initialStatus, errmsg);
    } else {
      this.setup();
      this.resume();
    }
  }

  respondWithInput(answer: string) {
    if (this.inputCallback) {
      if (this.lastSent) {
        delete waitingIds[this.lastSent.id];
      }
      var line = answer.toUpperCase();
      var vals = line.split(',');
      //console.log(">>>",vals);
      let iresponse = {line, vals};
      console.log('RESPONSE: ', iresponse);
      this.inputCallback(iresponse);
    }
  }

  setup() {
    this.runtime.print = (s: string) => {
      this.output += s;
    }
    this.runtime.input = async (prompt: string, nargs: number) => {
      this.output += prompt + "\n?";
      this.inputPromise = new Promise<InputResponse>((resolve, reject) => {
        this.inputCallback = resolve;
      });
      return this.inputPromise;
    }
    this.runtime.resume = this.resume.bind(this);

    try {
      this.runtime.load(this.program);
      this.runtime.reset();
    } catch (e) {
      this.send(this.initialStatus, `?ERROR: ${e.message} (line ${this.getCurrentLabel()})`);
    }
  }

  async resume() {
    if (this.runtime.exited) {
      console.log('?EXITED');
      return;
    } else {
      console.log('resuming at', this.runtime.getCurrentLabel());
    }
    try {
      for (let iter = 0; iter < MAX_ITERS; iter++) {
        if (!this.runtime.step()) {
          break;
        }
        if (this.output.length > MAX_CHARS) {
          this.output += "...";
          break;
        }
      }
      if (this.output) {
        let sent = await this.send(this.lastRecv, this.output);
        this.output = '';
        if (!this.runtime.exited) {
          waitingIds[sent.id] = this;
        }
      }
    } catch (e) {
      this.send(this.lastRecv, `?ERROR: ${e.message} (line ${this.getCurrentLabel()})`);
    }
  }

  async send(status: Status, text: string) {
    let senderhandle = splitURL(status.account.url);
    console.log('SENDING: ' + senderhandle);
    let sent = await this.masto.statuses.create({
      inReplyToId: status.id,
      spoilerText: text.split('\n').length > MAX_LINES ? "BASIC program output" : null,
      status: senderhandle + ' ' + text,
      visibility: status.visibility || 'direct',
    });
    console.log('SENT: ' + sent.uri + "\n" + text + "\n---\n");
    this.lastSent = sent;
    return sent;
  }
}

async function runProgram(masto: MastoClient, status: Status) {
  let data = extractText(status);
  console.log('RECV: ' + status.uri + '\n' + data + '\n---\n');
  let session = new ProgramSession(masto, status);
  session.runProgram(data);
}

async function respondToProgram(masto: MastoClient, status: Status) {
  let replyId = status.inReplyToId;
  if (!replyId) return;
  let session = waitingIds[replyId];
  if (!session) return;
  let data = extractText(status);
  console.log('RESPOND: ' + status.uri + '\n' + data + '\n---\n');
  session.lastRecv = status;
  session.respondWithInput(data);
}

const main = async () => {
  const masto = await login({ url: 'https://botsin.space', accessToken: TOKEN });
  const timeline = await masto.stream.streamUser();
  console.log("awaiting stream");

  const update$ = fromEvent<Status>(timeline, 'update');

  update$.subscribe((status) => {
    if (status.application?.name != 'BasicBOT') {
      if (status.inReplyToId) {
        respondToProgram(masto, status);
      } else {
        runProgram(masto, status);
      }
    }
  });
};

main().catch((error) => {
  throw error;
});

