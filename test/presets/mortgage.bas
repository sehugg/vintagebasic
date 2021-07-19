OPTION DIALECT HP
10  PRINT "DANIEL O'ROURKE FEB. 23, 1977"
20  PRINT "MINI-COMPUTOR 102"
30  PRINT "SUBJECT: MORTGAGE PAYMENT"
40  FOR A=1 TO 3
50  PRINT 
60  NEXT A
70  PRINT "HI, I AM A COMPUTOR. YOU HAVE COME TO ME "
80  PRINT "SO I CAN HELP YOU SOLVE YOUR MORTGAGE"
90  PRINT "PROBLEMS, BECAUSE I CAN MAKE CALCULATIONS"
100  PRINT "MUCH FASTER AND MORE ACCURATELY THAN YOU"
110  PRINT "CAN. IF YOU DON'T KNOW HOW TO USE ME,AND"
120  PRINT "YOU WOULD LIKE INSTRUCTIONS, PLEASE TYPE"
125  PRINT "A 1 (ONE). FOLLOW IT WITH A CARRIAGE RETURN."
130  PRINT "IF NOT TYPE A 0 (ZERO) FOLLOWED BY A CARRI-"
140  PRINT "AGE RETURN. DO IT NOW, PLEASE."
142  PRINT 
144  PRINT 
150  INPUT B
152  IF B=1 THEN 160
155  IF B=0 THEN 285
157  IF B#1 THEN 142
160  PRINT 
165  PRINT 
170  PRINT "THANK YOU, HERE ARE YOUR INSTRUCTIONS."
180  PRINT 
190  PRINT 
200  GOTO 250
250  PRINT "TYPE IN THE AMOUNT YOU WISH TO BORROW."
260  PRINT "FOLLOW IT WITH A COMMA (,) THEN TYPE IN"
270  PRINT "THE NUMBER OF YEARS YOU WOULD LIKE TO TAKE"
280  PRINT "TO REPAY THAT LOAN. FOLLOW THAT WITH"
282  PRINT "A CARRIAGE RETURN. DO IT NOW."
285  PRINT 
286  PRINT 
290  INPUT C,D
295  PRINT 
296  PRINT 
297  IF B=0 THEN 340
300  PRINT "THANK YOU, NOW TYPE IN THE INTEREST RATE."
310  PRINT "THIS INFORMATION MUST BE IN DECIMAL FORM."
320  PRINT "EXAMPLE: .10=10% INTEREST RATE."
325  PRINT "FOLLOW THIS INFORMATION WITH A CARRIAGE RE-"
330  PRINT "TURN. DO IT NOW."
340  INPUT E
342  LET G=C*(((E/12)*(1+E/12)^(D*12))/((1+E/12)^(D*12)-1))
344  LET F=(G*D*(12))-C
350  PRINT 
351  PRINT 
352  PRINT "THANK YOU."
354  PRINT "THE TOTAL COST OF YOUR LOAN IS";F
355  PRINT 
356  PRINT "YOUR MONTHLY PAYMENTS (INCLUDING INTEREST) ARE";G
358  PRINT 
359  PRINT 
360  PRINT "NOW YOU WILL RECEIVE A PAYMENT SCHEDULE"
370  PRINT "OF PAYMENTS FOR THE FIRST TWELVE MONTHS OF"
380  PRINT "YOUR REPAYMENT PERIOD. THEN I WILL TELL YOU"
390  PRINT "HOW MUCH YOU HAVE PAID TOWARDS THE PRINCIPLE,"
400  PRINT "THEN I WILL TELL YOU HOW MUCH YOU HAVE PAID"
410  PRINT "ON THE INTEREST, AND THEN I WILL TELL YOU HOW"
420  PRINT "MUCH YOU STILL HAVE LEFT TO REPAY (BALANCE DUE)."
430  PRINT 
440  PRINT 
510  PRINT "MONTH","PRINCIPLE","INTEREST","BALANCE DUE"
515  LET R=(E/12)*C
520  FOR I=1 TO 12
530  LET K=(E/12)*C
540  LET P=G-K
550  LET C=(C)-(P)
570  PRINT I,P,K,C
600  NEXT I
650  PRINT 
660  PRINT 
670  PRINT "THE AMOUNT YOU HAVE PAID TOWARDS THE PRINCIPLE IS:"
675  LET Q=G-E
685  PRINT 
690  PRINT "$";Q
695  PRINT 
700  PRINT 
710  PRINT "THE AMOUNT YOU HAVE PAID ON INTEREST IS:"
715  PRINT 
720  PRINT "$";R
725  PRINT 
730  PRINT 
735  PRINT "YOUR BALANCE DUE IS:"
736  PRINT 
740  PRINT "$";C
750  PRINT 
760  PRINT 
780  PRINT "THIS COMPLETES THE MORTGAGE PAYMENT PROGRAM."
790  PRINT "THANK YOU FOR YOUR COOPERATION."
800  FOR T=1 TO 4
810  PRINT 
820  NEXT T
999  END 
