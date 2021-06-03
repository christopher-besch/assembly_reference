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

; print string at rax
; rax const char*
_print:
    push rax
    ; counter
    mov rbx, 0

_print_loop:
    ; go to next character
    inc rax
    ; found new counter
    inc rbx
    ; move current char in string to least significant bit of rcx
    mov cl, [rax]
    cmp cl, 0
    jne _print_loop

    ; print
    mov rax, 1
    mov rdi, 1
    ; address to first char
    pop rsi
    mov rdx, rbx
    syscall

    ret

