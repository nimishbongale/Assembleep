Assume cs:code,ds:data
data segment
        x db 10h,05h,03h,15h,01h	
        n dw n-x
data ends

code segment
start:
        mov ax,data
        mov ds,ax

        mov bx,n
        dec bx		; no. of passes required
next_pass:
        mov cx,bx	; no. of comparisons in a pass = no. of passes remaining including that pass
        mov ah,00	
        lea si,x
next_comp:
        mov al,[si]
        cmp al,[si+1]
        jle do_nothing
        xchg al,[si+1]
        mov [si],al
        mov ah,1
do_nothing:
        inc si
        loop next_comp
        cmp ah, 0
        je finish		
        dec bx
        jnz next_pass
finish:
        mov ah,4ch
        int 21h
code ends
end start