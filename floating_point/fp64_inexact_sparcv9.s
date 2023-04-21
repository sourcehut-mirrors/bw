	.file	"fp64_inexact.c"
	.section	".text"
.LLtext0:
	.section	".rodata"
	.align 8
.LLC0:
	.asciz	"FAIL : provide a decimal number\n"
	.align 8
.LLC1:
	.asciz	"INFO : LC_NUMERIC locale is now %s\n"
	.align 8
.LLC2:
	.asciz	"C"
	.align 8
.LLC3:
	.asciz	"FAIL : setlocale fail\n"
	.align 8
.LLC4:
	.asciz	"     : \"%s\" not reasonable?\n"
	.align 8
.LLC5:
	.asciz	"INFO : FP Exception raised is"
	.align 8
.LLC6:
	.asciz	" FE_INEXACT"
	.align 8
.LLC7:
	.asciz	" FE_DIVBYZERO"
	.align 8
.LLC8:
	.asciz	" FE_UNDERFLOW"
	.align 8
.LLC9:
	.asciz	" FE_OVERFLOW"
	.align 8
.LLC10:
	.asciz	" FE_INVALID"
	.align 8
.LLC11:
	.asciz	"\n"
	.align 8
.LLC12:
	.asciz	"FAIL : number not understood\n"
	.align 8
.LLC13:
	.asciz	"     "
	.align 8
.LLC15:
	.asciz	"FAIL : number is not normal\n"
	.align 8
.LLC16:
	.asciz	"     : looks like %-+22.16e\n"
	.align 8
.LLC17:
	.asciz	"INFO : %-+68.60g\n"
	.align 8
.LLC14:
	.long	0
	.long	0
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
.LLFB15:
	.file 1 "fp64_inexact.c"
	.loc 1 41 0
	.cfi_startproc
	save	%sp, -208, %sp
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	sethi	%hi(_GLOBAL_OFFSET_TABLE_-8), %l7
	add	%l7, %lo(_GLOBAL_OFFSET_TABLE_-4), %l7
	call	__sparc_get_pc_thunk.l7
	 nop
	mov	%i0, %g1
	stx	%i1, [%fp+2183]
	st	%g1, [%fp+2175]
	.loc 1 45 0
	st	%g0, [%fp+2035]
	.loc 1 47 0
	ld	[%fp+2175], %g1
	cmp	%g1, 1
	bg	%icc, .LL2
	 nop
	.loc 1 48 0
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 49 0
	mov	1, %g1
	ba,pt	%xcc, .LL3
	 nop
.LL2:
	.loc 1 52 0
	ld	[%fp+2175], %g1
	cmp	%g1, 2
	ble	%icc, .LL4
	 nop
	.loc 1 53 0
	ldx	[%fp+2183], %g1
	add	%g1, 16, %g1
	ldx	[%g1], %g1
	mov	%g1, %o1
	mov	4, %o0
	call	__setlocale50, 0
	 nop
	stx	%o0, [%fp+2039]
	.loc 1 54 0
	ldx	[%fp+2039], %o1
	sethi	%hi(.LLC1), %g1
	or	%g1, %lo(.LLC1), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	ba,pt	%xcc, .LL5
	 nop
.LL4:
	.loc 1 56 0
	sethi	%hi(.LLC2), %g1
	or	%g1, %lo(.LLC2), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	mov	4, %o0
	call	__setlocale50, 0
	 nop
	stx	%o0, [%fp+2039]
.LL5:
	.loc 1 59 0
	ldx	[%fp+2039], %g1
	brnz	%g1, .LL6
	 nop
	.loc 1 60 0
	sethi	%hi(.LLC3), %g1
	or	%g1, %lo(.LLC3), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 61 0
	ldx	[%fp+2183], %g1
	add	%g1, 16, %g1
	ldx	[%g1], %g1
	mov	%g1, %o2
	sethi	%hi(.LLC4), %g1
	or	%g1, %lo(.LLC4), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 62 0
	mov	1, %g1
	ba,pt	%xcc, .LL3
	 nop
