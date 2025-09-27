	.file	"fmad.c"
	.section	".text"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LLC18:
	.asciz	"\n\nINFO : this machine is a "
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
	.asciz	"--------------- Maybe no FMA Calls ---------------\n"
	.align 8
.LLC23:
	.asciz	"No FMA  fp32  = %-+24.18e\n"
	.align 8
.LLC24:
	.asciz	"\nThe 32-bit float dotme_fp32 : "
	.align 8
.LLC25:
	.asciz	"\n"
	.align 8
.LLC26:
	.asciz	"\n\nCast the 32-bit FP data into 64-bit FP\n"
	.align 8
.LLC27:
	.asciz	"\n---------- cast to FP64  ------------"
	.align 8
.LLC28:
	.asciz	" dotme_fp32 casted to (double)dotme_fp64\ndotme_fp64  is \n"
	.align 8
.LLC29:
	.asciz	"\n-------------------------------------"
	.align 8
.LLC30:
	.asciz	"\n        fp64  = %-+30.24e\n"
	.align 8
.LLC31:
	.asciz	" dotme_fp64  is "
	.global _Qp_mul
	.global _Qp_mul
	.global _Qp_add
	.global _Qp_mul
	.global _Qp_add
	.global _Qp_mul
	.global _Qp_add
	.align 8
.LLC32:
	.asciz	"\n        fp128 = %-+46.38Le\n"
	.align 8
.LLC33:
	.asciz	" dotme_fp128 is "
	.align 8
.LLC34:
	.asciz	"\n\n\n"
	.align 8
.LLC35:
	.asciz	"-------------------- FMA Calls -------------------\n"
	.align 8
.LLC36:
	.asciz	"\n  fmaf fp32   = %-+30.24e\n"
	.align 8
.LLC37:
	.asciz	"  fma  fp64   = %-+30.24e\n"
	.align 8
.LLC38:
	.asciz	"\n  fmal fp128  = %-+46.38Le\n"
	.align 8
.LLC39:
	.asciz	"\n\n"
	.align 8
.LLC40:
	.asciz	"--------------------------------------------------\n"
	.align 8
.LLC41:
	.asciz	"\n\nCorrect result is +5.595788259858e-02"
	.align 8
.LLC42:
	.asciz	"or this    0x3faca682f76db9b9 from ARMv8"
	.align 8
.LLC43:
	.asciz	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+"
	.align 8
.LLC44:
	.asciz	"Same thing on Intel Core i5-7300U K8-class CPU"
	.align 8
.LLC45:
	.asciz	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a"
	.align 8
.LLC46:
	.asciz	"\nNOTE : IBM Power systems may report strange fp128 hex values"
	.section	".rodata"
	.align 16
.LLC0:
	.long	1073735768
	.long	-290545948
	.long	1547012860
	.long	1206164256
	.long	-1073835383
	.long	688459205
	.long	-1151298626
	.long	-1908037503
	.long	1073685942
	.long	746018639
	.long	1915624133
	.long	2116285006
	.long	1073671097
	.long	-1825299254
	.long	-1163668132
	.long	-1102645236
	.align 16
