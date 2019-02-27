start:
call factproc
jmp exit

factproc:
cmp n,01h
je back
mov ax,fact
mul n
dec n
mov fact,ax
call factproc

back:
ret 

exit:
mov ah,4ch
int 21h
