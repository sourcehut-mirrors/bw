	.file	"div2.c"
	.machine power4
	.section	".text"
.Ltext0:
	.section	.rodata
	.align 3
.LC1:
	.string	"C"
	.align 3
.LC4:
	.string	"ERROR : could not attain CLOCK_REALTIME\n"
	.align 3
.LC7:
	.string	"     : time delta %lu nsecs\n"
	.align 3
.LC9:
	.string	" foo = %32.26e\n"
	.section	".toc","aw"
	.align 3
.LCTOC0:
	.tc .LCTOC1[TC],.LCTOC1
	.section	".toc1","aw"
	.align 3
.LCTOC1 = .+32768
.LC0:
	.quad	0x42dc12218377de40
.LC2:
	.quad	.LC1
.LC3:
	.quad	stderr
.LC5:
	.quad	.LC4
.LC6:
	.quad	0x4000000000000000
.LC8:
	.quad	.LC7
.LC10:
	.quad	.LC9
.LC11:
	.quad	0x3fe0000000000000
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
	.file 1 "div2.c"
	.loc 1 30 1
	.cfi_startproc
	mflr %r0
	std %r0,16(%r1)
	stfd %f30,-16(%r1)
	stfd %f31,-8(%r1)
	std %r29,-40(%r1)
	std %r30,-32(%r1)
	std %r31,-24(%r1)
	stdu %r1,-224(%r1)
	.cfi_def_cfa_offset 224
	.cfi_offset 65, 16
	.cfi_offset 62, -16
	.cfi_offset 63, -8
	.cfi_offset 29, -40
	.cfi_offset 30, -32
	.cfi_offset 31, -24
	mr %r31,%r1
	.cfi_def_cfa_register 31
	ld %r30,.LCTOC0@toc(%r2)
	mr %r9,%r3
	std %r4,280(%r31)
	stw %r9,272(%r31)
	.loc 1 36 21
	lfd %f30,.LC0-.LCTOC1(%r30)
	.loc 1 38 5
	ld %r4,.LC2-.LCTOC1(%r30)
	li %r3,6
	bl setlocale
	nop
	.loc 1 39 5
	bl sysinfo
	nop
	.loc 1 41 10
	addi %r9,%r31,120
	mr %r4,%r9
	li %r3,0
	bl clock_gettime
	nop
	mr %r9,%r3
	mr %r10,%r9
	.loc 1 41 8
	li %r9,-1
	cmpw %cr0,%r10,%r9
	bne %cr0,.L2
	.loc 1 43 9
	ld %r9,.LC3-.LCTOC1(%r30)
	ld %r9,0(%r9)
	ld %r4,.LC5-.LCTOC1(%r30)
	mr %r3,%r9
	bl fprintf
	nop
	.loc 1 44 15
	li %r9,1
	b .L8
.L2:
	.loc 1 47 13
	li %r29,0
	.loc 1 47 5
	b .L4
.L5:
	.loc 1 48 28 discriminator 3
	mr %r9,%r29
	rldicl %r9,%r9,0,32
	std %r9,160(%r31)
	lfd %f0,160(%r31)
	fcfid %f0,%f0
	.loc 1 48 25 discriminator 3
	fadd %f12,%f30,%f0
	.loc 1 48 13 discriminator 3
	lfd %f0,.LC6-.LCTOC1(%r30)
	fdiv %f31,%f12,%f0
	.loc 1 47 30 discriminator 3
	addi %r9,%r29,1
	rldicl %r29,%r9,0,32
.L4:
	.loc 1 47 5 discriminator 1
	lis %r9,0xf
	ori %r9,%r9,0x423f
	cmplw %cr0,%r29,%r9
	ble %cr0,.L5
	.loc 1 50 5
	addi %r9,%r31,136
	mr %r4,%r9
	li %r3,0
	bl clock_gettime
	nop
	.loc 1 51 19
	addi %r9,%r31,136
	ld %r5,0(%r9)
	ld %r6,8(%r9)
	addi %r9,%r31,120
	ld %r3,0(%r9)
	ld %r4,8(%r9)
	bl timediff
	nop
	std %r3,112(%r31)
	.loc 1 52 5
	ld %r4,112(%r31)
	ld %r3,.LC8-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 53 5
	stfd %f31,160(%r31)
	ld %r9,160(%r31)
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	std %r10,160(%r31)
	lfd %f0,160(%r31)
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC10-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 55 13
	li %r29,0
	.loc 1 55 5
	b .L6
.L7:
	.loc 1 56 28 discriminator 3
	mr %r9,%r29
	rldicl %r9,%r9,0,32
	std %r9,160(%r31)
	lfd %f0,160(%r31)
	fcfid %f0,%f0
	.loc 1 56 25 discriminator 3
	fadd %f12,%f30,%f0
	.loc 1 56 13 discriminator 3
	lfd %f0,.LC11-.LCTOC1(%r30)
	fmul %f31,%f12,%f0
	.loc 1 55 30 discriminator 3
	addi %r9,%r29,1
	rldicl %r29,%r9,0,32