.LL6:
	.loc 1 65 0
	call	__errno, 0
	 nop
	mov	%o0, %g1
	st	%g0, [%g1]
	.loc 1 66 0
	mov	992, %o0
	call	feclearexcept, 0
	 nop
	.loc 1 68 0
	ldx	[%fp+2183], %g1
	add	%g1, 8, %g1
	ldx	[%g1], %g1
	mov	0, %o1
	mov	%g1, %o0
	call	strtod, 0
	 nop
	std	%f0, [%fp+2023]
	.loc 1 70 0
	mov	992, %o0
	call	fetestexcept, 0
	 nop
	mov	%o0, %g1
	st	%g1, [%fp+2035]
	.loc 1 71 0
	ld	[%fp+2035], %g1
	cmp	%g1, 0
	be	%icc, .LL7
	 nop
	.loc 1 72 0
	sethi	%hi(.LLC5), %g1
	or	%g1, %lo(.LLC5), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 73 0
	ld	[%fp+2035], %g1
	and	%g1, 32, %g1
	cmp	%g1, 0
	be	%icc, .LL8
	 nop
	.loc 1 73 0 is_stmt 0 discriminator 1
	sethi	%hi(.LLC6), %g1
	or	%g1, %lo(.LLC6), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL8:
	.loc 1 74 0 is_stmt 1
	ld	[%fp+2035], %g1
	and	%g1, 64, %g1
	cmp	%g1, 0
	be	%icc, .LL9
	 nop
	.loc 1 74 0 is_stmt 0 discriminator 1
	sethi	%hi(.LLC7), %g1
	or	%g1, %lo(.LLC7), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL9:
	.loc 1 75 0 is_stmt 1
	ld	[%fp+2035], %g1
	and	%g1, 128, %g1
	cmp	%g1, 0
	be	%icc, .LL10
	 nop
	.loc 1 75 0 is_stmt 0 discriminator 1
	sethi	%hi(.LLC8), %g1
	or	%g1, %lo(.LLC8), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL10:
	.loc 1 76 0 is_stmt 1
	ld	[%fp+2035], %g1
	and	%g1, 256, %g1
	cmp	%g1, 0
	be	%icc, .LL11
	 nop
	.loc 1 76 0 is_stmt 0 discriminator 1
	sethi	%hi(.LLC9), %g1
	or	%g1, %lo(.LLC9), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL11:
	.loc 1 77 0 is_stmt 1
	ld	[%fp+2035], %g1
	and	%g1, 512, %g1
	cmp	%g1, 0
	be	%icc, .LL12
	 nop
	.loc 1 77 0 is_stmt 0 discriminator 1
	sethi	%hi(.LLC10), %g1
	or	%g1, %lo(.LLC10), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL12:
	.loc 1 78 0 is_stmt 1
	sethi	%hi(.LLC11), %g1
	or	%g1, %lo(.LLC11), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL7:
	.loc 1 81 0
	call	__errno, 0
	 nop
	mov	%o0, %g1
	ld	[%g1], %g1
	cmp	%g1, 34
	be	%icc, .LL13
	 nop
	.loc 1 81 0 is_stmt 0 discriminator 1
	call	__errno, 0
	 nop
	mov	%o0, %g1
	ld	[%g1], %g1
	cmp	%g1, 22
	bne	%icc, .LL14
	 nop
.LL13:
	.loc 1 82 0 is_stmt 1
	sethi	%hi(.LLC12), %g1
	or	%g1, %lo(.LLC12), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 83 0
	sethi	%hi(.LLC13), %g1
	or	%g1, %lo(.LLC13), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	perror, 0
	 nop
	.loc 1 84 0
	mov	1, %g1
	ba,pt	%xcc, .LL3
	 nop
