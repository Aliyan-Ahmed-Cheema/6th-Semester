mov ah,01100101B


test ah,1
jz even ;if ZF if one,AH is even
mov bl,1
jmp done
even:
    mov bl,0
done: