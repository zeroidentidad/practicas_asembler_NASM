
@set INCLUDE=c:\program files\microsoft visual studio 9.0\vc\include
@set LIB=c:\program files\microsoft visual studio 9.0\vc\lib;c:\program files\microsoft sdks\windows\v6.0a\lib;

nasm -f win32 asc.asm  --prefix _ -l asc.lst
nasm -f win32 asc2.asm  --prefix _ -l asc2.lst
nasm -f win32 asc3.asm  --prefix _ -l asc3.lst
nasm -f win32 out.asm  --prefix _

cl mainline.c asc2.obj out.obj
