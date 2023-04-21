	.file	"fmad.c"
	.section	".text"
.LLtext0:
	.section	".rodata"
	.align 8
.LLC18:
	.asciz	"NOTE : this machine is a "
	.align 8
.LLC19:
	.asciz	"big"
	.align 8
.LLC20:
	.asciz	"little"
	.align 8
.LLC21:
	.asciz	" endian architecture.\n"
	.align 8
.LLC22:
	.asciz	"     : Be sure to adjust your brain accordingly.\n\n\n"
	.align 8
.LLC23:
	.asciz	"--------------- Maybe no FMA Calls ---------------\n\n"
	.align 8
.LLC24:
	.asciz	"        fp32  = %-+24.18e\n"
	.align 8
.LLC25:
	.asciz	" dotme_fp32  is "
	.align 8
.LLC26:
	.asciz	"0x%02x "
	.align 8
.LLC27:
	.asciz	"\n\n"
	.align 8
.LLC28:
	.asciz	"        fp64  = %-+24.18e\n"
	.align 8
.LLC29:
	.asciz	" dotme_fp64  is "
	.global _Qp_mul
	.global _Qp_mul
	.global _Qp_add
	.global _Qp_mul
	.global _Qp_add
	.global _Qp_mul
	.global _Qp_add
	.align 8
.LLC30:
	.asciz	"        fp128 = %-+24.18Le\n"
	.align 8
.LLC31:
	.asciz	" dotme_fp128 is "
	.align 8
.LLC32:
	.asciz	"\n\n\n\n"
	.align 8
.LLC33:
	.asciz	"-------------------- FMA Calls -------------------\n\n"
	.align 8
.LLC35:
	.asciz	"  fmaf fp32   = %-+24.18e\n"
	.align 8
.LLC37:
	.asciz	"  fma  fp64   = %-+24.18e\n"
	.align 8
.LLC39:
	.asciz	"  fmal fp128  = %-+24.18Le\n"
	.align 8
.LLC40:
	.asciz	"\n\n\n"
	.align 8
.LLC41:
	.asciz	"--------------------------------------------------\n\n"
	.align 8
.LLC42:
	.asciz	"\nCorrect result is +5.595788259858e-02\n"
	.align 8
.LLC43:
	.asciz	"or this    0x3faca682f76db9b9 from ARMv8\n"
	.align 8
.LLC44:
	.asciz	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+\n"
	.align 8
.LLC45:
	.asciz	"Same thing on Intel Core i5-7300U K8-class CPU\n"
	.align 8
.LLC46:
	.asciz	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a\n"
	.align 8
.LLC47:
	.asciz	"\nNOTE : IBM Power systems may report strange fp128 hex values\n"
	.align 16
.LLC0:
	.long	1073735768
	.long	4004421348
	.long	1547012860
	.long	1206164256
	.long	-1073835383
	.long	688459205
	.long	3143668670
	.long	2386929793
	.long	1073685942
	.long	746018639
	.long	1915624133
	.long	2116285006
	.long	1073671097
	.long	2469668042
	.long	3131299164
	.long	3192322060
	.align 16
.LLC1:
	.long	-1073815815
	.long	3676492005
	.long	1614907703
	.long	1271310320
	.long	-1073847795
	.long	3021842782
	.long	851131951
	.long	263717864
	.long	1073723766
	.long	3719098080
	.long	4090183255
	.long	1403251715
	.long	-1073845404
	.long	3144383353
	.long	488787894
	.long	548986156
	.align 4
.LLC2:
	.long	1072966775
	.align 4
.LLC3:
	.long	3209249941
	.align 4
.LLC4:
	.long	1066588950
	.align 4
.LLC5:
	.long	1064688842
	.align 4
.LLC6:
	.long	3211754734
	.align 4
.LLC7:
	.long	3207661274
	.align 4
.LLC8:
	.long	1071430511
	.align 4
.LLC9:
	.long	3207967326
	.align 8
.LLC10:
	.long	1073644942
	.long	3941199430
	.align 8
.LLC11:
	.long	-1075238766
	.long	2425412700
	.align 8
.LLC12:
	.long	1072847714
	.long	3346363639
	.align 8
.LLC13:
	.long	1072610201
	.long	859983020
	.align 8
.LLC14:
	.long	-1074925667
	.long	2989297238
	.align 8
.LLC15:
	.long	-1075437349
	.long	1104844259
	.align 8
.LLC16:
	.long	1073452909
	.long	3670994447
	.align 8
.LLC17:
	.long	-1075399093
	.long	3065493394
	.align 4
.LLC34:
	.long	0
	.align 8
.LLC36:
	.long	0
	.long	0
	.align 16
