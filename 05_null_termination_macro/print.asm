; macro constant
STDOUT equ 1

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
    mov rdi, STDOUT
    ; address to first char
    pop rsi
    mov rdx, rbx
    syscall

    ret

