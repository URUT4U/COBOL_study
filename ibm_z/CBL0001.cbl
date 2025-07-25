      *-----------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    CBL0001.
      *--------------------
       ENVIRONMENT DIVISION.
      *--------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PRINT-LINE ASSIGN TO PRTLINE.
           SELECT ACCT-REC   ASSIGN TO ACCTREC.
      *SELECT clause creates an internal file name
      *ASSIGN clause creates a name for an external data source,
      *which is associated with the JCL DDNAME used by the z/OS
      *e.g. ACCTREC is linked in JCL file CBL0001J to &SYSUID..DATA
      *where &SYSUID. stands for Your z/OS user id
      *e.g. if Your user id is Z54321,
      *the data set used for ACCTREC is Z54321.DATA	
      *-------------
       DATA DIVISION.
      *-------------
       FILE SECTION.
       FD  PRINT-LINE RECORDING MODE F.
       01  PRINT-REC.
           05  ACCT-NO-O      PIC X(8).
           05  ACCT-LIMIT-O   PIC $$,$$$,$$9.99.
           05  ACCT-BALANCE-O PIC $$,$$$,$$9.99.
      * PIC $$,$$$,$$9.99 -- Alternative for PIC on chapter 7.2.3,
      * using $ to allow values of different amounts of digits
      * and .99 instead of v99 to allow period display on output
           05  LAST-NAME-O    PIC X(20).
           05  FIRST-NAME-O   PIC X(15).
           05  COMMENTS-O     PIC X(50).
      * since the level 05 is higher than level 01,
      * all variables belong to PRINT-REC (see chapter 7.3.3)
      *
       FD  ACCT-REC RECORDING MODE F.
       01  ACCT-FIELDS.
           05  ACCT-NO            PIC X(8).
           05  ACCT-LIMIT         PIC S9(7)V99 COMP-3.
           05  ACCT-BALANCE       PIC S9(7)V99 COMP-3.
      * PIC S9(7)v99 -- seven-digit plus a sign digit value
      * COMP-3 -- packed BCD (binary coded decimal) representation
           05  LAST-NAME          PIC X(20).
           05  FIRST-NAME         PIC X(15).
           05  CLIENT-ADDR.
               10  STREET-ADDR    PIC X(25).
               10  CITY-COUNTY    PIC X(20).
               10  USA-STATE      PIC X(15).
           05  RESERVED           PIC X(7).
           05  COMMENTS           PIC X(50).
      *
       WORKING-STORAGE SECTION.
       01 FLAGS.
         05 LASTREC           PIC X VALUE SPACE.
      *------------------
       PROCEDURE DIVISION.
      *------------------
       OPEN-FILES.
           OPEN INPUT  ACCT-REC.
           OPEN OUTPUT PRINT-LINE.
      *
       READ-NEXT-RECORD.
           PERFORM READ-RECORD
      *     The previous statement is needed before entering the loop.
      *     Both the loop condition LASTREC = 'Y'
      *     and the call to WRITE-RECORD depend on READ-RECORD having
      *     been executed before.
      *     The loop starts at the next line with PERFORM UNTIL
            PERFORM UNTIL LASTREC = 'Y'
            PERFORM WRITE-RECORD
            PERFORM READ-RECORD
            END-PERFORM
           .
      *
       CLOSE-STOP.
           CLOSE ACCT-REC.
           CLOSE PRINT-LINE.
           GOBACK.
      *
       READ-RECORD.
           READ ACCT-REC
           AT END MOVE 'Y' TO LASTREC
           END-READ.
      *
       WRITE-RECORD.
           MOVE ACCT-NO      TO  ACCT-NO-O.
           MOVE ACCT-LIMIT   TO  ACCT-LIMIT-O.
           MOVE ACCT-BALANCE TO  ACCT-BALANCE-O.
           MOVE LAST-NAME    TO  LAST-NAME-O.
           MOVE FIRST-NAME   TO  FIRST-NAME-O.
           MOVE COMMENTS     TO  COMMENTS-O.
           WRITE PRINT-REC.
      *

