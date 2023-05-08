	.file	"fp128_q.c"
	.machine power9
	.abiversion 2
	.section	".text"
.Ltext0:
	.file 1 "fp128_q.c"
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
.LC7:
	.string	"     : the sizeof(fp0) is %i\n"
	.align 3
.LC8:
	.string	"%40.36Qg"
	.align 3
.LC9:
	.string	"     : quadmath_snprintf formatted %i chars.\n"
	.align 3
.LC11:
	.string	"FAIL : quadmath_snprintf failed.\n"
	.align 3
.LC12:
	.string	"     : the value of fp0 is %s\n"
	.align 3
.LC14:
	.string	"FAIL : wtf quadmath_snprintf failed.\n"
	.align 3
.LC15:
	.string	"     : the value of fp1 is %s\n"
	.align 3
.LC16:
	.string	"INFO : quadmath_snprintf formatted %i chars.\n"
	.align 3
.LC17:
	.string	"FAIL : wat? quadmath_snprintf failed.\n"
	.align 3
.LC18:
	.string	"     : fp2 = fp0 + fp1 = %s\n"
	.align 3
.LC20:
	.string	"%46.40Qe"
	.align 3
.LC21:
	.string	"\nlibquadmath says pi = %s\n"
	.align 3
.LC22:
	.string	"the real thing is  ~= "
	.align 3
.LC23:
	.string	"3.1415926535897932384626433832795028841971693993..."
	.section	".toc","aw"
	.align 3
.LC10:
	.quad	stderr
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB3:
	.loc 1 45 33
	.cfi_startproc
.LCF0:
0:	addis 2,12,.TOC.-.LCF0@ha
	addi 2,2,.TOC.-.LCF0@l
	.localentry	main,.-main
	mflr 0
	std 0,16(1)
	std 31,-8(1)
	stdu 1,-224(1)
	.cfi_def_cfa_offset 224
	.cfi_offset 65, 16
	.cfi_offset 31, -8
	mr 31,1
	.cfi_def_cfa_register 31
	mr 9,3
	std 4,200(31)
	stw 9,192(31)
	.loc 1 48 18
	li 9,128
	std 9,96(31)
	.loc 1 49 20
	li 4,1
	ld 3,96(31)
	bl calloc
	nop
	mr 9,3
	std 9,104(31)
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
	.loc 1 66 5
	li 4,9
	addis 3,2,.LC2@toc@ha
	addi 3,3,.LC2@toc@l
	bl printf
	nop
	.loc 1 70 5
	li 4,17
	addis 3,2,.LC3@toc@ha
	addi 3,3,.LC3@toc@l
	bl printf
	nop
	.loc 1 74 5
	li 4,36
	addis 3,2,.LC4@toc@ha
	addi 3,3,.LC4@toc@l
	bl printf
	nop
	.loc 1 78 5
	li 4,33
	addis 3,2,.LC5@toc@ha
	addi 3,3,.LC5@toc@l
	bl printf
	nop
	.loc 1 86 9
	addis 9,2,.LC6@toc@ha
	addi 9,9,.LC6@toc@l
	lxv 0,0(9)
	stxv 0,112(31)
	.loc 1 88 5
	li 4,16
	addis 3,2,.LC7@toc@ha
	addi 3,3,.LC7@toc@l
	bl printf
	nop
	.loc 1 90 17
	ld 7,112(31)
	ld 8,120(31)
	addis 5,2,.LC8@toc@ha
	addi 5,5,.LC8@toc@l
	ld 4,96(31)
	ld 3,104(31)
	bl quadmath_snprintf
	nop
	mr 9,3
	stw 9,128(31)
	.loc 1 93 8
	lwz 9,128(31)
	cmpwi 0,9,0
	ble 0,.L2
	.loc 1 95 9
	lwa 9,128(31)
	mr 4,9
	addis 3,2,.LC9@toc@ha
	addi 3,3,.LC9@toc@l
	bl printf
	nop
	.loc 1 105 5
	ld 4,104(31)
	addis 3,2,.LC12@toc@ha
	addi 3,3,.LC12@toc@l
	bl printf
	nop
	.loc 1 107 9
	addis 9,2,.LC13@toc@ha
	addi 9,9,.LC13@toc@l
	lxv 0,0(9)
	stxv 0,144(31)
	.loc 1 109 17
	ld 7,144(31)
	ld 8,152(31)
	addis 5,2,.LC8@toc@ha
	addi 5,5,.LC8@toc@l
	ld 4,96(31)
	ld 3,104(31)
	bl quadmath_snprintf
	nop
	mr 9,3
	stw 9,128(31)
	.loc 1 112 8
	lwz 9,128(31)
	cmpwi 0,9,0
	ble 0,.L5
	b .L11
