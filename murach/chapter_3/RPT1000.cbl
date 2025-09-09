      ************************************************************************
      * Author: Nathan Ranna
      * Date:
      * Purpose:
      * Tectonic:
      ************************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RPT1000.
      ************************************************************************
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      *     SELECT CUSTMAST ASSIGN TO CUSTMAST. 
      *     SELECT SALESRPT ASSIGN TO SALESRPT.
           SELECT CUSTMAST ASSIGN TO "CUSTMAST.DAT". 
           SELECT SALESRPT ASSIGN TO "SALESRPT.OUT".
      * O ERRO ESTÁ NO FATO DE ESTARMOS TENTANDO DAR O MESMO NOME LÓGICO
      * (O NOME DO SELECT) QUANTO COMO O NOME DO FD E DO SELECT NÃO PODE
      ************************************************************************
       DATA DIVISION.

       FILE SECTION.
       FD   CUSTMAST.
       01   CUSTOMER-MASTER-RECORD.
           05   CM-BRANCH-NUMBER        PIC 9(2).
           05   CM-SALESREP-NUMBER      PIC 9(2).
           05   CM-CUSTOMER-NUMBER      PIC 9(5).
           05   CM-CUSTOMER-NAME        PIC X(20).
           05   CM-SALES-THIS-YTD       PIC S9(5)V9(2).
           05   CM-SALES-LAST-YTD       PIC S9(5)V9(2).

       FD SALESRPT.
       01   PRINT-AREA  PIC X(132).

       WORKING-STORAGE SECTION.
       
       77   CUSTMAST-EOF-SWITCH         PIC X        VALUE "N".
           
       01   PRINT-FIELDS.
           05   PAGE-COUNT              PIC S9(3)    VALUE ZERO.
           05   LINES-ON-PAGE           PIC S9(3)    VALUE +55.
           05   LINES-COUNT             PIC S9(3)    VALUE +99.
           05   SPACE-CONTROL           PIC S9.

       01   TOTAL-FIELD.
           05   GRAND-TOTAL-THIS-YTD    PIC S9(7)V99 VALUE ZERO.
           05   GRAND-TOTAL-LAST-YTD    PIC S9(7)V99 VALUE ZERO.

       01   CURRENT-DATE-AND-TIME.
           05   CD-YEAR                 PIC 9999.
           05   CD-MONTH                PIC 99.
           05   CD-DAY                  PIC 99.
           05   CD-HOURS                PIC 99.
           05   CD-MINUTES              PIC 99.
           05   FILLER                  PIC X(9).

      ************************************************************************
       PROCEDURE DIVISION.

       000-MAIN.
