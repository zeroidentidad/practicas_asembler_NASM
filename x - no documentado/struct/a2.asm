segment .data
st:     db   'A'
        dd   5000
        db   'B'
        dw   100
segment .bss
segment .text

    global a1
a1:
    enter   0,0

    leave
    mov     eax,st
    ret