.LLC38:
	.long	0
	.long	0
	.long	0
	.long	0
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
.LLFB3:
	.file 1 "fmad.c"
	.loc 1 43 0
	.cfi_startproc
	save	%sp, -976, %sp
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
	.loc 1 82 0
	sethi	%hi(.LLC2), %g1
	or	%g1, %lo(.LLC2), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1943]
	sethi	%hi(.LLC3), %g1
	or	%g1, %lo(.LLC3), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1947]
	sethi	%hi(.LLC4), %g1
	or	%g1, %lo(.LLC4), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1951]
	sethi	%hi(.LLC5), %g1
	or	%g1, %lo(.LLC5), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1955]
	ldx	[%fp+1943], %g1
	stx	%g1, [%fp+1927]
	ldx	[%fp+1951], %g1
	stx	%g1, [%fp+1935]
	.loc 1 83 0
	sethi	%hi(.LLC6), %g1
	or	%g1, %lo(.LLC6), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1959]
	sethi	%hi(.LLC7), %g1
	or	%g1, %lo(.LLC7), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1963]
	sethi	%hi(.LLC8), %g1
	or	%g1, %lo(.LLC8), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1967]
	sethi	%hi(.LLC9), %g1
	or	%g1, %lo(.LLC9), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f8
	st	%f8, [%fp+1971]
	ldx	[%fp+1959], %g1
	stx	%g1, [%fp+1911]
	ldx	[%fp+1967], %g1
	stx	%g1, [%fp+1919]
	.loc 1 86 0
	sethi	%hi(.LLC10), %g1
	or	%g1, %lo(.LLC10), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+1975]
	sethi	%hi(.LLC11), %g1
	or	%g1, %lo(.LLC11), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+1983]
	sethi	%hi(.LLC12), %g1
	or	%g1, %lo(.LLC12), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+1991]
	sethi	%hi(.LLC13), %g1
	or	%g1, %lo(.LLC13), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+1999]
	ldx	[%fp+1975], %g1
	stx	%g1, [%fp+1879]
	ldx	[%fp+1983], %g1
	stx	%g1, [%fp+1887]
	ldx	[%fp+1991], %g1
	stx	%g1, [%fp+1895]
	ldx	[%fp+1999], %g1
	stx	%g1, [%fp+1903]
	.loc 1 87 0
	sethi	%hi(.LLC14), %g1
	or	%g1, %lo(.LLC14), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+2007]
	sethi	%hi(.LLC15), %g1
	or	%g1, %lo(.LLC15), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+2015]
	sethi	%hi(.LLC16), %g1
	or	%g1, %lo(.LLC16), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+2023]
	sethi	%hi(.LLC17), %g1
	or	%g1, %lo(.LLC17), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	std	%f8, [%fp+2031]
	ldx	[%fp+2007], %g1
	stx	%g1, [%fp+1847]
	ldx	[%fp+2015], %g1
	stx	%g1, [%fp+1855]
	ldx	[%fp+2023], %g1
	stx	%g1, [%fp+1863]
	ldx	[%fp+2031], %g1
	stx	%g1, [%fp+1871]
	.loc 1 95 0
	sethi	%hi(.LLC0), %g1
	or	%g1, %lo(.LLC0), %g1
	ldx	[%l7 + %g1], %g4
	add	%fp, 1775, %g1
	mov	%g4, %g5
	mov	64, %g4
	mov	%g4, %o2
	mov	%g5, %o1
	mov	%g1, %o0
	call	memcpy, 0
	 nop
	.loc 1 96 0
	sethi	%hi(.LLC1), %g1
	or	%g1, %lo(.LLC1), %g1
	ldx	[%l7 + %g1], %g4
	add	%fp, 1711, %g1
	mov	%g4, %g5
	mov	64, %g4
	mov	%g4, %o2
	mov	%g5, %o1
	mov	%g1, %o0
	call	memcpy, 0
	 nop
	.loc 1 105 0
	sethi	%hi(.LLC18), %g1
	or	%g1, %lo(.LLC18), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 106 0
	call	endian, 0
	 nop
	mov	%o0, %g1
	cmp	%g1, 0
	be	%icc, .LL2
	 nop
	.loc 1 107 0
	sethi	%hi(.LLC19), %g1
	or	%g1, %lo(.LLC19), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	ba,pt	%xcc, .LL3
	 nop
.LL2:
	.loc 1 109 0
	sethi	%hi(.LLC20), %g1
	or	%g1, %lo(.LLC20), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
.LL3:
	.loc 1 111 0
	sethi	%hi(.LLC21), %g1
	or	%g1, %lo(.LLC21), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 112 0
	sethi	%hi(.LLC22), %g1
	or	%g1, %lo(.LLC22), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 114 0
	sethi	%hi(.LLC23), %g1
	or	%g1, %lo(.LLC23), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 121 0
	ld	[%fp+1927], %f9
	ld	[%fp+1911], %f8
	fmuls	%f9, %f8, %f9
	.loc 1 125 0
	ld	[%fp+1931], %f10
	ld	[%fp+1915], %f8
	fmuls	%f10, %f8, %f8
	.loc 1 123 0
	fadds	%f9, %f8, %f9
	.loc 1 129 0
	ld	[%fp+1935], %f10
	ld	[%fp+1919], %f8
	fmuls	%f10, %f8, %f8
	.loc 1 127 0
	fadds	%f9, %f8, %f9
	.loc 1 133 0
	ld	[%fp+1939], %f10
	ld	[%fp+1923], %f8
	fmuls	%f10, %f8, %f8
	.loc 1 131 0
	fadds	%f9, %f8, %f8
	.loc 1 119 0
	st	%f8, [%fp+1707]
	.loc 1 136 0
	ld	[%fp+1707], %f8
	fstod	%f8, %f8
	std	%f8, [%fp+1327]
	ldx	[%fp+1327], %o1
	sethi	%hi(.LLC24), %g1
	or	%g1, %lo(.LLC24), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 138 0
	sethi	%hi(.LLC25), %g1
	or	%g1, %lo(.LLC25), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 139 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL4
	 nop
