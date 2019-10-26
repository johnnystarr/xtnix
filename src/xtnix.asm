cpu 8086
bits 16

    org     100h                ; default com location

    jmp short bootstrap

    %include "./version.inc"
    %include "./kernel/kernel.inc"
    %include "./kernel/write.asm"

bootstrap:
    mov     ah, 0x00
    mov     al, 0x03  ; text mode 80x25 16 colors, clear screen
    int     10h
    mov     si, booting
    call    kernel_write

    ; TODO: add other boot cycles here

    mov     si, str
    call    kernel_write
    ret

booting: db "Booting XTNIX...", 0
str: db "XTNIX ", VERSION, 0
