	.file	"fp_w128.c"
	.machine power9
	.abiversion 2
	.section	".text"
.Ltext0:
	.file 1 "fp_w128.c"
	.section	.rodata
	.align 3
.LC0:
	.string	"INFO : FLT_EVAL_METHOD == %d\n"
	.align 3
.LC1:
	.string	"INFO : DECIMAL_DIG == %d\n"
	.align 3
.LC2:
	.string	"INFO : FLT_DECIMAL_DIG == %d\n"
	.align 3
.LC3:
	.string	"INFO : DBL_DECIMAL_DIG == %d\n"
	.align 3
.LC4:
	.string	"INFO : LDBL_DECIMAL_DIG == %d\n"
	.align 3
.LC5:
	.string	"INFO : LDBL_DIG == %d\n"
	.align 3
.LC6:
	.string	"\n------------------------------------------"
	.align 3
.LC8:
	.string	"     : the sizeof(u[0]) is %i\n"
	.align 3
.LC9:
	.string	"%40.36Qg"
	.align 3
.LC10:
	.string	"u[0] = %s\n"
	.align 3
.LC15:
	.string	"we have u[ 2] = %-36.22Le\n"
	.align 3
.LC16:
	.string	"we have u[ 3] = %-36.22Le\n"
	.align 3
.LC17:
	.string	"we have u[ 4] = %-36.22Le\n"
	.align 3
.LC18:
	.string	"\n"
	.align 3
.LC19:
	.string	"        u[%2i] = %-36.22Le\n"
	.align 3
.LC20:
	.string	"\n\nFinal result should be 6 precisely.\n"
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB3:
	.loc 1 43 1
	.cfi_startproc
.LCF0:
0:	addis 2,12,.TOC.-.LCF0@ha
	addi 2,2,.TOC.-.LCF0@l
	.localentry	main,.-main
	mflr 0
	std 0,16(1)
	std 31,-8(1)
	stdu 1,-928(1)
	.cfi_def_cfa_offset 928
	.cfi_offset 65, 16
	.cfi_offset 31, -8
	mr 31,1
	.cfi_def_cfa_register 31
	mr 9,3
	std 4,904(31)
	stw 9,896(31)
	.loc 1 48 18
	li 9,64
	std 9,104(31)
	.loc 1 49 20
	li 4,1
	ld 3,104(31)
	bl calloc
	nop
	mr 9,3
	std 9,112(31)
	.loc 1 57 5
	li 4,0
	addis 3,2,.LC0@toc@ha
	addi 3,3,.LC0@toc@l
	bl printf
	nop
	.loc 1 61 5
	li 4,36
	addis 3,2,.LC1@toc@ha
	addi 3,3,.LC1@toc@l
	bl printf
	nop
	.loc 1 65 5
	li 4,9
	addis 3,2,.LC2@toc@ha
	addi 3,3,.LC2@toc@l
	bl printf
	nop
	.loc 1 69 5
	li 4,17
	addis 3,2,.LC3@toc@ha
	addi 3,3,.LC3@toc@l
	bl printf
	nop
	.loc 1 73 5
	li 4,36
	addis 3,2,.LC4@toc@ha
	addi 3,3,.LC4@toc@l
	bl printf
	nop
	.loc 1 77 5
	li 4,33
	addis 3,2,.LC5@toc@ha
	addi 3,3,.LC5@toc@l
	bl printf
	nop
	.loc 1 80 5
	addis 3,2,.LC6@toc@ha
	addi 3,3,.LC6@toc@l
	bl puts
	nop
	.loc 1 82 10
	addis 9,2,.LC7@toc@ha
	addi 9,9,.LC7@toc@l
	lxv 0,0(9)
	stxv 0,128(31)
	.loc 1 84 5
	li 4,16
	addis 3,2,.LC8@toc@ha
	addi 3,3,.LC8@toc@l
	bl printf
	nop
	.loc 1 86 17
	lxv 0,128(31)
	mfvsrd 8,0
	mfvsrld 7,0
	addis 5,2,.LC9@toc@ha
	addi 5,5,.LC9@toc@l
	ld 4,104(31)
	ld 3,112(31)
	bl quadmath_snprintf
	nop
	mr 9,3
	stw 9,120(31)
	.loc 1 89 8
	lwz 9,120(31)
	cmpwi 0,9,0
	ble 0,.L2
	.loc 1 89 22 discriminator 1
	ld 4,112(31)
	addis 3,2,.LC10@toc@ha
	addi 3,3,.LC10@toc@l
	bl printf
	nop
