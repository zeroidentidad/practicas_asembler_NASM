segment .data
ask1:   db   "Ingrese primer numero: ",0
ask2:   db   "Ingrese segundo numero: ",0
tell    db   "El numero mas grande es: ",0
newline db   10,0
segment .bss
valor1: resd   1
segment .text

    extern in_integer
    extern out_integer
    extern out_string

    global escoger
escoger:
    enter   0,0

    push    dword ask1
    call    in_integer
    pop     ebx
    mov     [valor1],eax
    push    dword ask2
    call    in_integer
    pop     ebx

    xor     ebx,ebx            ; zero ebx
    cmp     eax,[valor1]       ; comparar los dos valores
    setg    bl                 ; establecer bl=1 si valor2 > valor1, sino cero
    not     ebx                ; cumplimiento del primero
    inc     ebx                ; cumplimiento del segundo
    mov     ecx,ebx            ; copiar en ecx
    and     ecx,eax            ; ecx es: o segundo valor, o cero
    not     ebx                ; ebx es cero o todos
    and     ebx,[valor1]       ; ebx es cero o primer de valor
    or      ecx,ebx            ; ecx es ya sea primer o segundo valor

    push    dword tell
    call    out_string
    pop     ebx
    push    ecx
    call    out_integer
    pop     ebx
    push    dword newline
    call    out_string
    pop     ebx

    leave
    ret
