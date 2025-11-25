	.file	"swap_eight.c"
	.section	".text"
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/dclarke/pgm/bw/xmand" "swap_eight.c"
	.align 4
	.global swap_eight
	.type	swap_eight, #function
	.proc	017
swap_eight:
.LFB0:
	.file 1 "swap_eight.c"
	.loc 1 48 1
	.cfi_startproc
	.register	%g7, #ignore
	mov	0, %g1
	sub	%sp, %g1, %g1
	stx	%g0, [%g1+1791]
	stx	%fp, [%sp+2159]
	stx	%i7, [%sp+2167]
	add	%sp, -256, %sp
	.cfi_def_cfa_offset 2303
	.cfi_offset 30, 112
	.cfi_offset 31, 120
	sub	%sp, -256, %fp
	.cfi_def_cfa 30, 2047
	mov	%o7, %i7
	.cfi_register 15, 31
	stx	%o0, [%fp+2175]
	.loc 1 48 1
	ldx	[%g7+40], %g1
	stx	%g1, [%fp+2039]
	mov	0, %g1
	.loc 1 50 22
	stx	%g0, [%fp+1975]
	stx	%g0, [%fp+1983]
	stx	%g0, [%fp+1991]
	stx	%g0, [%fp+1999]
	stx	%g0, [%fp+2007]
	stx	%g0, [%fp+2015]
	stx	%g0, [%fp+2023]
	stx	%g0, [%fp+2031]
	.loc 1 52 27
	ldx	[%fp+2175], %g1
	sllx	%g1, 56, %g1
	.loc 1 52 10
	stx	%g1, [%fp+1975]
	.loc 1 53 29
	ldx	[%fp+2175], %g1
	sllx	%g1, 40, %g4
	mov	255, %g1
	sllx	%g1, 48, %g1
	and	%g4, %g1, %g1
	.loc 1 53 10
	stx	%g1, [%fp+1983]
	.loc 1 54 31
	ldx	[%fp+2175], %g1
	sllx	%g1, 24, %g4
	mov	255, %g1
	sllx	%g1, 40, %g1
	and	%g4, %g1, %g1
	.loc 1 54 10
	stx	%g1, [%fp+1991]
	.loc 1 55 33
	ldx	[%fp+2175], %g1
	sllx	%g1, 8, %g4
	mov	255, %g1
	sllx	%g1, 32, %g1
	and	%g4, %g1, %g1
	.loc 1 55 10
	stx	%g1, [%fp+1999]
	.loc 1 56 35
	ldx	[%fp+2175], %g1
	srlx	%g1, 8, %g4
	sethi	%hi(4278190080), %g1
	and	%g4, %g1, %g1
	.loc 1 56 10
	stx	%g1, [%fp+2007]
	.loc 1 57 37
	ldx	[%fp+2175], %g1
	srlx	%g1, 24, %g4
	sethi	%hi(16711680), %g1
	and	%g4, %g1, %g1
	.loc 1 57 10
	stx	%g1, [%fp+2015]
	.loc 1 58 39
	ldx	[%fp+2175], %g1
	srlx	%g1, 40, %g4
	mov	255, %g1
	sllx	%g1, 8, %g1
	and	%g4, %g1, %g1
	.loc 1 58 10
	stx	%g1, [%fp+2023]
	.loc 1 59 16
	ldx	[%fp+2175], %g1
	srlx	%g1, 56, %g1
	.loc 1 59 10
	stx	%g1, [%fp+2031]
	.loc 1 61 15
	ldx	[%fp+1975], %g4
	.loc 1 61 22
	ldx	[%fp+1983], %g1
	.loc 1 61 19
	or	%g4, %g1, %g4
	.loc 1 61 29
	ldx	[%fp+1991], %g1
	.loc 1 61 26
	or	%g4, %g1, %g4
	.loc 1 61 36
	ldx	[%fp+1999], %g1
	.loc 1 61 33
	or	%g4, %g1, %g4
	.loc 1 61 43
	ldx	[%fp+2007], %g1
	.loc 1 61 40
	or	%g4, %g1, %g4
	.loc 1 61 50
	ldx	[%fp+2015], %g1
	.loc 1 61 47
	or	%g4, %g1, %g4
	.loc 1 61 57
	ldx	[%fp+2023], %g1
	.loc 1 61 54
	or	%g4, %g1, %g4
	.loc 1 61 64
	ldx	[%fp+2031], %g1
	.loc 1 61 12
	or	%g4, %g1, %g1
	stx	%g1, [%fp+1967]
	.loc 1 63 12
	ldx	[%fp+1967], %g1
	mov	%g1, %g4
	.loc 1 65 1
	ldx	[%fp+2039], %g1
	ldx	[%g7+40], %g5
	xor	%g1, %g5, %g1
	mov	0, %g5
	brz	%g1, .L3
	 nop
	call	__stack_chk_fail, 0
	 nop
