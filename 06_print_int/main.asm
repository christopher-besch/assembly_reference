section .bss
    digit_space resb 100
    ; current pointer in digit_space
    digit_space_pos resb 8

section .text
    global _start

_start:
    mov rax, 123
    call _print_rax

    mov rax, 60
    mov rdi, 0
    syscall

; print int pointed at by rax
_print_rax:
    ; current pointer <- initially set to beginning of space
    mov rcx, digit_space
    ; add newline <- filled reversed
    mov rbx, 10
    ; use dereference rcx
    mov [rcx], rbx
    ; increment current pointer
    inc rcx
    ; set value pointed at to next position -> save current pointer
    mov [digit_space_pos], rcx

    ; get each digit of base-10 number in reverse
_print_rax_loop:
    ; divide by 10
    ; rdx shouldn't mess up division
    mov rdx, 0
    mov rbx, 10
    div rbx
    ; store division
    push rax
    ; remainder is last digit
    ; get ascii of digit
    add rdx, 48

    ; rcx gets overriden by syscall
    mov rcx, [digit_space_pos]
    ; store least significant byte of rdx
    mov [rcx], dl
    ; go to next digit
    inc rcx
    ; store current pointer again
    mov [digit_space_pos], rcx

    ; get division back
    pop rax
    ; loop if not 0
    cmp rax, 0
    jne _print_rax_loop

    ; print digits backwards
_print_rax_loop1:
    mov rcx, [digit_space_pos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digit_space_pos]
    dec rcx
    mov [digit_space_pos], rcx

    ; hit start of digit_space
    cmp rcx, digit_space
    jge _print_rax_loop1

    ret

