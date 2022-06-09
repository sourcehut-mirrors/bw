	.file	"fmad.c"
	.machine power9
	.section	".text"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 3
.LC6:
	.string	"d32   = %-+24.18e\n"
	.align 3
.LC7:
	.string	"dotme_fp32 is at %p\n"
	.align 3
.LC8:
	.string	"0x%02x "
	.align 3
.LC9:
	.string	"d64   = %-+24.18e\n"
	.align 3
.LC10:
	.string	"dotme_fp64 is at %p\n"
	.globl __gcc_qmul
	.globl __gcc_qadd
	.align 3
.LC11:
	.string	"d128  = %-+24.18Le\n"
	.align 3
.LC12:
	.string	"dotme_fp128 is at %p\n"
	.align 3
.LC13:
	.string	"      = +5.595788259858e-02 is correct"
	.align 3
.LC14:
	.string	"trust this 0x3faca682f76db9b9 from ARMv8"
	.align 3
.LC15:
	.string	"or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+"
	.align 3
.LC16:
	.string	"also fp128 0x3ffaca682f76db9db367bf4a016eb280"
	.align 3
.LC17:
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
	addis 9,2,.LANCHOR0@toc@ha
	mflr 0
	stfd 24,-64(1)
	stfd 25,-56(1)
	stfd 26,-48(1)
	stfd 27,-40(1)
	stfd 28,-32(1)
	stfd 29,-24(1)
	stfd 30,-16(1)
	addi 9,9,.LANCHOR0@toc@l
	stfd 31,-8(1)
	std 29,-88(1)
	std 30,-80(1)
	std 31,-72(1)
	std 28,-96(1)
	addis 3,2,.LC6@toc@ha
	.cfi_register 65, 0
	.cfi_offset 56, -64
	.cfi_offset 57, -56
	.cfi_offset 58, -48
	.cfi_offset 59, -40
	.cfi_offset 60, -32
	.cfi_offset 61, -24
	.cfi_offset 62, -16
	.cfi_offset 63, -8
	.cfi_offset 29, -88
	.cfi_offset 30, -80
	.cfi_offset 31, -72
	.cfi_offset 28, -96
	addis 30,2,.LC8@toc@ha
	li 31,1
	lxv 1,0(9)
	lxv 6,96(9)
	lxv 7,112(9)
	lxv 8,128(9)
	addi 3,3,.LC6@toc@l
	addi 30,30,.LC8@toc@l
	lxv 9,144(9)
	lxv 10,160(9)
	lxv 11,176(9)
	lxv 12,192(9)
	lxv 0,208(9)
	lxv 13,16(9)
	lxv 2,32(9)
	lxv 3,48(9)
	lxv 5,80(9)
	lxv 4,64(9)
	std 0,16(1)
	stdu 1,-464(1)
	.cfi_def_cfa_offset 464
	.cfi_offset 65, 16
	stxv 1,320(1)
	stxv 13,304(1)
	addi 29,1,359
	stxv 2,272(1)
	stxv 3,288(1)
	stxv 4,240(1)
	stxv 5,256(1)
	stxv 6,176(1)
	stxv 7,192(1)
	stxv 8,208(1)
	stxv 9,224(1)
	stxv 10,112(1)
	stxv 11,128(1)
	stxv 12,144(1)
	stxv 0,160(1)
	lfs 11,320(1)
	lfs 7,304(1)
	lfs 10,324(1)
	lfs 6,308(1)
	lfs 12,328(1)
	lfs 8,312(1)
	lfs 0,332(1)
	lfs 9,316(1)
	fmuls 10,10,6
	fmadds 11,11,7,10
	fmadds 12,12,8,11
	fmadds 0,0,9,12
	stfs 0,360(1)
	lfs 0,360(1)
	mfvsrd 4,0
	fmr 1,0
	bl printf
	nop
	addis 3,2,.LC7@toc@ha
	addi 4,1,360
	addi 3,3,.LC7@toc@l
	bl printf
	nop
.L2:
	lbzx 4,29,31
	mr 3,30
	addi 31,31,1
	bl printf
	nop
	cmpldi 0,31,5
	bne 0,.L2
	li 3,10
	li 29,1
	addi 28,1,351
	bl putchar
	nop
	lfd 11,272(1)
	lfd 7,240(1)
	lfd 10,280(1)
	lfd 6,248(1)
	lfd 12,288(1)
	lfd 8,256(1)
	lfd 0,296(1)
	lfd 9,264(1)
	addis 3,2,.LC9@toc@ha
	fmul 10,10,6
	addi 3,3,.LC9@toc@l
	fmadd 11,11,7,10
	fmadd 12,12,8,11
	fmadd 0,0,9,12
	stfd 0,352(1)
	ld 4,352(1)
	mtvsrd 1,4
	bl printf
	nop
	addis 3,2,.LC10@toc@ha
	addi 4,1,352
	addi 3,3,.LC10@toc@l
	bl printf
	nop
