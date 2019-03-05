erase mainline.obj
erase sum.obj
erase mainline.exe

nasm -f obj sum.asm --prefix _

bcc32 -I"c:\borland\bcc55\include" -L"c:\borland\bcc55\lib" mainline.c sum.obj
