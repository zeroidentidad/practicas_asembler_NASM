segment .data
char_prompt: db  "Assembly prompt for character: ",0
char_msg:    db  "Returned character: "
character:   db  0
newline:     db  10,0
string_prompt: db "Assembly prompt for string: ",0
string_msg:  db  "Returned string: ",0
string:      dd  0
segment .bss

segment .text

    extern in_char
    extern in_string
    extern out_string
    global prompt_and_read
prompt_and_read:
    enter  0,0
    pushad
    pushfd

    push   dword char_prompt
    call   in_char
    mov    [character],al
    pop    eax
    push   char_msg
    call   out_string
    pop    eax

    push   dword string_prompt
    call   in_string
    mov    [string],eax
    pop    eax
    push   dword [string]
    call   out_string
    pop    eax
    push   dword newline
    call   out_string
    pop    eax

    popfd
    popad
    mov    eax,0
    leave
    ret
