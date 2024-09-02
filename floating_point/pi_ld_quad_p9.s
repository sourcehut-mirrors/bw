	.text
	.abiversion 2
	.file	"pi_ld_quad.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function main
.LCPI0_0:
	.quad	0x400921fb54442d18              # double 3.1415926535897931
	.text
	.globl	main
	.p2align	4
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.cfi_startproc
.Lfunc_gep0:
	addis 2, 12, .TOC.-.Lfunc_gep0@ha
	addi 2, 2, .TOC.-.Lfunc_gep0@l
.Lfunc_lep0:
	.localentry	main, .Lfunc_lep0-.Lfunc_gep0
# %bb.0:
	mflr 0
	std 31, -8(1)
	stdu 1, -1568(1)
	std 0, 1584(1)
	.cfi_def_cfa_offset 1568
	.cfi_offset r31, -8
	.cfi_offset lr, 16
	mr	31, 1
	.cfi_def_cfa_register r31
                                        # kill: def $r3 killed $r3 killed $x3
	li 5, 0
	stw 5, 1556(31)
	stw 3, 1552(31)
	std 4, 1544(31)
	addis 3, 2, .LCPI0_0@toc@ha
	lfd 0, .LCPI0_0@toc@l(3)
	stfd 0, 112(31)
	li 3, 6
	addis 4, 2, .L.str@toc@ha
	addi 4, 4, .L.str@toc@l
	extsw 3, 3
	bl setlocale
	nop
	addi 3, 31, 120
	bl uname
	nop
	cmpwi	3, 0
	bge 0, .LBB0_2
# %bb.1:
	addis 3, 2, .LC0@toc@ha
	ld 3, .LC0@toc@l(3)
	ld 3, 0(3)
	addis 4, 2, .L.str.1@toc@ha
	addi 4, 4, .L.str.1@toc@l
	bl fprintf
	nop
	addis 3, 2, .L.str.2@toc@ha
	addi 3, 3, .L.str.2@toc@l
	bl perror
	nop
	b .LBB0_3
.LBB0_2:
	addis 3, 2, .L.str.3@toc@ha
	addi 3, 3, .L.str.3@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.4@toc@ha
	addi 3, 3, .L.str.4@toc@l
	bl printf
	nop
	addi 4, 31, 120
	addis 3, 2, .L.str.5@toc@ha
	addi 3, 3, .L.str.5@toc@l
	bl printf
	nop
	addi 3, 31, 120
	addi 4, 3, 256
	addis 3, 2, .L.str.6@toc@ha
	addi 3, 3, .L.str.6@toc@l
	bl printf
	nop
	addi 3, 31, 120
	addi 4, 3, 512
	addis 3, 2, .L.str.7@toc@ha
	addi 3, 3, .L.str.7@toc@l
	bl printf
	nop
	addi 3, 31, 120
	addi 4, 3, 768
	addis 3, 2, .L.str.8@toc@ha
	addi 3, 3, .L.str.8@toc@l
	bl printf
	nop
	addi 3, 31, 120
	addi 4, 3, 1024
	addis 3, 2, .L.str.9@toc@ha
	addi 3, 3, .L.str.9@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.3@toc@ha
	addi 3, 3, .L.str.3@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.10@toc@ha
	addi 3, 3, .L.str.10@toc@l
	bl printf
	nop
.LBB0_3:
	addis 3, 2, .L.str.11@toc@ha
	addi 3, 3, .L.str.11@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.12@toc@ha
	addi 3, 3, .L.str.12@toc@l
	li 4, 18
	li 5, 1
	std 5, 104(31)                          # 8-byte Folded Spill
	li 6, 5
	bl printf
	nop
                                        # kill: def $x4 killed $x3
	ld 3, 104(31)                           # 8-byte Folded Reload
	stw 3, 1540(31)
	lbz 3, 1540(31)
	cmpwi	3, 1
	crmove	20, 2
	li 4, 0
	li 3, 1
	isel 3, 3, 4, 20
	stw 3, 1536(31)
	addis 3, 2, .L.str.13@toc@ha
	addi 3, 3, .L.str.13@toc@l
	bl printf
	nop
	lwz 3, 1536(31)
	cmpwi	3, 0
	bne	0, .LBB0_5