.LLC1:
	.long	-1073815815
	.long	-618475291
	.long	1614907703
	.long	1271310320
	.long	-1073847795
	.long	-1273124514
	.long	851131951
	.long	263717864
	.long	1073723766
	.long	-575869216
	.long	-204784041
	.long	1403251715
	.long	-1073845404
	.long	-1150583943
	.long	488787894
	.long	548986156
	.section	.text.startup,"ax",@progbits
	.align 4
	.align 64
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -960, %sp
	sethi	%hi(1072966775), %g1
	sethi	%hi(1073644544), %g4
	or	%g1, %lo(1072966775), %g1
	or	%g4, 398, %g4
	st	%g1, [%fp+1759]
	sethi	%hi(3209249941), %g1
	or	%g1, %lo(3209249941), %g1
	sethi	%hi(3941198848), %g5
	st	%g1, [%fp+1763]
	sethi	%hi(1066588950), %g1
	or	%g1, %lo(1066588950), %g1
	or	%g5, 582, %g5
	st	%g1, [%fp+1767]
	sethi	%hi(1064688842), %g1
	or	%g1, %lo(1064688842), %g1
	sllx	%g4, 32, %g4
	st	%g1, [%fp+1771]
	sethi	%hi(3211754734), %g1
	or	%g1, %lo(3211754734), %g1
	add	%g4, %g5, %g4
	st	%g1, [%fp+1775]
	sethi	%hi(3207661274), %g1
	or	%g1, %lo(3207661274), %g1
	sethi	%h44(.LLC0), %o1
	st	%g1, [%fp+1779]
	sethi	%hi(1071430511), %g1
	or	%g1, %lo(1071430511), %g1
	or	%o1, %m44(.LLC0), %o1
	st	%g1, [%fp+1783]
	sethi	%hi(3207967326), %g1
	or	%g1, %lo(3207967326), %g1
	sllx	%o1, 12, %o1
	st	%g1, [%fp+1787]
	mov	64, %o2
	ldx	[%fp+1759], %g1
	or	%o1, %l44(.LLC0), %o1
	ldx	[%fp+1767], %i5
	add	%fp, 1919, %o0
	ldx	[%fp+1783], %g5
	stx	%g1, [%fp+1727]
	sethi	%hi(3219728384), %g1
	stx	%i5, [%fp+1735]
	or	%g1, 146, %g1
	ldx	[%fp+1775], %i5
	sllx	%g1, 32, %g1
	stx	%i5, [%fp+1743]
	sethi	%hi(2425412608), %i5
	stx	%g5, [%fp+1751]
	or	%i5, 92, %i5
	sethi	%hi(1072846848), %g5
	add	%g1, %i5, %g1
	or	%g5, 866, %g5
	sethi	%hi(3346363392), %i5
	stx	%g4, [%fp+1791]
	or	%i5, 247, %i5
	sllx	%g5, 32, %g5
	sethi	%hi(1072609280), %g4
	add	%g5, %i5, %g5
	or	%g4, 921, %g4
	sethi	%hi(859982848), %i5
	sllx	%g4, 32, %g4
	stx	%g1, [%fp+1799]
	or	%i5, 172, %i5
	sethi	%hi(3220040704), %g1
	add	%g4, %i5, %g4
	or	%g1, 925, %g1
	sethi	%hi(2989296640), %i5
	stx	%g5, [%fp+1807]
	or	%i5, 598, %i5
	sllx	%g1, 32, %g1
	sethi	%hi(3219529728), %g5
	add	%g1, %i5, %g1
	or	%g5, 219, %g5
	sethi	%hi(1104843776), %i5
	sllx	%g5, 32, %g5
	stx	%g4, [%fp+1815]
	or	%i5, 483, %i5
	sethi	%hi(1073452032), %g4
	add	%g5, %i5, %g5
	or	%g4, 877, %g4
	sethi	%hi(3670993920), %i5
	stx	%g1, [%fp+1823]
	sllx	%g4, 32, %g4
	or	%i5, 527, %i5
	sethi	%hi(3219567616), %g1
	stx	%g5, [%fp+1831]
	add	%g4, %i5, %g4
	stx	%g4, [%fp+1839]
	sethi	%hi(1073644544), %g4
	or	%g4, 398, %g4
	or	%g1, 587, %g1
	sllx	%g4, 12, %g4
	sethi	%hi(3065492480), %g5
	or	%g4, 3758, %g4
	or	%g5, 914, %g5
	sllx	%g4, 12, %g4
	sllx	%g1, 32, %g1
	or	%g4, 2542, %g4
	add	%g1, %g5, %g1
	stx	%g1, [%fp+1847]
	sllx	%g4, 8, %g4
	or	%g4, 70, %g4
	stx	%g4, [%fp+1855]
	sethi	%hi(3219728384), %g4
	or	%g4, 146, %g4
	sllx	%g4, 12, %g4
	or	%g4, 2313, %g4
	sllx	%g4, 12, %g4
	or	%g4, 220, %g4
	sllx	%g4, 8, %g4
	or	%g4, 92, %g4
	stx	%g4, [%fp+1863]
	sethi	%hi(1072846848), %g4
	or	%g4, 866, %g4
	sllx	%g4, 12, %g4
	or	%g4, 3191, %g4
	sllx	%g4, 12, %g4
	or	%g4, 1396, %g4
	sllx	%g4, 8, %g4
	or	%g4, 247, %g4
	stx	%g4, [%fp+1871]
	sethi	%hi(1072609280), %g4
	or	%g4, 921, %g4
	sllx	%g4, 12, %g4
	or	%g4, 820, %g4
	sllx	%g4, 12, %g4
	or	%g4, 588, %g4
	sllx	%g4, 8, %g4
	or	%g4, 172, %g4
	stx	%g4, [%fp+1879]
	sethi	%hi(3220040704), %g4
	or	%g4, 925, %g4
	sllx	%g4, 12, %g4
	or	%g4, 2850, %g4
	sllx	%g4, 12, %g4
	or	%g4, 3342, %g4
	sllx	%g4, 8, %g4
	or	%g4, 86, %g4
	stx	%g4, [%fp+1887]
	sethi	%hi(3219529728), %g4
	or	%g4, 219, %g4
	sllx	%g4, 12, %g4
	or	%g4, 1053, %g4
	sllx	%g4, 12, %g4
	or	%g4, 2709, %g4
	sllx	%g4, 8, %g4
	or	%g4, 227, %g4
	stx	%g4, [%fp+1895]
	sethi	%hi(1073452032), %g4
	or	%g4, 877, %g4
	sllx	%g4, 12, %g4
	or	%g4, 3500, %g4
	sllx	%g4, 12, %g4
	or	%g4, 3822, %g4
	sllx	%g4, 8, %g4
	or	%g4, 15, %g4
	stx	%g4, [%fp+1903]
	sethi	%hi(3219567616), %g4
	or	%g4, 587, %g4
	sllx	%g4, 12, %g4
	or	%g4, 2923, %g4
	sllx	%g4, 12, %g4
	or	%g4, 1975, %g4
	sllx	%g4, 8, %g4
	or	%g4, 146, %g4
	call	memcpy, 0
	 stx	%g4, [%fp+1911]
	sethi	%h44(.LLC1), %o1
	mov	64, %o2
	or	%o1, %m44(.LLC1), %o1
	add	%fp, 1983, %o0
	sllx	%o1, 12, %o1
	call	memcpy, 0
	 or	%o1, %l44(.LLC1), %o1
	call	sysinfo, 0
	 mov	1, %o0
	sethi	%h44(.LLC18), %o0
	or	%o0, %m44(.LLC18), %o0
	sllx	%o0, 12, %o0
	call	printf, 0
	 or	%o0, %l44(.LLC18), %o0
	call	endian, 0
	 nop
	cwbe	%o0, 2, .LL5
	sethi	%h44(.LLC20), %o0
	or	%o0, %m44(.LLC20), %o0
	sllx	%o0, 12, %o0
	call	printf, 0
	 or	%o0, %l44(.LLC20), %o0
