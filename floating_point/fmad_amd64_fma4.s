	.file	"fmad.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC12:
	.string	"\n\nINFO : this machine is a "
.LC13:
	.string	"big"
.LC14:
	.string	"little"
.LC15:
	.string	" endian architecture.\n\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC16:
	.string	"--------------- Maybe no FMA Calls ---------------\n\n"
	.section	.rodata.str1.1
.LC17:
	.string	"No FMA  fp32  = %-+24.18e\n"
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"\nThe 32-bit float dotme_fp32 : \n"
	.section	.rodata.str1.1
.LC19:
	.string	"\n\n"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"\n\nCast the 32-bit FP data into 64-bit FP\n\n"
	.align 8
.LC21:
	.string	"\n---------- cast to FP64  ------------\n"
	.align 8
.LC22:
	.string	" dotme_fp32 casted to (double)dotme_fp64\ndotme_fp64  is \n\n"
	.section	.rodata.str1.1
.LC23:
	.string	"\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"\n-------------------------------------\n"
	.section	.rodata.str1.1
.LC25:
	.string	"\n        fp64  = %-+30.24e\n"
.LC26:
	.string	" dotme_fp64  is \n"
.LC27:
	.string	"\n        fp128 = %-+46.38Le\n"
.LC28:
	.string	" dotme_fp128 is \n"
.LC29:
	.string	"\n\n\n\n"
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"-------------------- FMA Calls -------------------\n\n"
	.section	.rodata.str1.1
.LC32:
	.string	"\n  fmaf fp32   = %-+30.24e\n"
.LC34:
	.string	"  fma  fp64   = %-+30.24e\n"
.LC35:
	.string	"\n  fmal fp128  = %-+46.38Le\n"
.LC36:
	.string	"\n\n\n"
	.section	.rodata.str1.8
	.align 8
.LC37:
	.string	"--------------------------------------------------\n\n"
	.align 8
.LC38:
	.string	"\n\nCorrect result is +5.595788259858e-02\n"
	.align 8
.LC39:
	.string	"or this    0x3faca682f76db9b9 from ARMv8\n"
	.align 8
.LC40:
	.string	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+\n"
	.align 8
.LC41:
	.string	"Same thing on Intel Core i5-7300U K8-class CPU\n"
	.align 8
.LC42:
	.string	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a\n"
	.align 8
.LC43:
	.string	"\nNOTE : IBM Power systems may report strange fp128 hex values\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,10
	.p2align 3
	.globl	main
	.type	main, @function
