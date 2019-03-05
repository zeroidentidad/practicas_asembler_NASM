%define a         qword [ebp+8]
%define b         qword [ebp+16]
%define c         qword [ebp+24]
%define solucion1 dword [ebp+32]
%define solucion2 dword [ebp+36]

%define rad         qword [ebp-8]
%define recip_2a    qword [ebp-16]

segment .data
menoscuatro: dw    -4
segment .bss
segment .text

    global cuadratica
cuadratica:
    push   ebp
    mov    ebp,esp
    sub    esp,16    ; dos espacios de trabajo double
    push   ebx

    fild   word [menoscuatro]    ; st: -4
    fld    a                   ; st: a, -4
    fld    c                   ; st: c, a, -4
    fmulp  st1                 ; st: a*c, -4
    fmulp  st1                 ; st: -4*a*c
    fld    b                   ; st: b, -4*a*c
    fld    b                   ; st: b, b, -4*a*c
    fmulp  st1                 ; st: b*b, -4*a*c
    faddp  st1                 ; st: b*b - 4*a*c
    ftst                       ; comparar st0 a 0
    fstsw  ax                  ; ax = palabra de estado
    sahf                       ; banderas = ah
    jb     no_solucion_real

    fsqrt                      ; st: sqrt(b*b - 4*a*c)
    fstp   rad                 ; st: vacio, y radical almacenado
    fld1                       ; st: 1
    fld    a                   ; st: a, 1
    fscale                     ; st: 2*a, 1
    fdivp  st1                 ; st: 1/(2*a)
    fst    recip_2a            ; st: 1/(2*a)
    fld    b                   ; st: b, 1/(2*a)
    fld    rad                 ; st: rad , b, 1/(2*a)
    fsubrp st1                 ; st: rad  - b, 1/(2*a)
    fmulp  st1                 ; st: (-b + rad )/(2*a)
    mov    ebx,solucion1
    fstp   qword [ebx]         ; resultado en solucion1
    fld    b                   ; st: b
    fld    rad                 ; st: rad , b
    fchs                       ; st: -rad , b
    fsubrp st1                 ; st: -rad  - b
    fmul   recip_2a            ; st: (-rad  - b)/(2*a)
    mov    ebx,solucion2
    fstp   qword [ebx]         ; resultado en solucion2
    mov    eax,1               ; retornar valor
    jmp    quit

no_solucion_real:
    mov    eax,0

quit:
    pop    ebx
    mov    esp,ebp
    pop    ebp
    ret
