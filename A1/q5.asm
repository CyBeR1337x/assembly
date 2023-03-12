.MODEL SMALL
.STACK 100H 
.DATA    
    MSG DB '***********', 0AH, 0DH, '$'                          
    MS2 DB '****' 
    A DB ?
    B DB ?
    C DB ?     
    MS3 DB '****', 0AH, 0DH, '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 2
    MOV DL, '?'
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV A, AL
    
    INT 21H
    MOV B, AL
    
    INT 21H
    MOV C, AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    MOV DL, 0DH
    INT 21H      
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H  
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    
    LEA DX, MS2
    INT 21H
    
    LEA DX, MSG 
    INT 21H  
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    
    MOV AH, 2
    MOV DL, 07H
    INT 21H
   
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
