assume cs:code,ds:data
data segment
        pa equ 20a0h
        pb equ 20a1h
        pc equ 20a2h
        cr equ 20a3h
        msg db "No. of 1's : "
        ones db ?,"$"
data ends
code segment
start:
        mov ax,data
        mov ds,ax

        mov dx,cr
        mov al,82h		; PA – output & PB – input 
        out dx,al

        mov dx,pb
        in al,dx			; read from PB

        mov cx,8
        mov ah,00
rot_again:
        ror al,1
        jnc next
        inc ah			; [ah] = no. of 1’s
next:
        loop rot_again
        mov bl,ah		; store ASCII value of [ah]
        add ah,30h
        mov ones,ah

        lea dx,msg
        mov ah,09h
        int 21h

        ;mov al,00h
        ;ror bl,1			; to check odd or even no of ones
        ;jc disp
        ;mov al,0ffh
disp:
        mov dx,pa
        out dx,al

        mov ah,4ch
        int 21h
code ends
end start
