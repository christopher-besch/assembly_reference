%include "../05_null_termination_macro/print.asm"

section .bss
    buffer resb 1

section .text
    global _start

_start:
    ; read first argument
    pop rax
    pop rax
    pop rax
    call _print

    ; print newline
    mov rax, 10
    mov [buffer], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

