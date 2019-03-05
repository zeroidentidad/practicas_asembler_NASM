       org 100h
       mov  eax,[x]
       mov  ebx,[y]
looptop:
       cmp  eax,0              ; if (x == 0) we're done
       je   goback
       cmp  eax,ebx            ; make certain x is the larger number
       jge  modulo
       xchg eax,ebx            ; swap x and y
modulo:
       cdq                    ; set up for division
       idiv ebx               ; divide edxeax by eb
       mov  eax,edx           ; the remainder is in edx
       jmp  looptop
goback:
       mov ah,4Ch
       int 21h
x:     dd   9863
y:     dd   41272
