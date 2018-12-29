x86-boot.o: boot.S
	$(AS) boot.S -o x86-boot.o

.PHONY: clean x86
clean:
	rm -f *.o
x86: x86-boot.o
	mv x86-boot.o ../../x86-boot.o
