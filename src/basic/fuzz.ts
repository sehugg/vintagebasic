
import { BASICParser, DIALECTS, BASICOptions, CompileError } from "./compiler";
import { BASICRuntime, InputResponse, RuntimeError } from "./runtime";

process.on('unhandledRejection', (reason, promise) => {
    console.log('Unhandled Rejection at:', promise, 'reason:', reason);
// Application specific logging, throwing an error, or other logic here
});

export function fuzz(buf) {
    var parser = new BASICParser();
    var str = buf.toString();
    try {
        var pgm = parser.parseFile(str, "test.bas");
        var runtime = new BASICRuntime();
        runtime.load(pgm);
        runtime.reset();
        runtime.print = (s) => {
            if (s == null) throw new Error("PRINT null string");
        }
        runtime.input = function(prompt: string, nargs: number) : Promise<InputResponse> {
            var p = new Promise<InputResponse>( (resolve, reject) => {
                var arr = [];
                for (var i=0; i<Math.random()*10; i++)
                    arr.push(i+"");
                resolve({vals:arr, line:arr.join(' ')});
            });
            return p;
        }
        for (var i=0; i<50000; i++) {
            if (!runtime.step()) break;
        }
        if (Math.random() < 0.001) runtime.load(pgm);
        for (var i=0; i<50000; i++) {
            if (!runtime.step()) break;
        }
    } catch (e) {
        if (e instanceof CompileError) return;
        if (e instanceof RuntimeError) return;
        throw e;
    }
}
