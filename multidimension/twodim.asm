segment .data
ar:    times 20 dd  0
segment .bss
segment .text

    global twodim
twodim:
    enter   0,0

    mov     eax,5
    imul    eax,3
    add     eax,2
    shl     eax,2
    mov     dword [ar + eax],32

    leave
    mov     eax,ar
    ret