.L6:
	.loc 1 55 5 discriminator 1
	lis %r9,0xf
	ori %r9,%r9,0x423f
	cmplw %cr0,%r29,%r9
	ble %cr0,.L7
	.loc 1 58 5
	addi %r9,%r31,120
	mr %r4,%r9
	li %r3,0
	bl clock_gettime
	nop
	.loc 1 59 19
	addi %r9,%r31,120
	ld %r5,0(%r9)
	ld %r6,8(%r9)
	addi %r9,%r31,136
	ld %r3,0(%r9)
	ld %r4,8(%r9)
	bl timediff
	nop
	std %r3,112(%r31)
	.loc 1 60 5
	ld %r4,112(%r31)
	ld %r3,.LC8-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 61 5
	stfd %f31,160(%r31)
	ld %r9,160(%r31)
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	std %r10,160(%r31)
	lfd %f0,160(%r31)
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC10-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 63 12
	li %r9,0
.L8:
	.loc 1 65 1 discriminator 1
	mr %r3,%r9
	addi %r1,%r31,224
	.cfi_def_cfa 1, 0
	ld %r0,16(%r1)
	mtlr %r0
	ld %r29,-40(%r1)
	ld %r30,-32(%r1)
	ld %r31,-24(%r1)
	lfd %f30,-16(%r1)
	lfd %f31,-8(%r1)
	blr
	.long 0
	.byte 0,0,2,1,130,3,0,1
	.cfi_endproc
.LFE0:
	.size	main,.-.L.main
.Letext0:
	.file 2 "/usr/lib/gcc/powerpc64-linux-gnu/10/include/stddef.h"
	.file 3 "/usr/include/powerpc64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/powerpc64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/powerpc64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/powerpc64-linux-gnu/bits/stdint-uintn.h"
	.file 7 "/usr/include/powerpc64-linux-gnu/bits/types/struct_timespec.h"
	.file 8 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3b3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0xc
	.4byte	.LASF62
	.4byte	.LASF63
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.4byte	0x33
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.4byte	0x4d
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.4byte	0x69
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.4byte	0x4d
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.4byte	0x3a
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.4byte	0x3a
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.4byte	0x3a
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0xc4
	.byte	0x21
	.4byte	0x3a
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.4byte	0x24f
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.4byte	0x54
	.byte	0
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.4byte	0x2d
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.4byte	0x2d
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.4byte	0x2d
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.4byte	0x2d
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.4byte	0x2d
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.4byte	0x2d
	.byte	0x30
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.4byte	0x2d
	.byte	0x38
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.4byte	0x2d
	.byte	0x40
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.4byte	0x2d
	.byte	0x48
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.4byte	0x2d
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.4byte	0x2d
	.byte	0x58
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.4byte	0x268
	.byte	0x60
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.4byte	0x26e
	.byte	0x68
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.4byte	0x54
	.byte	0x70
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.4byte	0x54
	.byte	0x74
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.4byte	0x96
	.byte	0x78
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.4byte	0x62
	.byte	0x80
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.4byte	0x70
	.byte	0x82
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.4byte	0x274
	.byte	0x83
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.4byte	0x284
	.byte	0x88
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.4byte	0xa2
	.byte	0x90
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.4byte	0x28f
	.byte	0x98
	.uleb128 0x8
	.4byte	.LASF38
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.4byte	0x29a
	.byte	0xa0
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.4byte	0x26e
	.byte	0xa8
	.uleb128 0x8
	.4byte	.LASF40
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.4byte	0xba
	.byte	0xb0
	.uleb128 0x8
	.4byte	.LASF41
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.4byte	0x41
	.byte	0xb8
	.uleb128 0x8
	.4byte	.LASF42
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.4byte	0x54
	.byte	0xc0
	.uleb128 0x8
	.4byte	.LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.4byte	0x2a0
	.byte	0xc4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.4byte	0xc8
	.uleb128 0x9
	.4byte	.LASF64
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xa
	.4byte	.LASF45
	.uleb128 0x2
	.byte	0x8
	.4byte	0x263
	.uleb128 0x2
	.byte	0x8
	.4byte	0xc8
	.uleb128 0xb
	.4byte	0x33
	.4byte	0x284
	.uleb128 0xc
	.4byte	0x4d
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.4byte	0x25b
	.uleb128 0xa
	.4byte	.LASF46
	.uleb128 0x2
	.byte	0x8
	.4byte	0x28a
	.uleb128 0xa
	.4byte	.LASF47
	.uleb128 0x2
	.byte	0x8
	.4byte	0x295
	.uleb128 0xb
	.4byte	0x33
	.4byte	0x2b0
	.uleb128 0xc
	.4byte	0x4d
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.4byte	0x24f
	.uleb128 0xd
	.4byte	.LASF65
	.byte	0x8
	.byte	0x8b
	.byte	0xe
	.4byte	0x2b0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF48
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF49
	.uleb128 0x4
	.4byte	.LASF50
	.byte	0x6
	.byte	0x1a
	.byte	0x14
	.4byte	0x7e
	.uleb128 0x4
	.4byte	.LASF51
	.byte	0x6
	.byte	0x1b
	.byte	0x14
	.4byte	0x8a
	.uleb128 0x7
	.4byte	.LASF53
	.byte	0x10
	.byte	0x7
	.byte	0xa
	.byte	0x8
	.4byte	0x310
	.uleb128 0x8
	.4byte	.LASF54
	.byte	0x7
	.byte	0xc
	.byte	0xc
	.4byte	0xae
	.byte	0
	.uleb128 0x8
	.4byte	.LASF55
	.byte	0x7
	.byte	0x10
	.byte	0x15
	.4byte	0xbc
	.byte	0x8
	.byte	0
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x1
	.byte	0x1d
	.byte	0x5
	.4byte	0x54
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a9
	.uleb128 0xf
	.4byte	.LASF56
	.byte	0x1
	.byte	0x1d
	.byte	0x10
	.4byte	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0x1d
	.byte	0x1d
	.4byte	0x3a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x10
	.string	"k"
	.byte	0x1
	.byte	0x20
	.byte	0x17
	.4byte	0x2d0
	.uleb128 0x1
	.byte	0x6d
	.uleb128 0x11
	.4byte	.LASF58
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.4byte	0x2dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x10
	.string	"t0"
	.byte	0x1
	.byte	0x22
	.byte	0x15
	.4byte	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x10
	.string	"t1"
	.byte	0x1
	.byte	0x22
	.byte	0x19
	.4byte	0x2e8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x10
	.string	"foo"
	.byte	0x1
	.byte	0x23
	.byte	0x15
	.4byte	0x3af
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x3f
	.uleb128 0x11
	.4byte	.LASF59
	.byte	0x1
	.byte	0x24
	.byte	0x15
	.4byte	0x3af
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x3e
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.4byte	0x2d
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF60
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
.LASF11:
	.string	"__off_t"
