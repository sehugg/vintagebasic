OPTION DIALECT HP2000
0 REM http://www.bitsavers.org/bits/HP/paperTapes/JeffM/CRAPS.BAS
10  REM THIS IS A SPECIAL VERSION OF CRAPS
20  REM 1) MAXIMUM BANK IS $1000
30  REM 2) THE PLAYER GETS 10 CHANCES TO PLACE A BET
40  REM 3) COMMENTS HAVE BEEN ADJUSTED FOR FAMILIES
50  PRINT TAB(18)"G T E     S Y L V A N I A"
60  PRINT
70  PRINT TAB(27)"1 9 7 4"
80  PRINT
90  PRINT TAB(20)"F A M I L Y     D A Y"
100  PRINT
110  PRINT
120  PRINT TAB(16)"COMPUTERIZED CRAP GAME RULES"
130  PRINT
140  PRINT
150  PRINT
160  PRINT "2, 3, OR 12 ON THE FIRST THROW IS A LOSER."
170  PRINT "7 OR 11 ON THE FIRST THROW WINS."
180  PRINT
190  PRINT "IF FIRST THROW IS NOT A WINNER OR A LOSER IT BECOMES";
200  PRINT " YOUR POINT."
210  PRINT "CONTINUE TO ROLL UNTIL EITHER 7 OR YOUR POINT OCCURS."
220  PRINT "ROLL 7 AND YOU LOSE.  MAKE YOUR POINT AND YOU WIN."
230  PRINT 
240  PRINT "YOU MAY END THE GAME BY ENTERING A ZERO BET."
250  PRINT 
260  PRINT "I RESERVE THE RIGHT TO END THE GAME AT ANY TIME."
270  PRINT 
280  LET F6=0
290  PRINT "NO PROFANITY!"
300  PRINT 
310  PRINT "WHAT TIME IS IT";
320  INPUT T
330  IF T<2401 THEN 390
340  IF F6<1 THEN 360
350  PRINT "DUMMY!  ";
360  PRINT "WHAT TIME";
370  LET F6=F6+1
380  GOTO 320
390  LET T=T*19
400  IF T<1900 THEN 430
410  LET T=T-1900
420  GOTO 400
430  PRINT "THANK YOU  -  ON WITH THE GAME."
440  FOR D=1 TO T
450  LET R1=RND(0)
460  NEXT D
470  LET F2=0
480  LET F3=0
490  LET F4=0
500  LET F5=0
510  LET X=0
520  LET Y=0
530  PRINT " ENTER YOUR BANKROLL  ";
540  INPUT F7
550  IF F7<1001 THEN 620
560  LET F5=F5+1
570  IF F5>1 THEN 600
580  PRINT "YOU'RE TOO RICH FOR MY ELECTRONS!"
590  GOTO 530
600  PRINT "BE REASONABLE!  THIS IS NOT LOS VEGAS."
610  GOTO 530
620  LET F8=F7
630  PRINT "YOU NOW HAVE TEN TRYS TO BEAT THE BANK."
640  LET Q=10
650  GOTO 750
660  PRINT 
670  IF F8>F7 THEN 710
680  IF F7>F8 THEN 730
690  PRINT "EVEN WITH THE BOARD   -   HMPH!"
700  GOTO 2050
710  PRINT "YOU HAVE WON  "F8-F7" DOLLARS.  TRY AND GET IT."
720  GOTO 2050
730  PRINT "YOU HAVE LOST  "F7-F8" DOLLARS.  SORRY ABOUT THAT."
740  GOTO 2050
750  IF Q=0 THEN 660
760  LET Q=Q-1
770  PRINT "  PLACE YOUR BET ";
780  INPUT B
790  IF B=0 THEN 660
800  IF B<1 THEN 1830
810  IF B>F8 THEN 1890
820  LET B=INT(B)
830  GOSUB 2240
840  PRINT "    FIRST THROW";V;W;
850  IF A=2 THEN 930
860  IF A=3 THEN 950
870  IF A=7 THEN 970
880  IF A=11 THEN 990
890  IF A=12 THEN 910
900  GOTO 1010
910  PRINT " BOX CARS     ";
920  GOTO 1430
930  PRINT " SNAKE EYES     ";
940  GOTO 1430
950  PRINT " CRAPS     ";
960  GOTO 1430
970  PRINT " BIG SEVEN  -  A WINNER";
980  GOTO 1090
990  PRINT " BIG ELEVEN  -  A WINNER";
1000  GOTO 1090
1010  LET C=A
1020  PRINT " YOUR POINT   ";A
1030  GOSUB 2240
1040  PRINT "    NEXT THROW ";V;W
1050  IF A=7 THEN 1410
1060  IF A#C THEN 1030
1070  PRINT "      MADE YOUR POINT";
1080  REM WIN COUNTER
1090  LET X=X+1
1100  IF X>1 THEN 1150
1110  IF X=3 THEN 1170
1120  IF X=4 THEN 1190
1130  IF X>4 THEN 1210
1140  GOTO 1220
1150  PRINT " AGAIN";
1160  GOTO 1110
1170  PRINT ".    DARNIT!";
1180  GOTO 1220
1190  PRINT ".  STOP THAT!";
1200  GOTO 1220
1210  PRINT ".  -DISGUSTING-";
1220  IF Y=2 THEN 1280
1230  IF Y=3 THEN 1300
1240  IF Y=4 THEN 1320
1250  IF Y=5 THEN 1340
1260  IF Y>5 THEN 1360
1270  GOTO 1370
1280  PRINT " FOR A CHANGE - DON'T GET COCKY.";
1290  GOTO 1370
1300  PRINT " IN SPITE OF ME.";
1310  GOTO 1370
1320  PRINT "    SPOIL SPORT";
1330  GOTO 1370
1340  PRINT "    FEEL BETTER?";
1350  GOTO 1370
1360  PRINT " - - RELAX";
1370  LET Y=0
1380  PRINT 
1390  LET F8=F8+B
1400  GOTO 1800
1410  PRINT " SEVEN - - -";
1420  REM LOSS COUNTER
1430  LET Y=Y+1
1440  PRINT " YOU LOSE";
1450  IF Y>1 THEN 1550
1460  IF Y=3 THEN 1570
1470  IF Y=4 THEN 1590
1480  IF Y=5 THEN 1610
1490  IF Y>5 THEN 1630
1500  IF X=2 THEN 1650
1510  IF X=3 THEN 1680
1520  IF X=4 THEN 1710
1530  IF X>4 THEN 1740
1540  GOTO 1760
1550  PRINT " AGAIN.  ";
1560  GOTO 1460
1570  PRINT " KEEP UP THE GOOD WORK!";
1580  GOTO 1500
1590  PRINT " EAT YOUR HEART OUT!";
1600  GOTO 1500
1610  PRINT " IT'S NOT YOUR DAY, IS IT, SUCKER?";
1620  GOTO 1500
1630  PRINT " YOU'RE JUST TOO GOOD TO BE TRUE.";
1640  GOTO 1500
1650  PRINT ".";
1660  PRINT "  BUT KEEP TRYING.";
1670  GOTO 1760
1680  PRINT ".";
1690  PRINT "  THAT ENDS YOUR LITTLE STREAK.";
1700  GOTO 1760
1710  PRINT ".";
1720  PRINT "    GOTCHA!";
1730  GOTO 1760
1740  PRINT ".";
1750  PRINT "  AT LAST I FIXED YOUR WAGON.";
1760  PRINT ""
1770  LET X=0
1780  LET F8=F8-B
1790  IF F8<1 THEN 2220
1800  PRINT 
1810  PRINT "YOU NOW HAVE  "F8"DOLLARS IN THE BANK."
1820  GOTO 750
1830  PRINT "NO BETS LESS THAN A BUCK.";
1840  LET F2=F2+1
1850  IF F2=2 THEN 1950
1860  IF F2>2 THEN 1970
1870  PRINT 
1880  GOTO 750
1890  PRINT "NO CREDIT AT THIS CASINO.";
1900  LET F3=F3+1
1910  IF F3=2 THEN 1950
1920  IF F3>2 THEN 1970
1930  PRINT
1940  GOTO 750
1950  PRINT "    (SECOND WARNING)"
1960  GOTO 750
1970  PRINT "       G O   T O    # @ & % "
1980  LET F4=F4+1
1990  IF F4=2 THEN 2020
2000  IF F4>2 THEN 2040
2010  GOTO 750
2020  PRINT " DO THAT AGAIN AND I'LL QUIT"
2030  GOTO 750
2040  PRINT " I WARNED YOU   -  SMART GUY  -  I QUIT"
2050  PRINT
2060  PRINT
2070  PRINT
2080  PRINT
2090  PRINT "NEXT PLAYER. . . PLEASE ENTER YOUR LUCKY NUMBER."
2100  PRINT
2110  PRINT
2120  PRINT
2130  PRINT
2140  PRINT
2150  PRINT
2160  INPUT F6
2170  PRINT
2180  PRINT
2190  PRINT
2200  PRINT
2210  GOTO 50
2220  PRINT "  B U S T"
2230  GOTO 2050
2240  LET V=INT(6*RND(0)+1)
2250  LET W=INT(6*RND(0)+1)
2260  LET A=V+W
2270  RETURN
2280  END
