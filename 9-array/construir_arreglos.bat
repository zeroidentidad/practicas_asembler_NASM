erase *.obj
erase *.exe

@set INCLUDE=C:\Program Files\Microsoft Visual Studio 12.0\VC\include
@set LIB=C:\Program Files\Microsoft Visual Studio 12.0\VC\lib;C:\Program Files\Microsoft SDKs\Windows\v7.1A\Lib

nasm -f win32 por_cuatro.asm  --prefix _
nasm -f win32 ordenar.asm  --prefix _

cl codigo_por_cuatro.c por_cuatro.obj
cl codigo_ordenar.c ordenar.obj
