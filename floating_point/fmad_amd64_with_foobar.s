	.file	"fmad.c"
	.text
.Ltext0:
	.file 1 "fmad.c"
	.section	.rodata
.LC16:
	.string	"NOTE : this machine is a "
.LC17:
	.string	"big"
.LC18:
	.string	"little"
.LC19:
	.string	" endian architecture.\n"
	.align 8
.LC20:
	.string	"     : Be sure to adjust your brain accordingly.\n\n\n"
	.align 8
.LC21:
	.string	"--------------- Maybe no FMA Calls ---------------\n\n"
.LC22:
	.string	"        fp32  = %-+24.18e\n"
.LC23:
	.string	" dotme_fp32  is "
.LC24:
	.string	"0x%02x "
.LC25:
	.string	"\n\n"
.LC26:
	.string	"        fp64  = %-+24.18e\n"
.LC27:
	.string	" dotme_fp64  is "
.LC28:
	.string	"        fp128 = %-+24.18Le\n"
.LC29:
	.string	" dotme_fp128 is "
.LC30:
	.string	"\n\n\n\n"
	.align 8
.LC31:
	.string	"-------------------- FMA Calls -------------------\n\n"
.LC33:
	.string	"  fmaf fp32   = %-+24.18e\n"
.LC35:
	.string	"  fma  fp64   = %-+24.18e\n"
.LC37:
	.string	"  fmal fp128  = %-+24.18Le\n"
.LC38:
	.string	"\n\n\n"
	.align 8
.LC39:
	.string	"--------------------------------------------------\n\n"
	.align 8
.LC40:
	.string	"\nCorrect result is +5.595788259858e-02\n"
	.align 8
.LC41:
	.string	"or this    0x3faca682f76db9b9 from ARMv8\n"
	.align 8
.LC42:
	.string	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+\n"
	.align 8
.LC43:
	.string	"Same thing on Intel Core i5-7300U K8-class CPU\n"
	.align 8
.LC44:
	.string	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a\n"
	.align 8
