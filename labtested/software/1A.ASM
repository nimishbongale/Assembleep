assume cs:code,ds:data
data segment
	a db 10h,20h,30h,40h,50h	; Sorting only bytes.
	n db n-a
	key db 20h
	msg1 db "Key not found$"
	msg2 db "Key found at position: "
	pos db ?,"$"			; $ indicates till where message is supposed to be printed
data ends

code segment
start:
        mov ax,data
        mov ds,ax

        mov al,0			; low
        mov dl,n			
        dec dl				; high = n-1
again:
        cmp al,dl
        ja failed
        mov cl,al
        add al,dl			; low + high	
        shr al,1			; mid	
        mov ah,00h
        mov si,ax
        mov bl,[si]			; [mid] in bl
        cmp bl,key
        jae loc1				; [mid]  >=  key ?
        inc al				; no, low = mid+1, to search in second half
        jmp again
loc1:
        je success			; [mid] = key ?
        dec al				; no, high = mid – 1, to search in first half
        mov dl,al
        mov al,cl
        jmp again
failed:
        lea dx,msg1			; key not found
        jmp display
success:
        inc al
        add al,30h
        mov pos, al                        ; store ASCII value at pos.
        lea dx,msg2

display:
        mov ah,9
        int 21h

        mov ah,4ch
        int 21h
code ends
end start
