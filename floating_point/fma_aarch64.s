	/* This thing is FreeBSD arm64 only! */

	.rodata
	/*
	 * a = [1.907607, -.7862027, 1.147311, .9604002]
	 * b = [-.9355000, -.6915108, 1.724470, -.7097529] */
vector_a:
	.double  1.907607
	.double -0.7862027
	.double  1.147311
	.double  0.9604002

vector_b:
	.double -0.9355000
	.double -0.6915108
	.double  1.724470
	.double -0.7097529

msg_fma:
	.ascii "With fused multiply-add:        "
msg_fma_len = . - msg_fma

msg_sequential:
	.ascii "Using a sequential computation: "
msg_sequential_len = . - msg_sequential

	.data
hex_buffer:	/* A preallocated buffer to dump a hex string into */
	.ascii "0x\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n"
hex_buffer_sz = . - hex_buffer

	.text
	.globl _start

nibble_to_hex:	/* Take a 4bit number in x0 and convert it to te corresponding hex */
	stp	fp,	lr,	[sp, #-0x10]!	/* Push a stack frame */

	cmp	x0,	#10

	bge	.nibble_to_hex.ge10
	add	x0,	x0,	#0x30
	b	.nibble_to_hex.out
.nibble_to_hex.ge10:
	add	x0,	x0,	#(0x41 - 10)
.nibble_to_hex.out:
	ldp	fp,	lr,	[sp], #0x10	/* Pop the stack frame */
	ret

print_hex:	/* Print contents of x0 as a unsigned hexadecimal number */
	stp	fp,	lr,	[sp, #-0x10]!	/* Push a stack frame */

	mov	x8,	x0			/* move aside the number into x8 */
	ldr	x3,	=hex_buffer		/* Pointer into the hex buffer */
	add	x3,	x3, #(hex_buffer_sz - 2)	/* Offset so that we before the newline */
	mov	x4,	#8			/* Loop counter */

	.hexloop:
	and	x1,	x8,	#0xFF		/* Mask out the last byte */

	and	x0,	x1,	#0x0F		/* Load low nibble */
	bl	nibble_to_hex			/* Convert to hex char */
	strb	w0,	[x3],	#-1		/* Store the character and decrement our write pointer */

	lsr	x0,	x1,	#4		/* Load high nibble */
	bl	nibble_to_hex			/* Convert to hex char */
	strb	w0,	[x3],	#-1		/* Store the character and decrement our write pointer */

	lsr	x8,	x8,	#8		/* Advance to next byte to be dumped */

	sub	x4,	x4,	#1		/* decrement loop counter */
	cmp	x4,	#0
	bne	.hexloop

	mov	x8,	#4			/* write( */
	mov	x0,	1			/*    stdout */
	ldr	x1,	=hex_buffer		/*    hex_buffer */
	ldr	x2,	=hex_buffer_sz		/*    hex_buffer_sz */
	svc	#0				/* ); */

	ldp	fp,	lr,	[sp], #0x10	/* Pop the stack frame */
	ret

	/* FMA version of the computation */
dot4_fma:
	stp	fp,	lr,	[sp, #-0x10]!	/* Push a stack frame */


	mov	x10,	#0			/* Counter	*/
	fmov	d0,	#0			/* Result	*/
	ldr	x1,	=vector_a		/* Base address */
	ldr	x2,	=vector_b		/* Base address */

.dot4_fma.loop:
	ldr	d1,	[x1,	x10,	LSL #3]	/* d1 = [vector_a + offset * 8] */
	ldr	d2,	[x2,	x10,	LSL #3]	/* d2 = [vector_b + offset * 8] */
	fmadd	d0,	d1,	d2,	d0

	add	x10,	x10,	#1		/* Bump counter */

	cmp	x10,	#4
	blt	.dot4_fma.loop

	ldp	fp,	lr,	[sp], #0x10	/* Pop the stack frame */
	ret

	/* Sequential version of the computation */
dot4_seq:
	stp	fp,	lr,	[sp, #-0x10]!	/* Push a stack frame */


	mov	x10,	#0			/* Counter	*/
	fmov	d0,	#0			/* Result	*/
	ldr	x1,	=vector_a		/* Base address */
	ldr	x2,	=vector_b		/* Base address */

.dot4_seq.loop:
	ldr	d1,	[x1,	x10,	LSL #3]	/* d1 = [vector_a + offset * 8] */
	ldr	d2,	[x2,	x10,	LSL #3]	/* d2 = [vector_b + offset * 8] */

	fmul	d1,	d1,	d2
	fadd	d0,	d0,	d1

	add	x10,	x10,	#1		/* Bump counter */

	cmp	x10,	#4
	blt	.dot4_seq.loop

	ldp	fp,	lr,	[sp], #0x10	/* Pop the stack frame */
	ret

_start:
	stp	fp,	lr,	[sp, #-0x10]!	/* Push stack frame */

	/* FMA first */
	mov	x8,	#4			/* write( */
	mov	x0,	1			/*    stdout */
	ldr	x1,	=msg_fma		/*    msg_fma */
	ldr	x2,	=msg_fma_len		/*    msg_fma_len */
	svc	#0				/* ); */

	/* Do the calculation and dump the hex to stdout */
	bl	dot4_fma
	fmov	x0,	d0	/* Transfer the result of the fmadd into x0 */
	bl	print_hex	/* Convert into hex */



	/* Sequential version */
	mov	x8,	#4			/* write( */
	mov	x0,	1			/*    stdout */
	ldr	x1,	=msg_sequential		/*    msg_sequential */
	ldr	x2,	=msg_sequential_len	/*    msg_sequential_len */
	svc	#0				/* ); */

	/* Do the calculation and dump the hex to stdout */
	bl	dot4_seq
	fmov	x0,	d0	/* Transfer the result of the calculation into x0 */
	bl	print_hex	/* Convert into hex */


	mov	x8,	#1	// exit (
	mov	x0,	#0	//   0
	svc	#0		// );
