segment .data

segment .bss

segment .text
    global gcdargs
gcdargs:
    push ebp
    mov  ebp,esp
looptop:
    mov  eax,[ebp+8]
    cmp  eax,0              ; if (x == 0) estamos listos
    je   goback
    mov  ebx,[ebp+12]
    cmp  eax,ebx            ; hacer que cierto valor x sea un numero mas grande
    jge  modulo
    mov  eax,[ebp+8]
    xchg eax,[ebp+12]
    mov  [ebp+8],eax
modulo:
    mov  ebx,[ebp+12]
    mov  eax,[ebp+8]
    cdq                    ; set up para division
    idiv ebx               ; dividir edxeax por ebx
    mov  [ebp+8],edx           ; el residuo esta en edx
    jmp  looptop

goback:
    mov  eax,[ebp+12]           ; retornar y
    mov  esp,ebp
    pop  ebp
    ret
