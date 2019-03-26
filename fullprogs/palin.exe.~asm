assume cs:code,ds:data,es:extra
data segment
str1 dw "madam"
msg1 dw "Palindrome$"
msg2 dw "Not a Palindrome$"
data ends

extra segment
str2 dw "madam1"
extra ends

code segment
start:
mov ax,data
mov ds,ax
mov es,ax

lea si,[0004h]
lea di,str2
mov cx,0006h

whileloop:
mov al,[si]
mov bl,[di]
cmp al,bl
jne notapalin
dec si
inc di
loop whileloop

palin:
lea dx,msg1
jmp exit

notapalin:
lea dx,msg2
jmp exit

exit:
mov ah,09h
int 21h

mov ah,4ch
int 21h

code ends
end start





; [SOURCE]: C:\emu8086\MySource\palin.asm