.L3:
	mov	%g4, %o0
	mov	%fp, %g1
	mov	%i7, %o7
	ldx	[%fp+2167], %i7
	ldx	[%fp+2159], %fp
	mov	%g1, %sp
	jmp	%o7+8
	 nop
	.cfi_endproc
.LFE0:
	.size	swap_eight, .-swap_eight
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-uintn.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0xdd
	.uahalf	0x5
	.byte	0x1
	.byte	0x8
	.uaword	.Ldebug_abbrev0
	.uleb128 0x3
	.uaword	.LASF13
	.byte	0x1
	.uaword	.LASF0
	.uaword	.LASF1
	.uaxword	.Ltext0
	.uaxword	.Letext0-.Ltext0
	.uaword	.Ldebug_line0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.uaword	.LASF2
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.uaword	.LASF3
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.uaword	.LASF4
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.uaword	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.uaword	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.uaword	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.uaword	.LASF8
	.uleb128 0x2
	.uaword	.LASF10
	.byte	0x2
	.byte	0x2d
	.byte	0x1b
	.uaword	0x43
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.uaword	.LASF9
	.uleb128 0x2
	.uaword	.LASF11
	.byte	0x3
	.byte	0x1b
	.byte	0x14
	.uaword	0x66
	.uleb128 0x5
	.uaword	.LASF14
	.byte	0x1
	.byte	0x2f
	.byte	0xa
	.uaword	0x79
	.uaxword	.LFB0
	.uaxword	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uaword	0xd4
	.uleb128 0x6
	.asciz	"x"
	.byte	0x1
	.byte	0x2f
	.byte	0x1e
	.uaword	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 128
	.uleb128 0x7
	.uaword	.LASF12
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.uaword	0x79
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x8
	.asciz	"b"
	.byte	0x1
	.byte	0x32
	.byte	0x16
	.uaword	0xd4
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x9
	.uaword	0x79
	.uleb128 0xa
	.uaword	0x43
	.byte	0x7
	.byte	0
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
	.uleb128 0x3
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uaword	0x2c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x8
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaxword	.Ltext0
	.uaxword	.Letext0-.Ltext0
	.uaxword	0
	.uaxword	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.ascii	"GNU C89 15.2.1 20251108 -m64 -mhard-float -mno-app-regs -mfl"
	.ascii	"at"
	.asciz	" -msoft-quad-float -mno-unaligned-doubles -mno-faster-structs -mcpu=niagara7 -mtune=niagara7 -mno-vis -mno-cbcond -mno-fmaf -mno-fsmuld -mno-popc -mno-subxc -g -O0 -pedantic-errors -std=c90 -fno-builtin -fno-fast-math -foffload-options=-fno-stack-protector"
.LASF4:
	.asciz	"unsigned int"
.LASF5:
	.asciz	"long unsigned int"
.LASF11:
	.asciz	"uint64_t"
.LASF2:
	.asciz	"unsigned char"
.LASF9:
	.asciz	"char"
.LASF12:
	.asciz	"result"
.LASF8:
	.asciz	"long int"
.LASF3:
	.asciz	"short unsigned int"
.LASF6:
	.asciz	"signed char"
.LASF7:
	.asciz	"short int"
.LASF14:
	.asciz	"swap_eight"
.LASF10:
	.asciz	"__uint64_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.asciz	"swap_eight.c"
.LASF1:
	.asciz	"/home/dclarke/pgm/bw/xmand"
	.ident	"GCC: (Gentoo 15.2.1_p20251108-r1 p2) 15.2.1 20251108"
	.section	.note.GNU-stack,"",@progbits