.LL5:
	.loc 1 140 0 discriminator 3
	add	%fp, 1707, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 139 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL4:
	.loc 1 139 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 3
	bleu	%xcc, .LL5
	 nop
	.loc 1 142 0 is_stmt 1
	sethi	%hi(.LLC27), %g1
	or	%g1, %lo(.LLC27), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 190 0
	ldd	[%fp+1879], %f10
	ldd	[%fp+1847], %f8
	fmuld	%f10, %f8, %f10
	.loc 1 194 0
	ldd	[%fp+1887], %f12
	ldd	[%fp+1855], %f8
	fmuld	%f12, %f8, %f8
	.loc 1 192 0
	faddd	%f10, %f8, %f10
	.loc 1 198 0
	ldd	[%fp+1895], %f12
	ldd	[%fp+1863], %f8
	fmuld	%f12, %f8, %f8
	.loc 1 196 0
	faddd	%f10, %f8, %f10
	.loc 1 202 0
	ldd	[%fp+1903], %f12
	ldd	[%fp+1871], %f8
	fmuld	%f12, %f8, %f8
	.loc 1 200 0
	faddd	%f10, %f8, %f8
	.loc 1 188 0
	std	%f8, [%fp+1695]
	.loc 1 204 0
	ldd	[%fp+1695], %f8
	std	%f8, [%fp+1327]
	ldx	[%fp+1327], %o1
	sethi	%hi(.LLC28), %g1
	or	%g1, %lo(.LLC28), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 205 0
	sethi	%hi(.LLC29), %g1
	or	%g1, %lo(.LLC29), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 206 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL6
	 nop
.LL7:
	.loc 1 207 0 discriminator 3
	add	%fp, 1695, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 206 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL6:
	.loc 1 206 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 7
	bleu	%xcc, .LL7
	 nop
	.loc 1 209 0 is_stmt 1
	sethi	%hi(.LLC27), %g1
	or	%g1, %lo(.LLC27), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 222 0
	ldx	[%fp+1775], %i4
	ldx	[%fp+1783], %i5
	ldx	[%fp+1711], %g4
	ldx	[%fp+1719], %g5
	stx	%i4, [%fp+1647]
	stx	%i5, [%fp+1655]
	stx	%g4, [%fp+1631]
	stx	%g5, [%fp+1639]
	add	%fp, 1663, %g1
	add	%fp, 1647, %g4
	add	%fp, 1631, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_mul, 0
	 nop
.LLVL0:
	ldx	[%fp+1663], %i4
	ldx	[%fp+1671], %i5
	.loc 1 226 0
	ldx	[%fp+1791], %i2
	ldx	[%fp+1799], %i3
	ldx	[%fp+1727], %g4
	ldx	[%fp+1735], %g5
	stx	%i2, [%fp+1599]
	stx	%i3, [%fp+1607]
	stx	%g4, [%fp+1583]
	stx	%g5, [%fp+1591]
	add	%fp, 1615, %g1
	add	%fp, 1599, %g4
	add	%fp, 1583, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_mul, 0
	 nop
.LLVL1:
	ldx	[%fp+1615], %g4
	ldx	[%fp+1623], %g5
	.loc 1 224 0
	stx	%i4, [%fp+1551]
	stx	%i5, [%fp+1559]
	stx	%g4, [%fp+1535]
	stx	%g5, [%fp+1543]
	add	%fp, 1567, %g1
	add	%fp, 1551, %g4
	add	%fp, 1535, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_add, 0
	 nop
.LLVL2:
	ldx	[%fp+1567], %i4
	ldx	[%fp+1575], %i5
	.loc 1 230 0
	ldx	[%fp+1807], %i2
	ldx	[%fp+1815], %i3
	ldx	[%fp+1743], %g4
	ldx	[%fp+1751], %g5
	stx	%i2, [%fp+1503]
	stx	%i3, [%fp+1511]
	stx	%g4, [%fp+1487]
	stx	%g5, [%fp+1495]
	add	%fp, 1519, %g1
	add	%fp, 1503, %g4
	add	%fp, 1487, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_mul, 0
	 nop
.LLVL3:
	ldx	[%fp+1519], %g4
	ldx	[%fp+1527], %g5
	.loc 1 228 0
	stx	%i4, [%fp+1455]
	stx	%i5, [%fp+1463]
	stx	%g4, [%fp+1439]
	stx	%g5, [%fp+1447]
	add	%fp, 1471, %g1
	add	%fp, 1455, %g4
	add	%fp, 1439, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_add, 0
	 nop
