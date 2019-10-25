cpu 8086
bits 16

	org     100h                ; default com location

	jmp short start
	%include "./kernel/write.asm"

start:
	mov     si, str
	call    kernel_write
	ret

str:    db "XTNIX v0.1.0", 0