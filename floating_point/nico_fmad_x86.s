.section .rodata
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
	pushq %rbp
	movq  %rsp, %rbp

	movq  $0, %r15       // Index
	pxor  %xmm0, %xmm0   // Result
	leaq  vector_a, %rcx // Base address
	leaq  vector_b, %rdx // Base address

.loop:
	movq  (%rcx, %r15, 8), %xmm1
	movq  (%rdx, %r15, 8), %xmm2

	vfmadd132sd %xmm1, %xmm2, %xmm0

	inc %r15

	cmpq $4, %r15
	jb   .loop

	leave
	ret

_start:
	pushq %rbp
	movq  %rsp, %rbp

	call dot4_example

	movq $0x1, %rax
	movq $0x0, %rdi
	syscall

