      ************************************************************************
      * Author: Nathan Ranna
      * Date:
      * Purpose: Calculate if given year is a leap year
      * Tectonic:
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
      ************************************************************************
       DATA DIVISION.

       FILE SECTION.
       WORKING-STORAGE SECTION.

       77   WS-YEAR     PIC 9(4) VALUE ZEROS.
       77   WS-RESULT   PIC 9    VALUE ZERO.

      ************************************************************************
       PROCEDURE DIVISION.

       MAIN.
           DISPLAY "-----------------------".
           DISPLAY "ENTER A YEAR (XXXX): ".
           ACCEPT WS-YEAR.
           PERFORM LEAP.
           IF WS-RESULT = 0
               DISPLAY "IT ISN'T A LEAP YEAR."
           ELSE
               DISPLAY "IT'S LEAP YEAR."
           END-IF.
           DISPLAY "-----------------------".
           STOP RUN.


       LEAP.
           IF FUNCTION MOD(WS-YEAR, 400) = 0
               MOVE 1 TO WS-RESULT
               EXIT PARAGRAPH
           END-IF.
           IF FUNCTION MOD(WS-YEAR, 4) = 0
               IF FUNCTION MOD(WS-YEAR, 100) = 0
                   EXIT PARAGRAPH
               MOVE 1 TO WS-RESULT
               EXIT PARAGRAPH
           END-IF.