# %bb.4:
	addis 3, 2, .L.str.14@toc@ha
	addi 3, 3, .L.str.14@toc@l
	bl printf
	nop
	b .LBB0_6
.LBB0_5:
	addis 3, 2, .L.str.15@toc@ha
	addi 3, 3, .L.str.15@toc@l
	bl printf
	nop
.LBB0_6:
	addis 3, 2, .L.str.16@toc@ha
	addi 3, 3, .L.str.16@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.17@toc@ha
	addi 3, 3, .L.str.17@toc@l
	li 4, 8
	bl printf
	nop
	addis 3, 2, .L.str.18@toc@ha
	addi 3, 3, .L.str.18@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.19@toc@ha
	addi 3, 3, .L.str.19@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.20@toc@ha
	addi 3, 3, .L.str.20@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.21@toc@ha
	addi 3, 3, .L.str.21@toc@l
	bl printf
	nop
	addi 4, 31, 112
	addis 3, 2, .L.str.22@toc@ha
	addi 3, 3, .L.str.22@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.23@toc@ha
	addi 3, 3, .L.str.23@toc@l
	bl printf
	nop
	lwz 3, 1536(31)
	cmpwi	3, 0
	beq	0, .LBB0_12
# %bb.7:
	li 3, 7
	stw 3, 1540(31)
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	lwz 3, 1540(31)
	cmpwi	3, -1
	ble 0, .LBB0_11
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
	lwa 4, 1540(31)
	addi 3, 31, 112
	add 3, 3, 4
	lbz 4, 0(3)
	addis 3, 2, .L.str.24@toc@ha
	addi 3, 3, .L.str.24@toc@l
	extsw 4, 4
	bl printf
	nop
# %bb.10:                               #   in Loop: Header=BB0_8 Depth=1
	lwz 3, 1540(31)
	addi 3, 3, -1
	stw 3, 1540(31)
	b .LBB0_8
.LBB0_11:
	b .LBB0_17
.LBB0_12:
	li 3, 0
	stw 3, 1540(31)
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	lwz 3, 1540(31)
	cmpwi	3, 8
	bge 0, .LBB0_16
# %bb.14:                               #   in Loop: Header=BB0_13 Depth=1
	lwa 4, 1540(31)
	addi 3, 31, 112
	add 3, 3, 4
	lbz 4, 0(3)
	addis 3, 2, .L.str.24@toc@ha
	addi 3, 3, .L.str.24@toc@l
	extsw 4, 4
	bl printf
	nop
# %bb.15:                               #   in Loop: Header=BB0_13 Depth=1
	lwz 3, 1540(31)
	addi 3, 3, 1
	stw 3, 1540(31)
	b .LBB0_13
.LBB0_16:
	b .LBB0_17
.LBB0_17:
	addis 3, 2, .L.str.25@toc@ha
	addi 3, 3, .L.str.25@toc@l
	bl printf
	nop
	li 3, 44
	std 3, 1400(31)
	addi 3, 31, 1408
	ld 4, 1400(31)
	lfd 1, 112(31)
	addis 5, 2, .L.str.26@toc@ha
	addi 5, 5, .L.str.26@toc@l
	mffprd	6, 1
	bl snprintf
	nop
	addi 4, 31, 1408
	addis 3, 2, .L.str.27@toc@ha
	addi 3, 3, .L.str.27@toc@l
	bl printf
	nop
	addis 3, 2, .L.str.28@toc@ha
	addi 3, 3, .L.str.28@toc@l
	bl printf
	nop
	li 3, 0
	addi 1, 1, 1568
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr
	.long	0
	.quad	0
.Lfunc_end0:
	.size	main, .Lfunc_end0-.Lfunc_begin0
	.cfi_endproc
                                        # -- End function
	.p2align	4                               # -- Begin function uname
	.type	uname,@function
