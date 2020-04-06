       IDENTIFICATION DIVISION.
       PROGRAM-ID. factorial recursive.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 numb PIC 9(4) VALUE 5.
       01 fact PIC 9(8) VALUE 0.
       LOCAL-STORAGE SECTION.
       01 num PIC 9(4).
       PROCEDURE DIVISION.
           move numb to num.
           if numb = 0
             move 1 to fact
           else
             subtract 1 from numb
             call 'factorial'
             add num to fact
           end-if.

           display num '! = ' fact.
           goback.
      * Per p275 re: batch compilation
      *
      * Use the END PROGRAM marker to terminate each program in the
      * sequence except the last program in the batch (for which the END
      * PROGRAM marker is optional).
      *
      * If you omit the END PROGRAM marker from a program (other than the
      * last program in a sequenece of separate programs), the next
      * program in the sequence will be nested in the preceding program.
       END PROGRAM factorial.
