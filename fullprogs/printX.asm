assume cs:code
code segment
start:
mov ah,00h   ; function to set video mode
mov al,02h   ; 80 x 25 gray scale, try 03
int 10h      ; I am BIOS remember

mov ah,02    ; function to set cursor
mov dh,12d
mov dl,40d
int 10h

mov al, 'X'
mov bl, 8ch
mov cl,1
mov ah,9
int 10h

mov ah,07h
int 21h

mov ah,4ch
int 21h
code ends
end start



; [SOURCE]: C:\emu8086\MySource\printX.asm
