      ************************************************************************
      * Author: Nathan Ranna
      * Date:
      * Purpose:
      * Tectonic:
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REVSTR.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
      ************************************************************************
       DATA DIVISION.

       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WS-STRING     PIC X(64) VALUE "HELLO WORLD.".
       01 WS-TMPSTR     PIC X(64).
       01 WS-POS        PIC S99.
       01 WS-INDEX      PIC S99 COMP VALUE 1. *> COBOL STRINGS START AT 1
       01 WS-STRLEN     PIC S99 COMP VALUE 0.

      ************************************************************************
       PROCEDURE DIVISION.

       REVERSE-STRING.
      *
           MOVE FUNCTION LENGTH(FUNCTION TRIM(WS-STRING)) TO WS-STRLEN.
      *     DISPLAY "Orginal: " WS-STRING.
           INITIALIZE WS-TMPSTR.

           PERFORM VARYING WS-POS FROM WS-STRLEN BY -1
           UNTIL WS-POS = 0
               MOVE WS-STRING(WS-POS:1) TO WS-TMPSTR(WS-INDEX:1)
               ADD 1 TO WS-INDEX
           END-PERFORM.
           MOVE WS-TMPSTR TO WS-STRING.
      *     DISPLAY "Reversed: " WS-STRING.
           STOP RUN.
      *