.LLVL4:
	ldx	[%fp+1471], %i4
	ldx	[%fp+1479], %i5
	.loc 1 234 0
	ldx	[%fp+1823], %i2
	ldx	[%fp+1831], %i3
	ldx	[%fp+1759], %g4
	ldx	[%fp+1767], %g5
	stx	%i2, [%fp+1407]
	stx	%i3, [%fp+1415]
	stx	%g4, [%fp+1391]
	stx	%g5, [%fp+1399]
	add	%fp, 1423, %g1
	add	%fp, 1407, %g4
	add	%fp, 1391, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_mul, 0
	 nop
.LLVL5:
	ldx	[%fp+1423], %g4
	ldx	[%fp+1431], %g5
	.loc 1 232 0
	stx	%i4, [%fp+1359]
	stx	%i5, [%fp+1367]
	stx	%g4, [%fp+1343]
	stx	%g5, [%fp+1351]
	add	%fp, 1375, %g1
	add	%fp, 1359, %g4
	add	%fp, 1343, %g5
	mov	%g5, %o2
	mov	%g4, %o1
	mov	%g1, %o0
	call	_Qp_add, 0
	 nop
.LLVL6:
	ldx	[%fp+1375], %g4
	ldx	[%fp+1383], %g5
	.loc 1 220 0
	stx	%g4, [%fp+1679]
	stx	%g5, [%fp+1687]
	.loc 1 236 0
	ldx	[%fp+1679], %g4
	ldx	[%fp+1687], %g5
	mov	%g4, %o2
	mov	%g5, %o3
	sethi	%hi(.LLC30), %g1
	or	%g1, %lo(.LLC30), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 237 0
	sethi	%hi(.LLC31), %g1
	or	%g1, %lo(.LLC31), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 238 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL8
	 nop
.LL9:
	.loc 1 239 0 discriminator 3
	add	%fp, 1679, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 238 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL8:
	.loc 1 238 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 15
	bleu	%xcc, .LL9
	 nop
	.loc 1 241 0 is_stmt 1
	sethi	%hi(.LLC32), %g1
	or	%g1, %lo(.LLC32), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 243 0
	sethi	%hi(.LLC33), %g1
	or	%g1, %lo(.LLC33), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 266 0
	ld	[%fp+1939], %f8
	st	%f8, [%fp+1327]
	ld	[%fp+1923], %f9
	st	%f9, [%fp+1311]
	ld	[%fp+1935], %f10
	st	%f10, [%fp+1295]
	ld	[%fp+1919], %f11
	st	%f11, [%fp+1279]
	ld	[%fp+1931], %f12
	st	%f12, [%fp+1263]
	ld	[%fp+1915], %f13
	st	%f13, [%fp+1247]
	ld	[%fp+1927], %f8
	ld	[%fp+1911], %f9
	sethi	%hi(.LLC34), %g1
	or	%g1, %lo(.LLC34), %g1
	ldx	[%l7 + %g1], %g1
	ld	[%g1], %f10
	fmovs	%f10, %f5
	fmovs	%f9, %f3
	fmovs	%f8, %f1
	call	fmaf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f8, %f5
	ld	[%fp+1247], %f3
	ld	[%fp+1263], %f1
	call	fmaf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f8, %f5
	ld	[%fp+1279], %f3
	ld	[%fp+1295], %f1
	call	fmaf, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f8, %f5
	ld	[%fp+1311], %f3
	ld	[%fp+1327], %f1
	call	fmaf, 0
	 nop
	fmovs	%f0, %f8
	st	%f8, [%fp+1707]
	.loc 1 268 0
	ld	[%fp+1707], %f8
	fstod	%f8, %f8
	std	%f8, [%fp+1327]
	ldx	[%fp+1327], %o1
	sethi	%hi(.LLC35), %g1
	or	%g1, %lo(.LLC35), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 270 0
	sethi	%hi(.LLC25), %g1
	or	%g1, %lo(.LLC25), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 271 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL10
	 nop
.LL11:
	.loc 1 272 0 discriminator 3
	add	%fp, 1707, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 271 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL10:
	.loc 1 271 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 3
	bleu	%xcc, .LL11
	 nop
	.loc 1 274 0 is_stmt 1
	sethi	%hi(.LLC27), %g1
	or	%g1, %lo(.LLC27), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 278 0
	ldd	[%fp+1903], %f8
	std	%f8, [%fp+1327]
	ldd	[%fp+1871], %f10
	std	%f10, [%fp+1311]
	ldd	[%fp+1895], %f12
	std	%f12, [%fp+1295]
	ldd	[%fp+1863], %f14
	std	%f14, [%fp+1279]
	ldd	[%fp+1887], %f16
	std	%f16, [%fp+1263]
	ldd	[%fp+1855], %f18
	std	%f18, [%fp+1247]
	ldd	[%fp+1879], %f8
	ldd	[%fp+1847], %f10
	sethi	%hi(.LLC36), %g1
	or	%g1, %lo(.LLC36), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f12
	fmovd	%f12, %f4
	fmovd	%f10, %f2
	fmovd	%f8, %f0
	call	fma, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f8, %f4
	ldd	[%fp+1247], %f2
	ldd	[%fp+1263], %f0
	call	fma, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f8, %f4
	ldd	[%fp+1279], %f2
	ldd	[%fp+1295], %f0
	call	fma, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f8, %f4
	ldd	[%fp+1311], %f2
	ldd	[%fp+1327], %f0
	call	fma, 0
	 nop
	fmovd	%f0, %f8
	std	%f8, [%fp+1695]
	.loc 1 280 0
	ldd	[%fp+1695], %f8
	std	%f8, [%fp+1327]
	ldx	[%fp+1327], %o1
	sethi	%hi(.LLC37), %g1
	or	%g1, %lo(.LLC37), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 281 0
	sethi	%hi(.LLC29), %g1
	or	%g1, %lo(.LLC29), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 282 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL12
	 nop
