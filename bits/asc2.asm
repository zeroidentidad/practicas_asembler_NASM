segment .data

segment .bss
value1:  resd  1
value2:  resd  1
segment .text

    extern out_dec_registers

    global ascending
ascending:
    dd     0x000000C8  ; enter 0,0
    db     0x60  ; pushad
    db     0x9C  ; pushfd

 ; set the two values
    dw     0x05C7 ; mov dword [value1],500
    dd     value1 ;  "
    dd     500    ;  "
    dw     0x05C7 ; mov dword [value2],200
    dd     value2 ;  "
    dd     200    ;  "

 ; display the values
    db    0xA1     ; mov   eax,[value1]
    dd    value1   ;  " 
    dw    0x1D8B   ; mov   ebx,[value2]
    dd    value2   ;  " 
    db    0xB9     ; mov   ecx,out_dec_registers
    dd    out_dec_registers
    dw    0xD1FF   ; call  ecx                   ;  "

 ; swap if necessary
    db    0xA1     ; mov   eax,[value1]
    dd    value1   ;  " 
    dw    0x053B   ; cmp   eax,[value2]
    dd    value2   ;  "
    dw    0x117C   ; jl    ordered
    dw    0x1D8B   ; mov   ebx,[value2]
    dd    value2   ;  " 
    dw    0x1D89   ; mov   [value1],ebx
    dd    value1   ;  " 
    db    0xA3     ; mov   [value2],eax
    dd    value2   ;  " 
ordered:

 ; display the values
    db    0xA1     ; mov   eax,[value1]
    dd    value1   ;  " 
    dw    0x1D8B   ; mov   ebx,[value2]
    dd    value2   ;  " 
    db    0xB9     ; mov   ecx,out_dec_registers
    dd    out_dec_registers
    dw    0xD1FF   ; call  ecx                   ;  "

 ; return sequence
    db    0x9D     ; popfd
    db    0x61     ; popad
    db    0xB8     ; mov    eax,0
    dd    0        ;  "
    db    0xC9     ; leave
    db    0xC3     ; ret
