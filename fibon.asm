factloop:
mov al,first
mov bl,second
cmp n,00h
je exit

add al,bl
mov first,bl
mov second,al
dec n
jmp factloop

exit:
mov ah,4ch
int 21h
