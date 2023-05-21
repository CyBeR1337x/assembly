.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 9, 6, 0, 1, 2, 3, 4 ,7
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, ARR
    MOV CX, 8
OUTER:
    MOV DX, CX
    DEC DX
    LEA SI, ARR
INNER: 
    CMP DX, 0
    JNE BODY
    LOOP OUTER
    JMP DISPAY
BODY:  
    MOV AL, [SI]
    MOV BL, [SI+1]
    CMP BL, AL
    JC SWAP
    INC SI
    DEC DX
    JMP INNER 
SWAP:
    MOV [SI], BL
    MOV [SI+1], AL
    DEC DX
    INC SI
    JMP INNER
    
DISPAY:    
    MOV CX, 8
    LEA SI, ARR
    MOV AH, 2 
  
TRAV:
    MOV DL, [SI]
    ADD DL, 30H
    INT 21H 
    INC SI
    
    LOOP TRAV
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
