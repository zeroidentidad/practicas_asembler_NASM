erase *.obj
erase *.exe

@set INCLUDE=C:\Program Files\Microsoft Visual Studio 12.0\VC\include
@set LIB=C:\Program Files\Microsoft Visual Studio 12.0\VC\lib;C:\Program Files\Microsoft SDKs\Windows\v7.1A\Lib

nasm -f win32 mostrar.asm  --prefix _
nasm -f win32 salida.asm  --prefix _
nasm -f win32 mover.asm  --prefix _

cl logica_izquierda.c mostrar.obj salida.obj mover.obj
cl logica_derecha.c mostrar.obj salida.obj mover.obj
cl aritmetica_izquierda.c mostrar.obj salida.obj mover.obj
cl aritmetica_derecha.c mostrar.obj salida.obj mover.obj
cl alternar_izquierda.c mostrar.obj salida.obj mover.obj
cl alternar_derecha.c mostrar.obj salida.obj mover.obj
cl acarreo_alternar_izquierda.c mostrar.obj salida.obj mover.obj
cl acarreo_alternar_derecha.c mostrar.obj salida.obj mover.obj
