segment .data
       ;
       ; data inicializado
       ;
segment .bss
       ;
       ; data unitilizado
       ;
segment .text
    global _func
_func:
    push ebp    ; si necesitamos que esta instrucción se ejecute antes
    mov  ebp,esp ; copiamos ebp en esp
    sub  esp,n   ; sustituimos por enter
    push        ; guardar registros
       ;
       ; cuerpo de la funcion
       ;
    pop         ; devolver registros
    mov  eax,0  ; retornar valor
    mov  esp,ebp
    pop  ebp
    ret
