segment .data
st:     db   'A'
        db   0,0,0
        dd   5000
        db   'B'
        db   0
        dw   100
segment .bss
segment .text

    global a1
a1:
    enter   0,0

    leave
    mov     eax,st
    ret
