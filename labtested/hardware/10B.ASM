assume cs:code,ds:data
data segment
 pa equ 20a0h
 pb equ 20a1h
 pc equ 20a2h
 cr equ 20a3h
 data ends

 code segment
 start:
  mov ax,data
  mov ds,ax
  mov dx,cr
  mov al,82h
  out dx,al
  mov al,00h
  mov dx,pa
  out  dx,al
  mov al,0f0h
  out dx,al
  mov dx,pb

scn:
  in al,dx
  and al,0fh
  cmp al,0fh
  je scn
  mov cl,01
  rotate:
  ror al,1
  jc next
  jmp startmov
next :
  add cl,03
  jmp rotate
  startmov:
  mov al,0f0h
  mov dx,pa


nextled:
  out dx,al
  call delay
  inc al
  dec cl
  jnz nextled
  call delay
  call delay
  dec al
  and al,0fh

cmdwn:
  out dx,al
  call delay
  dec al
  cmp al,00h
  jge cmdwn
mov ah,4ch
int 21h

delay proc
 mov bx,02fffh
 l2:
 mov di,0ffffh
 l1:
 dec di
 jnz l1
 dec bx
 jnz l2
 ret
delay endp
code ends
end start 


