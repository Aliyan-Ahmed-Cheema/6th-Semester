mov ah,1
int 21h

sub al,30h
mov dl,al

mov ah,1
int 21h
sub al,30h
add dl,al
add dl,30h
mov ah,2
int 21h