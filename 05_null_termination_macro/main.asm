; copy in place
%include "print.asm"

%macro exit 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

section .data
    text db "Hello World!",10,0
    text1 db "I like trains.",10,0

section .text
    global _start

_start:
    mov rax, text
    call _print

    mov rax, text1
    call _print

    exit 0

