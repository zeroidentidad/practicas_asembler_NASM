segment .data
segment .bss
segment .text

    extern showal
    extern out_flags
; funcion operacion and
    global andbits
andbits:
    enter  0,0
    pushad

    mov  al,11110000b
    call showal
    mov  al,00110011b
    call showal
    mov  al,00110011b
    and  al,11110000b
    call showal

    popad
    leave
    ret
; funcion operacion or
    global orbits
orbits:
    enter  0,0
    pushad

    mov  al,11110000b
    call showal
    mov  al,00110011b
    call showal
    mov  al,00110011b
    or   al,11110000b
    call showal

    popad
    leave
    ret
; funcion operacion xor
    global xorbits
xorbits:
    enter  0,0
    pushad

    mov  al,11110000b
    call showal
    mov  al,00110011b
    call showal
    mov  al,00110011b
    xor  al,11110000b
    call showal

    popad
    leave
    ret
; funcion operacion not
    global notbits
notbits:
    enter  0,0
    pushad

    mov  al,00110011b
    call showal
    mov  al,00110011b
    not  al
    call showal

    popad
    leave
    ret
; funcion de prueba, bits originales
    global testbits
testbits:
    enter  0,0
    pushad

    mov  al,11001100b
    call showal
    mov  al,00110011b
    call showal
    mov  al,00110011b
    test al,11001100b
    call out_flags

    mov  al,11100011b
    call showal
    mov  al,11101100b
    call showal
    mov  al,11100011b
    test al,11101100b
    call out_flags

    popad
    leave
    ret
