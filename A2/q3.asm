.MODEL SMALL
.STACK 100H
.DATA
    M1 DB 0AH, 0DH, 'ENTER A HEX DIGIT: $'
    M2 DB 0AH, 0DH, 'IN DECIMAL IS IT: $'
    M3 DB 0AH, 0DH, 'DO YOU WANT TO DO IT AGAIN? $'
    M4 DB 0AH, 0DH, 'ILLEGAL CHARACTER - ENTER 0 .. 9 OR A .. F: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
START:
    MOV AH, 9
    LEA DX, M1
    INT 21H
START2:    
    MOV AH, 1
    INT 21H
               
    MOV BL, AL 
    
    CMP BL, 41H
    JGE ALPHANUMERIC 
    
    CMP BL, 30H
    JL ILLEGAL
    
    CMP BL, 03AH
    JGE ILLEGAL
    
    MOV AH, 9
    LEA DX, M2
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H 
    JMP ASK

ALPHANUMERIC:
    CMP BL, 46H
    JG ILLEGAL
    
    MOV AH, 9
    LEA DX, M2
    INT 21H
    
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    
    SUB BL, 11H
    
    MOV DL, BL 
    INT 21H
    JMP ASK
ILLEGAL:
    MOV AH, 9
    LEA DX, M4
    INT 21H
    
    JMP START2 
ASK:
    MOV AH, 9
    LEA DX, M3
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, 'y'
    JE START
    
    CMP AL, 'Y'
    JE START 
EXIT:     
    MOV AH, 4CH
    INT 21H
    MAIN ENDP 
END MAIN

    
    
    
