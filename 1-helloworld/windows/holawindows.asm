       org 100h
       mov dx,string                 ; definimos la variable string
       mov ah,9                      ; 9 es copiado en el registro ah
       int 21h                       ; colocamos una instrcción de interrupción
       mov ah,4Ch
       int 21h
string db 'Hola, Mundo!',0Dh,0Ah,'$' ; 0Dh es el caracter de retornar, 0Ah es el pie de linea, el signo $ es para terminar la cadena
