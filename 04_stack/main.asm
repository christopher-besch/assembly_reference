section .data
    digit db 0,10

section .text
    global _start

_start:
    push 4
    push 8
    push 3

    pop rax
    call _print_rax_digit
    pop rax
    call _print_rax_digit
    pop rax
    call _print_rax_digit

    mov rax, 60
    mov rdi, 0
    syscall

_print_rax_digit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

