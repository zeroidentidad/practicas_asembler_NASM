
@set INCLUDE=c:\program files\microsoft visual studio 9.0\vc\include
@set LIB=c:\program files\microsoft visual studio 9.0\vc\lib;c:\program files\microsoft sdks\windows\v6.0a\lib;

nasm -f win32 twodim.asm  --prefix _

cl mainline.c twodim.obj
