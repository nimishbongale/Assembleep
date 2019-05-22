assume cs:code,ds:data
data segment
pa equ 20A0h
pb equ 20A1h
pc equ 20A2h
cr equ 20A3h
data ends

code segment
start:
        mov ax,data
        mov ds,ax
        mov dx,cr
        mov al,82h
        out dx,al
        mov al,01

rpt:
        mov dx,pa
        out dx,al
        call delay
        ror al,1
        
        push ax
        mov ah,06h
        mov dl,0ffh
        int 21h
        pop ax
        jz rpt

        mov ah,4ch
        int 21h

delay proc
        mov si,0ffffh
        l2:mov di,0ffffh
        l1:dec di
        jnz l1
        dec si
        jnz l2
        ret
delay endp

code ends
end start
