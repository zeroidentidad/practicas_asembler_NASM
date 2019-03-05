segment .data
st:     dd   5000
        dw   100
        db   'A'
        db   'B'
segment .bss
segment .text

    global a1
a1:
    enter   0,0

    leave
    mov     eax,st
    ret
