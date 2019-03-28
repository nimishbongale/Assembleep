assume cs:code,ds:data

data segment
    fibo db 10 dup(?)
    n db 07h    ; no. of Fibonacci numbers to be genetared
data ends

code segment
start:
    mov ax, data
    mov ds, ax
    
    lea si, fibo
    mov al, 00h ; fib(n-2)
    mov [si], al
    inc si
    mov bl, 01h ; fib(n-1)
    mov [si], bl
    inc si
    mov cl, n
    sub cl,2  ; already two numbers generated and stored
    mov ch, 00  ; so that I can use loop instruction
    
nextnumber:
    add al, bl  ; fib(n) = fib(n-1) + fib(n-2)
    mov [si], al
    inc si
    xchg al, bl ; al suppose to contain fib(n-2) but it has fib(n-1), so exchange with bl
    loop nextnumber
    
    mov ah,4ch
    int 21h
code ends
end start