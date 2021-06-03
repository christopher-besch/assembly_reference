section .data
    digit db 0,10

section .text
    global _start

_start:
    mov rax, 6
    mov rbx, 2
    ; divide rax by rbx
    div rbx
    call _print_rax_digit

    mov rax, 1
    add rax, 4
    call _print_rax_digit

    mov rax, 60
    mov rdi, 0
    syscall
    
_print_rax_digit:
    ; ascii of '0'
    add rax, 48
    ; [digit] -> address of digit
    ; al -> least significant bit of rax
    ; -> newline doesn't get touched
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    ; digit + newline
    mov rdx, 2
    syscall
    ret
