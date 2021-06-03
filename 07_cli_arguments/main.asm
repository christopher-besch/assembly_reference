%include "../05_null_termination_macro/print.asm"

section .bss
    buffer resb 1

section .text
    global _start

_start:
    pop rax
    pop rax
    call _print

    ; print newline
    mov [buffer], 10
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall

