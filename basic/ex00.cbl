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
       01 GDA-NOME      PIC X(20)   VALUE SPACES.
       01 GDA-NUMBER    PIC 9(02)   VALUE 0.
      ************************************************************************
       PROCEDURE DIVISION.
      ************************************************************************
       MAIN-PROCEDURE.
           DISPLAY "Type your name: "
           ACCEPT GDA-NOME
           DISPLAY "Type a number: "
           ACCEPT GDA-NUMBER

           IF GDA-NUMBER = 1 OR GDA-NUMBER = 2
               DISPLAY "Your name is: " GDA-NOME
               DISPLAY "Number typed: " GDA-NUMBER
           ELSE
               DISPLAY "Invalid number."
           END-IF
           STOP RUN.
       END PROGRAM PROG001.
