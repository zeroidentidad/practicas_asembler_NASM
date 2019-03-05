segment .data
segment .bss
segment .text

    global a_ordenar
a_ordenar:
    push    ebp
    mov     ebp,esp

reiniciar:
    mov     ebx,[ebp+12]   ; direccion del arreglo
    mov     ecx,[ebp+8]    ; tamaño del arreglo
    sub     ecx,1

top:
    mov     eax,[ebx]
    cmp     eax,[ebx+4]
    jle     noswap
    xchg    eax,[ebx+4]
    mov     [ebx],eax
    jmp     reiniciar
noswap:
    add     ebx,4
    loop    top

    leave
    ret
