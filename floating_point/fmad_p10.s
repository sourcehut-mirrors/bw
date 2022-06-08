	.file	"fmad.c"
	.machine power10
	.section	".text"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 3
.LC8:
	.string	"d32   = %-+24.18e\n"
	.align 3
.LC9:
	.string	"dotme_fp32 is at %p\n"
	.align 3
.LC10:
	.string	"0x%02x "
	.align 3
.LC12:
	.string	"d64   = %-+24.18e\n"
	.align 3
.LC13:
	.string	"dotme_fp64 is at %p\n"
	.globl __gcc_qmul
	.globl __gcc_qadd
	.align 3
.LC22:
	.string	"d128  = %-+24.18Le\n"
	.align 3
.LC23:
	.string	"dotme_fp128 is at %p\n"
	.align 3
.LC24:
	.string	"      = +5.595788259858e-02 is correct"
	.align 3
.LC25:
	.string	"trust this 0x3faca682f76db9b9 from ARMv8"
	.align 3
.LC26:
	.string	"or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+"
	.align 3
.LC27:
	.string	"also fp128 0x3ffaca682f76db9db367bf4a016eb280"
	.align 3
.LC28:
	.string	"\nNOTE : IBM Power systems may report strange hex values"
	.section	.text.startup,"ax",@progbits
	.align 2
	.p2align 4,,15
	.globl main
	.section	".opd","aw"
	.align 3
main:
	.quad	.L.main,.TOC.@tocbase,0
	.previous
	.type	main, @function
.L.main:
.LFB7:
	.cfi_startproc
	plfs 0,.LC6@pcrel
	pld 4,.LC7@pcrel
	mflr 0
	std 29,-40(1)
	std 30,-32(1)
	pla 3,.LC8@pcrel
	.cfi_register 65, 0
	.cfi_offset 29, -40
	.cfi_offset 30, -32
	pla 29,.LC10@pcrel
	std 31,-24(1)
	stfd 30,-16(1)
	.cfi_offset 31, -24
	.cfi_offset 62, -16
	li 31,4
	std 0,16(1)
	stfd 31,-8(1)
	std 27,-56(1)
	std 28,-48(1)
	mtvsrd 1,4
	stdu 1,-208(1)
	.cfi_def_cfa_offset 208
	.cfi_offset 65, 16
	.cfi_offset 63, -8
	.cfi_offset 27, -56
	.cfi_offset 28, -48
	addi 30,1,135
	stfs 0,136(1)
	bl printf
	nop
	addi 4,1,136
	pla 3,.LC9@pcrel
	bl printf
	nop
.L2:
	lbzu 4,1(30)
	addi 31,31,-1
	mr 3,29
	bl printf
	nop
	cmpwi 0,31,0
	bne 0,.L2
	li 3,10
	addi 28,1,127
	li 31,8
	pla 27,.LC10@pcrel
	bl putchar
	nop
	plfd 1,.LC11@pcrel
	pla 3,.LC12@pcrel
	mr 30,28
	mfvsrd 4,1
	stfd 1,128(1)
	bl printf
	nop
	addi 4,1,128
	pla 3,.LC13@pcrel
	bl printf
	nop
.L3:
	lbz 4,1(30)
	addi 29,30,1
	mr 3,27
	addi 31,31,-1
	addi 30,30,2
	addi 31,31,-1
	bl printf
	nop
	lbz 4,1(29)
	mr 3,27
	bl printf
	nop
	cmpwi 0,31,0
	bne 0,.L3
	li 3,10
	addi 31,1,111
	pla 29,.LC10@pcrel
	bl putchar
	nop
	plfd 3,.LC14@pcrel
	plfd 4,.LC14+8@pcrel
	plfd 1,.LC15@pcrel
	plfd 2,.LC15+8@pcrel
	bl __gcc_qmul
	nop
	plfd 3,.LC16@pcrel
	plfd 4,.LC16+8@pcrel
	fmr 31,2
	fmr 30,1
	plfd 2,.LC17+8@pcrel
	plfd 1,.LC17@pcrel
	bl __gcc_qmul
	nop
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	plfd 3,.LC18@pcrel
	plfd 4,.LC18+8@pcrel
	fmr 31,2
	fmr 30,1
	plfd 2,.LC19+8@pcrel
	plfd 1,.LC19@pcrel
	bl __gcc_qmul
	nop
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	plfd 3,.LC20@pcrel
	plfd 4,.LC20+8@pcrel
	fmr 31,2
	fmr 30,1
	plfd 2,.LC21+8@pcrel
	plfd 1,.LC21@pcrel
	bl __gcc_qmul
	nop
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	pla 3,.LC22@pcrel
	fmr 12,1
	mfvsrd 5,2
	stfd 2,120(1)
	stfd 12,112(1)
	mfvsrd 4,12
	bl printf
	nop
	addi 4,1,112
	pla 3,.LC23@pcrel
	bl printf
	nop
	.p2align 4,,15
.L4:
	lbz 4,1(31)
	addi 30,31,1
	mr 3,29
	addi 31,31,2
	bl printf
	nop
	lbz 4,1(30)
	mr 3,29
	bl printf
	nop
	cmpld 0,28,31
	bne 0,.L4
	li 3,10
	bl putchar
	nop
	pla 3,.LC24@pcrel
	bl puts
	nop
	pla 3,.LC25@pcrel
	bl puts
	nop
	pla 3,.LC26@pcrel
	bl puts
	nop
	pla 3,.LC27@pcrel
	bl puts
	nop
	pla 3,.LC28@pcrel
	bl puts
	nop
	addi 1,1,208
	.cfi_def_cfa_offset 0
	li 3,42
	ld 0,16(1)
	ld 27,-56(1)
	ld 28,-48(1)
	ld 29,-40(1)
	ld 30,-32(1)
	ld 31,-24(1)
	lfd 30,-16(1)
	lfd 31,-8(1)
	mtlr 0
	.cfi_restore 65
	.cfi_restore 63
	.cfi_restore 62
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 28
	.cfi_restore 27
	blr
	.long 0
	.byte 0,0,2,1,130,5,0,0
	.cfi_endproc
.LFE7:
	.size	main,.-.L.main
	.section	.rodata.cst4,"aM",@progbits,4
	.align 2
.LC6:
	.long	1030042608
	.section	.rodata.cst8,"aM",@progbits,8
	.align 3
.LC7:
	.long	1068279422
	.long	0
	.align 3
.LC11:
	.long	1068279426
	.long	-143803968
	.section	.rodata.cst16,"aM",@progbits,16
	.align 4
.LC14:
	.long	1073644942
	.long	-353767866
	.long	-1131523160
	.long	499178280
	.align 4
.LC15:
	.long	-1074925667
	.long	-1305670058
	.long	-1136631219
	.long	-755914240
	.align 4
.LC16:
	.long	-1075238766
	.long	-1869554596
	.long	1015184817
	.long	96921950
	.align 4
.LC17:
	.long	-1075437349
	.long	1104844259
	.long	-1133127183
	.long	2021507104
	.align 4
.LC18:
	.long	1072847714
	.long	-948603657
	.long	1015115990
	.long	737222548
	.align 4
.LC19:
	.long	1073452909
	.long	-623972849
	.long	1015962098
	.long	-1164107936
	.align 4
.LC20:
	.long	1072610201
	.long	859983020
	.long	-1132105558
	.long	-1928928224
	.align 4
.LC21:
	.long	-1075399093
	.long	-1229473902
	.long	1014427010
	.long	1325021464
	.ident	"GCC: (Debian 11.3.0-1) 11.3.0"
	.gnu_attribute 4, 5