.LL14:
	.loc 1 87 0
	ldd	[%fp+2023], %f0
	call	__fpclassifyd, 0
	 nop
	mov	%o0, %g1
	cmp	%g1, 2
	be	%icc, .LL15
	 nop
	.loc 1 87 0 is_stmt 0 discriminator 1
	ldd	[%fp+2023], %f10
	sethi	%hi(.LLC14), %g1
	or	%g1, %lo(.LLC14), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	fcmpd	%fcc0, %f10, %f8
	fbe	%fcc0, .LL15
	 nop
	.loc 1 88 0 is_stmt 1
	sethi	%hi(.LLC15), %g1
	or	%g1, %lo(.LLC15), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 89 0
	ldx	[%fp+2023], %o2
	sethi	%hi(.LLC16), %g1
	or	%g1, %lo(.LLC16), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o1
	sethi	%hi(__sF), %g1
	or	%g1, %lo(__sF), %g1
	ldx	[%l7 + %g1], %g1
	add	%g1, 304, %o0
	call	fprintf, 0
	 nop
	.loc 1 90 0
	mov	1, %g1
	ba,pt	%xcc, .LL3
	 nop
.LL15:
	.loc 1 93 0
	mov	992, %o0
	call	feclearexcept, 0
	 nop
	.loc 1 95 0
	ldd	[%fp+2023], %f8
	std	%f8, [%fp+2015]
	.loc 1 98 0
	ldx	[%fp+2015], %o1
	sethi	%hi(.LLC17), %g1
	or	%g1, %lo(.LLC17), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 100 0
	mov	0, %g1
.LL3:
	sra	%g1, 0, %g1
	.loc 1 102 0
	mov	%g1, %i0
	return	%i7+8
	 nop
	.cfi_endproc
.LLFE15:
	.size	main, .-main
.LLetext0:
	.file 2 "/usr/include/sys/common_int_types.h"
	.file 3 "/usr/include/stdint.h"
	.file 4 "/usr/include/sys/ansi.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/math.h"
	.file 7 "/usr/include/stdlib.h"
	.file 8 "/usr/include/time.h"
	.file 9 "/usr/include/unistd.h"
	.file 10 "/usr/include/sparc/fenv.h"
	.section	.debug_info,"",@progbits
