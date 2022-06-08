
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

	.text
	.globl _start

dot4_example:
	stp	fp,	lr,	[sp, #-0x10]!	/* Push a stack frame */


	mov	x10,	#0			/* Counter 	*/
	fmov	d0,	#0			/* Result  	*/
	ldr	x1,	=vector_a		/* Base address */
	ldr	x2,	=vector_b		/* Base address */

.loop:
	ldr	d1,	[x1,	x10,	LSL #3]	/* d1 = [vector_a + offset * 8] */
	ldr	d2,	[x2,	x10,	LSL #3]	/* d2 = [vector_b + offset * 8] */
	fmadd	d0,	d1, 	d2,	d0

	add	x10,	x10,	#1		/* Bump counter */

	cmp	x10,	#4
	blt	.loop
	
.out:
	ldp	fp,	lr,	[sp], #0x10	/* Pop the stack frame */
	ret

_start:
	stp	fp,	lr,	[sp, #-0x10]!	/* Push stack frame */

	bl	dot4_example

	mov	x8,	#1	// exit (
	mov	x0,	#0	//   0
	svc	#0	  	// );

