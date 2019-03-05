segment data

segment bss

segment text
    global mcd
mcd:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; x
    mov  ebx,[ebp+12]       ; y
looptop:
    cmp  eax,0              ; if (x == 0) estamos listos
    je   goback
    cmp  eax,ebx            ; hacer que cierto valor x sea un numero mas grande
    jge  modulo
    xchg eax,ebx            ; intercambiar x & y
modulo:
    cdq                    ; setup para division
    idiv ebx               ; dividir edxeax por ebx
    mov  eax,edx           ; el residuo esta en edx
    jmp  looptop

goback:
    mov  eax,ebx           ; retornar y
    mov  esp,ebp
    pop  ebp
    ret
