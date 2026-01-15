section .bss
    ; variables


section .data
    ; constants

    hello: db "Hello, World!", 0xa
    hello_len: equ $-hello


section .text
    global _start

    _start:
        mov eax, 4    ; sys_write
        mov ebx, 1
        mov ecx, hello
        mov edx, hello_len
        int 0x80

        mov eax, 1    ; sys_exit
        mov ebx, 0
        int 0x80

