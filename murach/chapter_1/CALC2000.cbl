      ************************************************************************
      * Author: Nathan Ranna
      * Date:
      * Purpose:
      * Tectonic:
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC2000.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
      ************************************************************************
       DATA DIVISION.

       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 USER-ENTRIES.
           05 NUMBER-ENTERED        PIC 9       VALUE 1.
           05 INVESTMENT-AMOUNT     PIC 99999.
           05 NUMBER-OF-YEARS       PIC 99.
           05 YEARLY-INTEREST       PIC 99V9.
       01 WORK-FIELDS.
           05 FUTURE-VALUE          PIC 9(7)V99.
           05 YEAR-COUNTER          PIC 999.
           05 EDITED-FUTURE-VALUE   PIC Z,ZZZ,ZZZ.99.

      ************************************************************************
       PROCEDURE DIVISION.

       000-CALCULATE-FUTURE-VALUES.
           PERFORM 100-CALCULATE-FUTURE-VALUE
                UNTIL NUMBER-ENTERED = ZERO.
           DISPLAY "END OF SESSION.".
           STOP RUN.

       100-CALCULATE-FUTURE-VALUE.
           DISPLAY "------------------------------------".
           DISPLAY "TO END THE PROGRAM, ENTER 0.".
           DISPLAY "TO PERFORM ANOTHER CALCULATION, ENTER 1.".
           ACCEPT NUMBER-ENTERED.
           DISPLAY "------------------------------------".
           IF NUMBER-ENTERED = 1
               PERFORM 110-GET-USER-VALUES
               MOVE 1 TO YEAR-COUNTER
               PERFORM 120-CALCULATE-NEXT-FV
                    UNTIL YEAR-COUNTER > NUMBER-OF-YEARS
               MOVE FUTURE-VALUE TO EDITED-FUTURE-VALUE
               DISPLAY "FUTURE VALUE = " EDITED-FUTURE-VALUE
           END-IF.

       110-GET-USER-VALUES.
           DISPLAY "ENTER INVESTMENT AMOUNT (XXXXX). ".
           ACCEPT INVESTMENT-AMOUNT.
           MOVE INVESTMENT-AMOUNT TO FUTURE-VALUE.
           DISPLAY "ENTER NUMBER OF YEARS (XX). ".
           ACCEPT NUMBER-OF-YEARS.
           DISPLAY "ENTER YEARLY INTEREST RATE (XX.X). ".
           ACCEPT YEARLY-INTEREST.

       120-CALCULATE-NEXT-FV.
           COMPUTE FUTURE-VALUE = FUTURE-VALUE +
               (FUTURE-VALUE * YEARLY-INTEREST / 100).
           ADD 1 TO YEAR-COUNTER.
