	.file	"bob.c"
	.section	".text"
	.align 4
	.global answer
	.type	answer, #function
	.proc	04
answer:
	save	%sp, -176, %sp
	mov	%i0, %g1
	st	%g1, [%fp+2175]
	ld	[%fp+2175], %g1
	srl	%g1, 0, %g1
	popc	%g1, %g1
	sra	%g1, 0, %g1
	mov	%g1, %i0
	return	%i7+8
	 nop
	.size	answer, .-answer
	.ident	"GCC: (genunix Fri May 11 08:23:40 GMT 2018) 8.1.0"
