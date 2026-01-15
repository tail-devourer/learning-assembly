section .text
    global _start

    _start:
        push 0x00736c2f
        push 0x6e69622f

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

