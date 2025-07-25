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

       LEAP.
           IF FUNCTION MOD(WS-YEAR, 400) = 0
               MOVE 1 TO WS-RESULT
               STOP RUN
           END-IF.
           IF FUNCTION MOD(WS-YEAR, 4) = 0
               IF FUNCTION MOD(WS-YEAR, 100) = 0
                   STOP RUN
               MOVE 1 TO WS-RESULT
               STOP RUN
           END-IF.
           STOP RUN.
