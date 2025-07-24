      ******************************************************************
      * Author:JOSE FELIPE
      * Date:12\07\2026
      * Purpose:LISTAR ALUNOS DO CURSO.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG007.
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE
           ASSIGN TO "C:\sistem\BATCH.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE
           ASSIGN TO "C:\sistem\BATCH-1.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-ERRO
           ASSIGN TO "C:\sistem\BATCH-2.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
      ******************************************************************
       DATA DIVISION.
       FILE SECTION.
          FD INPUT-FILE.
          01 INPUT-RECORD.
          03 INPUT-DATA PIC X(95).
          03 FILLER REDEFINES INPUT-DATA.
          05 GDA-NR-CHAVE  PIC 9(08).
          05 GDA-NOME      PIC X(27).
          05 GDA-RG        PIC 9(09).
          05 GDA-DT-NIVER  PIC X(10).
          05 GDA-NR-TEL    PIC 9(11).
          05 GDA-ENDEREC   PIC X(15).
          05 gda-valor     PIC 9(15).
          FD OUTPUT-FILE.
          01 OUTPUT-RECORD PIC X(95).
          FD OUTPUT-ERRO.
          01 OUTPUT-ERRO PIC X(95).

       WORKING-STORAGE SECTION.
          01 WS-EOF-FLAG PIC X VALUE 'N'.
          88 END-OF-INPUT VALUE 'Y'.
          01 GDA-VL-ATUA  PIC 9(15) VALUE 0. 
      ******************************************************************
       PROCEDURE DIVISION.

       1000-MAIN-LOGIC.
           OPEN INPUT INPUT-FILE
           OUTPUT OUTPUT-FILE
                  OUTPUT-ERRO.
           PERFORM 2000-PROCESS-RECORDS UNTIL END-OF-INPUT.
           CLOSE INPUT-FILE
                 OUTPUT-FILE
                 OUTPUT-ERRO. 
       STOP RUN.

       2000-PROCESS-RECORDS SECTION.
      *
           DISPLAY '----------------------------------'
           DISPLAY 'ENTRADA   ' GDA-NR-CHAVE
           DISPLAY 'ENTRADA   ' GDA-NOME
           DISPLAY 'ENTRADA   ' GDA-RG
           DISPLAY 'ENTRADA   ' GDA-DT-NIVER
           DISPLAY 'ENTRADA   ' GDA-ENDEREC
           DISPLAY 'ENTRADA   ' gda-valor
           
           READ INPUT-FILE
           AT END
             SET END-OF-INPUT TO TRUE
           NOT AT END
            IF  GDA-NR-CHAVE  NOT EQUAL 12345680
            AND GDA-NR-CHAVE  NOT EQUAL 12345681
            SUBTRACT 100 FROM gda-valor
                IF GDA-DT-NIVER > '26/07/1991'
                   DISPLAY ' NOME DA PESSOAL '  GDA-NOME
                END-IF
                MOVE INPUT-RECORD TO OUTPUT-RECORD
                WRITE OUTPUT-RECORD
            ELSE 
                MOVE INPUT-RECORD TO OUTPUT-ERRO
                WRITE OUTPUT-ERRO
            END-IF
           END-READ.
       2000-EXIT.
           EXIT.
