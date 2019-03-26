assume cs:code,ds:data
data segment
n db 50h,30h,10h,20h,40h
data ends

code segment
start:
mov ax,data
mov ds,ax

mov cx,0005h
mov dx,0004h

outer:
mov si,0000h
mov dx,0004h
inner:
mov al,[si]
cmp al,[si+1]
jg dotheswap
cont:
dec dx
inc si
cmp dx,0000h
jne inner

loop outer
jmp exit

dotheswap:
call swap
jmp cont

swap proc
mov bl,[si]
xchg bl,[si+1]
mov [si],bl
ret
swap endp

exit:
mov ah,4ch
int 21h

code ends
end start



; [SOURCE]: C:\emu8086\MySource\bubble.asm
