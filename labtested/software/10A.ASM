assume cs:code,ds:data
data segment
    fname db "test.txt"
    buff db 50 dup (0)
    errmsg db 0ah,0dh,"File not found$"
    closemsg db 0ah,0dh,"File closed successfully$"
data ends

code segment
    start:
    mov ax,data
    mov ds,ax
    mov ah,3dh
    lea dx,fname
    mov al,0
    int 21h
    jnc next
    lea dx,errmsg
    mov ah,09h
    int 21h
    
    jmp finish
    next:
    mov bx,ax
    mov ah,3fh
    mov cx,50d
    
    lea dx,buff
    int 21h
    mov cx,50d
    lea si,buff
    
    repeat:
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop repeat
    
    mov ah,3ch
    int 21h
    
    finish: 
    lea dx,closemsg
    mov ah,09h
    int 21h
    
    mov ah,4ch
    int 21h
code ends
end start