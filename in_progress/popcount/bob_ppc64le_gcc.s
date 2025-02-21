	.file	"bob.c"
	.machine power9
	.abiversion 2
	.section	".text"
	.align 2
	.p2align 4,,15
	.globl answer
	.type	answer, @function
answer:
.LFB0:
	.cfi_startproc
	popcntw 3,3
	rldicl 3,3,0,58
	blr
	.long 0
	.byte 0,0,0,0,0,0,0,0
	.cfi_endproc
.LFE0:
	.size	answer,.-answer
	.ident	"GCC: (GENUNIX Sun Jun  2 19:47:18 UTC 2024) 14.1.0"
	.section	.note.GNU-stack,"",@progbits
