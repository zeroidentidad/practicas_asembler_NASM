segment .data

segment .bss

segment .text
    global gcdlocal
gcdlocal:
    push ebp
    mov  ebp,esp
    sub  esp,8              ; espacio para variables locales
    mov  eax,[ebp+8]        ; x
    mov  [ebp-4],eax
    mov  eax,[ebp+12]       ; y
    mov  [ebp-8],eax
looptop:
    mov  eax,[ebp-4]
    cmp  eax,0              ; if (x == 0) estamos listos
    je   goback
    cmp  eax,[ebp-8]        ; hacer que cierto valor x sea un numero mas grande
    jge  modulo
    xchg eax,[ebp-8]
    mov  [ebp-4],eax
modulo:
    mov  ebx,[ebp-8]
    mov  eax,[ebp-4]
    cdq                    ; set up para division
    idiv ebx               ; dividir edxeax por ebx
    mov  [ebp-4],edx       ; el residuo esta en edx
    jmp  looptop

goback:
    mov  eax,[ebp-8]           ; retornar y
    mov  esp,ebp
    pop  ebp
    ret
