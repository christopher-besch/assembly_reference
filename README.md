# Linux x86_64 Assembly

## Links

- [linux64.inc](https://pastebin.com/N1ZdmhLw)

## Commands

- `nasm -f elf64 -o hello.o hello.asm`
- `ld hello.o -o hello`

## Registers

| 8-bit | 16-bit | 32-bit | 64-bit |
| :---- | :----- | :----- | :----- |
| al    | ax     | eax    | rax    |
| bl    | bx     | ebx    | rbx    |
| cl    | cx     | ecx    | rcx    |
| dl    | dx     | edx    | rdx    |
| sil   | si     | esi    | rsi    |
| dil   | di     | edi    | rdi    |
| bpl   | bp     | ebp    | rbp    |
| spl   | sp     | esp    | rsp    |
| r8b   | r8w    | r8d    | r8     |
| r9b   | r9w    | r9d    | r9     |
| r10b  | r10w   | r10d   | r10    |
| r11b  | r11w   | r11d   | r11    |
| r12b  | r12w   | r12d   | r12    |
| r13b  | r13w   | r13d   | r13    |
| r14b  | r14w   | r14d   | r14    |
| r15b  | r15w   | r15d   | r15    |

Usually where registers are used, pointers can also be used.
Like instead of `pop reg` `pop [label]` to pop a value off the stack directily into memory.

## System Calls

Can be found [here](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)

| rax | System Call | rdi                              | rsi        | rdx          | r10 | r8  | r9  |
| :-- | :---------- | :------------------------------- | :--------- | :----------- | :-- | :-- | :-- |
| 0   | sys_read    | unsigned int fd (filedescriptor) | char\* buf | size_t count |     |     |     |
| 1   | sys_write   | unsigned int fd                  | char\* buf | size_t count |     |     |     |
| 60  | sys_exit    | int error_code                   |            |              |     |     |     |

## Flags

| Flag Symbol | Description      |
| :---------- | ---------------- |
| CF          | carry            |
| PF          | parity           |
| ZF          | zero             |
| SF          | sign             |
| OF          | overflow         |
| AF          | adjust           |
| IF          | interrup enabled |

Individual flags are part of a register.

## Pointers

32- and 16-bit versions in parentheses

| Name          | Meaning            | Desciption                             |
| :------------ | ------------------ | -------------------------------------- |
| rip (eip, ip) | index pointer      | address to be executed in control flow |
| rsp (esp, sp) | stack pointer      | top of stack                           |
| rbp (ebp, bp) | stack base pointer | bottom of stack                        |

## Conditional Jump

unsigned version in parentheses

| Jump Symbol | Result of cmp a,b / Condition |
| :---------- | :---------------------------- |
| je          | `a=b`                         |
| jne         | `a!=b`                        |
| jg (ja)     | `a>b`                         |
| jge (jae)   | `a>=b`                        |
| jl (jb)     | `a<b`                         |
| jle (jbe)   | `a<=b`                        |
| jz          | `a=0`                         |
| jnz         | `a!=0`                        |
| jo          | overflow occurred             |
| jno         | overflow didn't occur         |
| js          | is signed                     |
| jns         | not signed                    |

## Math Operations

unsigned version in parentheses

| Name               | Description     |
| :----------------- | :-------------- |
| add a, b           | `a = a+b`       |
| sub a, b           | `a = a-b`       |
| mul reg (imul reg) | `rax = rax*reg` |
| div reg (idiv reg) | `rax = raw/reg` |
| neg reg            | `reg = -reg`    |
| inc reg            | `reg = reg+1`   |
| dec reg            | `reg = reg-1`   |
| adc a, b           | `a = a+b+CF`    |
| sbb a, b           | `a = a-b-CF`    |

## NASM Macros

```asm
; prevent symbol collision
%macro freeze 0
%%loop:
    jmp %%loop
%endmacro
```
