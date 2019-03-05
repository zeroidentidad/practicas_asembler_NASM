%macro sti 2
    db   0xC7,0x05
    dd   %2
    dd   %1
%endmacro

segment .data

segment .bss
value1:  resd  1
value2:  resd  1
segment .text

    extern out_dec_registers

    global ascending
ascending:
    enter 0,0
    pushad
    pushfd

 ; set the two values
    sti    500,value1 ; mov dword [value1],500
    sti    200,value2 ; mov dword [value2],200

 ; display the values
    mov   eax,[value1]
    mov   ebx,[value2]
    call  out_dec_registers

 ; swap if necessary
    mov   eax,[value1]
    cmp   eax,[value2]
    jl    ordered
    mov   ebx,[value2]
    mov   [value1],ebx
    mov   [value2],eax
ordered:

 ; display the values
    mov   eax,[value1]
    mov   ebx,[value2]
    call  out_dec_registers

 ; return sequence
    popfd
    popad
    mov    eax,0
    leave
    ret
