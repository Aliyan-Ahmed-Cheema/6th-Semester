Mov cl, 10110011B

MOV dh,0
MOV al,cl
MOV bl,8

c_loop:
    test al,1
    jz skip_inc
    inc dh
skip_inc:
    shr al,1
    dec bl
    jnz c_loop