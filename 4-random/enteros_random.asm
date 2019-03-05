segment .data

segment .bss

segment .text
    global enterorandom         ; definimos nuestra variable global
enterorandom:
    push ebp
    mov  ebp,esp
    mov  eax,[ebp+8]        ; primer argumento

    cmp  eax,[ebp+12]       ; asegurarse de que el primer argumento es menor
    jl   inorder
    xchg eax,[ebp+12]       ; intercambiar primero y segundo
    mov  [ebp+8],eax
inorder:                    ; creamos la funcion inorder entre preorder y postorder
    rdtsc                   ; leer contador de marca de tiempo
    shr  eax,2
    mov  ebx,[ebp+12]       ; el valor más grande
    add  ebx,1              ;  sumar uno
    sub  ebx,[ebp+8]        ; subtracción del valor delta
    cdq                     ; limpiar edx
    idiv ebx                ; dividir edxeax por ebx
    add  edx,[ebp+8]

goback:
    mov  eax,edx
    mov  esp,ebp
    pop  ebp
    ret
