# Vintage BASIC

[Try it online at 8bitworkshop.com](https://8bitworkshop.com/redir.html?platform=basic)

## Usage

~~~sh
npm run build
node gen/basic/run.js test/presets/hello.bas 
~~~

## Test Suite, Fuzzer

~~~sh
npm run test
npm run fuzzbasic
~~~

## Example

~~~basic
OPTION DIALECT DARTMOUTH
10 PRINT "HELLO! LET'S PROGRAM IN BASIC."
20 INPUT "WOULD YOU MIND TYPING IN YOUR NAME";A$
30 PRINT "THANKS, ";A$;"! THIS WILL BE FUN!"
40 INPUT "NOW TELL ME YOUR FAVORITE NUMBER";N
50 LET B=N^2
60 PRINT "THAT'S A GOOD ONE! I LIKE";B;"MYSELF."
70 PRINT "NICE MEETING YOU, ";A$;"."
999 END
~~~

Note the OPTION DIALECT line at the beginning of the file.  This is a
non-standard BASIC construct that tells the compiler to recognize a specific
variant of BASIC.  This affects syntax, allowable keywords and functions,
and print formatting.  Older dialects will limit the editor to uppercase
characters.

# BASIC Interpreter

## Dialects

The 8bitworkshop IDE supports several flavors of BASIC.
The BASIC dialect can be selected with the `OPTION DIALECT` statement,
which should be the first line in your program.
There are several dialects supported:

DARTMOUTH, DARTMOUTH4
: BASIC 4th Edition or "the Fourth" (1968) ran on the
  [Dartmouth BASIC Time Sharing System](https://en.wikipedia.org/wiki/Dartmouth_Time_Sharing_System).
  It's the ancestor of most of the other BASICs in this list.
  We support everything except the `MAT` (matrix math) statements and multiline function definitions.

DECPLUS, BASICPLUS
: DEC BASIC-PLUS (1972).
  This was an extended riff on Dartmouth BASIC written for PDP-11 systems running RSTS/E.
  We support the `GOTO` *expr* `OF` *line, line...* syntax, but not the other extended flow control directives like `PRINT I IF I > 10`.
  There are some other quirks not supported, like the "`&`" symbol substituted for a `PRINT` statement,
  and the `PRINT USING` statement (used for numeric formatting).

TINY
: Tiny BASIC (1975) was a stripped-down integer-only interpreted BASIC (though we allow floats in our interpretation).
  It was designed as a [freely-available implementation](https://en.wikipedia.org/wiki/Tiny_BASIC)
  in response to Bill Gates' "[Open Letter To Hobbyists](https://en.wikipedia.org/wiki/Open_Letter_to_Hobbyists)," and led to the coining of the term "copyleft".
  The first version was published in the [PCC (People's Computer Company) newsletter](https://archive.computerhistory.org/resources/access/text/2017/09/102661095/102661095-05-v4-n2-acc.pdf),
  which spun off a new periodical to publish source code -- Dr. Dobb's Journal.
  To make reimplementation easier, the parser was written in a bytecode language called [IL](https://en.wikipedia.org/wiki/Tiny_BASIC#Implementation_in_a_virtual_machine).

HP, HPTSB, HP2000
: HP Time-Shared BASIC (1976).
  The games in *[What To Do After You Hit Return](https://archive.org/details/Whattodoafteryouhitreturn)*
  were written in this dialect, which supports a unique array-slice syntax for strings.
  Many BASIC games were ported to this dialect, including a popular
  [cross-country pioneer simulation](https://www.filfre.net/2011/04/on-the-trail-of-the-oregon-trail-part-4/).

ALTAIR41, ALTAIR
: MITS Altair 8800 BASIC 4.1 (1977), Microsoft's first product.
  [David Ahl](http://www.vintage-basic.net/games.html) liked this one, so many classic games should work with it.

BASIC80
: Microsoft's BASIC-80 (1977) for Z80 and 8080 CPUs.
  It ran on CP/M and later became TRS-80 Level III BASIC.
  This introduced the `WHILE ... WEND` syntax which persisted all the way to Visual BASIC.

ECMA55, MINIMAL
: Minimal BASIC (1978) was an attempt to define an interoperable BASIC standard.
  Microsoft BASICs were becoming the de-facto standard, so it was ultimately withdrawn,
  although the ANSI standard remains.
  It is very similar to Dartmouth BASIC 4th edition, except without the CHANGE command,
  assignment chaining, and tick (') comments.
  
MODERN
: A fictional BASIC which pulls out all of the stops, which is to say it doesn't explicitly disallow anything without a good reason.
  Some things are disallowed, like using a variable before assignment, or using an array before dimensioning.
  Labels are supported, and line numbers are optional.
  Block IF/THEN/ELSE is supported, as are subroutines with SUB/CALL.


## Examples

The [8bitworkshop IDE](https://8bitworkshop.com/redir.html?platform=basic)
includes many examples of classic BASIC programs.
Some of these are historically relevant and reproduced from the original source code.

[Hello World](https://8bitworkshop.com/redir.html?platform=basic&file=hello.bas)
: This is a simple "conversational program" which simulates a short dialogue
  between human and computer.
  At the time, this type of program was a disarming introduction to computers for those who have never seen one.
  It demonstrates the `PRINT` and `INPUT` commands, string variables, and the `^` exponentiation operator.

[Lander](https://8bitworkshop.com/redir.html?platform=basic&file=lander.bas)
: A lunar (or Earth) powered descent simulator, originally written in DEC's FOCAL language by a high-school student in 1969.
  He submitted it to DEC's newsletter where the editor David H. Ahl translated it into BASIC.
  (Benj Edwards wrote up a [great article](https://www.technologizer.com/2009/07/19/lunar-lander/) about it.)
  At each time step, the player enters a quantity of fuel to burn, and downward velocity slows proportionally.
  The goal is to reach near-zero velocity at the surface without running out of fuel.
 
[Hammurabi](https://8bitworkshop.com/redir.html?platform=basic&file=hamurabi.bas)
: Another early David Ahl conversion, from FOCAL program to the EduSystem 70 (PDP-8)
  and later to Microsoft BASIC.
  This version was found at [Pete Turnbull's web site](http://www.dunnington.info/public/basicgames/).

[23 Matches](https://8bitworkshop.com/redir.html?platform=basic&file=23match.bas)
: A simple [Nim-like](https://en.wikipedia.org/wiki/Nim) game, where the last player to take an object loses, and the computer plays perfectly.
  David Ahl's version added computer trash-talking, with insults like "meatball-nose" and "floppy ears."
  Our version from the 1973 DEC EduSystem Handbook is more polite.

[Hunt the Wumpus](https://8bitworkshop.com/redir.html?platform=basic&file=wumpus.bas)
: The classic (only?) dodecahedronal hunting game, written by Gregory Yob in 1973
  as a response to the many two-dimensional games like Mugwump.
  This is a version from [HP library tapes](http://www.dunnington.info/public/basicgames/).
  It implores: `IF YOU DON'T KNOW WHAT A DODECAHEDRON IS, ASK SOMEONE`.

[Craps](https://8bitworkshop.com/redir.html?platform=basic&file=craps.bas)
: A gambling simulator adapted for "GTE Sylvania 1974 Family Day" found on a [tape backup](http://www.bitsavers.org/bits/HP/paperTapes/JeffM/).
  This must have been part of a demonstration where families were present, since `NO PROFANITY!` is requested.
  One wonders what the non-censored version of the program was like.
  
[Star Trader](https://8bitworkshop.com/redir.html?platform=basic&file=startrader.bas)
: Dave Kaufman's 1974 multiplayer space trading game, which (along with [another text-based space game](http://www.dunnington.info/public/startrek/index.html))
  inspired a genre that now includes *Elite*, *Trade Wars* and *Eve Online*.
  The game was so big that it had to be split into multiple files, linked with the `CHAIN` command.
  Our BASIC interpreter doesn't support that, so we renumbered and combined everything into a single file,
  and made a few other changes since we don't support `PRINT USING` either.
  This game was published in the People's Computing Company's newsletter and in their 1975 compendium
  *[What To Do After You Hit Return](https://archive.org/details/Whattodoafteryouhitreturn)*.

[Interest Calculator](https://8bitworkshop.com/redir.html?platform=basic&file=mortgage.bas)
: A simple HP BASIC program from 1977 that computes interest payments.
  Soon, VisiCalc and other spreadsheet software would largely replace BASIC programming for these kinds of tasks.
  
[Haunted House](https://8bitworkshop.com/redir.html?platform=basic&file=haunted.bas)
: A silly and spooky adventure game from 1979, found on an old DEC tape backup.

[Sieve Benchmark](https://8bitworkshop.com/redir.html?platform=basic&file=sieve.bas)
: This is an implementation of the [Byte Sieve](https://en.wikipedia.org/wiki/Byte_Sieve),
  a popular Sieve of Eratosthenes benchmark published in a 1981 issue of BYTE magazine.
  Our implementation uses the `OPTION CPUSPEED MAX` command to run much faster than the
  interpreter's default of 1,000 statements per second.
  Initial cocktail napkin simulations show that we run at about 30% the speed of [John Ham's Minimal BASIC to x86 Compiler](https://buraphakit.sourceforge.io/BASIC.shtml).





## Statements

`CHANGE`
: Convert a string to an array of character codes, or vice-versa.
  Not available in all dialects.

`CLEAR`
: Clears all variables, arrays, and function definitions.

`DATA` datum, datum...
: Creates data elements to be read back serially by READ.
  Elements are separated by commas, and can be numeric, or quoted or unquoted strings.
  (Compatibility issue: Whitespace is not trimmed on unquoted strings.)

`DEF FN`a`(`arg, arg...`)` = definition
: Defines a function with zero or more arguments.
  The function name must start with `FN`.
  The function body cannot call itself, although the compiler doesn't check to see if functions call each other recursively.

`DIM` varname `(` dim1, dim2... `)`
:  Reserves space for arrays.
   Unless declared otherwise, all array subscripts shall have a
   lower bound of zero and an upper bound of ten. Thus the default
   space allocation reserves space for 11 elements in one-dimensional arrays and 121 elements in two-dimensional arrays.
   In HP dialect, strings are allocated using the `DIM` statement.

`END`
:  Terminates the program.
   In MINIMAL and HP dialects, an `END` must be the final statement in the program.

`FOR` varname `=` initial `TO` final `STEP` step
: Declares a FOR loop, terminated by a NEXT statement.
  The numeric variable *varname* is set to *initial* before the first loop iteration. 
  After each iteration, the variable is incremented by *step* (which can be negative) and then checked against *final*.
  The loop is repeated until the value is equal to or goes beyond the final value.
  In some dialects, this check is done before the first iteration, and so zero iterations are possible.

`NEXT` varname, varname...
: Ends a FOR loop. In some dialects, *varname* is optional, and multiple variables can be specified.

`GOTO` label
: Transfers control of the program to a specified line number or label.
  In some dialects, this can be a computed value.

`GOSUB` label ... `RETURN`
: Like `GOTO`, but pushes the program counter onto a return stack.
  `RETURN` pops the topmost value off this stack and resumes execution.

`IF` condition [ `THEN` statement | `GOTO` label ] `ELSE` statement
: If *condition* is non-zero, execute the statements after THEN,
  or transfer control to the label after the GOTO.
  In some dialects, ELSE can be specified, which binds to the rightmost THEN.

`INPUT` prompt? `,` ref `,` ref ...
: Pauses and accepts input from the keyboard.
  A quoted string *prompt* can be present.
  In any case, a "?" is printed before pausing for input.
  Each *ref* can be a simple variable or array element, numeric or string.
  If multiple values are specified, they are separated by commas before being accepted.

`LET` ref `=` expression
: Assigns a computed expression to a variable, which can be a simple variable or array reference.
  The `LET` can be ommitted in most dialects.
  In HP dialect, the left side can be an array slice for strings.

`ON` index [ `GOTO` | `GOSUB` ] label1, label2 ...
: Computes *index* and uses it to select one or more labels to GOTO or GOSUB.
  The value 1 specifies the first label, 2 the second, etc.
  Some dialects silently ignore out-of-bounds values.

`OPTION BASE` [ 0 | 1 ]
: Selects whether arrays start at 0 or 1.
  The DIM statement specifies the highest valid index regardless of this setting.

`OPTION DIALECT` identifier
: Selects a BASIC dialect to use for parsing and running the program.

`OPTION CPUSPEED` [ number | `MAX` ]
: Sets the simulated BASIC interpreter speed in statements per second, or MAX for maximum speed.

`OPTION` name value
: Set other dialect options -- see the [table](#dialectfeaturematrix) below.
  For example, `OPTION UPPERCASEONLY 0` enables lowercase on mainframe dialects.

`PRINT` expression [ `,` | `;` ] [ expression ... ]
: Prints to the output.
  Each expression can be numeric or string.
  If numeric, most dialects put whitespace before and after the value, or a minus sign before.
  A comma separates expressions by tab groups, defined by the dialect, and usually 14-16 characters long.
  A semicolon places no extra whitespace between expressions.
  A new line is generated after the PRINT statement unless it ends with a comma or semicolon.

`RANDOMIZE`
: Initialize the `RANDOM` number generator with a random seed.
  The `RND` function returns a predictable sequence of numbers until this statement is executed.
  This is consistent with the ECMA-55 standard.

`READ` ref `,` ref ...
: Reads data serially from DATA statements in the program.

`RESTORE` label
: Resets the data pointer used by READ to the first DATA statement.
  Some dialects allow a label to be specified.

`STOP`
: Halts the program.

`WHILE` condition ... `WEND`
: Executes a loop as long as *condition* is non-zero.
  Only in BASIC80 and MODERN dialects.


## Numeric Functions

`ABS(X)`
: The absolute value of X, i.e., if X < 0 then return -X.

`ATN(X)`
:                The arctangent of X in radians, i.e., the angle
                 whose tangent is X. The range of the function
                 is
                        `-(pi/2) < ATN(X) < (pi/2)`

`COS(X)`
:                 The cosine of X, where X is in radians.

`EXP(X)`
:                 The exponential of X, i.e., the value of the
                  base of natural logarithms (e = 2,71828...)
                  raised to the power X.

`INT(X)`
:                 The largest integer not greater than X; e.g.
                  `INT(1.3)` = 1 and `INT(-1.3)` = -2.

`LOG(X)`
:                 The natural logarithm of X; X must be greater
                  than zero.

`RND`
:                 The next pseudo-random  number in an
                  implementation-supplied sequence of pseudo-random
                  numbers uniformly distributed in the range 
                  0 <= `RND` < 1.

`SGN(X)`
:                 The sign of X: -1 if X < 0, 0 if X = 0 and
                  +1 if X > 0.

`SIN(X)`
:                 The sine of X, where X is in radians.

`SQR(X)`
:                 The nonnegative square root of X; X must be
                  nonnegative.

`TAN(X)`
:                 The tangent of X, where X  is in radians.

`FIX(` num `)`
: Returns the integer part of the *num* argument, rounding up to zero if negative or down to zero if positive.

`INT(` num `)`
: Rounds down to an integer (floor).

`RND`
: Returns a random number.
  The sequence is repeatable unless RANDOMIZE has been executed.

`ROUND(` num `)`
: Rounds to the nearest integer.


## String Functions

`ASC(` string `)`
: Returns the character code of the leftmost character of *string*.

`CHR$(` num `)`
: Converts a character code to a single-character string.
  Try 9 (tab), 10 (line feed), 12 (form feed) and 7 (bell).

`HEX$(` num `)`
: Converts a number to its hexidecimal notation.

`INSTR(` needle `,` haystack `)`
: Returns the position of substring *needle* in the string *haystack*, or 0 if not found.

`INSTR(` index `,` needle `,` haystack `)`
: Returns the position of substring *needle* in the string *haystack* starting at *index*, or 0 if not found.

`LEFT$(` string `,` count `)`
: Returns the leftmost *count* characters of a string.

`LEN(` string `)`
: Returns the length of a string.

`LIN(` count `)`
: Returns *count* line feeds for use in PRINT statements.

`MID$(` string `,` index `,` count `)`
: Returns *count* characters from *string*, starting at character *index* (1 is the leftmost character).

`OCT$(` num `)`
: Converts a number to its octal representation.

`POS`
: Returns the current column position of the printed output.

`RIGHT$(` string `,` count `)`
: Returns the rightmost *count* characters of a string.

`SPC(` count `)`
: Returns a string of *count* space characters, for use in PRINT statements.

`SPACE$(` count `)`
: Returns a string of *count* space characters.

`STR$(` num `)`
: Converts *num* to its string representation.

`STRING$(` count `,` char `)`
: Returns a string of *count* repetitions of *char*, which can be either a numeric character code or another string.

`TAB(` column `)`
: Returns the number of spaces neccessary to advance to a given column, or an empty string if already past the desired column.
  For use in PRINT statements.

`TIMER`
: Returns the number of seconds since a reference time.

`UPS$(` string `)`
: Converts *string* to uppercase.

`VAL(` string `)`
: Converts a string value to a numeric.


## Compatibility

The IDE's BASIC compiler doesn't emulate each dialect exactly.
However, there is a rich tradition in BASIC of porting programs from one dialect to another,
so for maximum verisimilitude you should try it yourself.
Here are some of the issues that might pop up:

`MAT` keyword and matrix operations
: Not supported.
  A lot of games only use this feature to read in arrays of data, which can be easily done with loops.

`CHAIN`
: For BASIC programs too big to fit into memory, this was a primitive way to pass variables between them (with the `COM` declaration).
  Instead, you can renumber and merge the files by hand.

`PRINT USING` and `IMAGE`
: Dartmouth BASIC Sixth Edition introduced powerful numeric formatting features similar to that of FORTRAN.
  However, this is not implemented.
  You can use the `NFORMAT$` and string functions as a substitute.

`ENTER`
: On HP BASIC, the `ENTER` statement doesn't time out, or allow a `#` port variable.
  But it does return how fast it took for you to type.

`CONVERT`
: The HP BASIC `CONVERT` command can't assign to array slices.

`ON ERROR GOTO`
: Error trapping is not supported.

`THEN` clauses
: All BASICs support the `IF` *condition* `THEN` *statement* syntax,
  even though early BASICs only supported a `GOTO` line number.

`PRINT` separators
: If there is no delimiter between items, ";" is assumed.
  
No integer types
: Only floating point and string types (`A$`) are supported, just like in JavaScript.
  Integer (`I%`) types are not supported.

Relational operators anywhere
: Many BASICs only let you use relational operators in an IF statement.
  We allow them anywhere, and return a logical value of 0 for false and 1 for true --
  or -1 for true when bitwise logic operators are supported.

No file support
: Can't open, read, write files.

Error messages
: Our error messages may be at times better or worse than actual vintage BASIC systems.
  They are certainly more verbose overall.

Out-of-order line numbers
: If line 200 comes before line 100 in the file, line 200 will be executed first.
  No error will be given for out-of-order line numbers.
  You also can't jump to a line number that doesn't exist, like in some interpreted BASICs.

Multiple-line function definitions
: Dartmouth BASIC 4th Edition supported complex multiline functions with a `DEF ... FNEND` block.
  We only support simple mathematical functions.

Embedded character codes
: Strings in HP BASIC do not support embedded character codes like `"RING"'7"RING"`.


## Dialect Feature Matrix

dialectName                   |TINY     |ECMA55   |DARTMOUTH|HP2000   |DECPLUS  |ALTAIR41 |BASIC80  |MODERN   
------------------------------|---------|---------|---------|---------|---------|---------|---------|--------
asciiOnly                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |-        
uppercaseOnly                 |Y        |Y        |Y        |Y        |-        |Y        |-        |-        
optionalLabels                |-        |-        |-        |-        |-        |-        |-        |Y        
optionalWhitespace            |-        |-        |-        |-        |-        |Y        |Y        |-        
multipleStmtsPerLine          |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
varNaming                     |A        |A1       |A1       |A1       |A1       |*        |*        |*        
staticArrays                  |-        |Y        |Y        |Y        |Y        |-        |-        |-        
sharedArrayNamespace          |Y        |Y        |-        |-        |-        |Y        |Y        |-        
defaultArrayBase              |0        |0        |0        |1        |0        |0        |0        |0        
defaultArraySize              |0        |11       |11       |11       |11       |11       |11       |0        
defaultValues                 |Y        |-        |-        |-        |Y        |Y        |Y        |-        
stringConcat                  |-        |-        |-        |-        |Y        |Y        |Y        |Y        
maxDimensions                 |0        |2        |2        |2        |2        |128      |255      |255      
maxDefArgs                    |255      |255      |255      |255      |255      |255      |255      |255      
maxStringLength               |255      |255      |255      |255      |255      |255      |255      |2048     
tickComments                  |-        |-        |Y        |-        |Y        |-        |Y        |Y        
hexOctalConsts                |-        |-        |-        |-        |-        |-        |Y        |Y        
validKeywords                 |11       |26       |31       |31       |39       |44       |51       |all      
validFunctions                |0        |12       |17       |23       |39       |37       |46       |all      
validOperators                |11       |11       |11       |18       |19       |19       |19       |all      
printZoneLength               |1        |15       |15       |15       |14       |15       |14       |16       
numericPadding                |-        |Y        |Y        |Y        |Y        |Y        |Y        |-        
checkOverflow                 |-        |Y        |Y        |-        |Y        |Y        |-        |Y        
testInitialFor                |-        |Y        |Y        |Y        |Y        |-        |Y        |Y        
optionalNextVar               |-        |-        |-        |-        |-        |Y        |Y        |Y        
multipleNextVars              |-        |-        |-        |-        |-        |Y        |Y        |Y        
bitwiseLogic                  |-        |-        |-        |-        |-        |Y        |Y        |Y        
checkOnGotoIndex              |-        |Y        |Y        |-        |Y        |-        |-        |Y        
computedGoto                  |Y        |-        |-        |Y        |-        |-        |-        |-        
restoreWithLabel              |-        |-        |-        |Y        |-        |-        |Y        |Y        
squareBrackets                |-        |-        |-        |Y        |-        |-        |-        |Y        
arraysContainChars            |-        |-        |-        |Y        |-        |-        |-        |-        
endStmtRequired               |-        |Y        |Y        |Y        |-        |-        |-        |-        
chainAssignments              |-        |-        |Y        |Y        |-        |-        |-        |Y        
optionalLet                   |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
compiledBlocks                |-        |Y        |Y        |Y        |Y        |-        |-        |Y        
`OPTION`                      |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`PRINT`                       |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`IF`                          |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`GOTO`                        |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`INPUT`                       |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`LET`                         |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`GOSUB`                       |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`RETURN`                      |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`CLEAR`                       |Y        |-        |-        |-        |-        |-        |-        |Y        
`END`                         |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`DATA`                        |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`DEF`                         |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`DIM`                         |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`FOR`                         |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`NEXT`                        |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`ON`                          |-        |Y        |Y        |-        |Y        |Y        |Y        |Y        
`RANDOMIZE`                   |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`READ`                        |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`RESTORE`                     |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`STOP`                        |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`CHANGE`                      |-        |-        |Y        |-        |Y        |-        |-        |Y        
`ENTER`                       |-        |-        |-        |Y        |-        |-        |-        |Y        
`ELSE`                        |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`WHILE`                       |-        |-        |-        |-        |Y        |-        |Y        |Y        
`WEND`                        |-        |-        |-        |-        |-        |-        |Y        |Y        
*a* = *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* <> *b*                    |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* >< *b*                    |Y        |-        |-        |-        |-        |-        |-        |Y        
*a* < *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* > *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* <= *b*                    |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* >= *b*                    |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* + *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* - *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* * *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* / *b*                     |Y        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* ^ *b*                     |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
*a* ** *b*                    |-        |-        |-        |Y        |Y        |-        |-        |Y        
*a* *#* *b*                   |-        |-        |-        |Y        |-        |-        |-        |Y        
*a* NOT *b*                   |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
*a* AND *b*                   |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
*a* OR *b*                    |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
*a* MIN *b*                   |-        |-        |-        |Y        |-        |-        |-        |Y        
*a* MAX *b*                   |-        |-        |-        |Y        |-        |-        |-        |Y        
*a* == *b*                    |-        |-        |-        |-        |Y        |-        |-        |Y        
*a* XOR *b*                   |-        |-        |-        |-        |Y        |Y        |Y        |Y        
*a* IMP *b*                   |-        |-        |-        |-        |Y        |Y        |Y        |Y        
*a* EQV *b*                   |-        |-        |-        |-        |Y        |Y        |Y        |Y        
*a* \ *b*                     |-        |-        |-        |-        |-        |Y        |Y        |Y        
*a* MOD *b*                   |-        |-        |-        |-        |-        |Y        |Y        |Y        
`ABS()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`ATN()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`COS()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`EXP()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`INT()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`LOG()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`RND()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`SGN()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`SIN()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`SQR()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`TAB()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`TAN()`                       |-        |Y        |Y        |Y        |Y        |Y        |Y        |Y        
`CTL()`                       |-        |-        |-        |Y        |-        |-        |-        |Y        
`LEN()`                       |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
`LIN()`                       |-        |-        |-        |Y        |-        |-        |-        |Y        
`POS()`                       |-        |-        |-        |Y        |Y        |Y        |Y        |Y        
`TIM()`                       |-        |-        |-        |Y        |-        |-        |-        |Y        
`UPS$()`                      |-        |-        |-        |Y        |-        |-        |-        |Y        
`NFORMAT$()`                  |-        |-        |-        |Y        |Y        |-        |-        |Y        
`LOG10()`                     |-        |-        |-        |-        |Y        |-        |-        |Y        
`PI()`                        |-        |-        |-        |-        |Y        |-        |-        |Y        
`CHR$()`                      |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`LEFT$()`                     |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`RIGHT$()`                    |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`MID$()`                      |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`INSTR()`                     |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`SPACE$()`                    |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`VAL()`                       |-        |-        |-        |-        |Y        |Y        |Y        |Y        
`ASC()`                       |-        |-        |-        |-        |-        |Y        |Y        |Y        
`CINT()`                      |-        |-        |-        |-        |-        |Y        |Y        |Y        
`FIX()`                       |-        |-        |-        |-        |-        |Y        |Y        |Y        
`HEX$()`                      |-        |-        |-        |-        |-        |Y        |Y        |Y        
`OCT$()`                      |-        |-        |-        |-        |-        |Y        |Y        |Y        
`SPC()`                       |-        |-        |-        |-        |-        |Y        |Y        |Y        
`STR$()`                      |-        |-        |-        |-        |-        |Y        |Y        |Y        
`STRING$()`                   |-        |-        |-        |-        |-        |Y        |Y        |Y    



# BASIC Compiler Internals

If you want to know more about the internals of a BASIC compiler written in TypeScript, then read on.

## Tokenizer

The tokenizer is powered by one huge gnarly regular expression.
Each token type is a separate capture group, and we just look for the first one that matched.
Here's a sample of the regex:

~~~
    comment      identifier      string
... (['].*) | ([A-Z_]\w*[$]?) | (".*?") ...
~~~

In some tokenizers, like Microsoft BASIC, each keyword supported by the language is matched individually,
so whitespace is not required around keywords.
For example, `FORI=ATOB` would be matched `FOR I = A TO B`.
This was sometimes called "crunching."
We have a special case in the tokenizer to enable this for these dialects.

The tokenizer also has special cases for `REM`, `DATA`, and `OPTION` which require tokens be untouched
-- and in the case of `DATA`, whitespace preserved.

Since BASIC is a line-oriented language, the tokenizer operates on one line at a time,
and each line is then fed to the parser.
For block-oriented languages, we'd probably want to tokenize the entire file before the parsing stage.


## Parser

The parser is a hand-coded recursive descent parser.
Why?
There was no `yacc` nor `bison` when BASIC was invented, so the language was not designed for these tools.
In fact, BASIC is a little gnarly when you get into the details, so having a bit of control is nice,
and error messages can be more informative.
Both clang and gcc use recursive descent parsers, so it can't be that bad, right?

The program is parsed one line at a time.
After line tokenization, the tokens go into an array.
We can consume tokens (remove from the list), peek at tokens (check the next token without removing), and pushback (return them to the list).
We don't have to check for `null`; we will always get the EOL (end-of-line) empty-string token if we run out.

Expressions are parsed with an [operator-precedence parser](https://en.wikipedia.org/wiki/Operator-precedence_parser#Pseudocode), which isn't really that complicated.
We also infer types at this type (number or string).
We have a list of function signatures, and we know that "$" means a string variable, so we can check types.
The tricky part is that `FNA(X)` is a user-defined function, while `INT(X)` is a function, and `I1(X)` could be a dimensioned array.

Tokens carry their source code location with them, so we can assign a precise source code location to each statement.
This is used for error messages and for debugging.

The compiler generates an AST (Abstract Syntax Tree) and not any kind of VM bytecode.
The top-level of the AST is a list of statements, and an associated mapping of labels (line numbers) to statements.
AST nodes must refer to other nodes by index, not by reference, as the worker transfers it to the main thread using `JSON.stringify()`.


## Runtime

The runtime interprets the AST generated by the compiler.
It compiles each statement (PRINT, LET, etc.) into JavaScript.
The methods `expr2js()` converts expression trees to JavaScript, and `assign2js()` handles assignments like `LET`, `READ` and `INPUT`.

One statement is executed every time step.
There's a "program counter", which is the index of the next-to-run Statement node in the list.

Early BASICs were compiled languages, but the most popular BASICs for microcomputers were tokenized and interpreted.
There are subtle differences between the two.
For example, interpreted BASIC supports NEXT statements without a variable,
which always jump back to the most recent FOR even if you GOTO a different NEXT.
This requires the runtime maintain a stack of FOR loops.
Compiled BASIC dialects will verify loop structures at compile time.

For INPUT commands, the runtime calls the `input()` method, which returns a Promise.
The IDE overriddes this method to show a text field to the user, and resolve the Promise when data is entered.
The runtime might call multiple times until valid data is entered.