.L2:
	.loc 1 100 9
	addis 9,2,.LC10@toc@ha
	ld 9,.LC10@toc@l(9)
	ld 9,0(9)
	mr 6,9
	li 5,33
	li 4,1
	addis 3,2,.LC11@toc@ha
	addi 3,3,.LC11@toc@l
	bl fwrite
	nop
	.loc 1 101 16
	li 9,1
	b .L4
.L11:
	.loc 1 114 9
	lwa 9,128(31)
	mr 4,9
	addis 3,2,.LC9@toc@ha
	addi 3,3,.LC9@toc@l
	bl printf
	nop
	.loc 1 124 5
	ld 4,104(31)
	addis 3,2,.LC15@toc@ha
	addi 3,3,.LC15@toc@l
	bl printf
	nop
	.loc 1 126 9
	lxv 33,112(31)
	lxv 32,144(31)
	xsaddqp 0,1,0
	stxv 32,160(31)
	.loc 1 128 17
	ld 7,160(31)
	ld 8,168(31)
	addis 5,2,.LC8@toc@ha
	addi 5,5,.LC8@toc@l
	ld 4,96(31)
	ld 3,104(31)
	bl quadmath_snprintf
	nop
	mr 9,3
	stw 9,128(31)
	.loc 1 131 8
	lwz 9,128(31)
	cmpwi 0,9,0
	ble 0,.L7
	b .L12
.L5:
	.loc 1 119 9
	addis 9,2,.LC10@toc@ha
	ld 9,.LC10@toc@l(9)
	ld 9,0(9)
	mr 6,9
	li 5,37
	li 4,1
	addis 3,2,.LC14@toc@ha
	addi 3,3,.LC14@toc@l
	bl fwrite
	nop
	.loc 1 120 16
	li 9,1
	b .L4
.L12:
	.loc 1 133 9
	lwa 9,128(31)
	mr 4,9
	addis 3,2,.LC16@toc@ha
	addi 3,3,.LC16@toc@l
	bl printf
	nop
	.loc 1 143 5
	ld 4,104(31)
	addis 3,2,.LC18@toc@ha
	addi 3,3,.LC18@toc@l
	bl printf
	nop
	.loc 1 147 8
	addis 9,2,.LC19@toc@ha
	addi 9,9,.LC19@toc@l
	lxv 0,0(9)
	stxv 0,176(31)
	.loc 1 149 17
	ld 7,176(31)
	ld 8,184(31)
	addis 5,2,.LC20@toc@ha
	addi 5,5,.LC20@toc@l
	ld 4,96(31)
	ld 3,104(31)
	bl quadmath_snprintf
	nop
	mr 9,3
	stw 9,128(31)
	.loc 1 152 8
	lwz 9,128(31)
	cmpwi 0,9,0
	ble 0,.L9
	b .L13
.L7:
	.loc 1 138 9
	addis 9,2,.LC10@toc@ha
	ld 9,.LC10@toc@l(9)
	ld 9,0(9)
	mr 6,9
	li 5,38
	li 4,1
	addis 3,2,.LC17@toc@ha
	addi 3,3,.LC17@toc@l
	bl fwrite
	nop
	.loc 1 139 16
	li 9,1
	b .L4
.L13:
	.loc 1 153 9
	lwa 9,128(31)
	mr 4,9
	addis 3,2,.LC16@toc@ha
	addi 3,3,.LC16@toc@l
	bl printf
	nop
	.loc 1 160 5
	ld 4,104(31)
	addis 3,2,.LC21@toc@ha
	addi 3,3,.LC21@toc@l
	bl printf
	nop
	.loc 1 161 5
	addis 3,2,.LC22@toc@ha
	addi 3,3,.LC22@toc@l
	bl printf
	nop
	.loc 1 162 5
	addis 3,2,.LC23@toc@ha
	addi 3,3,.LC23@toc@l
	bl puts
	nop
	.loc 1 164 5
	ld 3,104(31)
	bl free
	nop
	.loc 1 165 12
	li 9,0
	b .L4
.L9:
	.loc 1 156 9
	addis 9,2,.LC10@toc@ha
	ld 9,.LC10@toc@l(9)
	ld 9,0(9)
	mr 6,9
	li 5,38
	li 4,1
	addis 3,2,.LC17@toc@ha
	addi 3,3,.LC17@toc@l
	bl fwrite
	nop
	.loc 1 157 16
	li 9,1
.L4:
	.loc 1 167 1
	extsw 9,9
	mr 3,9
	addi 1,31,224
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
.LC6:
	.long	-1236950581
	.long	2027224563
	.long	137438953
	.long	1074013356
	.align 4
