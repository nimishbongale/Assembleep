assume cs:code
code segment
start:
        mov cx,100d
        mov bl,00
next_digit:  mov al,bl
        aam
        add ax,3030h
        mov dl,ah
        mov ah,02
        push ax
       
        int 21h  
        
        pop ax
        mov dl,al
        mov ah,02
        int 21h     
        
        mov dl,0dh
        mov ah,2
        int 21h   
        
        call delay
        inc bl

        loop next_digit
        
        mov ah,4ch
        int 21h

delay proc
        mov si,02202h  ;adjust the delay according to your requirements
        l1:mov di,0ffffh ;generally 0ffffh
        l2:dec di
        jnz l2
        dec si
        jnz l1
        ret
delay endp
code ends
end start
