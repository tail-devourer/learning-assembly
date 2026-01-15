section .text
    global _start

    _start:
        mov rax, 0x00736c2f6e69622f
        push rax

        mov rax, 59     ; sys_execve
        mov rdi, rsp
        xor rdx, rdx

        push rdx
        push rdi
        mov rsi, rsp

        syscall

        mov rax, 60
        xor rdi, rdi
        syscall

