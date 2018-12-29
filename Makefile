CC = /home/noahk/opt/cross/bin/i686-elf-gcc
AS = /home/noahk/opt/cross/bin/i686-elf-as
CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -ffreestanding -O2 -nostdlib -lgcc
export CC AS CFLAGS LDFLAGS
all:
	+$(MAKE) -C boot
	+$(MAKE) -C driver
	+$(MAKE) -C kernel

.PHONY: clean
clean:
	rm -f *.bin *.o
	make -C boot clean
	make -C driver clean
	make -C include clean
	make -C kernel clean