.LL13:
	.loc 1 283 0 discriminator 3
	add	%fp, 1695, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 282 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL12:
	.loc 1 282 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 7
	bleu	%xcc, .LL13
	 nop
	.loc 1 285 0 is_stmt 1
	sethi	%hi(.LLC27), %g1
	or	%g1, %lo(.LLC27), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 289 0
	ldx	[%fp+1823], %g4
	ldx	[%fp+1831], %g5
	stx	%g4, [%fp+1327]
	stx	%g5, [%fp+1335]
	ldx	[%fp+1759], %g4
	ldx	[%fp+1767], %g5
	stx	%g4, [%fp+1311]
	stx	%g5, [%fp+1319]
	ldx	[%fp+1807], %g4
	ldx	[%fp+1815], %g5
	stx	%g4, [%fp+1295]
	stx	%g5, [%fp+1303]
	ldx	[%fp+1743], %g4
	ldx	[%fp+1751], %g5
	stx	%g4, [%fp+1279]
	stx	%g5, [%fp+1287]
	ldx	[%fp+1791], %g4
	ldx	[%fp+1799], %g5
	stx	%g4, [%fp+1263]
	stx	%g5, [%fp+1271]
	ldx	[%fp+1727], %g4
	ldx	[%fp+1735], %g5
	stx	%g4, [%fp+1247]
	stx	%g5, [%fp+1255]
	ldd	[%fp+1775], %f12
	ldd	[%fp+1783], %f14
	ldd	[%fp+1711], %f16
	ldd	[%fp+1719], %f18
	sethi	%hi(.LLC38), %g1
	or	%g1, %lo(.LLC38), %g1
	ldx	[%l7 + %g1], %g1
	ldd	[%g1], %f8
	ldd	[%g1+8], %f10
	fmovd	%f16, %f4
	fmovd	%f18, %f6
	fmovd	%f12, %f0
	fmovd	%f14, %f2
	call	fmal, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	ldd	[%fp+1247], %f4
	ldd	[%fp+1255], %f6
	ldd	[%fp+1263], %f0
	ldd	[%fp+1271], %f2
	call	fmal, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	ldd	[%fp+1279], %f4
	ldd	[%fp+1287], %f6
	ldd	[%fp+1295], %f0
	ldd	[%fp+1303], %f2
	call	fmal, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	ldd	[%fp+1311], %f4
	ldd	[%fp+1319], %f6
	ldd	[%fp+1327], %f0
	ldd	[%fp+1335], %f2
	call	fmal, 0
	 nop
	fmovd	%f0, %f8
	fmovd	%f2, %f10
	std	%f8, [%fp+1679]
	std	%f10, [%fp+1687]
	.loc 1 291 0
	ldx	[%fp+1679], %g4
	ldx	[%fp+1687], %g5
	mov	%g4, %o2
	mov	%g5, %o3
	sethi	%hi(.LLC39), %g1
	or	%g1, %lo(.LLC39), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 292 0
	sethi	%hi(.LLC31), %g1
	or	%g1, %lo(.LLC31), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 293 0
	stx	%g0, [%fp+2039]
	ba,pt	%xcc, .LL14
	 nop
.LL15:
	.loc 1 294 0 discriminator 3
	add	%fp, 1679, %g4
	ldx	[%fp+2039], %g1
	add	%g4, %g1, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	sra	%g1, 0, %g1
	mov	%g1, %o1
	sethi	%hi(.LLC26), %g1
	or	%g1, %lo(.LLC26), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 293 0 discriminator 3
	ldx	[%fp+2039], %g1
	add	%g1, 1, %g1
	stx	%g1, [%fp+2039]
