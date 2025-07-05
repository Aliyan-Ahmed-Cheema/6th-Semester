Mov cl, 10010101B

MOV dh,0


L:
    test cl,1
    jz skip_inc
    inc dh
skip_inc:
    shr cl,1
    inc cl
    loop L
