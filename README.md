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

For example,

```bash
man 2 write
```

## Reverse Engineering

To view hexadecimal dump of a program file, you can use `xxd` utility.

```bash
xxd program
```

If you wish to see all the strings presents in a program file, you can use `strings` utility.

```bash
strings program
```

For Linux (elf) program, you can also use `readelf` utility. This though doesn't reveal the entire information if you're planning to reverse engineer.

```bash
readelf -a program
```

Lastly, there's also `objdump` utility. Please note that the result it provides uses GNU style of assembly while the programs contained in this repo use NASM.

```bash
objdump -d program
```

The major difference between GAS and NASM syntax is that NASM tries to be more readable with `mov eax, 1` (Set eax to 1), while GAS uses a style closer to actual machine code which is similar to `mov $0x1, %eax` (Put 1 into eax).
