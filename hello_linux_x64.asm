section .bss
    ; variables


section .data
    ; constants

    hello: db "Hello, World!", 0xa
    hello_len: equ $-hello


section .text
    global _start

    _start:
        mov rax, 1    ; sys_write
        mov rdi, 1
        mov rsi, hello
        mov rdx, hello_len
        syscall

        mov rax, 60   ; sys_exit
        mov rdi, 0
        syscall