.LASF16:
	.string	"_IO_read_ptr"
.LASF28:
	.string	"_chain"
.LASF63:
	.string	"/home/dclarke/pgm/lastmiles/floating_point"
.LASF8:
	.string	"size_t"
.LASF34:
	.string	"_shortbuf"
.LASF22:
	.string	"_IO_buf_base"
.LASF49:
	.string	"long long unsigned int"
.LASF37:
	.string	"_codecvt"
.LASF48:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF1:
	.string	"long int"
.LASF15:
	.string	"_flags"
.LASF23:
	.string	"_IO_buf_end"
.LASF32:
	.string	"_cur_column"
.LASF46:
	.string	"_IO_codecvt"
.LASF60:
	.string	"double"
.LASF31:
	.string	"_old_offset"
.LASF61:
	.ascii	"GNU C99 10.2.0 -msecure-plt -m64 -mcpu=970 -mno-altivec -mno"
	.ascii	"-isel -mno-vsx -mno-crypto -mno-htm -mno-qua"
	.string	"d-memory-atomic -mfull-toc -mno-multiple -mupdate -mno-avoid-indexed-addresses -mno-dlmzb -mno-bit-align -mno-strict-align -mbig -mregnames -mno-recip -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-unsafe-math-optimizations -fasynchronous-unwind-tables"
.LASF9:
	.string	"__uint32_t"
.LASF45:
	.string	"_IO_marker"
.LASF5:
	.string	"unsigned int"
.LASF40:
	.string	"_freeres_buf"
.LASF2:
	.string	"long unsigned int"
.LASF20:
	.string	"_IO_write_ptr"
.LASF4:
	.string	"short unsigned int"
.LASF24:
	.string	"_IO_save_base"
.LASF35:
	.string	"_lock"
.LASF58:
	.string	"tdelta_nsec"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF55:
	.string	"tv_nsec"
.LASF36:
	.string	"_offset"
.LASF54:
	.string	"tv_sec"
.LASF14:
	.string	"__syscall_slong_t"
.LASF21:
	.string	"_IO_write_end"
.LASF51:
	.string	"uint64_t"
.LASF64:
	.string	"_IO_lock_t"
.LASF52:
	.string	"_IO_FILE"
.LASF10:
	.string	"__uint64_t"
.LASF27:
	.string	"_markers"
.LASF3:
	.string	"unsigned char"
.LASF7:
	.string	"short int"
.LASF47:
	.string	"_IO_wide_data"
.LASF53:
	.string	"timespec"
.LASF33:
	.string	"_vtable_offset"
.LASF44:
	.string	"FILE"
.LASF50:
	.string	"uint32_t"
.LASF0:
	.string	"char"
.LASF59:
	.string	"some_num"
.LASF12:
	.string	"__off64_t"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF41:
	.string	"__pad5"
.LASF13:
	.string	"__time_t"
.LASF43:
	.string	"_unused2"
.LASF65:
	.string	"stderr"
.LASF62:
	.string	"div2.c"
.LASF57:
	.string	"argv"
.LASF25:
	.string	"_IO_backup_base"
.LASF56:
	.string	"argc"
.LASF39:
	.string	"_freeres_list"
.LASF38:
	.string	"_wide_data"
.LASF66:
	.string	"main"
.LASF19:
	.string	"_IO_write_base"
	.ident	"GCC: (Debian 10.2.0-15) 10.2.0"
	.gnu_attribute 4, 1
