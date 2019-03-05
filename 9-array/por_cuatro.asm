segment .data
segment .bss
segment .text

    global por_cuatro
por_cuatro:
    push    ebp
    mov     ebp,esp

    mov     ebx,[ebp+12]   ; direccion del arreglo
    mov     ecx,[ebp+8]    ; tamaño del arreglo

top:
    mov     eax,[ebx]
    shl     eax,2
    mov     [ebx],eax
    add     ebx,4
    loop    top

    leave
    ret
