
@set INCLUDE=c:\program files\microsoft visual studio 9.0\vc\include
@set LIB=c:\program files\microsoft visual studio 9.0\vc\lib;c:\program files\microsoft sdks\windows\v6.0a\lib;

nasm -f win32 retrieve.asm  --prefix _

nasm -f win32 in.asm  --prefix _

nasm -f win32 out.asm  --prefix _

cl mainline.c retrieve.obj in.obj out.obj -o mainline
