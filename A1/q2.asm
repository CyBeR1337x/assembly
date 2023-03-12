; Write a grogram to (a) display a “?”, (b) read two decimal digits whose sum is less than 10, (c) display them and their sum on the next line, with an appropriate message.
.MODEL SMALL
.STACK 100H 
.DATA    
    MSG DB 0AH , 0DH, 'THE SUM OF '
    A DB ? 
    MSG2 DB ' AND '
    B DB ?         
    MSG3 DB ' IS $'
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
    MOV BL, AL
    
    INT 21H 
    MOV B, AL 
    
    ADD BL, AL
    SUB BL, 30H
    
    MOV AH, 9
    LEA DX, MSG
    INT 21H
      
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
