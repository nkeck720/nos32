OBJ = kmain.o ../x86-boot.o ../driver/*.o

kernel: kmain.c
	$(CC) kmain.c $(CFLAGS) -o kmain.o
	$(CC) -T linker.ld $(LDFLAGS) -o ../nos.bin $(OBJ)
.PHONY: clean
clean:
	rm -f *.o ../nos.bin
