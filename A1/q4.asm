.MODEL SMALL
.STACK 100H 
.DATA    
    MSG DB 'ENTER A HEX DIGIT: $'
    MSG2 DB 0AH, 0DH, 'IN DECIMAL IT IS 1$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX       
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H  
    
    MOV AH, 1
    INT 21H 
    
    MOV BL, AL    
    SUB BL, 11H 
    
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN
