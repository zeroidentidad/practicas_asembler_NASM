segment .data
      db   __NASM_MAJOR__
      db   __NASM_MINOR__
      db   __NASM_SUBMINOR__
      db   __NASM_PATCHLEVEL__
      dd   __NASM_VERSION_ID__
      db   __NASM_VER__
      db   __FILE__
      dw   __LINE__
segment .bss
segment .text

    global try
try:
    ret
