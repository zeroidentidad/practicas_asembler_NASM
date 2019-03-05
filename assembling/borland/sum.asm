segment data use32

segment bss use32

segment text use32
    global sum
sum:
    push ebp
    mov  ebp,esp
    push ebx

    mov  ebx,[ebp+8]
    add  ebx,[ebp+12]

    mov  eax,ebx ; return value
    pop  ebx
    mov  esp,ebp
    pop  ebp
    ret
