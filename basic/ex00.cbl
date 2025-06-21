      ************************************************************************
      * Author: Nathan
      * Date: 14/06/2025
      * Purpose:
      * Tectonic: cobc
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG001.
      ************************************************************************
       ENVIRONMENT DIVISION.
      ************************************************************************
       CONFIGURATION SECTION.
      ************************************************************************
       INPUT-OUTPUT SECTION.
      ************************************************************************
       DATA DIVISION.
      ************************************************************************
       FILE SECTION.
      ************************************************************************
       WORKING-STORAGE SECTION.
       01 GDA-NOME      PIC X(20) VALUE SPACES.
       01 GDA-NUMBER    PIC 9(02) VALUE 0.
      ************************************************************************
       PROCEDURE DIVISION.
      ************************************************************************
       MAIN-PROCEDURE.
           DISPLAY "Type your name: "
           ACCEPT GDA-NOME
           DISPLAY "Type a number: "
           ACCEPT GDA-NUMBER
           EVALUATE GDA-NUMBER
               WHEN 01
               WHEN 02
                   DISPLAY 'Your name is: ' GDA-NOME
                   DISPLAY 'Number typed: ' GDA-NUMBER
               WHEN OTHER
                   DISPLAY "Invalid number."
           END-EVALUATE
           STOP RUN.
       END PROGRAM PROG001.