.LL14:
	.loc 1 293 0 is_stmt 0 discriminator 1
	ldx	[%fp+2039], %g1
	cmp	%g1, 15
	bleu	%xcc, .LL15
	 nop
	.loc 1 296 0 is_stmt 1
	sethi	%hi(.LLC40), %g1
	or	%g1, %lo(.LLC40), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 298 0
	sethi	%hi(.LLC41), %g1
	or	%g1, %lo(.LLC41), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 302 0
	sethi	%hi(.LLC42), %g1
	or	%g1, %lo(.LLC42), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 303 0
	sethi	%hi(.LLC43), %g1
	or	%g1, %lo(.LLC43), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 304 0
	sethi	%hi(.LLC44), %g1
	or	%g1, %lo(.LLC44), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 305 0
	sethi	%hi(.LLC45), %g1
	or	%g1, %lo(.LLC45), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 306 0
	sethi	%hi(.LLC46), %g1
	or	%g1, %lo(.LLC46), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 308 0
	sethi	%hi(.LLC47), %g1
	or	%g1, %lo(.LLC47), %g1
	ldx	[%l7 + %g1], %g1
	mov	%g1, %o0
	call	printf, 0
	 nop
	.loc 1 310 0
	mov	42, %g1
	sra	%g1, 0, %g1
	.loc 1 312 0
	mov	%g1, %i0
	return	%i7+8
	 nop
	.cfi_endproc
.LLFE3:
	.size	main, .-main
	.align 4
	.type	endian, #function
	.proc	04
endian:
.LLFB4:
	.loc 1 315 0
	.cfi_startproc
	save	%sp, -192, %sp
	.cfi_window_save
	.cfi_register 15, 31
	.cfi_def_cfa_register 30
	.loc 1 316 0
	mov	1, %g1
	st	%g1, [%fp+2043]
	.loc 1 317 0
	add	%fp, 2043, %g1
	ldub	[%g1], %g1
	and	%g1, 0xff, %g1
	xor	%g1, 1, %g1
	cmp	%g0, %g1
	addx	%g0, 0, %g1
	and	%g1, 0xff, %g1
	st	%g1, [%fp+2043]
	.loc 1 318 0
	ld	[%fp+2043], %g1
	sra	%g1, 0, %g1
	.loc 1 319 0
	mov	%g1, %i0
	return	%i7+8
	 nop
	.cfi_endproc
.LLFE4:
	.size	endian, .-endian
.LLetext0:
	.file 2 "/usr/include/sys/common_int_types.h"
	.file 3 "/usr/include/sys/ansi.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/stdint.h"
	.file 6 "/usr/include/math.h"
	.section	.debug_info,"",@progbits
