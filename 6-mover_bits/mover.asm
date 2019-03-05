segment .data
segment .bss
segment .text

    extern mostrar_ax

    global logica_izquierda
logica_izquierda:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    shl  ax,1
    call mostrar_ax
    shl  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global logica_derecha
logica_derecha:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    shr  ax,1
    call mostrar_ax
    shr  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global aritmetica_izquierda
aritmetica_izquierda:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    sal  ax,1
    call mostrar_ax
    sal  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global aritmetica_derecha
aritmetica_derecha:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    sar  ax,1
    call mostrar_ax
    sar  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global alternar_izquierda
alternar_izquierda:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    rol  ax,1
    call mostrar_ax
    rol  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global alternar_derecha
alternar_derecha:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    ror  ax,1
    call mostrar_ax
    ror  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global acarreo_alternar_izquierda
acarreo_alternar_izquierda:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    rcl  ax,1
    call mostrar_ax
    rcl  ax,1
    call mostrar_ax

    popad
    leave
    ret

    global acarreo_alternar_derecha
acarreo_alternar_derecha:
    enter  0,0
    pushad

    mov  ax,0x8002
    call mostrar_ax
    rcr  ax,1
    call mostrar_ax
    rcr  ax,1
    call mostrar_ax
    rcr  ax,1
    call mostrar_ax

    popad
    leave
    ret

