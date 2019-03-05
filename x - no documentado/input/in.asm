segment .data

segment .bss
char_hold:  resd 1
str_hold:   resb 20
str_len:    equ  $-str_hold-1
value:      resd 1
segment .text

    extern out_string
    extern getchar
    global in_char
in_char:
    enter  0,0
    pushad
    pushfd

    push   dword [ebp+8]
    call   out_string
    pop    eax
    mov    byte [char_hold],' '
    call   getchar
    cmp    eax,10
    jz     .in_char_finish
    mov    [char_hold],al

.in_char_flush:
    call   getchar
    cmp    eax,10
    jnz    .in_char_flush

.in_char_finish:
    popfd
    popad
    mov    al,[char_hold]
    leave
    ret

    global  in_string
in_string:
    enter  0,0
    pushad
    pushfd

    push   dword [ebp+8]
    call   out_string
    pop    eax

    mov    ebx,str_hold    ; address to store string
    mov    byte [ebx],0
    mov    ecx,str_len     ; maximum string length
.in_string_loop:
    call   getchar
    cmp    eax,10
    jz     .in_string_finish

    mov    [ebx],al
    add    ebx,1
    mov    byte [ebx],0
    sub    ecx,1
    jnz    .in_string_loop

.in_string_flush:
    call   getchar
    cmp    eax,10
    jnz    .in_string_flush

.in_string_finish:
    popfd
    popad
    mov    eax,str_hold
    leave
    ret

    global  in_integer
in_integer:
    enter  0,0
    pushad
    pushfd

    push   dword [ebp+8]
    call   in_string
    pop    ebx
    xor    ecx,ecx

.in_integer_loop:
    xor    ebx,ebx
    mov    bl,[eax]
    cmp    bl,0x30
    jl     .in_integer_finish
    cmp    bl,0x39
    jg     .in_integer_finish
    sub    ebx,0x30
    mov    edx,ecx
    shl    edx,1
    shl    ecx,3
    add    ecx,edx
    add    ecx,ebx
    add    eax,1
    jmp    .in_integer_loop

.in_integer_finish:
    mov    [value],ecx
    popfd
    popad
    mov    eax,[value]
    leave
    ret
