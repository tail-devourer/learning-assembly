section .text
    global _start

    _start:
        push 0x00736c2f
        push 0x6e69622f

        mov eax, 11     ; sys_execve
        mov ebx, esp
        xor edx, edx

        push edx
        push ebx
        mov ecx, esp

        int 0x80

        mov eax, 1
        xor ebx, ebx
        int 0x80

