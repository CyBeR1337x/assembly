;Read an uppercase letter (omit error checking), and display it at the next position on the same line in lower case
.MODEL SMALL
.STACK 100H 
.DATA
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    
    ADD AL, 20H
    
    MOV AH, 2
    MOV DL, AL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