.LL3:
	sethi	%h44(.LLC21), %o0
	sethi	%h44(.LLC25), %i5
	or	%o0, %m44(.LLC21), %o0
	or	%i5, %m44(.LLC25), %i5
	sllx	%o0, 12, %o0
	sllx	%i5, 12, %i5
	or	%o0, %l44(.LLC21), %o0
	call	puts, 0
	 sethi	%h44(.LLC31), %i4
	or	%i4, %m44(.LLC31), %i4
	sethi	%h44(.LLC22), %o0
	sllx	%i4, 12, %i4
	or	%o0, %m44(.LLC22), %o0
	mov	42, %i0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC22), %o0
	ld	[%fp+1727], %f8
	sethi	%h44(.LLC23), %o0
	ld	[%fp+1743], %f9
	or	%o0, %m44(.LLC23), %o0
	ld	[%fp+1731], %f11
	sllx	%o0, 12, %o0
	ld	[%fp+1747], %f14
	or	%o0, %l44(.LLC23), %o0
	ld	[%fp+1735], %f10
	ld	[%fp+1751], %f13
	fmuls	%f8, %f9, %f8
	ld	[%fp+1739], %f9
	ld	[%fp+1755], %f12
	fmuls	%f11, %f14, %f11
	fmuls	%f10, %f13, %f10
	fmuls	%f9, %f12, %f9
	fadds	%f8, %f11, %f8
	fadds	%f8, %f10, %f8
	fadds	%f8, %f9, %f8
	st	%f8, [%fp+1699]
	ld	[%fp+1699], %f8
	fstod	%f8, %f8
	call	printf, 0
	 movdtox	%f8, %o1
	sethi	%h44(.LLC24), %o0
	or	%o0, %m44(.LLC24), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC24), %o0
	mov	4, %o1
	call	hex_dump, 0
	 add	%fp, 1699, %o0
	call	puts, 0
	 or	%i5, %l44(.LLC25), %o0
	sethi	%h44(.LLC26), %o0
	or	%o0, %m44(.LLC26), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC26), %o0
	ld	[%fp+1699], %f8
	sethi	%h44(.LLC27), %o0
	or	%o0, %m44(.LLC27), %o0
	sllx	%o0, 12, %o0
	or	%o0, %l44(.LLC27), %o0
	fstod	%f8, %f8
	std	%f8, [%fp+1703]
	call	puts, 0
	 nop
	sethi	%h44(.LLC28), %o0
	or	%o0, %m44(.LLC28), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC28), %o0
	mov	8, %o1
	call	hex_dump, 0
	 add	%fp, 1703, %o0
	call	putchar, 0
	 mov	10, %o0
	sethi	%h44(.LLC29), %o0
	or	%o0, %m44(.LLC29), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC29), %o0
	ldd	[%fp+1791], %f8
	sethi	%h44(.LLC30), %o0
	ldd	[%fp+1823], %f10
	or	%o0, %m44(.LLC30), %o0
	ldd	[%fp+1799], %f14
	sllx	%o0, 12, %o0
	ldd	[%fp+1831], %f20
	or	%o0, %l44(.LLC30), %o0
	ldd	[%fp+1807], %f12
	ldd	[%fp+1839], %f18
	fmuld	%f8, %f10, %f8
	ldd	[%fp+1815], %f10
	ldd	[%fp+1847], %f16
	fmuld	%f14, %f20, %f14
	fmuld	%f12, %f18, %f12
	fmuld	%f10, %f16, %f10
	faddd	%f8, %f14, %f8
	faddd	%f8, %f12, %f8
	faddd	%f8, %f10, %f8
	std	%f8, [%fp+1703]
	ldx	[%fp+1703], %o1
	call	printf, 0
	 nop
	call	puts, 0
	 or	%i4, %l44(.LLC31), %o0
	mov	8, %o1
	call	hex_dump, 0
	 add	%fp, 1703, %o0
	call	puts, 0
	 or	%i5, %l44(.LLC25), %o0
	ldx	[%fp+1919], %g4
	add	%fp, 1647, %o2
	ldx	[%fp+1927], %g5
	add	%fp, 1663, %o1
	ldx	[%fp+1983], %i2
	add	%fp, 1679, %o0
	ldx	[%fp+1991], %i3
	ldx	[%fp+1935], %o4
	stx	%g4, [%fp+1663]
	ldx	[%fp+1943], %o5
	stx	%g5, [%fp+1671]
	ldx	[%fp+1999], %g4
	ldx	[%fp+2007], %g5
	stx	%o4, [%fp+1327]
	ldx	[%fp+1951], %l6
	stx	%o5, [%fp+1335]
	ldx	[%fp+1959], %l7
	stx	%g4, [%fp+1343]
	ldx	[%fp+2015], %l4
	stx	%g5, [%fp+1351]
	ldx	[%fp+2023], %l5
	stx	%i2, [%fp+1647]
	ldx	[%fp+1967], %l2
	stx	%i3, [%fp+1655]
	ldx	[%fp+1975], %l3
	ldx	[%fp+2031], %l0
	ldx	[%fp+2039], %l1
	call	_Qp_mul, 0
	 nop
	ldx	[%fp+1327], %o4
	add	%fp, 1599, %o2
	ldx	[%fp+1335], %o5
	add	%fp, 1615, %o1
	ldx	[%fp+1343], %g4
	add	%fp, 1631, %o0
	ldx	[%fp+1351], %g5
	ldx	[%fp+1679], %i2
	stx	%o4, [%fp+1615]
	stx	%o5, [%fp+1623]
	ldx	[%fp+1687], %i3
	stx	%g4, [%fp+1599]
	call	_Qp_mul, 0
	 stx	%g5, [%fp+1607]
	ldx	[%fp+1631], %g4
	add	%fp, 1551, %o2
	ldx	[%fp+1639], %g5
	add	%fp, 1567, %o1
	stx	%i2, [%fp+1567]
	add	%fp, 1583, %o0
	stx	%i3, [%fp+1575]
	stx	%g4, [%fp+1551]
	call	_Qp_add, 0
	 stx	%g5, [%fp+1559]
	add	%fp, 1503, %o2
	add	%fp, 1519, %o1
	ldx	[%fp+1583], %i2
	add	%fp, 1535, %o0
	ldx	[%fp+1591], %i3
	stx	%l6, [%fp+1519]
	stx	%l7, [%fp+1527]
	stx	%l4, [%fp+1503]
	call	_Qp_mul, 0
	 stx	%l5, [%fp+1511]
	ldx	[%fp+1535], %g4
	add	%fp, 1455, %o2
	ldx	[%fp+1543], %g5
	add	%fp, 1471, %o1
	stx	%i2, [%fp+1471]
	add	%fp, 1487, %o0
	stx	%i3, [%fp+1479]
	stx	%g4, [%fp+1455]
	call	_Qp_add, 0
	 stx	%g5, [%fp+1463]
	add	%fp, 1407, %o2
	add	%fp, 1423, %o1
	ldx	[%fp+1487], %i2
	add	%fp, 1439, %o0
	ldx	[%fp+1495], %i3
	stx	%l2, [%fp+1423]
	stx	%l3, [%fp+1431]
	stx	%l0, [%fp+1407]
	call	_Qp_mul, 0
	 stx	%l1, [%fp+1415]
	ldx	[%fp+1439], %g4
	add	%fp, 1375, %o1
	ldx	[%fp+1447], %g5
	add	%fp, 1359, %o2
	stx	%i2, [%fp+1375]
	add	%fp, 1391, %o0
	stx	%i3, [%fp+1383]
	stx	%g4, [%fp+1359]
	call	_Qp_add, 0
	 stx	%g5, [%fp+1367]
	ldx	[%fp+1391], %g4
	sethi	%h44(.LLC32), %o0
	ldx	[%fp+1399], %g5
	or	%o0, %m44(.LLC32), %o0
	sllx	%o0, 12, %o0
	or	%o0, %l44(.LLC32), %o0
	stx	%g4, [%fp+1711]
	stx	%g5, [%fp+1719]
	ldx	[%fp+1711], %o2
	ldx	[%fp+1719], %o3
	call	printf, 0
	 nop
	sethi	%h44(.LLC33), %o0
	or	%o0, %m44(.LLC33), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC33), %o0
	mov	16, %o1
	call	hex_dump, 0
	 add	%fp, 1711, %o0
	sethi	%h44(.LLC34), %o0
	or	%o0, %m44(.LLC34), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC34), %o0
	sethi	%h44(.LLC35), %o0
	or	%o0, %m44(.LLC35), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC35), %o0
	fzeros	%f15
	ld	[%fp+1739], %f8
	ld	[%fp+1755], %f12
	sethi	%h44(.LLC36), %o0
	ld	[%fp+1735], %f9
	or	%o0, %m44(.LLC36), %o0
	ld	[%fp+1751], %f13
	sllx	%o0, 12, %o0
	ld	[%fp+1731], %f10
	or	%o0, %l44(.LLC36), %o0
	ld	[%fp+1747], %f14
	ld	[%fp+1727], %f11
	ld	[%fp+1743], %f16
	fmadds	%f11, %f16, %f15, %f11
	fmadds	%f10, %f14, %f11, %f10
	fmadds	%f9, %f13, %f10, %f9
	fmadds	%f8, %f12, %f9, %f8
	st	%f8, [%fp+1699]
	ld	[%fp+1699], %f8
	fstod	%f8, %f8
	call	printf, 0
	 movdtox	%f8, %o1
	mov	4, %o1
	call	hex_dump, 0
	 add	%fp, 1699, %o0
	call	puts, 0
	 or	%i5, %l44(.LLC25), %o0
	fzero	%f22
	ldd	[%fp+1815], %f8
	ldd	[%fp+1847], %f16
	sethi	%h44(.LLC37), %o0
	ldd	[%fp+1807], %f10
	or	%o0, %m44(.LLC37), %o0
	ldd	[%fp+1839], %f18
	sllx	%o0, 12, %o0
	ldd	[%fp+1799], %f12
	or	%o0, %l44(.LLC37), %o0
	ldd	[%fp+1831], %f20
	ldd	[%fp+1791], %f14
	ldd	[%fp+1823], %f24
	fmaddd	%f14, %f24, %f22, %f14
	fmaddd	%f12, %f20, %f14, %f12
	fmaddd	%f10, %f18, %f12, %f10
	fmaddd	%f8, %f16, %f10, %f8
	std	%f8, [%fp+1703]
	ldx	[%fp+1703], %o1
	call	printf, 0
	 nop
	call	puts, 0
	 or	%i4, %l44(.LLC31), %o0
	mov	8, %o1
	call	hex_dump, 0
	 add	%fp, 1703, %o0
	call	puts, 0
	 or	%i5, %l44(.LLC25), %o0
	fzero	%f8
	ldd	[%fp+1967], %f12
	fzero	%f10
	ldd	[%fp+1975], %f14
	ldd	[%fp+2031], %f16
	ldd	[%fp+2039], %f18
	ldd	[%fp+1951], %f20
	ldd	[%fp+1959], %f22
	ldd	[%fp+2015], %f24
	ldd	[%fp+2023], %f26
	ldd	[%fp+1935], %f28
	ldd	[%fp+1943], %f30
	ldd	[%fp+1999], %f32
	ldd	[%fp+2007], %f34
	ldd	[%fp+1919], %f0
	ldd	[%fp+1927], %f2
	ldd	[%fp+1983], %f4
	ldd	[%fp+1991], %f6
	std	%f12, [%fp+1263]
	std	%f14, [%fp+1271]
	std	%f16, [%fp+1279]
	std	%f18, [%fp+1287]
	std	%f20, [%fp+1295]
	std	%f22, [%fp+1303]
	std	%f24, [%fp+1311]
	std	%f26, [%fp+1319]
	std	%f28, [%fp+1327]
	std	%f30, [%fp+1335]
	std	%f32, [%fp+1343]
	call	fmal, 0
	 std	%f34, [%fp+1351]
	ldd	[%fp+1343], %f32
	fmovd	%f0, %f8
	ldd	[%fp+1351], %f34
	fmovd	%f2, %f10
	ldd	[%fp+1327], %f28
	ldd	[%fp+1335], %f30
	fmovd	%f32, %f4
	fmovd	%f34, %f6
	fmovd	%f28, %f0
	call	fmal, 0
	 fmovd	%f30, %f2
	ldd	[%fp+1311], %f24
	fmovd	%f0, %f8
	ldd	[%fp+1319], %f26
	fmovd	%f2, %f10
	ldd	[%fp+1295], %f20
	ldd	[%fp+1303], %f22
	fmovd	%f24, %f4
	fmovd	%f26, %f6
	fmovd	%f20, %f0
	call	fmal, 0
	 fmovd	%f22, %f2
	ldd	[%fp+1279], %f16
	fmovd	%f0, %f8
	ldd	[%fp+1287], %f18
	fmovd	%f2, %f10
	ldd	[%fp+1263], %f12
	ldd	[%fp+1271], %f14
	fmovd	%f16, %f4
	fmovd	%f18, %f6
	fmovd	%f12, %f0
	call	fmal, 0
	 fmovd	%f14, %f2
	std	%f0, [%fp+1711]
	sethi	%h44(.LLC38), %o0
	std	%f2, [%fp+1719]
	or	%o0, %m44(.LLC38), %o0
	ldx	[%fp+1711], %o2
	sllx	%o0, 12, %o0
	ldx	[%fp+1719], %o3
	call	printf, 0
	 or	%o0, %l44(.LLC38), %o0
	mov	16, %o1
	call	hex_dump, 0
	 add	%fp, 1711, %o0
	sethi	%h44(.LLC39), %o0
	or	%o0, %m44(.LLC39), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC39), %o0
	sethi	%h44(.LLC40), %o0
	or	%o0, %m44(.LLC40), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC40), %o0
	sethi	%h44(.LLC41), %o0
	or	%o0, %m44(.LLC41), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC41), %o0
	sethi	%h44(.LLC42), %o0
	or	%o0, %m44(.LLC42), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC42), %o0
	sethi	%h44(.LLC43), %o0
	or	%o0, %m44(.LLC43), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC43), %o0
	sethi	%h44(.LLC44), %o0
	or	%o0, %m44(.LLC44), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC44), %o0
	sethi	%h44(.LLC45), %o0
	or	%o0, %m44(.LLC45), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC45), %o0
	sethi	%h44(.LLC46), %o0
	or	%o0, %m44(.LLC46), %o0
	sllx	%o0, 12, %o0
	call	puts, 0
	 or	%o0, %l44(.LLC46), %o0
	return	%i7+8
	 nop
.LL5:
	sethi	%h44(.LLC19), %o0
	or	%o0, %m44(.LLC19), %o0
	sllx	%o0, 12, %o0
	call	printf, 0
	 or	%o0, %l44(.LLC19), %o0
	cwbe	%g0, %g0, .LL3
	nop
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.0"
