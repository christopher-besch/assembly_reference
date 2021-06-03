; data definition
section .data
    ; <- name assigned to address in memory of data
    ;    <- define bytes
    ;                       <- newline
    text db "Hello, World!",10

; section .bss <- for data allocated

; code section
section .text
    ; make viewable by linker
    global _start

; label part of code
; start always needed
_start:
    ; call subroutine
    ; same as jump, except for being able to use ret
    call _print_hello

    ; sys_exit
    mov rax, 60
    ; errorcode
    mov rdi, 0
    syscall

_print_hello:
    ; load arguments for syscall
    ; mov -> move data
    ; sys_write has ID 1
    mov rax, 1
    ; filedescriptor
    ; 0 (standard input), 1 (standard output), 2 (standard error)
    mov rdi, 1
    ; &buffer
    ; location of string to write
    mov rsi, text
    ; count
    ; length of string
    mov rdx, 14
    ; to kernel
    syscall
    ; return to caller
    ret
    
