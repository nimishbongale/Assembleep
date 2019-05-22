assume cs:code, ds:data

disp macro mesg
lea dx,mesg
mov ah, 9
int 21h
endm

data segment
pwd1  db 'god123' ;set your own password
len1 db len1-pwd1
pwd2 db 10 dup (?)
len2 db ?
mesg1 db  0ah,0dh,"Passwords matched$"
mesg2 db  0ah,0dh,"Passwords did not match$"
mesg3 db  0ah,0dh,"Enter password:$"
mesg4 db  0ah,0dh,"Exceeded 3 attempts. Keyboard locked$"
data ends

code segment
start: mov ax,data
           mov ds,ax
           mov es,ax

           mov bl, 0   ; no of attempts
rpt:    call readpwd
           call match
           inc bl
           cmp bl,3
           jb rpt
           disp mesg4
           mov ah, 4ch
           int 21h

readpwd proc near
           disp mesg3
           mov bh, 0
           lea si, pwd2
           
again:     mov ah,8
           int 21h
           cmp al,0dh
           je  next
           mov [si],al
           inc si
           inc bh
           mov dl,"*"
           mov ah, 2
           int 21h
           jmp again
next:      mov len2, bh
           ret
readpwd endp

match proc near
           mov cl, len1
           cmp cl,len2
           je machstr
           jmp mismatch
machstr:
           lea si, pwd1
           lea di, pwd2
           cld
           mov ch,0
           rep cmpsb
           jnz mismatch
           disp mesg1
           mov ah, 4ch
           int 21h
mismatch:
           disp mesg2
           ret
match endp
code ends
end start
