section .text
	global _start
_start:
	mov eax,4          ; ID de llamada al sistema: sys_write - escribir
	mov ebx,1          ; descriptor de archivo para salida estandard
	mov ecx,string     ; dirección de string
	mov edx,length     ; string length
	int 80h            ; llamada al sistema
	mov eax,1          ; ID de llamada al sistema: sys_exit - salida
	mov ebx,0          ; codigo 0 de salida: no error
	int 80h            ; llamada al sistema

section .data
string:  db 'Hola Mundo!',0Ah ; string de salida
length: equ 13                ; longitud del string
