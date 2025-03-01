	.file	"bob.c"
	.section	".text"
	.align 4
	.align 32
	.global answer
	.type	answer, #function
	.proc	04
answer:
	jmp	%o7+8
	 popc	%o0, %o0
	.size	answer, .-answer
	.ident	"GCC: (genunix Fri May 11 08:23:40 GMT 2018) 8.1.0"
