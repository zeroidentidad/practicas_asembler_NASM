segment .data

segment .bss
x:    resd  1
y:    resd  1
segment .text
    global gcdmem           ; declaracion global de la funcion gcdmen
gcdmem:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; x
    mov  [x],eax
    mov  eax,[ebp+12]       ; y
    mov  [y],eax
looptop:
    mov  eax,[x]
    cmp  eax,0              ; if (x == 0) estamos listo
    je   goback
    mov  ebx,[y]
    cmp  eax,ebx            ; hacer que cierto valor x sea un numero mas grande
    jge  modulo
    mov  [x],ebx
    mov  [y],eax
modulo:
    mov  ebx,[y]
    mov  eax,[x]
    cdq                    ; set up para division
    idiv ebx               ; dividir edxeax por ebx
    mov  [x],edx           ; el residuo esta en edx
    jmp  looptop

goback:
    mov  eax,[y]           ; return y
    mov  esp,ebp
    pop  ebp
    ret