.LLdebug_info0:
	.uaword	0x3df
	.uahalf	0x4
	.uaword	.LLdebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.uaword	.LLASF53
	.byte	0xc
	.uaword	.LLASF54
	.uaword	.LLASF55
	.uaxword	.LLtext0
	.uaxword	.LLetext0-.LLtext0
	.uaword	.LLdebug_line0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x33
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.uaword	.LLASF0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.uaword	.LLASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.uaword	.LLASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.uaword	.LLASF3
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.uaword	.LLASF4
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.uaword	.LLASF5
	.uleb128 0x4
	.uaword	.LLASF37
	.byte	0x6
	.byte	0xaa
	.uaword	0x68
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.uaword	.LLASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.uaword	.LLASF7
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.uaword	.LLASF8
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.uaword	.LLASF9
	.uleb128 0x6
	.uaword	.LLASF11
	.byte	0x2
	.byte	0x33
	.uaword	0x96
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.uaword	.LLASF10
	.uleb128 0x6
	.uaword	.LLASF12
	.byte	0x2
	.byte	0x34
	.uaword	0x3a
	.uleb128 0x6
	.uaword	.LLASF13
	.byte	0x3
	.byte	0x4a
	.uaword	0x9d
	.uleb128 0x6
	.uaword	.LLASF14
	.byte	0x4
	.byte	0x2a
	.uaword	0x8b
	.uleb128 0x6
	.uaword	.LLASF15
	.byte	0x5
	.byte	0x2d
	.uaword	0x3a
	.uleb128 0x6
	.uaword	.LLASF16
	.byte	0x5
	.byte	0x31
	.uaword	0x96
	.uleb128 0x7
	.uaword	.LLASF19
	.byte	0x10
	.byte	0x5
	.byte	0x51
	.uaword	0xf9
	.uleb128 0x8
	.uaword	.LLASF17
	.byte	0x5
	.byte	0x52
	.uaword	0xf9
	.byte	0
	.uleb128 0x8
	.uaword	.LLASF18
	.byte	0x5
	.byte	0x53
	.uaword	0x68
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x41
	.uleb128 0x7
	.uaword	.LLASF20
	.byte	0x98
	.byte	0x5
	.byte	0x70
	.uaword	0x205
	.uleb128 0x9
	.asciz	"_p"
	.byte	0x5
	.byte	0x71
	.uaword	0xf9
	.byte	0
	.uleb128 0x9
	.asciz	"_r"
	.byte	0x5
	.byte	0x72
	.uaword	0x68
	.byte	0x8
	.uleb128 0x9
	.asciz	"_w"
	.byte	0x5
	.byte	0x73
	.uaword	0x68
	.byte	0xc
	.uleb128 0x8
	.uaword	.LLASF21
	.byte	0x5
	.byte	0x74
	.uaword	0x7d
	.byte	0x10
	.uleb128 0x8
	.uaword	.LLASF22
	.byte	0x5
	.byte	0x75
	.uaword	0x76
	.byte	0x12
	.uleb128 0x9
	.asciz	"_bf"
	.byte	0x5
	.byte	0x76
	.uaword	0xd4
	.byte	0x18
	.uleb128 0x8
	.uaword	.LLASF23
	.byte	0x5
	.byte	0x77
	.uaword	0x68
	.byte	0x28
	.uleb128 0x8
	.uaword	.LLASF24
	.byte	0x5
	.byte	0x7a
	.uaword	0x205
	.byte	0x30
	.uleb128 0x8
	.uaword	.LLASF25
	.byte	0x5
	.byte	0x7b
	.uaword	0x216
	.byte	0x38
	.uleb128 0x8
	.uaword	.LLASF26
	.byte	0x5
	.byte	0x7c
	.uaword	0x235
	.byte	0x40
	.uleb128 0x8
	.uaword	.LLASF27
	.byte	0x5
	.byte	0x7d
	.uaword	0x254
	.byte	0x48
	.uleb128 0x8
	.uaword	.LLASF28
	.byte	0x5
	.byte	0x7e
	.uaword	0x27a
	.byte	0x50
	.uleb128 0x8
	.uaword	.LLASF29
	.byte	0x5
	.byte	0x81
	.uaword	0xd4
	.byte	0x58
	.uleb128 0x9
	.asciz	"_up"
	.byte	0x5
	.byte	0x84
	.uaword	0xf9
	.byte	0x68
	.uleb128 0x9
	.asciz	"_ur"
	.byte	0x5
	.byte	0x85
	.uaword	0x68
	.byte	0x70
	.uleb128 0x8
	.uaword	.LLASF30
	.byte	0x5
	.byte	0x88
	.uaword	0x280
	.byte	0x74
	.uleb128 0x8
	.uaword	.LLASF31
	.byte	0x5
	.byte	0x89
	.uaword	0x290
	.byte	0x77
	.uleb128 0x8
	.uaword	.LLASF32
	.byte	0x5
	.byte	0x8b
	.uaword	0x216
	.byte	0x78
	.uleb128 0x8
	.uaword	.LLASF33
	.byte	0x5
	.byte	0x8d
	.uaword	0x2a0
	.byte	0x80
	.uleb128 0x8
	.uaword	.LLASF34
	.byte	0x5
	.byte	0x90
	.uaword	0x68
	.byte	0x88
	.uleb128 0x8
	.uaword	.LLASF35
	.byte	0x5
	.byte	0x91
	.uaword	0xb3
	.byte	0x90
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.uleb128 0xb
	.uaword	0x68
	.uaword	0x216
	.uleb128 0xc
	.uaword	0x205
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x207
	.uleb128 0xb
	.uaword	0xc9
	.uaword	0x235
	.uleb128 0xc
	.uaword	0x205
	.uleb128 0xc
	.uaword	0x205
	.uleb128 0xc
	.uaword	0xbe
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x21c
	.uleb128 0xb
	.uaword	0xb3
	.uaword	0x254
	.uleb128 0xc
	.uaword	0x205
	.uleb128 0xc
	.uaword	0xb3
	.uleb128 0xc
	.uaword	0x68
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x23b
	.uleb128 0xb
	.uaword	0xc9
	.uaword	0x273
	.uleb128 0xc
	.uaword	0x205
	.uleb128 0xc
	.uaword	0x273
	.uleb128 0xc
	.uaword	0xbe
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x279
	.uleb128 0xd
	.uleb128 0x2
	.byte	0x8
	.uaword	0x25a
	.uleb128 0xe
	.uaword	0x41
	.uaword	0x290
	.uleb128 0xf
	.uaword	0x3a
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.uaword	0x41
	.uaword	0x2a0
	.uleb128 0xf
	.uaword	0x3a
	.byte	0
	.byte	0
	.uleb128 0xe
	.uaword	0x33
	.uaword	0x2b0
	.uleb128 0xf
	.uaword	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.uaword	.LLASF36
	.byte	0x5
	.byte	0x92
	.uaword	0xff
	.uleb128 0xe
	.uaword	0x2b0
	.uaword	0x2cb
	.uleb128 0xf
	.uaword	0x3a
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.uaword	.LLASF38
	.byte	0x5
	.byte	0x95
	.uaword	0x2bb
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.uaword	.LLASF39
	.uleb128 0x4
	.uaword	.LLASF40
	.byte	0x7
	.byte	0x5c
	.uaword	0xbe
	.uleb128 0xe
	.uaword	0x2d
	.uaword	0x2f8
	.uleb128 0xf
	.uaword	0x3a
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.uaword	.LLASF41
	.byte	0x8
	.byte	0x75
	.uaword	0x2e8
	.uleb128 0x4
	.uaword	.LLASF42
	.byte	0x8
	.byte	0x7e
	.uaword	0x68
	.uleb128 0x10
	.uaword	.LLASF56
	.byte	0x8
	.byte	0x80
	.uaword	.LLASF57
	.uaword	0x96
	.uleb128 0x4
	.uaword	.LLASF43
	.byte	0x9
	.byte	0x9b
	.uaword	0x2d
	.uleb128 0x4
	.uaword	.LLASF44
	.byte	0x9
	.byte	0x9c
	.uaword	0x68
	.uleb128 0x4
	.uaword	.LLASF45
	.byte	0x9
	.byte	0x9d
	.uaword	0x68
	.uleb128 0x4
	.uaword	.LLASF46
	.byte	0x9
	.byte	0x9e
	.uaword	0x68
	.uleb128 0x6
	.uaword	.LLASF47
	.byte	0xa
	.byte	0x25
	.uaword	0xa8
	.uleb128 0x11
	.uaword	0x349
	.uleb128 0x4
	.uaword	.LLASF48
	.byte	0xa
	.byte	0x4c
	.uaword	0x354
	.uleb128 0x12
	.uaword	.LLASF58
	.byte	0x1
	.byte	0x28
	.uaword	0x68
	.uaxword	.LLFB15
	.uaxword	.LLFE15-.LLFB15
	.uleb128 0x1
	.byte	0x9c
	.uaword	0x3dc
	.uleb128 0x13
	.uaword	.LLASF49
	.byte	0x1
	.byte	0x28
	.uaword	0x68
	.uleb128 0x3
	.byte	0x91
	.sleb128 128
	.uleb128 0x13
	.uaword	.LLASF50
	.byte	0x1
	.byte	0x28
	.uaword	0x3dc
	.uleb128 0x3
	.byte	0x91
	.sleb128 136
	.uleb128 0x14
	.asciz	"buf"
	.byte	0x1
	.byte	0x2b
	.uaword	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x15
	.uaword	.LLASF51
	.byte	0x1
	.byte	0x2c
	.uaword	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.asciz	"num"
	.byte	0x1
	.byte	0x2c
	.uaword	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.uaword	.LLASF52
	.byte	0x1
	.byte	0x2d
	.uaword	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.uaword	0x2d
	.byte	0
	.section	.debug_abbrev,"",@progbits
