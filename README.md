# Learning Assembly

## Setup Instructions

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install nasm gcc gcc-multilib libc6:i386 build-essential
```

## How to Assemble

### Linux x86-64

```bash
nasm -f elf64 program.asm
ld program.o -o program
```

### Linux x86

```bash
nasm -f elf32 program.asm
ld program.o -o program -m elf_i386
```

## System Call References

System call numbers are defined in architecture-specific `unistd` headers installed with *libc*.

```bash
cat /usr/include/x86_64-linux-gnu/asm/unistd_64.h
```

```bash
cat /usr/include/asm/unistd_32.h
```

## Manual Pages

For general system call documentation and architecture-specific information,

```bash
man syscall
```

For details on a specific syscall and its C interface,

```bash
man 2 <function_name>
```
