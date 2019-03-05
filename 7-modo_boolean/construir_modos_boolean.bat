erase *.obj
erase *.exe

@set INCLUDE=C:\Program Files\Microsoft Visual Studio 12.0\VC\include
@set LIB=C:\Program Files\Microsoft Visual Studio 12.0\VC\lib;C:\Program Files\Microsoft SDKs\Windows\v7.1A\Lib

nasm -f win32 mostrar.asm  --prefix _
nasm -f win32 salida.asm  --prefix _
nasm -f win32 modos_boolean.asm  --prefix _

cl and.c modos_boolean.obj mostrar.obj salida.obj
cl or.c modos_boolean.obj mostrar.obj salida.obj
cl xor.c modos_boolean.obj mostrar.obj salida.obj
cl not.c modos_boolean.obj mostrar.obj salida.obj
cl test.c modos_boolean.obj mostrar.obj salida.obj
