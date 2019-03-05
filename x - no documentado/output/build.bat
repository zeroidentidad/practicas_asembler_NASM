
@set INCLUDE=c:\program files\microsoft visual studio 9.0\vc\include
@set LIB=c:\program files\microsoft visual studio 9.0\vc\lib;c:\program files\microsoft sdks\windows\v6.0a\lib;

nasm -f win32 show.asm  --prefix _

nasm -f win32 out.asm  --prefix _

cl mainline.c show.obj out.obj
