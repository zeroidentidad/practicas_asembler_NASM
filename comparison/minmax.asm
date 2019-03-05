segment data

segment bss

segment text
    global mini
mini:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]
    cmp  eax,[ebp+12]
    jle  minret
    mov  eax,[ebp+12]
minret:
    mov  esp,ebp
    pop  ebp
    ret

    global maxi
maxi:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]
    cmp  eax,[ebp+12]
    jg   maxret
    mov  eax,[ebp+12]
maxret:
    mov  esp,ebp
    pop  ebp
    ret

    global abso
abso:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]
    cmp  eax,0
    jge  absret
    mov  eax,0
    sub  eax,[ebp+8]
absret:
    mov  esp,ebp
    pop  ebp
    ret
