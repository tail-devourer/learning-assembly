# Learning Assembly

## Setup Instructions

The following instructions enables assembling and linking both 32-bit and 64-bit programs on Ubuntu.

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

System call numbers are architecture-specific and defined in the kernel ABI headers installed with *libc*.

For x86-64:

```bash
cat /usr/include/x86_64-linux-gnu/asm/unistd_64.h
```

For x86:

```bash
cat /usr/include/asm/unistd_32.h
```

System call numbers do not match between architectures. For example, the `write` syscall uses `RAX = 1` on x86-64 and `EAX = 4` on x86. Arguments are also passed differently between the two ABIs.

## Manual Pages

For general information on the syscall interface:

```bash
man syscall
```

For details on a specific syscall and its C interface:

```bash
man 2 <function_name>
```

Example:

```bash
man 2 write
```

Note that the C interface may differ from direct syscall usage.

## Reverse Engineering and Inspection

To view hexadecimal dump of a binary:

```bash
xxd program
```

To extract printable strings from a binary:

```bash
strings program
```

For inspecting ELF binaries:

```bash
readelf -a program
```

The above provides structural information but is not sufficient for full reverse engineering.

To disassemble a binary:

```bash
objdump -d program
```

`objdump` outputs GNU (GAS) style assembly. The source files in this repository use NASM syntax instead. The main syntactic difference is operand order and notation. For example, `mov eax, 1` (NASM) vs `mov $0x1, %eax` (GAS).