.L2:
	.loc 1 92 10
	addis 9,2,.LC11@toc@ha
	addi 9,9,.LC11@toc@l
	lxv 0,0(9)
	stxv 0,144(31)
	.loc 1 110 32
	lxv 32,144(31)
	.loc 1 110 29
	addis 9,2,.LC12@toc@ha
	addi 9,9,.LC12@toc@l
	lxv 33,0(9)
	xsdivqp 0,1,0
	.loc 1 110 19
	addis 9,2,.LC13@toc@ha
	addi 9,9,.LC13@toc@l
	lxv 33,0(9)
	xssubqp 1,1,0
	.loc 1 110 51
	lxv 45,128(31)
	.loc 1 110 58
	lxv 32,144(31)
	.loc 1 110 55
	xsmulqp 0,13,0
	.loc 1 110 46
	addis 9,2,.LC14@toc@ha
	addi 9,9,.LC14@toc@l
	lxv 45,0(9)
	xsdivqp 0,13,0
	.loc 1 110 36
	xsaddqp 0,1,0
	.loc 1 110 10
	stxv 32,160(31)
	.loc 1 111 5
	lxv 0,160(31)
	mfvsrd 6,0
	mfvsrld 5,0
	addis 3,2,.LC15@toc@ha
	addi 3,3,.LC15@toc@l
	bl printf
	nop
	.loc 1 112 32
	lxv 32,160(31)
	.loc 1 112 29
	addis 9,2,.LC12@toc@ha
	addi 9,9,.LC12@toc@l
	lxv 33,0(9)
	xsdivqp 0,1,0
	.loc 1 112 19
	addis 9,2,.LC13@toc@ha
	addi 9,9,.LC13@toc@l
	lxv 33,0(9)
	xssubqp 1,1,0
	.loc 1 112 51
	lxv 45,144(31)
	.loc 1 112 58
	lxv 32,160(31)
	.loc 1 112 55
	xsmulqp 0,13,0
	.loc 1 112 46
	addis 9,2,.LC14@toc@ha
	addi 9,9,.LC14@toc@l
	lxv 45,0(9)
	xsdivqp 0,13,0
	.loc 1 112 36
	xsaddqp 0,1,0
	.loc 1 112 10
	stxv 32,176(31)
	.loc 1 113 5
	lxv 0,176(31)
	mfvsrd 6,0
	mfvsrld 5,0
	addis 3,2,.LC16@toc@ha
	addi 3,3,.LC16@toc@l
	bl printf
	nop
	.loc 1 114 32
	lxv 32,176(31)
	.loc 1 114 29
	addis 9,2,.LC12@toc@ha
	addi 9,9,.LC12@toc@l
	lxv 33,0(9)
	xsdivqp 0,1,0
	.loc 1 114 19
	addis 9,2,.LC13@toc@ha
	addi 9,9,.LC13@toc@l
	lxv 33,0(9)
	xssubqp 1,1,0
	.loc 1 114 51
	lxv 45,160(31)
	.loc 1 114 58
	lxv 32,176(31)
	.loc 1 114 55
	xsmulqp 0,13,0
	.loc 1 114 46
	addis 9,2,.LC14@toc@ha
	addi 9,9,.LC14@toc@l
	lxv 45,0(9)
	xsdivqp 0,13,0
	.loc 1 114 36
	xsaddqp 0,1,0
	.loc 1 114 10
	stxv 32,192(31)
	.loc 1 115 5
	lxv 0,192(31)
	mfvsrd 6,0
	mfvsrld 5,0
	addis 3,2,.LC17@toc@ha
	addi 3,3,.LC17@toc@l
	bl printf
	nop
	.loc 1 117 5
	addis 3,2,.LC18@toc@ha
	addi 3,3,.LC18@toc@l
	bl puts
	nop
	.loc 1 118 12
	li 9,5
	stw 9,96(31)
	.loc 1 118 5
	b .L3
