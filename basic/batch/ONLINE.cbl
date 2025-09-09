      ************************************************************************
      * Author: Nathan Ranna
      * Date: 26/07/2025
      * Purpose: Collect and show user information according to its age.
      * Tectonic: cobc
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ONLINE.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
      ************************************************************************
       DATA DIVISION.

       FILE SECTION.
       WORKING-STORAGE SECTION.

       77   ON-NAME            PIC X(20) VALUE SPACES.
       77   ON-CPF             PIC 9(11).

       01   ON-BIRTH.
           05   BIRTH-DAY      PIC 99   VALUE 01.
           05   BIRTH-MONTH    PIC 99   VALUE 01.
           05   BIRTH-YEAR     PIC 9999 VALUE 2000.
           05   COMPLETE-DATE  PIC X(8).
           05   FORMAT-DATE    PIC X(10).

       01   TMP.
           05   TMP-DAY      PIC XX.
           05   TMP-MONTH    PIC XX.
           05   TMP-YEAR     PIC XXXX.

      ************************************************************************
       PROCEDURE DIVISION.

       000-MAIN.
           PERFORM 100-COLLECT-DATA.
           DISPLAY " " 
           DISPLAY "---------------------------------"
           DISPLAY "[YOUR INFORMATION]"
           DISPLAY "---------------------------------"
           IF BIRTH-YEAR < 2000
               DISPLAY "You're too old for me to print anything."
               DISPLAY " " 
               DISPLAY "End of execution, bye"
               STOP RUN
           END-IF. 
           STRING
               BIRTH-DAY DELIMITED BY SIZE
               "." DELIMITED BY SIZE
               BIRTH-MONTH DELIMITED BY SIZE
               "." DELIMITED BY SIZE
               BIRTH-YEAR DELIMITED BY SIZE
               INTO FORMAT-DATE
           DISPLAY "Your name: " ON-NAME.
           DISPLAY "Your CPF: " ON-CPF.
           DISPLAY "Date of birth: " FORMAT-DATE.
           DISPLAY " " 
           DISPLAY "End of execution, bye"
           STOP RUN.

       100-COLLECT-DATA.
           DISPLAY "---------------------------------"
           DISPLAY "[MAKE YOUR REGISTRY]"
           DISPLAY "---------------------------------"
           DISPLAY "Type your name."
           ACCEPT ON-NAME.
           DISPLAY "Type your CPF (XXXYYYZZZWW)."
           ACCEPT ON-CPF.
           DISPLAY "Type your date of birth (DDMMAAAA)."
           ACCEPT COMPLETE-DATE.
           DISPLAY " " 
           DISPLAY "[THANK YOU]"
      * eu nunca vou aceitar que string em cobol começa em 1...
      * DDMMAAAA 
      * 12345
           MOVE COMPLETE-DATE(1:2) TO BIRTH-DAY.
           MOVE COMPLETE-DATE(3:2) TO BIRTH-MONTH.
           MOVE COMPLETE-DATE(5:4) TO BIRTH-YEAR.
