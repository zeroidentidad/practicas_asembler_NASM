
%define CF_BIT 0x00000001
%define PF_BIT 0x00000004
%define AF_BIT 0x00000010
%define ZF_BIT 0x00000040
%define SF_BIT 0x00000080
%define DF_BIT 0x00000400
%define OF_BIT 0x00000800

; El segmento de datos ;;;;;;;;;;;;;;;;
segment .data
string_fmt:  db  "%s",0
integer_fmt: db  "%d",0
flag_string: db  "flags: ",0

cf_string:   db  "CF ",0
pf_string:   db  "PF ",0
af_string:   db  "AF ",0
zf_string:   db  "ZF ",0
sf_string:   db  "SF ",0
df_string:   db  "DF ",0
of_string:   db  "OF ",0
newline_string: db 10,0

hex_reg_fmt:    db "eax: 0x%.8X  ebx: 0x%.8X  ecx: 0x%.8X  edx: 0x%.8X",10
                db  0
dec_reg_fmt:    db "eax: %d  ebx: %d  ecx: %d  edx: %d",10
                db  0

; El segmento bss ;;;;;;;;;;;;;;;;
segment .bss
flags:       resd 1

; El segmento de texto ;;;;;;;;;;;;;;;;
segment .text
    extern printf
    global out_string
out_string:
    enter 0,0
    pushad
    pushfd

    push  dword [ebp+8]
    push  dword string_fmt
    call  printf
    pop   ecx
    pop   ecx

    popfd
    popad
    leave
    ret

    global out_flags
out_flags:
    enter  0,0
    pushad
    pushfd

    push   dword flag_string
    call   out_string
    pop    eax
    mov    eax,[esp]     ; obtener una copia de las banderas
    mov    [flags],eax

; La bandera de acarreo (CF)
    mov    eax,[flags]
    test   eax,CF_BIT
    jz     cf_not
    push   cf_string
    call   out_string 
    pop    eax
cf_not:
; La bandera de paridad (PF)
    mov    eax,[flags]
    test   eax,PF_BIT
    jz     pf_not
    push   pf_string
    call   out_string 
    pop    eax
pf_not:
; La bandera de acarreo auxiliar
    mov    eax,[flags]
    test   eax,AF_BIT
    jz     af_not
    push   af_string
    call   out_string 
    pop    eax
af_not:
; La bandera zero
    mov    eax,[flags]
    test   eax,ZF_BIT
    jz     zf_not
    push   zf_string
    call   out_string 
    pop    eax
zf_not:
; La bandera de signo
    mov    eax,[flags]
    test   eax,SF_BIT
    jz     sf_not
    push   sf_string
    call   out_string 
    pop    eax
sf_not:
; La bandera de direcci�n
    mov    eax,[flags]
    test   eax,DF_BIT
    jz     df_not
    push   df_string
    call   out_string 
    pop    eax
df_not:
; La bandera de desbordamiento
    mov    eax,[flags]
    test   eax,OF_BIT
    jz     of_not
    push   of_string
    call   out_string 
    pop    eax
of_not:
; Un salto de l�nea
    push   dword newline_string
    call   out_string
    pop    eax

    popfd
    popad
    leave
    ret

; ----------------------------
    global out_hex_registers
out_hex_registers:
    enter 0,0
    pushad
    pushfd

    push edx
    push ecx
    push ebx
    push eax
    push dword hex_reg_fmt
    call printf
    add  esp,20

    popfd
    popad
    leave
    ret

    global out_integer
out_integer:
    enter 0,0
    pushad
    pushfd

    push  dword [ebp+8]
    push  dword integer_fmt
    call  printf
    pop   ecx
    pop   ecx

    popfd
    popad
    leave
    ret

    global out_dec_registers
out_dec_registers:
    enter 0,0
    pushad
    pushfd

    push edx
    push ecx
    push ebx
    push eax
    push dword dec_reg_fmt
    call printf
    add  esp,20

    popfd
    popad
    leave
    ret

