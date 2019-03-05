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
    enter n,0
    push        ; guardar registros
       ;
       ; cuerpo de la funcion
       ;
    pop         ; devolver registros
    mov eax,0   ; retornar valor
    leave
    ret
