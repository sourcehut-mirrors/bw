	.text
	.file	"fmad.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI0_0:
	.quad	0xf42c77574f722e1b              # x86_fp80 1.90760700000000000002
	.short	0x3fff
	.zero	6
.LCPI0_1:
	.quad	0xc944948486e2ddb0              # x86_fp80 -0.786202699999999999984
	.short	0xbffe
	.zero	6
.LCPI0_2:
	.quad	0x92db163baba7b917              # x86_fp80 1.14731099999999999999
	.short	0x3fff
	.zero	6
.LCPI0_3:
	.quad	0xf5dcc99a12655d52              # x86_fp80 0.960400200000000000004
	.short	0x3ffe
	.zero	6
.LCPI0_4:
	.quad	0xef7ced916872b021              # x86_fp80 -0.935500000000000000012
	.short	0xbffe
	.zero	6
.LCPI0_5:
	.quad	0xb106da0ed4af195e              # x86_fp80 -0.691510800000000000021
	.short	0xbffe
	.zero	6
.LCPI0_6:
	.quad	0xdcbb6ed6777079e6              # x86_fp80 1.72447000000000000004
	.short	0x3fff
	.zero	6
.LCPI0_7:
	.quad	0xb5b25db5bdbc8e91              # x86_fp80 -0.709752899999999999991
	.short	0xbffe
	.zero	6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$400, %rsp                      # imm = 0x190
	movss	.L__const.main.a(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -64(%rbp)
	movss	.L__const.main.a+4(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -96(%rbp)
	movss	.L__const.main.a+8(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -80(%rbp)
	movss	.L__const.main.a+12(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -92(%rbp)
	movss	.L__const.main.b(%rip), %xmm0   # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -48(%rbp)
	movss	.L__const.main.b+4(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -88(%rbp)
	movss	.L__const.main.b+8(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -72(%rbp)
	movss	.L__const.main.b+12(%rip), %xmm0 # xmm0 = mem[0],zero,zero,zero
	movss	%xmm0, -84(%rbp)
	movsd	.L__const.main.a64(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -352(%rbp)
	movsd	.L__const.main.a64+8(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -384(%rbp)
	movsd	.L__const.main.a64+16(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -336(%rbp)
	movsd	.L__const.main.a64+24(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -376(%rbp)
	movsd	.L__const.main.b64(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -320(%rbp)
	movsd	.L__const.main.b64+8(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -368(%rbp)
	movsd	.L__const.main.b64+16(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -304(%rbp)
	movsd	.L__const.main.b64+24(%rip), %xmm0 # xmm0 = mem[0],zero
	movsd	%xmm0, -360(%rbp)
	movq	$0, -288(%rbp)
	movw	$0, -280(%rbp)
	movw	$0, -156(%rbp)
	movl	$0, -160(%rbp)
	movw	$0, -264(%rbp)
	movq	$0, -272(%rbp)
	movw	$0, -148(%rbp)
	movl	$0, -152(%rbp)
	movw	$0, -248(%rbp)
	movq	$0, -256(%rbp)
	movw	$0, -140(%rbp)
	movl	$0, -144(%rbp)
	movw	$0, -232(%rbp)
	movq	$0, -240(%rbp)
	movw	$0, -132(%rbp)
	movl	$0, -136(%rbp)
	fldt	.LCPI0_0(%rip)
	fstpt	-288(%rbp)
	fldt	.LCPI0_1(%rip)
	fstpt	-272(%rbp)
	fldt	.LCPI0_2(%rip)
	fstpt	-256(%rbp)
	fldt	.LCPI0_3(%rip)
	fstpt	-240(%rbp)
	movq	$0, -224(%rbp)
	movw	$0, -216(%rbp)
	movw	$0, -124(%rbp)
	movl	$0, -128(%rbp)
	movw	$0, -200(%rbp)
	movq	$0, -208(%rbp)
	movw	$0, -116(%rbp)
	movl	$0, -120(%rbp)
	movw	$0, -184(%rbp)
	movq	$0, -192(%rbp)
	movw	$0, -108(%rbp)
	movl	$0, -112(%rbp)
	movw	$0, -168(%rbp)
	movq	$0, -176(%rbp)
	movw	$0, -100(%rbp)
	movl	$0, -104(%rbp)
	fldt	.LCPI0_4(%rip)
	fstpt	-224(%rbp)
	fldt	.LCPI0_5(%rip)
	fstpt	-208(%rbp)
	fldt	.LCPI0_6(%rip)
	fstpt	-192(%rbp)
	fldt	.LCPI0_7(%rip)
	fstpt	-176(%rbp)
	movss	-64(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-48(%rbp), %xmm0
	movss	-96(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-88(%rbp), %xmm1
	addss	%xmm0, %xmm1
	movss	-80(%rbp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	mulss	-72(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	-92(%rbp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	mulss	-84(%rbp), %xmm1
	addss	%xmm0, %xmm1
	movss	%xmm1, -4(%rbp)
	movss	-4(%rbp), %xmm0                 # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	movl	$.L.str, %edi
	movb	$1, %al
	callq	printf
	leaq	-4(%rbp), %rsi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-4(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-3(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-2(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-1(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movsd	-352(%rbp), %xmm0               # xmm0 = mem[0],zero
	mulsd	-320(%rbp), %xmm0
	movsd	-384(%rbp), %xmm1               # xmm1 = mem[0],zero
	mulsd	-368(%rbp), %xmm1
	movsd	-336(%rbp), %xmm2               # xmm2 = mem[0],zero
	mulsd	-304(%rbp), %xmm2
	addsd	%xmm0, %xmm1
	movsd	-376(%rbp), %xmm0               # xmm0 = mem[0],zero
	mulsd	-360(%rbp), %xmm0
	addsd	%xmm1, %xmm2
	addsd	%xmm2, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0                # xmm0 = mem[0],zero
	movl	$.L.str.4, %edi
	movb	$1, %al
	callq	printf
	leaq	-16(%rbp), %rsi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-16(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-15(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-14(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-13(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-12(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-11(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-10(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-9(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	fldt	-288(%rbp)
	fldt	-224(%rbp)
	fmulp	%st, %st(1)
	fldt	-272(%rbp)
	fldt	-208(%rbp)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fldt	-256(%rbp)
	fldt	-192(%rbp)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fldt	-240(%rbp)
	fldt	-176(%rbp)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	fstpt	-32(%rbp)
	fldt	-32(%rbp)
	fstpt	(%rsp)
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	leaq	-32(%rbp), %rsi
	movl	$.L.str.7, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-32(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-31(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-30(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-29(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-28(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-27(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-26(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-25(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-24(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-23(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-22(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-21(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-20(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-19(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-18(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movzbl	-17(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$10, %edi
	callq	putchar@PLT
	movl	$.Lstr, %edi
	callq	puts@PLT
	movl	$.Lstr.13, %edi
	callq	puts@PLT
	movl	$.Lstr.14, %edi
	callq	puts@PLT
	movl	$.Lstr.15, %edi
	callq	puts@PLT
	movl	$.Lstr.16, %edi
	callq	puts@PLT
	movl	$42, %eax
	addq	$400, %rsp                      # imm = 0x190
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.a,@object        # @__const.main.a
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.L__const.main.a:
	.long	0x3ff42c77                      # float 1.90760696
	.long	0xbf494495                      # float -0.786202728
	.long	0x3f92db16                      # float 1.14731097
	.long	0x3f75dcca                      # float 0.960400223
	.size	.L__const.main.a, 16

	.type	.L__const.main.b,@object        # @__const.main.b
	.p2align	4
.L__const.main.b:
	.long	0xbf6f7cee                      # float -0.935500025
	.long	0xbf3106da                      # float -0.691510797
	.long	0x3fdcbb6f                      # float 1.72447002
	.long	0xbf35b25e                      # float -0.709752917
	.size	.L__const.main.b, 16

	.type	.L__const.main.a64,@object      # @__const.main.a64
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	4
.L__const.main.a64:
	.quad	0x3ffe858eeae9ee46              # double 1.9076070000000001
	.quad	0xbfe928929090dc5c              # double -0.78620270000000003
	.quad	0x3ff25b62c77574f7              # double 1.147311
	.quad	0x3feebb9933424cac              # double 0.96040020000000003
	.size	.L__const.main.a64, 32

	.type	.L__const.main.b64,@object      # @__const.main.b64
	.p2align	4
.L__const.main.b64:
	.quad	0xbfedef9db22d0e56              # double -0.9355
	.quad	0xbfe620db41da95e3              # double -0.69151079999999998
	.quad	0x3ffb976ddaceee0f              # double 1.7244699999999999
	.quad	0xbfe6b64bb6b7b792              # double -0.70975290000000002
	.size	.L__const.main.b64, 32

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"d32   = %-+24.18e\n"
	.size	.L.str, 19

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"dotme_fp32 is at %p\n"
	.size	.L.str.1, 21

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"0x%02x "
	.size	.L.str.2, 8

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"d64   = %-+24.18e\n"
	.size	.L.str.4, 19

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"dotme_fp64 is at %p\n"
	.size	.L.str.5, 21

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"d128  = %-+24.18Le\n"
	.size	.L.str.6, 20

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"dotme_fp128 is at %p\n"
	.size	.L.str.7, 22

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"      = +5.595788259858e-02 is correct"
	.size	.Lstr, 39

	.type	.Lstr.13,@object                # @str.13
.Lstr.13:
	.asciz	"trust this 0x3faca682f76db9b9 from ARMv8"
	.size	.Lstr.13, 41

	.type	.Lstr.14,@object                # @str.14
.Lstr.14:
	.asciz	"or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+"
	.size	.Lstr.14, 52

	.type	.Lstr.15,@object                # @str.15
.Lstr.15:
	.asciz	"also fp128 0x3ffaca682f76db9db367bf4a016eb280"
	.size	.Lstr.15, 46

	.type	.Lstr.16,@object                # @str.16
.Lstr.16:
	.asciz	"\nNOTE : IBM Power systems may report strange hex values"
	.size	.Lstr.16, 56

	.ident	"FreeBSD clang version 13.0.0 (git@github.com:llvm/llvm-project.git llvmorg-13.0.0-0-gd7b669b3a303)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
