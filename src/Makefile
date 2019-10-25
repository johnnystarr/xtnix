ASM    = @nasm
AFLAGS = -f bin -O0 -o xtnix.com -dVERSION="$(XTNIX_VERSION)"

xtnix.com:
	$(ASM) $(AFLAGS) kernel.asm

floppy: xtnix.com
	cd /opt/booterify; ./booterify -f 360 bootsector.bin /root/xtnix.com /root/xtnix.flp
