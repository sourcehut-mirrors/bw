	.file	"pi_fp128.c"
	.machine power4
	.section	".text"
.Ltext0:
	.section	.rodata
	.align 3
.LC1:
	.string	"the sizeof(pi) is %i bytes\n"
	.align 3
.LC3:
	.string	"\npi is this  3.14159265358979323846264338"
	.align 3
.LC5:
	.string	"327950288419716939937510.....\n\n"
	.align 3
.LC7:
	.string	"pi could be %42.38Le\n"
	.section	".toc","aw"
	.align 3
.LCTOC0:
	.tc .LCTOC1[TC],.LCTOC1
	.section	".toc1","aw"
	.align 3
.LCTOC1 = .+32768
.LC0:
	.quad	0x400921fb54442d18,0x3ca1a62633145c06
.LC2:
	.quad	.LC1
.LC4:
	.quad	.LC3
.LC6:
	.quad	.LC5
.LC8:
	.quad	.LC7
	.section	".text"
	.align 2
	.globl main
	.section	".opd","aw"
	.align 3
main:
	.quad	.L.main,.TOC.@tocbase,0
	.previous
	.type	main, @function
.L.main:
.LFB0:
	.file 1 "pi_fp128.c"
	.loc 1 41 1
	.cfi_startproc
	mflr %r0
	std %r0,16(%r1)
	std %r30,-16(%r1)
	std %r31,-8(%r1)
	stdu %r1,-144(%r1)
	.cfi_def_cfa_offset 144
	.cfi_offset 65, 16
	.cfi_offset 30, -16
	.cfi_offset 31, -8
	mr %r31,%r1
	.cfi_def_cfa_register 31
	ld %r30,.LCTOC0@toc(%r2)
	mr %r9,%r3
	std %r4,200(%r31)
	stw %r9,192(%r31)
	.loc 1 43 17
	lfd %f0,.LC0-.LCTOC1(%r30)
	lfd %f1,.LC0+8-.LCTOC1(%r30)
	stfd %f0,112(%r31)
	stfd %f1,120(%r31)
	.loc 1 45 5
	li %r4,16
	ld %r3,.LC2-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 47 5
	ld %r3,.LC4-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 48 5
	ld %r3,.LC6-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 50 5
	ld %r10,112(%r31)
	ld %r11,120(%r31)
	lfd %f0,112(%r31)
	lfd %f1,120(%r31)
	mr %r4,%r10
	mr %r5,%r11
	fmr %f2,%f1
	fmr %f1,%f0
	ld %r3,.LC8-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 52 12
	li %r9,0
	.loc 1 54 1
	mr %r3,%r9
	addi %r1,%r31,144
	.cfi_def_cfa 1, 0
	ld %r0,16(%r1)
	mtlr %r0
	ld %r30,-16(%r1)
	ld %r31,-8(%r1)
	blr
	.long 0
	.byte 0,0,0,1,128,2,0,1
	.cfi_endproc
.LFE0:
	.size	main,.-.L.main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0xc
	.4byte	.LASF14
	.4byte	.LASF15
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x8
	.4byte	0x34
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x1
	.byte	0x28
	.byte	0x5
	.4byte	0x5e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcf
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x28
	.byte	0xe
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x28
	.byte	0x1a
	.4byte	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x7
	.string	"pi"
	.byte	0x1
	.byte	0x2b
	.byte	0x11
	.4byte	0xd5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.4byte	0x6c
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
.LASF4:
	.string	"unsigned int"
.LASF16:
	.string	"main"
.LASF0:
	.string	"long unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF2:
	.string	"unsigned char"
.LASF1:
	.string	"char"
.LASF7:
	.string	"long int"
.LASF13:
	.ascii	"GNU C99 10.2.1 20210110 -msecure-plt -m64 -mcpu=970 -mno-alt"
	.ascii	"ivec -mno-isel -mno-vsx -mno-crypto -mno-htm -mno-qua"
	.string	"d-memory-atomic -mfull-toc -mno-multiple -mupdate -mno-avoid-indexed-addresses -mno-dlmzb -mno-bit-align -mno-strict-align -mbig -mregnames -mno-recip -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-unsafe-math-optimizations -fasynchronous-unwind-tables"
.LASF10:
	.string	"argc"
.LASF3:
	.string	"short unsigned int"
.LASF5:
	.string	"signed char"
.LASF11:
	.string	"argv"
.LASF12:
	.string	"long double"
.LASF6:
	.string	"short int"
.LASF14:
	.string	"pi_fp128.c"
.LASF15:
	.string	"/home/dclarke/pgm/lastmiles/floating_point"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.gnu_attribute 4, 5