uname:                                  # @uname
.Lfunc_begin1:
	.cfi_startproc
.Lfunc_gep1:
	addis 2, 12, .TOC.-.Lfunc_gep1@ha
	addi 2, 2, .TOC.-.Lfunc_gep1@l
.Lfunc_lep1:
	.localentry	uname, .Lfunc_lep1-.Lfunc_gep1
# %bb.0:
	mflr 0
	std 31, -8(1)
	stdu 1, -112(1)
	std 0, 128(1)
	.cfi_def_cfa_offset 112
	.cfi_offset r31, -8
	.cfi_offset lr, 16
	mr	31, 1
	.cfi_def_cfa_register r31
	std 3, 96(31)
	ld 4, 96(31)
	li 3, 256
	extsw 3, 3
	bl __xuname
	nop
	extsw 3, 3
	addi 1, 1, 112
	ld 0, 16(1)
	ld 31, -8(1)
	mtlr 0
	blr
	.long	0
	.quad	0
.Lfunc_end1:
	.size	uname, .Lfunc_end1-.Lfunc_begin1
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"C"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"WARNING : Could not attain system uname data.\n"
	.size	.L.str.1, 47

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"uname"
	.size	.L.str.2, 6

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"-------------------------------"
	.size	.L.str.3, 32

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"------------------------------\n"
	.size	.L.str.4, 32

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"        system name = %s\n"
	.size	.L.str.5, 26

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"          node name = %s\n"
	.size	.L.str.6, 26

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"            release = %s\n"
	.size	.L.str.7, 26

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"            version = %s\n"
	.size	.L.str.8, 26

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"            machine = %s\n"
	.size	.L.str.9, 26

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"------------------------------"
	.size	.L.str.10, 31

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	"\n"
	.size	.L.str.11, 2

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"INFO : compiler seems to be LLVM/Clang ver %i.%i.%i\n"
	.size	.L.str.12, 53

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	"This is a "
	.size	.L.str.13, 11

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"big"
	.size	.L.str.14, 4

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"little"
	.size	.L.str.15, 7

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	" endian machine.\n"
	.size	.L.str.16, 18

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"Size of long double = %i\n\n"
	.size	.L.str.17, 27

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"A correct long double "
	.size	.L.str.18, 23

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"should be :"
	.size	.L.str.19, 12

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"\n    0x40 00 92 1f b5 44 42 d1 "
	.size	.L.str.20, 32

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"84 69 89 8c c5 17 01 b8\n\n"
	.size	.L.str.21, 26

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"Address in memory of pi is 0x%lX : \n"
	.size	.L.str.22, 37

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	"This machine claims long double pi is\n    0x"
	.size	.L.str.23, 45

	.type	.L.str.24,@object               # @.str.24
.L.str.24:
	.asciz	"%02x "
	.size	.L.str.24, 6

	.type	.L.str.25,@object               # @.str.25
.L.str.25:
	.asciz	"\n\n"
	.size	.L.str.25, 3

	.type	.L.str.26,@object               # @.str.26
.L.str.26:
	.asciz	"%.42Lg"
	.size	.L.str.26, 7

	.type	.L.str.27,@object               # @.str.27
.L.str.27:
	.asciz	"Maybe pi is %s\n\n"
	.size	.L.str.27, 17

	.type	.L.str.28,@object               # @.str.28
.L.str.28:
	.asciz	"Actually is 3.141592653589793238462643383279502884197169...\n"
	.size	.L.str.28, 61

	.ident	"FreeBSD clang version 18.1.5 (https://github.com/llvm/llvm-project.git llvmorg-18.1.5-0-g617a15a9eac9)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym setlocale
	.addrsig_sym uname
	.addrsig_sym fprintf
	.addrsig_sym perror
	.addrsig_sym printf
	.addrsig_sym snprintf
	.addrsig_sym __xuname
	.addrsig_sym __stderrp
	.gnu_attribute 4, 9
	.section	.toc,"aw",@progbits
.LC0:
	.tc __stderrp[TC],__stderrp