.LLdebug_abbrev0:
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.uaword	0x2c
	.uahalf	0x2
	.uaword	.LLdebug_info0
	.byte	0x8
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaxword	.LLtext0
	.uaxword	.LLetext0-.LLtext0
	.uaxword	0
	.uaxword	0
	.section	.debug_line,"",@progbits
.LLdebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LLASF14:
	.asciz	"__off_t"
.LLASF15:
	.asciz	"size_t"
.LLASF13:
	.asciz	"uint64_t"
.LLASF54:
	.asciz	"fp64_inexact.c"
.LLASF16:
	.asciz	"ssize_t"
.LLASF23:
	.asciz	"_lbfsize"
.LLASF11:
	.asciz	"__int64_t"
.LLASF38:
	.asciz	"__sF"
.LLASF55:
	.asciz	"/home/dclarke/pgm/bw/floating_point"
.LLASF48:
	.asciz	"__fe_dfl_env"
.LLASF39:
	.asciz	"long long int"
.LLASF6:
	.asciz	"signed char"
.LLASF32:
	.asciz	"_flush"
.LLASF30:
	.asciz	"_ubuf"
.LLASF17:
	.asciz	"_base"
.LLASF24:
	.asciz	"_cookie"
.LLASF10:
	.asciz	"long int"
