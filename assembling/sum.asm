segment data

segment bss

segment text
    global sum
sum:
    push ebp
    mov  ebp,esp
    push ebx

    mov  ebx,[ebp+8]
    add  ebx,[ebp+12]

    mov  eax,ebx ; retornar valor
    pop  ebx
    mov  esp,ebp
    pop  ebp
    ret
