segment .data
inferior_prompt: db "Valor inferior a probar: ",0
superior_prompt: db "Valor superior a probar: ",0
newline:      db 10,0
segment .bss
inferior:  resd  1
superior:  resd  1
recorrer:   resd  1
factor: resd  1
segment .text

    extern out_integer
    extern in_integer
    extern out_string

    global encontrar_primos
encontrar_primos:
    enter  0,0
    pushad
    pushfd

 ; pedir límites superior e inferior
    push   dword inferior_prompt
    call   in_integer
    pop    ebx
    mov    [inferior],eax
    or     eax,0x00000001
    mov    [recorrer],eax
    push   dword superior_prompt
    call   in_integer
    pop    ebx
    mov    [superior],eax
    mov    dword [factor],2

 ; parte superior del bucle de prueba
factortest:
    mov   eax,[factor]   ; prueba para el factor mas grande
    imul  eax,eax
    cmp   [recorrer],eax
    jl    encontrar

    mov   eax,[recorrer]     ; prueba para el acarreo de división
    mov   ebx,[factor]
    cdq
    idiv  ebx
    cmp   edx,0
    je    siguiente

    add   dword [factor],1  ; empujar factor y ciclar
    jmp   factortest

 ; encontrar un primo
encontrar:
    push  dword [recorrer]
    call  out_integer
    pop   eax
    push  dword newline
    call  out_string
    pop   eax

 ; pasar al siguiente primo candidato
siguiente:
    mov   eax,[recorrer]
    add   eax,2
    cmp   eax,[superior]
    jg    terminado
    mov   [recorrer],eax
    mov   dword [factor],2
    jmp   factortest

terminado:
    popfd
    popad
    mov    eax,0
    leave
    ret