.LLASF21:
	.asciz	"_flags"
.LLASF34:
	.asciz	"_blksize"
.LLASF4:
	.asciz	"double"
.LLASF53:
	.asciz	"GNU C99 7.5.0 -m64 -mhard-float -mno-app-regs -mcpu=ultrasparc -mtune=ultrasparc -mno-vis -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-fast-math -fPIC"
.LLASF35:
	.asciz	"_offset"
.LLASF56:
	.asciz	"timezone"
.LLASF26:
	.asciz	"_read"
.LLASF9:
	.asciz	"unsigned int"
.LLASF25:
	.asciz	"_close"
.LLASF33:
	.asciz	"_lb_unused"
.LLASF1:
	.asciz	"long unsigned int"
.LLASF22:
	.asciz	"_file"
.LLASF8:
	.asciz	"short unsigned int"
.LLASF28:
	.asciz	"_write"
.LLASF43:
	.asciz	"optarg"
.LLASF45:
	.asciz	"optind"
.LLASF52:
	.asciz	"fpe_raised"
.LLASF12:
	.asciz	"__uint64_t"
.LLASF3:
	.asciz	"float"
.LLASF2:
	.asciz	"unsigned char"
.LLASF7:
	.asciz	"short int"
.LLASF19:
	.asciz	"__sbuf"
.LLASF20:
	.asciz	"__sFILE"
.LLASF41:
	.asciz	"tzname"
.LLASF57:
	.asciz	"__timezone13"
.LLASF36:
	.asciz	"FILE"
.LLASF46:
	.asciz	"optopt"
.LLASF42:
	.asciz	"daylight"
.LLASF27:
	.asciz	"_seek"
.LLASF5:
	.asciz	"long double"
.LLASF0:
	.asciz	"char"
.LLASF18:
	.asciz	"_size"
.LLASF29:
	.asciz	"_ext"
.LLASF44:
	.asciz	"opterr"
.LLASF40:
	.asciz	"__mb_cur_max"
.LLASF50:
	.asciz	"argv"
.LLASF51:
	.asciz	"candidate_double"
.LLASF37:
	.asciz	"signgam"
.LLASF31:
	.asciz	"_nbuf"
.LLASF49:
	.asciz	"argc"
.LLASF47:
	.asciz	"fenv_t"
.LLASF58:
	.asciz	"main"
	.ident	"GCC: (nb4 20200810) 7.5.0"
	.section	.text.__sparc_get_pc_thunk.l7,"axG",@progbits,__sparc_get_pc_thunk.l7,comdat
	.align 4
	.weak	__sparc_get_pc_thunk.l7
	.hidden	__sparc_get_pc_thunk.l7
	.type	__sparc_get_pc_thunk.l7, #function
	.proc	020
__sparc_get_pc_thunk.l7:
	.cfi_startproc
	add	%o7, %l7, %l7
	jmp	%o7+8
	 nop
	.cfi_endproc
