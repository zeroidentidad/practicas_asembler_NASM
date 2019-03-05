erase *.obj
erase *.exe

@set INCLUDE=C:\Program Files\Microsoft Visual Studio 12.0\VC\include
@set LIB=C:\Program Files\Microsoft Visual Studio 12.0\VC\lib;C:\Program Files\Microsoft SDKs\Windows\v7.1A\Lib
@set BIN=C:\Program Files\Microsoft Visual Studio 12.0\VC\bin

nasm -f win32 mcd.asm  --prefix _
cl codigoprincipal.c mcd.obj
