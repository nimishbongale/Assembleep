assume ds:data,cs:code
data segment
array db 5 dup(?)
n db 05h
first db 00h
second db 01h
code segment
start:
mov ax,data
mov ds,ax

mov si,0000h
factloop:
mov al,first
mov bl,second
cmp n,00h
je exit

add al,bl
mov [si],al
inc si
mov first,bl
mov second,al
dec n
jmp factloop

exit:
mov ah,4ch
int 21h
code ends
end start



; [SOURCE]: C:\emu8086\MySource\fibon.asm
