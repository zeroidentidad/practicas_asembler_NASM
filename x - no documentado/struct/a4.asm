segment .data
segment .bss
segment .text

struc   st
     .intvalue    resd 1
     .shortvalue  resw 1
     .charfirst   resb 1
     .charsecond  resb 1
endstruc

    global a4
a4:
    enter   0,0

    mov     eax,[ebp+8]    ; address of the struct
    mov     dword [eax + st.intvalue],6000
    mov     word [eax + st.shortvalue],200
    mov     byte [eax + st.charfirst],'X'
    mov     byte [eax + st.charsecond],'Y'

    leave
    ret
