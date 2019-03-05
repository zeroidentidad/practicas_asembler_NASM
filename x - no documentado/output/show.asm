segment .data
str:  db  "This is the output string.",10,0
segment .bss

segment .text
    extern out_string
    global show
show:
    enter 0,0
    push  dword str
    call  out_string
    pop   eax
    leave
    ret

    extern out_flags
    global flags
flags:
    enter 0,0
    mov   eax,44
    cmp   eax,44
    call out_flags
    mov   eax,0   ; return value
    leave
    ret

    extern out_hex_registers
    extern out_dec_registers
    global registers
registers:
    enter 0,0

    mov   eax,0xABCD
    call  out_hex_registers
    call  out_dec_registers

    leave
    ret
