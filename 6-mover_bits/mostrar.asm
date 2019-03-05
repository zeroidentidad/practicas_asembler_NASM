
segment .data
string_ax:   db  "                "
             db  "  CF="
string_cf:   db  0,10,0
segment .bss
segment .text
    extern out_string
    global mostrar_ax
mostrar_ax:
    enter 0,0
    pushad
    pushfd

    mov    byte [string_cf],'1'
    jc     acarreo
    mov    byte [string_cf],'0'
acarreo:

    mov    ebx,0
looptop:
    rol    ax,1
    jc     uno
    mov    byte [string_ax+ebx],'0'
    jmp    siguiente
uno:
    mov    byte [string_ax+ebx],'1'
siguiente:
    inc    ebx
    cmp    ebx,16
    jne    looptop

    push   string_ax
    call   out_string
    pop    ebx

    popfd
    popad
    leave
    ret
