.MODEL SMALL
.STACK 100H 
.DATA    
    MSG DB 'ENTER THREE INITIALS:$'
    V1 DB ?
    V2 DB ?
    V3 DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX       
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H   
    
    MOV AH, 1
    INT 21H
    MOV V1, AL
    
    INT 21H
    MOV V2, AL 
    
    INT 21H
    MOV V3, AL 
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV DL, V1
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    MOV DL, V2
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    MOV DL, V3
    INT 21H
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