.LC13:
	.long	-1168231105
	.long	721554505
	.long	-824633721
	.long	1073869815
	.align 4
.LC19:
	.long	-988347976
	.long	-2073458292
	.long	-1253817647
	.long	1073779231
	.section	".text"
.Letext0:
	.file 2 "/opt/gcc-12.2.0/lib/gcc/powerpc64le-linux-gnu/12.2.0/include/stddef.h"
	.file 3 "/usr/include/powerpc64le-linux-gnu/bits/types.h"
	.file 4 "/usr/include/powerpc64le-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/powerpc64le-linux-gnu/bits/types/FILE.h"
	.file 6 "/opt/gcc-12.2.0/lib/gcc/powerpc64le-linux-gnu/12.2.0/include/quadmath.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3ba
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0xf
	.4byte	.LASF58
	.byte	0x1d
	.4byte	.LASF59
	.4byte	.LASF60
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x3f
	.uleb128 0x9
	.4byte	0x2e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x9
	.4byte	0x46
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.4byte	0x7c
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.4byte	0x7c
	.uleb128 0x11
	.byte	0x8
	.uleb128 0x3
	.4byte	0x46
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.4byte	0x20c
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x33
	.byte	0x7
	.4byte	0x75
	.byte	0
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x36
	.byte	0x9
	.4byte	0x9d
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x37
	.byte	0x9
	.4byte	0x9d
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x38
	.byte	0x9
	.4byte	0x9d
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x39
	.byte	0x9
	.4byte	0x9d
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x3a
	.byte	0x9
	.4byte	0x9d
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x3b
	.byte	0x9
	.4byte	0x9d
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x3c
	.byte	0x9
	.4byte	0x9d
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x3d
	.byte	0x9
	.4byte	0x9d
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x40
	.byte	0x9
	.4byte	0x9d
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x41
	.byte	0x9
	.4byte	0x9d
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x42
	.byte	0x9
	.4byte	0x9d
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x44
	.byte	0x16
	.4byte	0x225
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x46
	.byte	0x14
	.4byte	0x22a
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x48
	.byte	0x7
	.4byte	0x75
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x49
	.byte	0x7
	.4byte	0x75
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x4a
	.byte	0xb
	.4byte	0x83
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x4d
	.byte	0x12
	.4byte	0x59
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x4e
	.byte	0xf
	.4byte	0x67
	.byte	0x82
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x4f
	.byte	0x8
	.4byte	0x22f
	.byte	0x83
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x51
	.byte	0xf
	.4byte	0x23f
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x59
	.byte	0xd
	.4byte	0x8f
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5b
	.byte	0x17
	.4byte	0x249
	.byte	0x98
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5c
	.byte	0x19
	.4byte	0x253
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5d
	.byte	0x14
	.4byte	0x22a
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x5e
	.byte	0x9
	.4byte	0x9b
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x5f
	.byte	0xa
	.4byte	0x2e
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x60
	.byte	0x7
	.4byte	0x75
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x62
	.byte	0x8
	.4byte	0x258
	.byte	0xc4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.4byte	0xa2
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x7
	.4byte	.LASF41
	.uleb128 0x3
	.4byte	0x220
	.uleb128 0x3
	.4byte	0xa2
	.uleb128 0xa
	.4byte	0x46
	.4byte	0x23f
	.uleb128 0xb
	.4byte	0x3f
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x218
	.uleb128 0x7
	.4byte	.LASF42
	.uleb128 0x3
	.4byte	0x244
	.uleb128 0x7
	.4byte	.LASF43
	.uleb128 0x3
	.4byte	0x24e
	.uleb128 0xa
	.4byte	0x46
	.4byte	0x268
	.uleb128 0xb
	.4byte	0x3f
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.4byte	0x20c
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x7
	.byte	0x8b
	.byte	0xe
	.4byte	0x268
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF44
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF45
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF46
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF47
	.uleb128 0x2
	.byte	0x20
	.byte	0x3
	.4byte	.LASF48
	.uleb128 0x15
	.4byte	.LASF64
	.byte	0x8
	.2byte	0x235
	.byte	0xd
	.4byte	0x2af
	.uleb128 0x4
	.4byte	0x9b
	.byte	0
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x6
	.byte	0x92
	.byte	0xc
	.4byte	0x75
	.4byte	0x2d0
	.uleb128 0x4
	.4byte	0x9d
	.uleb128 0x4
	.4byte	0x2e
	.uleb128 0x4
	.4byte	0x2d0
	.uleb128 0xc
	.byte	0
	.uleb128 0x3
	.4byte	0x4d
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x7
	.2byte	0x14c
	.byte	0xc
	.4byte	0x75
	.4byte	0x2ed
	.uleb128 0x4
	.4byte	0x2d0
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0x8
	.2byte	0x21e
	.byte	0xe
	.4byte	0x9b
	.4byte	0x309
	.uleb128 0x4
	.4byte	0x2e
	.uleb128 0x4
	.4byte	0x2e
	.byte	0
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.byte	0x2d
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a8
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0xe
	.4byte	0x75
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x1a
	.4byte	0x3a8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x6
	.string	"fp0"
	.byte	0x10
	.4byte	0x3b4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x6
	.string	"fp1"
	.byte	0x15
	.4byte	0x3b4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x6
	.string	"fp2"
	.byte	0x1a
	.4byte	0x3b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x6
	.string	"pi"
	.byte	0x1f
	.4byte	0x3b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.4byte	.LASF54
	.byte	0x30
	.byte	0x12
	.4byte	0x3a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x8
	.4byte	.LASF55
	.byte	0x31
	.byte	0xb
	.4byte	0x9d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x8
	.4byte	.LASF56
	.byte	0x32
	.byte	0x9
	.4byte	0x75
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x3
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF57
	.uleb128 0x18
	.4byte	0x3ad
	.4byte	.LASF66
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 47
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 45
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x16
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
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
.LASF50:
	.string	"printf"