.L4:
	.loc 1 119 38 discriminator 3
	lwz 9,96(31)
	addi 9,9,-1
	.loc 1 119 36 discriminator 3
	extsw 9,9
	sldi 9,9,4
	addi 10,31,96
	add 10,10,9
	li 9,32
	lxvx 32,10,9
	.loc 1 119 33 discriminator 3
	addis 9,2,.LC12@toc@ha
	addi 9,9,.LC12@toc@l
	lxv 33,0(9)
	xsdivqp 0,1,0
	.loc 1 119 23 discriminator 3
	addis 9,2,.LC13@toc@ha
	addi 9,9,.LC13@toc@l
	lxv 33,0(9)
	xssubqp 1,1,0
	.loc 1 119 59 discriminator 3
	lwz 9,96(31)
	addi 9,9,-2
	.loc 1 119 57 discriminator 3
	extsw 9,9
	sldi 9,9,4
	addi 10,31,96
	add 10,10,9
	li 9,32
	lxvx 45,10,9
	.loc 1 119 68 discriminator 3
	lwz 9,96(31)
	addi 9,9,-1
	.loc 1 119 66 discriminator 3
	extsw 9,9
	sldi 9,9,4
	addi 10,31,96
	add 10,10,9
	li 9,32
	lxvx 32,10,9
	.loc 1 119 63 discriminator 3
	xsmulqp 0,13,0
	.loc 1 119 52 discriminator 3
	addis 9,2,.LC14@toc@ha
	addi 9,9,.LC14@toc@l
	lxv 45,0(9)
	xsdivqp 0,13,0
	.loc 1 119 42 discriminator 3
	xsaddqp 0,1,0
	.loc 1 119 14 discriminator 3
	lwa 9,96(31)
	sldi 9,9,4
	addi 10,31,96
	add 10,10,9
	li 9,32
	stxvx 32,10,9
	.loc 1 120 9 discriminator 3
	lwa 9,96(31)
	sldi 9,9,4
	addi 10,31,96
	add 10,10,9
	li 9,32
	lxvx 0,10,9
	lwa 9,96(31)
	mfvsrd 6,0
	mfvsrld 5,0
	mr 4,9
	addis 3,2,.LC19@toc@ha
	addi 3,3,.LC19@toc@l
	bl printf
	nop
	.loc 1 118 23 discriminator 3
	lwz 9,96(31)
	addi 9,9,1
	stw 9,96(31)
.L3:
	.loc 1 118 17 discriminator 1
	lwz 9,96(31)
	cmpwi 0,9,47
	ble 0,.L4
	.loc 1 123 5
	addis 3,2,.LC20@toc@ha
	addi 3,3,.LC20@toc@l
	bl puts
	nop
	.loc 1 124 12
	li 9,0
	.loc 1 126 1
	extsw 9,9
	mr 3,9
	addi 1,31,928
	.cfi_def_cfa 1, 0
	ld 0,16(1)
	mtlr 0
	ld 31,-8(1)
	blr
	.long 0
	.byte 0,0,0,1,128,1,0,1
	.cfi_endproc
.LFE3:
	.size	main,.-main
	.section	.rodata
	.align 4
.LC7:
	.long	0
	.long	0
	.long	0
	.long	1073741824
	.align 4
.LC11:
	.long	0
	.long	0
	.long	0
	.long	-1073676288
	.align 4
.LC12:
	.long	0
	.long	0
	.long	0
	.long	1074338432
	.align 4
.LC13:
	.long	0
	.long	0
	.long	0
	.long	1074117632
	.align 4
