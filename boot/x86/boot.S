/*
 * boot.S - the bootstrapper for the NOS kernel.
 */

	/* Constants for the multiboot header block */
	.set ALIGN,	1<<0	/* loaded modules go on page boundaries */
	.set MEMINFO,	1<<1	/* give memory map */
	.set FLAGS,	ALIGN | MEMINFO
	.set MAGIC,	0x1BADB002
	.set CHECKSUM,	-(MAGIC + FLAGS)

	/* define program as a kernel */
	.section .multiboot
	.align 4
	.long MAGIC
	.long FLAGS
	.long CHECKSUM

	/* provide a basic 16K stack for the kernel */
	.section .bss
	.align 16
stack_bottom:
	.skip 16384
stack_top:

	/* now for the actual kernel start code */
	.section .text
	.global _start
	.type _start, @function
_start:
	mov $stack_top, %esp
	/* init the FPU */
	fninit			
	/* go ahead and load the high-level kernel */
	call nos_main

	/* On return, lock the system */
	cli
1:	hlt
	jmp 1b

	/* set the size of the start symbol */
	.size _start, . - _start
	
