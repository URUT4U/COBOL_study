      ************************************************************************
      * Author: Nathan Ranna
      * Date: xx/xx/xxxx
      * Purpose:
      * Tectonic:
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

           SELECT INPFILE ASSIGN TO "INPUT.DAT". 
           SELECT OUTFILE ASSIGN TO "OUTPUT.OUT".

      ************************************************************************
       DATA DIVISION.

       FILE SECTION.

       FD   INPFILE.
       01   INP-FILE-FIELDS.
           05   INP-NUMBER              PIC 9(2).
           05   INP-NAME                PIC X(20).

       FD   OUTFILE.
       01   PRINT-AREA  PIC X(132).

       WORKING-STORAGE SECTION.
       
       01   WS-FLAGS.
           05 EOF-SWITCH                PIC X        VALUE "N".
               88 END-OF-FILE                        VALUE "Y".
           
       01   PRINT-FIELDS.
           05   PAGE-COUNT              PIC S9(3)    VALUE ZERO.
           05   LINES-ON-PAGE           PIC S9(3)    VALUE +55.
           05   LINES-COUNT             PIC S9(3)    VALUE +99.

       01   HEADER-LINE-1.
           05   FILLER                  PIC X(20)    VALUE "MY REPORT".
           05   FILLER                  PIC X(50)    VALUE SPACES.
           05   FILLER                  PIC X(5)     VALUE "Page: ".
           05   HL1-PAGE-COUNT          PIC ZZ9(3).


      ************************************************************************
       PROCEDURE DIVISION.

       000-HELLO-WORLD.
      *
           DISPLAY "SALVE SIMPATIA.".
           STOP RUN.
      *