main:
.LFB17:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	movb	$0, %spl
	movl	$1, %edi
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$704, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovdqa	.LC44(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, -248(%rbp)
	xorl	%eax, %eax
	vmovdqa	%xmm0, -672(%rbp)
	vmovdqa	.LC45(%rip), %xmm0
	vmovdqa	%xmm0, -656(%rbp)
	vmovapd	.LC0(%rip), %xmm0
	vmovapd	%xmm0, -576(%rbp)
	vmovapd	.LC1(%rip), %xmm0
	vmovapd	%xmm0, -560(%rbp)
	vmovdqu	-576(%rbp), %ymm0
	vmovdqu	%ymm0, -640(%rbp)
	vmovapd	.LC2(%rip), %xmm0
	fldt	.LC4(%rip)
	vmovapd	%xmm0, -544(%rbp)
	vmovapd	.LC3(%rip), %xmm0
	fstpt	-384(%rbp)
	vmovapd	%xmm0, -528(%rbp)
	fldt	.LC5(%rip)
	vmovdqu	-544(%rbp), %ymm0
	fstpt	-368(%rbp)
	vmovdqu	%ymm0, -608(%rbp)
	vmovdqu	-384(%rbp), %ymm0
	fldt	.LC6(%rip)
	vmovdqu	%ymm0, -512(%rbp)
	fstpt	-352(%rbp)
	fldt	.LC7(%rip)
	fstpt	-336(%rbp)
	fldt	.LC8(%rip)
	vmovdqu	-352(%rbp), %ymm0
	fstpt	-320(%rbp)
	vmovdqu	%ymm0, -480(%rbp)
	fldt	.LC9(%rip)
	fstpt	-304(%rbp)
	fldt	.LC10(%rip)
	vmovdqu	-320(%rbp), %ymm0
	fstpt	-288(%rbp)
	vmovdqu	%ymm0, -448(%rbp)
	fldt	.LC11(%rip)
	fstpt	-272(%rbp)
	vmovdqu	-288(%rbp), %ymm0
	vmovdqu	%ymm0, -416(%rbp)
	vzeroupper
	call	sysinfo@PLT
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	call	endian@PLT
	cmpl	$2, %eax
	je	.L7
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L3:
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	-700(%rbp), %r15
	call	__printf_chk@PLT
	vmovss	-660(%rbp), %xmm0
	vmovss	-644(%rbp), %xmm4
	vmovss	-664(%rbp), %xmm1
	movl	$1, %edi
	vmovss	-648(%rbp), %xmm5
	vmovss	-672(%rbp), %xmm2
	movl	$1, %eax
	vmovss	-656(%rbp), %xmm6
	vmovss	-668(%rbp), %xmm3
	vmovss	-652(%rbp), %xmm7
	leaq	.LC17(%rip), %rsi
	leaq	.LC19(%rip), %rbx
	leaq	-696(%rbp), %r12
	leaq	.LC26(%rip), %r14
	leaq	-688(%rbp), %r13
	vmulss	%xmm7, %xmm3, %xmm3
	vfmaddss	%xmm3, %xmm6, %xmm2, %xmm2
	vfmaddss	%xmm2, %xmm5, %xmm1, %xmm1
	vfmaddss	%xmm1, %xmm4, %xmm0, %xmm0
	vmovss	%xmm0, -700(%rbp)
	vmovss	-700(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	__printf_chk@PLT
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$4, %esi
	movq	%r15, %rdi
	call	hex_dump@PLT
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	vmovss	-700(%rbp), %xmm0
	movl	$1, %edi
	leaq	.LC21(%rip), %rsi
	xorl	%eax, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm0, -696(%rbp)
	call	__printf_chk@PLT
	leaq	.LC22(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	call	hex_dump@PLT
	leaq	.LC23(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	vmovsd	-616(%rbp), %xmm0
	movl	$1, %edi
	vmovsd	-584(%rbp), %xmm4
	vmovsd	-624(%rbp), %xmm1
	movl	$1, %eax
	vmovsd	-592(%rbp), %xmm5
	vmovsd	-640(%rbp), %xmm2
	vmovsd	-608(%rbp), %xmm6
	vmovsd	-632(%rbp), %xmm3
	vmovsd	-600(%rbp), %xmm7
	leaq	.LC25(%rip), %rsi
	vmulsd	%xmm7, %xmm3, %xmm3
	vfmaddsd	%xmm3, %xmm6, %xmm2, %xmm2
	vfmaddsd	%xmm2, %xmm5, %xmm1, %xmm1
	vfmaddsd	%xmm1, %xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, -696(%rbp)
	vmovsd	-696(%rbp), %xmm0
	call	__printf_chk@PLT
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	call	hex_dump@PLT
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$256, %rsp
	leaq	.LC27(%rip), %rsi
	fldt	-512(%rbp)
	movl	$1, %edi
	xorl	%eax, %eax
	fldt	-448(%rbp)
	fldt	-496(%rbp)
	fldt	-432(%rbp)
	fldt	-480(%rbp)
	fldt	-416(%rbp)
	fldt	-464(%rbp)
	fldt	-400(%rbp)
	fxch	%st(7)
	fmulp	%st, %st(6)
	fxch	%st(4)
	fmulp	%st, %st(3)
	fxch	%st(4)
	faddp	%st, %st(2)
	fmulp	%st, %st(3)
	faddp	%st, %st(2)
	fmulp	%st, %st(2)
	faddp	%st, %st(1)
	fstpt	-688(%rbp)
	fldt	-688(%rbp)
	fstpt	(%rsp)
	call	__printf_chk@PLT
	addq	$256, %rsp
	leaq	.LC28(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$16, %esi
	movq	%r13, %rdi
	call	hex_dump@PLT
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC30(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	vmovss	-656(%rbp), %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	-672(%rbp), %xmm2
	leaq	.LC32(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vfmaddss	%xmm0, %xmm2, %xmm1, %xmm1
	vmovss	-652(%rbp), %xmm0
	vmovss	-668(%rbp), %xmm2
	vfmaddss	%xmm1, %xmm2, %xmm0, %xmm0
	vmovss	-648(%rbp), %xmm1
	vmovss	-664(%rbp), %xmm2
	vfmaddss	%xmm0, %xmm2, %xmm1, %xmm1
	vmovss	-644(%rbp), %xmm0
	vmovss	-660(%rbp), %xmm2
	vfmaddss	%xmm1, %xmm2, %xmm0, %xmm0
	vmovss	%xmm0, -700(%rbp)
	vmovss	-700(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$4, %esi
	movq	%r15, %rdi
	call	hex_dump@PLT
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	vmovsd	-608(%rbp), %xmm1
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovsd	-640(%rbp), %xmm2
	leaq	.LC34(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	vfmaddsd	%xmm0, %xmm2, %xmm1, %xmm1
	vmovsd	-600(%rbp), %xmm0
	vmovsd	-632(%rbp), %xmm2
	vfmaddsd	%xmm1, %xmm2, %xmm0, %xmm0
	vmovsd	-592(%rbp), %xmm1
	vmovsd	-624(%rbp), %xmm2
	vfmaddsd	%xmm0, %xmm2, %xmm1, %xmm1
	vmovsd	-584(%rbp), %xmm0
	vmovsd	-616(%rbp), %xmm2
	vfmaddsd	%xmm1, %xmm2, %xmm0, %xmm0
	vmovsd	%xmm0, -696(%rbp)
	vmovsd	-696(%rbp), %xmm0
	call	__printf_chk@PLT
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$8, %esi
	movq	%r12, %rdi
	call	hex_dump@PLT
	movq	%rbx, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	subq	$208, %rsp
	fldt	-448(%rbp)
	fldt	-512(%rbp)
	pushq	$0
	pushq	$0
	subq	$32, %rsp
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal@PLT
	fldt	-432(%rbp)
	fldt	-496(%rbp)
	fxch	%st(2)
	fstpt	32(%rsp)
	fxch	%st(1)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal@PLT
	fldt	-416(%rbp)
	fldt	-480(%rbp)
	fxch	%st(2)
	fstpt	32(%rsp)
	fxch	%st(1)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal@PLT
	fldt	-400(%rbp)
	fldt	-464(%rbp)
	fxch	%st(2)
	fstpt	32(%rsp)
	fxch	%st(1)
	fstpt	16(%rsp)
	fstpt	(%rsp)
	call	fmal@PLT
	leaq	.LC35(%rip), %rsi
	fstpt	-688(%rbp)
	movl	$1, %edi
	xorl	%eax, %eax
	fldt	-688(%rbp)
	fstpt	(%rsp)
	call	__printf_chk@PLT
	addq	$256, %rsp
	movl	$16, %esi
	movq	%r13, %rdi
	call	hex_dump@PLT
	leaq	.LC36(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC37(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC38(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	.LC39(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	leaq	.LC40(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC41(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC42(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	leaq	.LC43(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	-248(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L8
	leaq	-48(%rbp), %rsp
	movl	$42, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	popq	%r10
	.cfi_restore 10
	.cfi_def_cfa 10, 0
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%r15
	.cfi_restore 15
	popq	%rbp
	.cfi_restore 6
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L7:
	.cfi_restore_state
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L3
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE17:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	-353767866
	.long	1073644942
	.long	-1869554596
	.long	-1075238766
	.align 16
.LC1:
	.long	-948603657
	.long	1072847714
	.long	859983020
	.long	1072610201
	.align 16
.LC2:
	.long	-1305670058
	.long	-1074925667
	.long	1104844259
	.long	-1075437349
	.align 16
.LC3:
	.long	-623972849
	.long	1073452909
	.long	-1229473902
	.long	-1075399093
	.align 16
.LC4:
	.long	1332882971
	.long	-198412457
	.long	16383
	.long	0
	.align 16
.LC5:
	.long	-2031952464
	.long	-918252412
	.long	49150
	.long	0
	.align 16
.LC6:
	.long	-1415071465
	.long	-1831135685
	.long	16383
	.long	0
	.align 16
.LC7:
	.long	308632914
	.long	-170079846
	.long	16382
	.long	0
	.align 16
.LC8:
	.long	1752346657
	.long	-277025391
	.long	49150
	.long	0
	.align 16
.LC9:
	.long	-726722210
	.long	-1324951026
	.long	49150
	.long	0
	.align 16
.LC10:
	.long	2003859942
	.long	-591696170
	.long	16383
	.long	0
	.align 16
.LC11:
	.long	-1111716207
	.long	-1246601803
	.long	49150
	.long	0
	.align 16
.LC44:
	.quad	-4663120531351655305
	.quad	4572803757872700182
	.align 16
.LC45:
	.quad	-4669943802022101778
	.quad	-4668629320831550609
	.ident	"GCC: (Gentoo 14.3.0 p8) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