.LLdebug_info0:
	.uaword	0x428
	.uahalf	0x4
	.uaword	.LLdebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.uaword	.LLASF47
	.byte	0xc
	.uaword	.LLASF48
	.uaword	.LLASF49
	.uaxword	.LLtext0
	.uaxword	.LLetext0-.LLtext0
	.uaword	.LLdebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LLASF0
	.uleb128 0x3
	.uaword	.LLASF5
	.byte	0x2
	.byte	0x2e
	.uaword	0x3f
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.uaword	.LLASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.uaword	.LLASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.uaword	.LLASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.asciz	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.uaword	.LLASF4
	.uleb128 0x3
	.uaword	.LLASF6
	.byte	0x2
	.byte	0x33
	.uaword	0x6d
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.uaword	.LLASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.uaword	.LLASF8
	.uleb128 0x5
	.byte	0x8
	.uaword	0x81
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.uaword	.LLASF9
	.uleb128 0x3
	.uaword	.LLASF10
	.byte	0x3
	.byte	0x2a
	.uaword	0x62
	.uleb128 0x3
	.uaword	.LLASF11
	.byte	0x4
	.byte	0x2d
	.uaword	0x74
	.uleb128 0x3
	.uaword	.LLASF12
	.byte	0x4
	.byte	0x31
	.uaword	0x6d
	.uleb128 0x6
	.uaword	.LLASF15
	.byte	0x10
	.byte	0x4
	.byte	0x51
	.uaword	0xce
	.uleb128 0x7
	.uaword	.LLASF13
	.byte	0x4
	.byte	0x52
	.uaword	0xce
	.byte	0
	.uleb128 0x7
	.uaword	.LLASF14
	.byte	0x4
	.byte	0x53
	.uaword	0x54
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x3f
	.uleb128 0x6
	.uaword	.LLASF16
	.byte	0x98
	.byte	0x4
	.byte	0x70
	.uaword	0x1da
	.uleb128 0x8
	.asciz	"_p"
	.byte	0x4
	.byte	0x71
	.uaword	0xce
	.byte	0
	.uleb128 0x8
	.asciz	"_r"
	.byte	0x4
	.byte	0x72
	.uaword	0x54
	.byte	0x8
	.uleb128 0x8
	.asciz	"_w"
	.byte	0x4
	.byte	0x73
	.uaword	0x54
	.byte	0xc
	.uleb128 0x7
	.uaword	.LLASF17
	.byte	0x4
	.byte	0x74
	.uaword	0x4d
	.byte	0x10
	.uleb128 0x7
	.uaword	.LLASF18
	.byte	0x4
	.byte	0x75
	.uaword	0x46
	.byte	0x12
	.uleb128 0x8
	.asciz	"_bf"
	.byte	0x4
	.byte	0x76
	.uaword	0xa9
	.byte	0x18
	.uleb128 0x7
	.uaword	.LLASF19
	.byte	0x4
	.byte	0x77
	.uaword	0x54
	.byte	0x28
	.uleb128 0x7
	.uaword	.LLASF20
	.byte	0x4
	.byte	0x7a
	.uaword	0x1da
	.byte	0x30
	.uleb128 0x7
	.uaword	.LLASF21
	.byte	0x4
	.byte	0x7b
	.uaword	0x1eb
	.byte	0x38
	.uleb128 0x7
	.uaword	.LLASF22
	.byte	0x4
	.byte	0x7c
	.uaword	0x20a
	.byte	0x40
	.uleb128 0x7
	.uaword	.LLASF23
	.byte	0x4
	.byte	0x7d
	.uaword	0x229
	.byte	0x48
	.uleb128 0x7
	.uaword	.LLASF24
	.byte	0x4
	.byte	0x7e
	.uaword	0x24f
	.byte	0x50
	.uleb128 0x7
	.uaword	.LLASF25
	.byte	0x4
	.byte	0x81
	.uaword	0xa9
	.byte	0x58
	.uleb128 0x8
	.asciz	"_up"
	.byte	0x4
	.byte	0x84
	.uaword	0xce
	.byte	0x68
	.uleb128 0x8
	.asciz	"_ur"
	.byte	0x4
	.byte	0x85
	.uaword	0x54
	.byte	0x70
	.uleb128 0x7
	.uaword	.LLASF26
	.byte	0x4
	.byte	0x88
	.uaword	0x255
	.byte	0x74
	.uleb128 0x7
	.uaword	.LLASF27
	.byte	0x4
	.byte	0x89
	.uaword	0x265
	.byte	0x77
	.uleb128 0x7
	.uaword	.LLASF28
	.byte	0x4
	.byte	0x8b
	.uaword	0x1eb
	.byte	0x78
	.uleb128 0x7
	.uaword	.LLASF29
	.byte	0x4
	.byte	0x8d
	.uaword	0x275
	.byte	0x80
	.uleb128 0x7
	.uaword	.LLASF30
	.byte	0x4
	.byte	0x90
	.uaword	0x54
	.byte	0x88
	.uleb128 0x7
	.uaword	.LLASF31
	.byte	0x4
	.byte	0x91
	.uaword	0x88
	.byte	0x90
	.byte	0
	.uleb128 0x9
	.byte	0x8
	.uleb128 0xa
	.uaword	0x54
	.uaword	0x1eb
	.uleb128 0xb
	.uaword	0x1da
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x1dc
	.uleb128 0xa
	.uaword	0x9e
	.uaword	0x20a
	.uleb128 0xb
	.uaword	0x1da
	.uleb128 0xb
	.uaword	0x1da
	.uleb128 0xb
	.uaword	0x93
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x1f1
	.uleb128 0xa
	.uaword	0x88
	.uaword	0x229
	.uleb128 0xb
	.uaword	0x1da
	.uleb128 0xb
	.uaword	0x88
	.uleb128 0xb
	.uaword	0x54
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x210
	.uleb128 0xa
	.uaword	0x9e
	.uaword	0x248
	.uleb128 0xb
	.uaword	0x1da
	.uleb128 0xb
	.uaword	0x248
	.uleb128 0xb
	.uaword	0x93
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x24e
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x8
	.uaword	0x22f
	.uleb128 0xd
	.uaword	0x3f
	.uaword	0x265
	.uleb128 0xe
	.uaword	0x74
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.uaword	0x3f
	.uaword	0x275
	.uleb128 0xe
	.uaword	0x74
	.byte	0
	.byte	0
	.uleb128 0xd
	.uaword	0x81
	.uaword	0x285
	.uleb128 0xe
	.uaword	0x74
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.uaword	.LLASF32
	.byte	0x4
	.byte	0x92
	.uaword	0xd4
	.uleb128 0xd
	.uaword	0x285
	.uaword	0x2a0
	.uleb128 0xe
	.uaword	0x74
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.uaword	.LLASF37
	.byte	0x4
	.byte	0x95
	.uaword	0x290
	.uleb128 0x3
	.uaword	.LLASF33
	.byte	0x5
	.byte	0x2c
	.uaword	0x34
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.uaword	.LLASF34
	.uleb128 0x10
	.uaword	0x2b6
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.uaword	.LLASF35
	.uleb128 0x10
	.uaword	0x2c2
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.uaword	.LLASF36
	.uleb128 0x10
	.uaword	0x2ce
	.uleb128 0xf
	.uaword	.LLASF38
	.byte	0x6
	.byte	0xaa
	.uaword	0x54
	.uleb128 0x11
	.uaword	.LLASF50
	.byte	0x1
	.uahalf	0x13a
	.uaword	0x54
	.uaxword	.LLFB4
	.uaxword	.LLFE4-.LLFB4
	.uleb128 0x1
	.byte	0x9c
	.uaword	0x317
	.uleb128 0x12
	.uaword	.LLASF41
	.byte	0x1
	.uahalf	0x13c
	.uaword	0x54
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x13
	.uaword	.LLASF51
	.byte	0x1
	.byte	0x2a
	.uaword	0x54
	.uaxword	.LLFB3
	.uaxword	.LLFE3-.LLFB3
	.uleb128 0x1
	.byte	0x9c
	.uaword	0x3e6
	.uleb128 0x14
	.uaword	.LLASF39
	.byte	0x1
	.byte	0x2a
	.uaword	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 128
	.uleb128 0x14
	.uaword	.LLASF40
	.byte	0x1
	.byte	0x2a
	.uaword	0x3e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 136
	.uleb128 0x15
	.asciz	"a"
	.byte	0x1
	.byte	0x52
	.uaword	0x3fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x15
	.asciz	"b"
	.byte	0x1
	.byte	0x53
	.uaword	0x3fc
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x15
	.asciz	"a64"
	.byte	0x1
	.byte	0x56
	.uaword	0x411
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x15
	.asciz	"b64"
	.byte	0x1
	.byte	0x57
	.uaword	0x411
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x16
	.uaword	.LLASF42
	.byte	0x1
	.byte	0x5f
	.uaword	0x426
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x16
	.uaword	.LLASF43
	.byte	0x1
	.byte	0x60
	.uaword	0x426
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0x16
	.uaword	.LLASF44
	.byte	0x1
	.byte	0x63
	.uaword	0x2bd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -340
	.uleb128 0x16
	.uaword	.LLASF45
	.byte	0x1
	.byte	0x64
	.uaword	0x2c9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x16
	.uaword	.LLASF46
	.byte	0x1
	.byte	0x65
	.uaword	0x2d5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -368
	.uleb128 0x15
	.asciz	"j"
	.byte	0x1
	.byte	0x67
	.uaword	0x93
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.uaword	0x7b
	.uleb128 0xd
	.uaword	0x2bd
	.uaword	0x3fc
	.uleb128 0xe
	.uaword	0x74
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.uaword	0x3ec
	.uleb128 0xd
	.uaword	0x2c9
	.uaword	0x411
	.uleb128 0xe
	.uaword	0x74
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.uaword	0x401
	.uleb128 0xd
	.uaword	0x2d5
	.uaword	0x426
	.uleb128 0xe
	.uaword	0x74
	.byte	0x3
	.byte	0
	.uleb128 0x10
	.uaword	0x416
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
.LLASF28:
	.asciz	"_flush"
