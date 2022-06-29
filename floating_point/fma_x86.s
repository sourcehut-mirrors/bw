	.section .rodata

	/*	Vectors		*/
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

	/*	Messages	*/
msg_fma:
	.ascii "With fused multiply-add: "
msg_fma_len = . - msg_fma

msg_seq:
	.ascii "Sequential computation:  "
msg_seq_len = . - msg_seq



	.section .data
	/* A preallocated buffer to dump a hex string into */
hex_buffer:
	.ascii "0x\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n"
hex_buffer_sz = . - hex_buffer

	.text
	.globl _start

nibble_to_hex: /* Return the hexadecimal character for the given 4bit number in rdi */
	pushq %rbp
	movq  %rsp, %rbp

	cmp $10, %rdi
	jge .nibble_to_hex.ge10

	movq $0x30, %rax		/* Character '0' */
	jmp .nibble_to_hex.out

	.nibble_to_hex.ge10:
	movq $(0x41 - 10), %rax		/* Character 'A' - 10 */

	.nibble_to_hex.out:
	add %rdi, %rax			/* Add whatever we got */

	leave
	ret

print_hex:	/* Print the given number in rdi as a unsigned hexadecimal number to stdout */
	pushq %rbp
	movq  %rsp, %rbp

	movq	$(hex_buffer + hex_buffer_sz - 2), %r15	/* Pointer to the next character to be written */
	movq	$8, %r8					/* Loop counter */
	movq	%rdi, %rbx				/* Move aside the value into rbx */

	.hexloop:
	movq	%rbx, %rcx	/* Load our number */
	andq	$0xff, %rcx	/* Mask off the lowest byte */

	/* Lower nibble */
	movq	%rcx, %rdi	/* Load the nibble */
	andq	$0x0f, %rdi
	call	nibble_to_hex	/* Convert to hex char */
	movb	%al, (%r15)	/* Store out the character */
	decq	%r15		/* Decrement pointer */

	/* Higher nibble */
	movb	%cl, %dil	/* Load the the byte */
	shrq	$4, %rdi	/* shift out the lower 4 bits */
	call	nibble_to_hex
	movb	%al, (%r15)	/* Store the character */
	decq	%r15		/* Decrement pointer */

	shr	$8, %rbx	/* Advance to the next byte */

	decq	%r8		/* Decrement loop counter */
	jnz	.hexloop	/* continue if there are bytes to be converted */

	movq	$4, %rax		/* write( */
	movq	$1, %rdi		/*   stdout, */
	movq	$hex_buffer, %rsi	/*   hex_buffer, */
	movq	$hex_buffer_sz, %rdx	/*   hex_buffer_len */
	syscall				/* ); */

	leave
	ret

dot4_fma:
	pushq %rbp
	movq  %rsp, %rbp

	movq  $0, %r15       // Index
	pxor  %xmm0, %xmm0   // Result
	leaq  vector_a, %rcx // Base address
	leaq  vector_b, %rdx // Base address

dot4_fma.loop:
	movq  (%rcx, %r15, 8), %xmm1
	movq  (%rdx, %r15, 8), %xmm2

	vfmadd231sd %xmm1, %xmm2, %xmm0 // fuk me, this is insane

	inc %r15

	cmpq $4, %r15
	jb   dot4_fma.loop

	leave
	ret

dot4_seq:
	pushq %rbp
	movq %rsp, %rbp

	xorq  %r15, %r15     // Index
	pxor  %xmm0, %xmm0   // Accumulator
	leaq  vector_a, %rcx // Base address of elements of vector_a
	leaq  vector_b, %rdx // Dito, just vector_b


dot4_seq.loop:
	movq  (%rcx, %r15, 8), %xmm1
	movq  (%rdx, %r15, 8), %xmm2

	mulsd %xmm1, %xmm2    // xmm2 *= xmm1
	addsd %xmm2, %xmm0    // xmm0 += xmm2

	inc %r15

	cmp $4, %r15
	jb dot4_seq.loop

	leave
	ret

_start:
	pushq %rbp
	movq  %rsp, %rbp

	/* Print message for fma */
	movq $4, %rax
	movq $1, %rdi
	movq $msg_fma, %rsi
	movq $msg_fma_len, %rdx
	syscall

	/* Perform fma computation and print result (including newline) */
	call dot4_fma
	movq %xmm0, %rdi
	call print_hex

	/* Print message for sequential computation */
	movq $4, %rax
	movq $1, %rdi
	movq $msg_seq, %rsi
	movq $msg_seq_len, %rdx
	syscall

	/* Perform sequential computation and print result */
	call dot4_seq
	movq %xmm0, %rdi
	call print_hex

	/* exit syscall */
	movq $0x1, %rax
	movq $0x0, %rdi
	syscall