.LC14:
	.long	0
	.long	0
	.long	0
	.long	1074427648
	.section	".text"
.Letext0:
	.file 2 "/opt/gcc-12.2.0/lib/gcc/powerpc64le-linux-gnu/12.2.0/include/quadmath.h"
	.file 3 "/usr/include/stdio.h"
	.file 4 "/usr/include/stdlib.h"
	.file 5 "/opt/gcc-12.2.0/lib/gcc/powerpc64le-linux-gnu/12.2.0/include/stddef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x19d
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1d
	.4byte	.LASF22
	.4byte	.LASF23
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0xd6
	.byte	0x17
	.4byte	0x3f
	.uleb128 0x5
	.4byte	0x2e
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x46
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0xd
	.byte	0x8
	.uleb128 0x3
	.4byte	0x46
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x20
	.byte	0x3
	.4byte	.LASF10
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0xe
	.4byte	.LASF12
	.byte	0x2
	.byte	0x92
	.byte	0xc
	.4byte	0x75
	.4byte	0xc7
	.uleb128 0x2
	.4byte	0x85
	.uleb128 0x2
	.4byte	0x2e
	.uleb128 0x2
	.4byte	0xc7
	.uleb128 0x6
	.byte	0
	.uleb128 0x3
	.4byte	0x4d
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x14c
	.byte	0xc
	.4byte	0x75
	.4byte	0xe4
	.uleb128 0x2
	.4byte	0xc7
	.uleb128 0x6
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x21e
	.byte	0xe
	.4byte	0x83
	.4byte	0x100
	.uleb128 0x2
	.4byte	0x2e
	.uleb128 0x2
	.4byte	0x2e
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x184
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0xf
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1c
	.4byte	0x184
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.string	"u"
	.byte	0x2d
	.byte	0xf
	.4byte	0x189
	.uleb128 0x3
	.byte	0x91
	.sleb128 -800
	.uleb128 0x9
	.string	"j"
	.byte	0x2e
	.byte	0x9
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -832
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x30
	.byte	0x12
	.4byte	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -824
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x31
	.byte	0xb
	.4byte	0x85
	.uleb128 0x3
	.byte	0x91
	.sleb128 -816
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x32
	.byte	0x9
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -808
	.byte	0
	.uleb128 0x3
	.4byte	0x85
	.uleb128 0x10
	.4byte	0x199
	.4byte	0x199
	.uleb128 0x11
	.4byte	0x3f
	.byte	0x2f
	.byte	0
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.4byte	.LASF20
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"long long int"
.LASF24:
	.string	"size_t"
.LASF25:
	.string	"main"
.LASF20:
	.string	"_Float128"
.LASF0:
	.string	"long unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF21:
	.string	"GNU C17 12.2.0 -m64 -mabi=ieeelongdouble -mlong-double-128 -mfloat128 -mcpu=power9 -g -O0 -fno-fast-math"
.LASF12:
	.string	"quadmath_snprintf"
.LASF2:
	.string	"unsigned char"
.LASF1:
	.string	"char"
.LASF10:
	.string	"complex _Float128"
.LASF7:
	.string	"long int"
.LASF16:
	.string	"argv"
.LASF11:
	.string	"double"
.LASF15:
	.string	"argc"
.LASF17:
	.string	"buffer_size"
.LASF3:
	.string	"short unsigned int"
.LASF13:
	.string	"printf"
.LASF14:
	.string	"calloc"
.LASF22:
	.string	"fp_w128.c"
.LASF6:
	.string	"short int"
.LASF4:
	.string	"unsigned int"
.LASF18:
	.string	"buffer"
.LASF5:
	.string	"signed char"
.LASF23:
	.string	"/home/dclarke/pgm/bw/floating_point"
.LASF19:
	.string	"num_chars"
	.ident	"GCC: (mrw 12.2.0-1) 12.2.0"
	.gnu_attribute 4, 13
	.section	.note.GNU-stack,"",@progbits
