assume cs:code,ds:data
data segment
  pa equ 20a0h
  pb equ 20a1h
  pc equ 20a2h
  cr equ 20a3h
  rowval db ?
  colval db ?
  scode db ?
data ends

code segment
start:
        mov ax,data
        mov ds,ax
        mov dx,cr
        mov al,90h  ;control word, 
        out dx,al
tryagain:
        mov bl,01h   ;3 rows
        mov bh,03h
        mov cl,00h
next_row:
        mov dx,pc
        mov al,bl
        out dx,al ;check in first row

        mov dx,pa
        in al,dx   ;take single key input

        cmp al,00h ;if there is an input, al will have some one somewhere
        jne calculate; then calculate
        add cl,08h ;everytime 8 will be added to cl provided no key is pressed
        inc ah   ;ah=1
        shl bl,01;bl=2
        dec bh ;bh=2
        jnz next_row ;while there are rows remaining, go to next row
        jmp tryagain ;keep trying until single key input is obtained
calculate:
        mov rowval,ah   ;ah now contains rowval
        mov ah,00h
rot_again:
        ror al,01 ;find the one
        jc next ;once you get one
        inc ah ;if not, inc ah
        inc cl ;inc cl as well
        jmp rot_again
next:
        mov scode,cl ;scode=will be (8*no.of rows traversed before)+ (no. of zeroes encountered before one)
        mov colval,ah ;colval=ah
        mov al,cl ;ax becomes rowval,colval
        call disp ;display it
        mov ah,4ch
        int 21h

disp proc
        mov bl,al
        mov cl,4
        shr al,cl
        cmp al,09
        jle add_30
        add al,07 ;add 7 if ascii jump is required

add_30:
        add al,30h
        mov dl,al
        mov ah,02
        int 21h
        mov al,bl
        and al,0fh
        cmp al,09
        jle add_30_1
        add al,07
add_30_1:
        add al,30h
        mov dl,al
        mov ah,02
        int 21h
        ret

disp endp
code ends
end start
