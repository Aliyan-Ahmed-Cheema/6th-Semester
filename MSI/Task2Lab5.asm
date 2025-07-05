.DATA
    inputBuffer DB 80         
                DB 0          
                DB 80 DUP(?)  

.CODE


    mov ax, @DATA
    mov ds, ax


    
    mov ah, 0Ah
    mov dx, offset inputBuffer
    int 21h

    mov cl, [inputBuffer+1]      
    lea si, inputBuffer+2        

convert_loop:
    cmp cl, 0                   
    je conversion_done          

    mov al, [si]                
    cmp al, 'a'                 
    jb skip_conversion          
    cmp al, 'z'                 
    ja skip_conversion          

    sub al, 20h                 
    mov [si], al                

skip_conversion:
    inc si                     
    dec cl                     
    jmp convert_loop

conversion_done:
    lea si, inputBuffer+2     
    mov cl, [inputBuffer+1]   
    add si, cx                
    mov byte ptr [si], '$'    

    mov dx, OFFSET inputBuffer+2
    mov ah, 09h
    int 21h

    mov ax, 4C00h
    int 21h

 