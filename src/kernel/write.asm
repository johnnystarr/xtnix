;------------------------------------------------------------------------------
;  kernel_write 0.1.0
;  input:
;------------------------------------------------------------------------------
kernel_write:
.do:        lodsb                   ; loads next byte to al, (inc si)
            cmp     al, 0           ; at the end of our string?
            je      .done           ; if so, leave
            mov     ah, 0eh         ; bios (output char) int
            int     10h             ; call bios int
            jmp     .do             ; loop
.done:      test    dl, 00000001b   ; check no carriage return flag
            jne     .nc             ; if checked, goto nc (no carriage)
            mov     ah, 0eh         ; setup ah for bios output char
            mov     al, 0dh         ; carriage return
            int     10h             ; output carriage return
            mov     al, 0ah         ; new line
            int     10h             ; output new line
.nc:        ret                     ; return

