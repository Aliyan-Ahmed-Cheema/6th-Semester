mov ax, 1111111111111111B
mov cl ,00000100B

mov bx,1
shl bx,cl
not bx
and ax,bx