.L3:
	lbzx 4,28,29
	addi 31,29,1
	mr 3,30
	addi 29,29,2
	bl printf
	nop
	lbzx 4,28,31
	mr 3,30
	bl printf
	nop
	cmpdi 0,31,8
	bne 0,.L3
	li 3,10
	li 29,1
	addi 28,1,335
	bl putchar
	nop
	lfd 1,176(1)
	lfd 2,184(1)
	lfd 3,112(1)
	lfd 4,120(1)
	lfd 28,192(1)
	lfd 29,200(1)
	lfd 24,128(1)
	lfd 25,136(1)
	lfd 26,208(1)
	lfd 27,216(1)
	bl __gcc_qmul
	nop
	fmr 31,2
	fmr 30,1
	fmr 3,24
	fmr 4,25
	fmr 1,28
	fmr 2,29
	lfd 24,144(1)
	lfd 25,152(1)
	bl __gcc_qmul
	nop
	lfd 28,224(1)
	lfd 29,232(1)
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	fmr 3,24
	fmr 4,25
	fmr 31,2
	fmr 30,1
	fmr 2,27
	fmr 1,26
	lfd 26,160(1)
	lfd 27,168(1)
	bl __gcc_qmul
	nop
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	fmr 31,2
	fmr 30,1
	fmr 3,26
	fmr 4,27
	fmr 1,28
	fmr 2,29
	bl __gcc_qmul
	nop
	fmr 4,2
	fmr 3,1
	fmr 2,31
	fmr 1,30
	bl __gcc_qadd
	nop
	addis 3,2,.LC11@toc@ha
	stfd 1,336(1)
	stfd 2,344(1)
	addi 3,3,.LC11@toc@l
	ld 4,336(1)
	ld 5,344(1)
	mtvsrd 1,4
	mtvsrd 2,5
	bl printf
	nop
	addis 3,2,.LC12@toc@ha
	addi 4,1,336
	addi 3,3,.LC12@toc@l
	bl printf
	nop
	.p2align 4,,15
.L4:
	lbzx 4,28,29
	addi 31,29,1
	mr 3,30
	addi 29,29,2
	bl printf
	nop
	lbzx 4,28,31
	mr 3,30
	bl printf
	nop
	cmpdi 0,31,16
	bne 0,.L4
	li 3,10
	bl putchar
	nop
	addis 3,2,.LC13@toc@ha
	addi 3,3,.LC13@toc@l
	bl puts
	nop
	addis 3,2,.LC14@toc@ha
	addi 3,3,.LC14@toc@l
	bl puts
	nop
	addis 3,2,.LC15@toc@ha
	addi 3,3,.LC15@toc@l
	bl puts
	nop
	addis 3,2,.LC16@toc@ha
	addi 3,3,.LC16@toc@l
	bl puts
	nop
	addis 3,2,.LC17@toc@ha
	addi 3,3,.LC17@toc@l
	bl puts
	nop
	addi 1,1,464
	.cfi_def_cfa_offset 0
	li 3,42
	ld 0,16(1)
	ld 28,-96(1)
	ld 29,-88(1)
	ld 30,-80(1)
	ld 31,-72(1)
	lfd 24,-64(1)
	lfd 25,-56(1)
	lfd 26,-48(1)
	lfd 27,-40(1)
	lfd 28,-32(1)
	lfd 29,-24(1)
	lfd 30,-16(1)
	lfd 31,-8(1)
	mtlr 0
	.cfi_restore 65
	.cfi_restore 63
	.cfi_restore 62
	.cfi_restore 61
	.cfi_restore 60
	.cfi_restore 59
	.cfi_restore 58
	.cfi_restore 57
	.cfi_restore 56
	.cfi_restore 31
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 28
	blr
	.long 0
	.byte 0,0,2,1,136,4,0,0
	.cfi_endproc
.LFE7:
	.size	main,.-.L.main
	.section	.rodata
	.align 4
	.set	.LANCHOR0,. + 0
.LC0:
	.long	1072966775
	.long	-1085717355
	.long	1066588950
	.long	1064688842
.LC1:
	.long	-1083212562
	.long	-1087306022
	.long	1071430511
	.long	-1086999970
.LC2:
	.long	1073644942
	.long	-353767866
	.long	-1075238766
	.long	-1869554596
	.long	1072847714
	.long	-948603657
	.long	1072610201
	.long	859983020
.LC3:
	.long	-1074925667
	.long	-1305670058
	.long	-1075437349
	.long	1104844259
	.long	1073452909
	.long	-623972849
	.long	-1075399093
	.long	-1229473902
.LC4:
	.long	1073644942
	.long	-353767866
	.long	-1131523160
	.long	499178280
	.long	-1075238766
	.long	-1869554596
	.long	1015184817
	.long	96921950
	.long	1072847714
	.long	-948603657
	.long	1015115990
	.long	737222548
	.long	1072610201
	.long	859983020
	.long	-1132105558
	.long	-1928928224
.LC5:
	.long	-1074925667
	.long	-1305670058
	.long	-1136631219
	.long	-755914240
	.long	-1075437349
	.long	1104844259
	.long	-1133127183
	.long	2021507104
	.long	1073452909
	.long	-623972849
	.long	1015962098
	.long	-1164107936
	.long	-1075399093
	.long	-1229473902
	.long	1014427010
	.long	1325021464
	.ident	"GCC: (genunix Fri May 13 17:07:13 UTC 2022) 12.1.0"
	.gnu_attribute 4, 5
