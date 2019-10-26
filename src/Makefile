ASM    = @nasm
ISOBIN = @mkisofs
AFLAGS = -f bin -O0 -o xtnix.com -dVERSION="$(XTNIX_VERSION)"

xtnix.com:
	$(ASM) $(AFLAGS) xtnix.asm

floppy360: xtnix.com
	cd /opt/booterify; ./booterify -f 360 bootsector.bin /root/xtnix.com /root/xtnix.flp

floppy1440: xtnix.com
	cd /opt/booterify; ./booterify -f 1440 bootsector.bin /root/xtnix.com /root/xtnix.flp

iso: floppy1440
	$(ISOBIN) -quiet -V 'XTNIX' -input-charset iso8859-1 -o xtnix.iso -b xtnix.flp ./ || exit
