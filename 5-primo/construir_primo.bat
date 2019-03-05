erase *.obj
erase *.exe

@set INCLUDE=C:\Program Files\Microsoft Visual Studio 12.0\VC\include
@set LIB=C:\Program Files\Microsoft Visual Studio 12.0\VC\lib;C:\Program Files\Microsoft SDKs\Windows\v7.1A\Lib

nasm -f win32 primo.asm --prefix _
nasm -f win32 entrada.asm --prefix _
nasm -f win32 salida.asm --prefix _
cl codigo_primo.c primo.obj entrada.obj salida.obj 