.LASF9:
	.string	"__off_t"
.LASF12:
	.string	"_IO_read_ptr"
.LASF24:
	.string	"_chain"
.LASF8:
	.string	"size_t"
.LASF30:
	.string	"_shortbuf"
.LASF18:
	.string	"_IO_buf_base"
.LASF45:
	.string	"long long unsigned int"
.LASF64:
	.string	"free"
.LASF60:
	.string	"/home/dclarke/pgm/bw/floating_point"
.LASF33:
	.string	"_codecvt"
.LASF44:
	.string	"long long int"
.LASF5:
	.string	"signed char"
.LASF57:
	.string	"_Float128"
.LASF49:
	.string	"quadmath_snprintf"
.LASF25:
	.string	"_fileno"
.LASF13:
	.string	"_IO_read_end"
.LASF7:
	.string	"long int"
.LASF11:
	.string	"_flags"
.LASF19:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_cur_column"
.LASF42:
	.string	"_IO_codecvt"
.LASF47:
	.string	"double"
.LASF27:
	.string	"_old_offset"
.LASF32:
	.string	"_offset"
.LASF41:
	.string	"_IO_marker"
.LASF4:
	.string	"unsigned int"
.LASF36:
	.string	"_freeres_buf"
.LASF0:
	.string	"long unsigned int"
.LASF16:
	.string	"_IO_write_ptr"
.LASF3:
	.string	"short unsigned int"
.LASF20:
	.string	"_IO_save_base"
.LASF31:
	.string	"_lock"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF56:
	.string	"num_chars"
.LASF66:
	.string	"long double"
.LASF17:
	.string	"_IO_write_end"
.LASF62:
	.string	"_IO_lock_t"
.LASF61:
	.string	"_IO_FILE"
.LASF46:
	.string	"float"
.LASF23:
	.string	"_markers"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"short int"
.LASF43:
	.string	"_IO_wide_data"
.LASF29:
	.string	"_vtable_offset"
.LASF40:
	.string	"FILE"
.LASF1:
	.string	"char"
.LASF59:
	.string	"fp128_q.c"
.LASF55:
	.string	"buffer"
.LASF10:
	.string	"__off64_t"
.LASF14:
	.string	"_IO_read_base"
.LASF22:
	.string	"_IO_save_end"
.LASF37:
	.string	"__pad5"
.LASF39:
	.string	"_unused2"
.LASF63:
	.string	"stderr"
.LASF53:
	.string	"argv"
.LASF54:
	.string	"buffer_size"
.LASF51:
	.string	"calloc"
.LASF21:
	.string	"_IO_backup_base"
.LASF48:
	.string	"complex _Float128"
.LASF52:
	.string	"argc"
.LASF35:
	.string	"_freeres_list"
.LASF34:
	.string	"_wide_data"
.LASF58:
	.string	"GNU C17 12.2.0 -m64 -mabi=ieeelongdouble -mlong-double-128 -mfloat128 -mcpu=power9 -g -O0 -fno-fast-math"
.LASF65:
	.string	"main"
.LASF15:
	.string	"_IO_write_base"
	.ident	"GCC: (mrw 12.2.0-1) 12.2.0"
	.gnu_attribute 4, 13
	.section	.note.GNU-stack,"",@progbits