.LLASF15:
	.asciz	"__sbuf"
.LLASF2:
	.asciz	"short int"
.LLASF11:
	.asciz	"size_t"
.LLASF45:
	.asciz	"dotme_fp64"
.LLASF31:
	.asciz	"_offset"
.LLASF17:
	.asciz	"_flags"
.LLASF24:
	.asciz	"_write"
.LLASF12:
	.asciz	"ssize_t"
.LLASF38:
	.asciz	"signgam"
.LLASF27:
	.asciz	"_nbuf"
.LLASF33:
	.asciz	"uint8_t"
.LLASF37:
	.asciz	"__sF"
.LLASF50:
	.asciz	"endian"
.LLASF34:
	.asciz	"float"
.LLASF7:
	.asciz	"long int"
.LLASF6:
	.asciz	"__int64_t"
.LLASF25:
	.asciz	"_ext"
.LLASF30:
	.asciz	"_blksize"
.LLASF5:
	.asciz	"__uint8_t"
.LLASF21:
	.asciz	"_close"
.LLASF40:
	.asciz	"argv"
.LLASF36:
	.asciz	"long double"
.LLASF1:
	.asciz	"unsigned char"
.LLASF22:
	.asciz	"_read"
.LLASF39:
	.asciz	"argc"
.LLASF0:
	.asciz	"signed char"
.LLASF46:
	.asciz	"dotme_fp128"
.LLASF4:
	.asciz	"unsigned int"
.LLASF48:
	.asciz	"fmad.c"
.LLASF3:
	.asciz	"short unsigned int"
.LLASF20:
	.asciz	"_cookie"
.LLASF13:
	.asciz	"_base"
.LLASF19:
	.asciz	"_lbfsize"
.LLASF9:
	.asciz	"char"
.LLASF51:
	.asciz	"main"
.LLASF42:
	.asciz	"a128"
.LLASF41:
	.asciz	"eflag"
.LLASF8:
	.asciz	"long unsigned int"
.LLASF35:
	.asciz	"double"
.LLASF10:
	.asciz	"__off_t"
.LLASF29:
	.asciz	"_lb_unused"
.LLASF23:
	.asciz	"_seek"
.LLASF18:
	.asciz	"_file"
.LLASF44:
	.asciz	"dotme_fp32"
.LLASF49:
	.asciz	"/home/dclarke/pgm/bw/floating_point"
.LLASF32:
	.asciz	"FILE"
.LLASF43:
	.asciz	"b128"
.LLASF47:
	.asciz	"GNU C99 7.5.0 -m64 -mhard-float -mno-app-regs -mcpu=ultrasparc -mtune=ultrasparc -mno-vis -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-fast-math -fPIC"
.LLASF26:
	.asciz	"_ubuf"
.LLASF14:
	.asciz	"_size"
.LLASF16:
	.asciz	"__sFILE"
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