.LC45:
	.string	"\nNOTE : IBM Power systems may report strange fp128 hex values\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 43 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rbx, -8(%rbp)
	subq	$544, %rsp
	.cfi_offset 3, -24
	movl	%edi, -484(%rbp)
	movq	%rsi, -496(%rbp)
	.loc 1 82 20
	movl	$1072966775, %esi
	movl	%esi, %edi
	movq	%rcx, %r8
	movabsq	$-4294967296, %rsi
	andq	%r8, %rsi
	orq	%rdi, %rsi
	movq	%rsi, %rcx
	movl	$-1085717355, %esi
	movl	%esi, %esi
	salq	$32, %rsi
	movq	%rcx, %rdi
	movl	%edi, %edi
	orq	%rdi, %rsi
	movq	%rsi, %rcx
	movl	$1066588950, %esi
	movl	%esi, %edi
	movq	%rbx, %r8
	movabsq	$-4294967296, %rsi
	andq	%r8, %rsi
	orq	%rdi, %rsi
	movq	%rsi, %rbx
	movl	$1064688842, %esi
	movl	%esi, %esi
	salq	$32, %rsi
	movq	%rbx, %rdi
	movl	%edi, %edi
	orq	%rdi, %rsi
	movq	%rsi, %rbx
	movq	%rcx, -240(%rbp)
	movq	%rbx, -232(%rbp)
	.loc 1 83 20
	movl	$-1083212562, %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movabsq	$-4294967296, %rcx
	andq	%rdi, %rcx
	orq	%rsi, %rcx
	movq	%rcx, %rax
	movl	$-1087306022, %ecx
	movl	%ecx, %ecx
	salq	$32, %rcx
	movq	%rax, %rsi
	movl	%esi, %esi
	orq	%rsi, %rcx
	movq	%rcx, %rax
	movl	$1071430511, %ecx
	movl	%ecx, %esi
	movq	%rdx, %rdi
	movabsq	$-4294967296, %rcx
	andq	%rdi, %rcx
	orq	%rsi, %rcx
	movq	%rcx, %rdx
	movl	$-1086999970, %ecx
	movl	%ecx, %ecx
	salq	$32, %rcx
	movq	%rdx, %rsi
	movl	%esi, %esi
	orq	%rsi, %rcx
	movq	%rcx, %rdx
	movq	%rax, -256(%rbp)
	movq	%rdx, -248(%rbp)
	.loc 1 86 21
	movlpd	.LC0(%rip), %xmm0
	movsd	%xmm0, -224(%rbp)
	movlpd	.LC1(%rip), %xmm0
	movsd	%xmm0, -216(%rbp)
	movlpd	.LC2(%rip), %xmm0
	movsd	%xmm0, -208(%rbp)
	movlpd	.LC3(%rip), %xmm0
	movsd	%xmm0, -200(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -288(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -280(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, -272(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, -264(%rbp)
	.loc 1 87 21
	movlpd	.LC4(%rip), %xmm0
	movsd	%xmm0, -192(%rbp)
	movlpd	.LC5(%rip), %xmm0
	movsd	%xmm0, -184(%rbp)
	movlpd	.LC6(%rip), %xmm0
	movsd	%xmm0, -176(%rbp)
	movlpd	.LC7(%rip), %xmm0
	movsd	%xmm0, -168(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, -320(%rbp)
	movq	-184(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	-176(%rbp), %rax
	movq	%rax, -304(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -296(%rbp)
	.loc 1 95 26
	fldt	.LC8(%rip)
	fstpt	-160(%rbp)
	fldt	.LC9(%rip)
	fstpt	-144(%rbp)
	fldt	.LC10(%rip)
	fstpt	-128(%rbp)
	fldt	.LC11(%rip)
	fstpt	-112(%rbp)
	movq	-160(%rbp), %rax
	movq	%rax, -384(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -376(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, -368(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, -360(%rbp)
	movq	-128(%rbp), %rax
	movq	%rax, -352(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, -344(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, -336(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, -328(%rbp)
	.loc 1 96 26
	fldt	.LC12(%rip)
	fstpt	-96(%rbp)
	fldt	.LC13(%rip)
	fstpt	-80(%rbp)
	fldt	.LC14(%rip)
	fstpt	-64(%rbp)
	fldt	.LC15(%rip)
	fstpt	-48(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -448(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -440(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -432(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -408(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -400(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, -392(%rbp)
	.loc 1 105 5
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	.loc 1 106 10
	call	endian
	.loc 1 106 8
	testl	%eax, %eax
	je	.L2
	.loc 1 107 9
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	jmp	.L3
.L2:
	.loc 1 109 9
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
.L3:
	.loc 1 111 5
	movl	$.LC19, %edi
	movl	$0, %eax
	call	printf
	.loc 1 112 5
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	.loc 1 114 5
	movl	$.LC21, %edi
	movl	$0, %eax
	call	printf
	.loc 1 121 11
	movss	-240(%rbp), %xmm1
	.loc 1 121 18
	movss	-256(%rbp), %xmm0
	.loc 1 121 15
	mulss	%xmm0, %xmm1
	.loc 1 125 11
	movss	-236(%rbp), %xmm2
	.loc 1 125 18
	movss	-252(%rbp), %xmm0
	.loc 1 125 15
	mulss	%xmm2, %xmm0
	.loc 1 123 10
	addss	%xmm0, %xmm1
	.loc 1 129 11
	movss	-232(%rbp), %xmm2
	.loc 1 129 18
	movss	-248(%rbp), %xmm0
	.loc 1 129 15
	mulss	%xmm2, %xmm0
	.loc 1 127 10
	addss	%xmm0, %xmm1
	.loc 1 133 11
	movss	-228(%rbp), %xmm2
	.loc 1 133 18
	movss	-244(%rbp), %xmm0
	.loc 1 133 15
	mulss	%xmm2, %xmm0
	.loc 1 131 10
	addss	%xmm1, %xmm0
	.loc 1 119 16
	movss	%xmm0, -452(%rbp)
	.loc 1 136 5
	movss	-452(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC22, %edi
	movl	$1, %eax
	call	printf
	.loc 1 138 5
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 139 11
	movq	$0, -24(%rbp)
	.loc 1 139 5
	jmp	.L4
.L5:
	.loc 1 140 51 discriminator 3
	leaq	-452(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 140 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 139 33 discriminator 3
	incq	-24(%rbp)
.L4:
	.loc 1 139 16 discriminator 1
	cmpq	$3, -24(%rbp)
	jbe	.L5
	.loc 1 142 5
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 1 190 13
	movlpd	-288(%rbp), %xmm1
	.loc 1 190 22
	movlpd	-320(%rbp), %xmm0
	.loc 1 190 17
	mulsd	%xmm0, %xmm1
	.loc 1 194 13
	movlpd	-280(%rbp), %xmm2
	.loc 1 194 22
	movlpd	-312(%rbp), %xmm0
	.loc 1 194 17
	mulsd	%xmm2, %xmm0
	.loc 1 192 10
	addsd	%xmm0, %xmm1
	.loc 1 198 13
	movlpd	-272(%rbp), %xmm2
	.loc 1 198 22
	movlpd	-304(%rbp), %xmm0
	.loc 1 198 17
	mulsd	%xmm2, %xmm0
	.loc 1 196 10
	addsd	%xmm0, %xmm1
	.loc 1 202 13
	movlpd	-264(%rbp), %xmm2
	.loc 1 202 22
	movlpd	-296(%rbp), %xmm0
	.loc 1 202 17
	mulsd	%xmm2, %xmm0
	.loc 1 200 10
	addsd	%xmm1, %xmm0
	.loc 1 188 16
	movsd	%xmm0, -464(%rbp)
	.loc 1 204 5
	movlpd	-464(%rbp), %xmm0
	movl	$.LC26, %edi
	movl	$1, %eax
	call	printf
	.loc 1 205 5
	movl	$.LC27, %edi
	movl	$0, %eax
	call	printf
	.loc 1 206 11
	movq	$0, -24(%rbp)
	.loc 1 206 5
	jmp	.L6
.L7:
	.loc 1 207 51 discriminator 3
	leaq	-464(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 207 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 206 34 discriminator 3
	incq	-24(%rbp)
.L6:
	.loc 1 206 16 discriminator 1
	cmpq	$7, -24(%rbp)
	jbe	.L7
	.loc 1 209 5
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 1 222 14
	fldt	-384(%rbp)
	.loc 1 222 24
	fldt	-448(%rbp)
	.loc 1 222 18
	fmulp	%st, %st(1)
	.loc 1 226 14
	fldt	-368(%rbp)
	.loc 1 226 24
	fldt	-432(%rbp)
	.loc 1 226 18
	fmulp	%st, %st(1)
	.loc 1 224 10
	faddp	%st, %st(1)
	.loc 1 230 14
	fldt	-352(%rbp)
	.loc 1 230 24
	fldt	-416(%rbp)
	.loc 1 230 18
	fmulp	%st, %st(1)
	.loc 1 228 10
	faddp	%st, %st(1)
	.loc 1 234 14
	fldt	-336(%rbp)
	.loc 1 234 24
	fldt	-400(%rbp)
	.loc 1 234 18
	fmulp	%st, %st(1)
	.loc 1 232 10
	faddp	%st, %st(1)
	.loc 1 220 17
	fstpt	-480(%rbp)
	.loc 1 236 5
	fldt	-480(%rbp)
	fstpt	(%rsp)
	movl	$.LC28, %edi
	movl	$0, %eax
	call	printf
	.loc 1 237 5
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
	.loc 1 238 11
	movq	$0, -24(%rbp)
	.loc 1 238 5
	jmp	.L8
.L9:
	.loc 1 239 52 discriminator 3
	leaq	-480(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 239 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 238 39 discriminator 3
	incq	-24(%rbp)
.L8:
	.loc 1 238 16 discriminator 1
	cmpq	$15, -24(%rbp)
	jbe	.L9
	.loc 1 241 5
	movl	$.LC30, %edi
	movl	$0, %eax
	call	printf
	.loc 1 243 5
	movl	$.LC31, %edi
	movl	$0, %eax
	call	printf
	.loc 1 266 85
	movss	-256(%rbp), %xmm1
	.loc 1 266 79
	movss	-240(%rbp), %xmm0
	.loc 1 266 18
	xorps	%xmm2, %xmm2
	call	fmaf
	movaps	%xmm0, %xmm1
	.loc 1 266 67
	movss	-252(%rbp), %xmm3
	.loc 1 266 61
	movss	-236(%rbp), %xmm0
	.loc 1 266 18
	movaps	%xmm1, %xmm2
	movaps	%xmm3, %xmm1
	call	fmaf
	movaps	%xmm0, %xmm1
	.loc 1 266 49
	movss	-248(%rbp), %xmm3
	.loc 1 266 43
	movss	-232(%rbp), %xmm0
	.loc 1 266 18
	movaps	%xmm1, %xmm2
	movaps	%xmm3, %xmm1
	call	fmaf
	movaps	%xmm0, %xmm1
	.loc 1 266 31
	movss	-244(%rbp), %xmm3
	.loc 1 266 25
	movss	-228(%rbp), %xmm0
	.loc 1 266 18
	movaps	%xmm1, %xmm2
	movaps	%xmm3, %xmm1
	call	fmaf
	.loc 1 266 16
	movss	%xmm0, -452(%rbp)
	.loc 1 268 5
	movss	-452(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC33, %edi
	movl	$1, %eax
	call	printf
	.loc 1 270 5
	movl	$.LC23, %edi
	movl	$0, %eax
	call	printf
	.loc 1 271 11
	movq	$0, -24(%rbp)
	.loc 1 271 5
	jmp	.L10
.L11:
	.loc 1 272 51 discriminator 3
	leaq	-452(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 272 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 271 33 discriminator 3
	incq	-24(%rbp)
.L10:
	.loc 1 271 16 discriminator 1
	cmpq	$3, -24(%rbp)
	jbe	.L11
	.loc 1 274 5
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 1 278 97
	movlpd	-320(%rbp), %xmm1
	.loc 1 278 89
	movlpd	-288(%rbp), %xmm0
	.loc 1 278 18
	xorpd	%xmm2, %xmm2
	call	fma
	movsd	%xmm0, %xmm1
	.loc 1 278 76
	movlpd	-312(%rbp), %xmm3
	.loc 1 278 68
	movlpd	-280(%rbp), %xmm0
	.loc 1 278 18
	movsd	%xmm1, %xmm2
	movsd	%xmm3, %xmm1
	call	fma
	movsd	%xmm0, %xmm1
	.loc 1 278 55
	movlpd	-304(%rbp), %xmm3
	.loc 1 278 47
	movlpd	-272(%rbp), %xmm0
	.loc 1 278 18
	movsd	%xmm1, %xmm2
	movsd	%xmm3, %xmm1
	call	fma
	movsd	%xmm0, %xmm1
	.loc 1 278 34
	movlpd	-296(%rbp), %xmm3
	.loc 1 278 26
	movlpd	-264(%rbp), %xmm0
	.loc 1 278 18
	movsd	%xmm1, %xmm2
	movsd	%xmm3, %xmm1
	call	fma
	.loc 1 278 16
	movsd	%xmm0, -464(%rbp)
	.loc 1 280 5
	movlpd	-464(%rbp), %xmm0
	movl	$.LC35, %edi
	movl	$1, %eax
	call	printf
	.loc 1 281 5
	movl	$.LC27, %edi
	movl	$0, %eax
	call	printf
	.loc 1 282 11
	movq	$0, -24(%rbp)
	.loc 1 282 5
	jmp	.L12
.L13:
	.loc 1 283 51 discriminator 3
	leaq	-464(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 283 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 282 34 discriminator 3
	incq	-24(%rbp)
.L12:
	.loc 1 282 16 discriminator 1
	cmpq	$7, -24(%rbp)
	jbe	.L13
	.loc 1 285 5
	movl	$.LC25, %edi
	movl	$0, %eax
	call	printf
	.loc 1 289 110
	fldt	-448(%rbp)
	.loc 1 289 101
	fldt	-384(%rbp)
	.loc 1 289 19
	fldz
	fstpt	32(%rsp)
	fxch	%st(1)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal
	.loc 1 289 86
	fldt	-432(%rbp)
	.loc 1 289 77
	fldt	-368(%rbp)
	fxch	%st(2)
	.loc 1 289 19
	fstpt	32(%rsp)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal
	.loc 1 289 62
	fldt	-416(%rbp)
	.loc 1 289 53
	fldt	-352(%rbp)
	fxch	%st(2)
	.loc 1 289 19
	fstpt	32(%rsp)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal
	.loc 1 289 38
	fldt	-400(%rbp)
	.loc 1 289 29
	fldt	-336(%rbp)
	fxch	%st(2)
	.loc 1 289 19
	fstpt	32(%rsp)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal
	.loc 1 289 17
	fstpt	-480(%rbp)
	.loc 1 291 5
	fldt	-480(%rbp)
	fstpt	(%rsp)
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	.loc 1 292 5
	movl	$.LC29, %edi
	movl	$0, %eax
	call	printf
	.loc 1 293 11
	movq	$0, -24(%rbp)
	.loc 1 293 5
	jmp	.L14
.L15:
	.loc 1 294 52 discriminator 3
	leaq	-480(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 294 9 discriminator 3
	movzbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	.loc 1 293 39 discriminator 3
	incq	-24(%rbp)
.L14:
	.loc 1 293 16 discriminator 1
	cmpq	$15, -24(%rbp)
	jbe	.L15
	.loc 1 296 5
	movl	$.LC38, %edi
	movl	$0, %eax
	call	printf
	.loc 1 298 5
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	.loc 1 302 5
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	.loc 1 303 5
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	.loc 1 304 5
	movl	$.LC42, %edi
	movl	$0, %eax
	call	printf
	.loc 1 305 5
	movl	$.LC43, %edi
	movl	$0, %eax
	call	printf
	.loc 1 306 5
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	.loc 1 308 5
	movl	$.LC45, %edi
	movl	$0, %eax
	call	printf
	.loc 1 310 12
	movl	$42, %eax
	.loc 1 312 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.type	endian, @function
endian:
.LFB4:
	.loc 1 315 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 316 9
	movl	$1, -4(%rbp)
	.loc 1 317 25
	leaq	-4(%rbp), %rax
	.loc 1 317 14
	movzbl	(%rax), %eax
	.loc 1 317 42
	cmpb	$1, %al
	setne	%al
	movzbl	%al, %eax
	.loc 1 317 11
	movl	%eax, -4(%rbp)
	.loc 1 318 12
	movl	-4(%rbp), %eax
	.loc 1 319 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	endian, .-endian
	.section	.rodata
	.align 8
.LC0:
	.long	-353767866
	.long	1073644942
	.align 8
.LC1:
	.long	-1869554596
	.long	-1075238766
	.align 8
.LC2:
	.long	-948603657
	.long	1072847714
	.align 8
.LC3:
	.long	859983020
	.long	1072610201
	.align 8
.LC4:
	.long	-1305670058
	.long	-1074925667
	.align 8
.LC5:
	.long	1104844259
	.long	-1075437349
	.align 8
.LC6:
	.long	-623972849
	.long	1073452909
	.align 8
.LC7:
	.long	-1229473902
	.long	-1075399093
	.align 16
.LC8:
	.long	1332882971
	.long	-198412457
	.long	16383
	.long	0
	.align 16
.LC9:
	.long	-2031952464
	.long	-918252412
	.long	49150
	.long	0
	.align 16
.LC10:
	.long	-1415071465
	.long	-1831135685
	.long	16383
	.long	0
	.align 16
.LC11:
	.long	308632914
	.long	-170079846
	.long	16382
	.long	0
	.align 16
.LC12:
	.long	1752346657
	.long	-277025391
	.long	49150
	.long	0
	.align 16
.LC13:
	.long	-726722210
	.long	-1324951026
	.long	49150
	.long	0
	.align 16
.LC14:
	.long	2003859942
	.long	-591696170
	.long	16383
	.long	0
	.align 16
.LC15:
	.long	-1111716207
	.long	-1246601803
	.long	49150
	.long	0
	.text
.Letext0:
	.file 2 "/usr/include/sys/common_int_types.h"
	.file 3 "/opt/bw/gcc12/lib/gcc/x86_64--netbsd/12.2.0/include-fixed/stdio.h"
	.file 4 "/usr/include/stdint.h"
	.file 5 "/opt/bw/gcc12/lib/gcc/x86_64--netbsd/12.2.0/include-fixed/math.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x284
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0xc
	.long	.LASF25
	.byte	0xc
	.long	.LASF26
	.long	.LASF27
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x6
	.long	.LASF8
	.byte	0x2
	.byte	0x2e
	.byte	0x1b
	.long	0x4f
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x7
	.long	0x77
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0xe
	.long	0x77
	.uleb128 0x6
	.long	.LASF9
	.byte	0x3
	.byte	0x3b
	.byte	0x16
	.long	0x2e
	.uleb128 0x6
	.long	.LASF10
	.byte	0x4
	.byte	0x2c
	.byte	0x13
	.long	0x43
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x3
	.long	0x9b
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0x3
	.long	0xa7
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF13
	.uleb128 0x3
	.long	0xb3
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.value	0x1f0
	.byte	0xd
	.long	0xb3
	.long	0xe0
	.uleb128 0x2
	.long	0xb3
	.uleb128 0x2
	.long	0xb3
	.uleb128 0x2
	.long	0xb3
	.byte	0
	.uleb128 0xf
	.string	"fma"
	.byte	0x5
	.value	0x1e8
	.byte	0x8
	.long	0xa7
	.long	0x101
	.uleb128 0x2
	.long	0xa7
	.uleb128 0x2
	.long	0xa7
	.uleb128 0x2
	.long	0xa7
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.value	0x1ec
	.byte	0x7
	.long	0x9b
	.long	0x122
	.uleb128 0x2
	.long	0x9b
	.uleb128 0x2
	.long	0x9b
	.uleb128 0x2
	.long	0x9b
	.byte	0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x3
	.value	0x104
	.byte	0x6
	.long	0x64
	.long	0x13a
	.uleb128 0x2
	.long	0x13f
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.long	0x7e
	.uleb128 0x11
	.long	0x13a
	.uleb128 0x12
	.long	.LASF28
	.byte	0x1
	.value	0x13a
	.byte	0xc
	.long	0x64
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x178
	.uleb128 0x13
	.long	.LASF19
	.byte	0x1
	.value	0x13c
	.byte	0x9
	.long	0x64
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.long	.LASF29
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.long	0x64
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x246
	.uleb128 0xb
	.long	.LASF17
	.byte	0xe
	.long	0x64
	.uleb128 0x3
	.byte	0x91
	.sleb128 -500
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1b
	.long	0x246
	.uleb128 0x3
	.byte	0x91
	.sleb128 -512
	.uleb128 0x4
	.string	"a"
	.byte	0x52
	.byte	0x14
	.long	0x25a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x4
	.string	"b"
	.byte	0x53
	.byte	0x14
	.long	0x25a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x4
	.string	"a64"
	.byte	0x56
	.byte	0x15
	.long	0x26e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x4
	.string	"b64"
	.byte	0x57
	.byte	0x15
	.long	0x26e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x5
	.long	.LASF20
	.byte	0x5f
	.byte	0x1a
	.long	0x282
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0x5
	.long	.LASF21
	.byte	0x60
	.byte	0x1a
	.long	0x282
	.uleb128 0x3
	.byte	0x91
	.sleb128 -464
	.uleb128 0x5
	.long	.LASF22
	.byte	0x63
	.byte	0x14
	.long	0xa2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -468
	.uleb128 0x5
	.long	.LASF23
	.byte	0x64
	.byte	0x15
	.long	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -480
	.uleb128 0x5
	.long	.LASF24
	.byte	0x65
	.byte	0x1a
	.long	0xba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0x4
	.string	"j"
	.byte	0x67
	.byte	0xc
	.long	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x7
	.long	0x72
	.uleb128 0x9
	.long	0xa2
	.long	0x25a
	.uleb128 0xa
	.long	0x2e
	.byte	0
	.uleb128 0x3
	.long	0x24b
	.uleb128 0x9
	.long	0xae
	.long	0x26e
	.uleb128 0xa
	.long	0x2e
	.byte	0
	.uleb128 0x3
	.long	0x25f
	.uleb128 0x9
	.long	0xba
	.long	0x282
	.uleb128 0xa
	.long	0x2e
	.byte	0
	.uleb128 0x3
	.long	0x273
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 42
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF4:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF23:
	.string	"dotme_fp64"
.LASF29:
	.string	"main"
.LASF10:
	.string	"uint8_t"
.LASF28:
	.string	"endian"
.LASF11:
	.string	"float"
.LASF6:
	.string	"long int"
.LASF16:
	.string	"printf"
.LASF8:
	.string	"__uint8_t"
.LASF13:
	.string	"long double"
.LASF3:
	.string	"unsigned char"
.LASF17:
	.string	"argc"
.LASF2:
	.string	"signed char"
.LASF24:
	.string	"dotme_fp128"
.LASF1:
	.string	"unsigned int"
.LASF18:
	.string	"argv"
.LASF26:
	.string	"fmad.c"
.LASF5:
	.string	"short unsigned int"
.LASF7:
	.string	"char"
.LASF20:
	.string	"a128"
.LASF19:
	.string	"eflag"
.LASF0:
	.string	"long unsigned int"
.LASF12:
	.string	"double"
.LASF15:
	.string	"fmaf"
.LASF14:
	.string	"fmal"
.LASF25:
	.string	"GNU C99 12.2.0 -m64 -malign-double -mpc80 -march=k8 -mtune=k8 -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-fast-math"
.LASF22:
	.string	"dotme_fp32"
.LASF27:
	.string	"/home/dclarke/pgm/bw/floating_point"
.LASF21:
	.string	"b128"
	.ident	"GCC: (GENUNIX Fri Aug 26 16:41:30 UTC 2022) 12.2.0"
