.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH, 2
    MOV DL, '?'
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    INT 21H
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    MOV DL, 0DH
    INT 21H
    
    CMP BH, BL
    JG PRINT2 ; FIRST
    
    MOV DL, BH
    INT 21H 
    
    MOV DL, BL
    INT 21H
    
    JMP EXIT
PRINT2:
    MOV DL, BL
    INT 21H 
    MOV DL, BH
    INT 21H        
    
EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
