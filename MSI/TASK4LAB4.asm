    mov al,1
    mov ah,2
    mov bl,3
    mov bh,4

    mov cx, 0      

    ; Add first number in AL
    mov dx, 0      
    mov dl, al     
    call ADDITION  ; CX = CX + DX

    ; Add second number in AH
    mov dx, 0
    mov dl, ah     
    call ADDITION  

    ; Add third number in BL
    mov dx, 0
    mov dl, bl     
    call ADDITION  

    ; Add fourth number in BH
    mov dx, 0
    mov dl, bh     
    call ADDITION  

    ; Divide the sum by 4 to obtain the average 2^2=4
    shr cx, 2     ; Average = (AL + AH + BL + BH) / 4

    ; Terminate program
    
    int 21h


ADDITION:
    add cx, dx
    ret

