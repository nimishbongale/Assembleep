assume cs:code,ds:data
data segment
n db 10h,20h,30h,40h,50h
key db 40h
high db 04h
low db 00h
mid db  ?
msg1 db "Not found$"
msg2 db "Found at pos:"
pos db ?,"$"
data ends

code segment
start:
mov ax,data
mov ds,ax

whileloop:
mov low,dl
cmp dl,high
jg notfound

mov al,low
add al,dl
shr al,1

mov mid,al
mov ah,00h
mov si,ax

mov bl,key
cmp bl,[si]
je found
jg righthalf
jl lefthalf

righthalf:
mov cl,mid
inc cl
mov low,cl
jmp whileloop

lefthalf:
mov cl,mid
dec cl
mov high,cl
jmp whileloop

found:
mov cl,mid
add cl,30h
mov pos,cl

lea dx,msg2
jmp exit

notfound:
lea dx,msg1
jmp exit

exit:
mov ah,09h
int 21h

mov ah,4ch
int 21h

code ends
end start

