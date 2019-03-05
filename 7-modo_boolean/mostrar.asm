segment .data
string_al:   db  "        ",10,0
segment .bss
segment .text
    extern out_string
    global showal
showal:
    enter 0,0
    pushad
    pushfd

    mov    ebx,0
looptop:
    rol    al,1
    jc     one
    mov    byte [string_al+ebx],'0'
    jmp    next
one:
    mov    byte [string_al+ebx],'1'
next:
    inc    ebx
    cmp    ebx,8
    jne    looptop

    push   string_al
    call   out_string
    pop    ebx

    popfd
    popad
    leave
    ret
