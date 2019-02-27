whileloop:
mov ax,fact
mul n
dec n
mov fact,ax
cmp n,01h
jg whileloop
je exit

exit:
mov ah,4ch
int 21h
