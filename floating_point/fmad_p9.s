	.file	"fmad.c"
	.machine power9
	.abiversion 2
	.section	".text"
.Ltext0:
	.file 1 "fmad.c"
	.section	.rodata
	.align 3
.LC12:
	.string	"NOTE : this machine is a "
	.align 3
.LC14:
	.string	"big"
	.align 3
.LC16:
	.string	"little"
	.align 3
.LC18:
	.string	" endian architecture.\n"
	.align 3
.LC20:
	.string	"     : Be sure to adjust your brain accordingly.\n\n\n"
	.align 3
.LC22:
	.string	"--------------- Maybe no FMA Calls ---------------\n\n"
	.align 3
.LC24:
	.string	"        fp32  = %-+24.18e\n"
	.align 3
.LC26:
	.string	" dotme_fp32  is "
	.align 3
.LC28:
	.string	"0x%02x "
	.align 3
.LC30:
	.string	"\n\n"
	.align 3
.LC32:
	.string	"        fp64  = %-+24.18e\n"
	.align 3
.LC34:
	.string	" dotme_fp64  is "
	.globl __gcc_qmul
	.globl __gcc_qadd
	.align 3
.LC36:
	.string	"        fp128 = %-+24.18Le\n"
	.align 3
.LC38:
	.string	" dotme_fp128 is "
	.align 3
.LC40:
	.string	"\n\n\n\n"
	.align 3
.LC42:
	.string	"-------------------- FMA Calls -------------------\n\n"
	.align 3
.LC44:
	.string	"  fmaf fp32   = %-+24.18e\n"
	.align 3
.LC46:
	.string	"  fma  fp64   = %-+24.18e\n"
	.align 3
.LC48:
	.string	"  fmal fp128  = %-+24.18Le\n"
	.align 3
.LC50:
	.string	"\n\n\n"
	.align 3
.LC52:
	.string	"--------------------------------------------------\n\n"
	.align 3
.LC54:
	.string	"\nCorrect result is +5.595788259858e-02\n"
	.align 3
.LC56:
	.string	"or this    0x3faca682f76db9b9 from ARMv8\n"
	.align 3
.LC58:
	.string	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+\n"
	.align 3
.LC60:
	.string	"Same thing on Intel Core i5-7300U K8-class CPU\n"
	.align 3
.LC62:
	.string	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a\n"
	.align 3
.LC64:
	.string	"\nNOTE : IBM Power systems may report strange fp128 hex values\n"
	.align 2
.LC0:
	.long	1072966775
	.long	-1085717355
	.long	1066588950
	.long	1064688842
	.align 2
.LC1:
	.long	-1083212562
	.long	-1087306022
	.long	1071430511
	.long	-1086999970
	.align 3
.LC2:
	.long	-353767866
	.long	1073644942
	.long	-1869554596
	.long	-1075238766
	.long	-948603657
	.long	1072847714
	.long	859983020
	.long	1072610201
	.align 3
.LC3:
	.long	-1305670058
	.long	-1074925667
	.long	1104844259
	.long	-1075437349
	.long	-623972849
	.long	1073452909
	.long	-1229473902
	.long	-1075399093
	.align 4
.LC4:
	.long	-353767866
	.long	1073644942
	.long	499178280
	.long	-1131523160
	.long	-1869554596
	.long	-1075238766
	.long	96921950
	.long	1015184817
	.long	-948603657
	.long	1072847714
	.long	737222548
	.long	1015115990
	.long	859983020
	.long	1072610201
	.long	-1928928224
	.long	-1132105558
	.align 4
.LC5:
	.long	-1305670058
	.long	-1074925667
	.long	-755914240
	.long	-1136631219
	.long	1104844259
	.long	-1075437349
	.long	2021507104
	.long	-1133127183
	.long	-623972849
	.long	1073452909
	.long	-1164107936
	.long	1015962098
	.long	-1229473902
	.long	-1075399093
	.long	1325021464
	.long	1014427010
	.section	".toc","aw"
	.align 3
.LCTOC0:
	.tc .LCTOC1[TC],.LCTOC1
	.section	".toc1","aw"
	.align 3
.LCTOC1 = .+32768
.LC6:
	.quad	.LC0
.LC7:
	.quad	.LC1
.LC8:
	.quad	.LC2
.LC9:
	.quad	.LC3
.LC10:
	.quad	.LC4
.LC11:
	.quad	.LC5
.LC13:
	.quad	.LC12
.LC15:
	.quad	.LC14
.LC17:
	.quad	.LC16
.LC19:
	.quad	.LC18
.LC21:
	.quad	.LC20
.LC23:
	.quad	.LC22
.LC25:
	.quad	.LC24
.LC27:
	.quad	.LC26
.LC29:
	.quad	.LC28
.LC31:
	.quad	.LC30
.LC33:
	.quad	.LC32
.LC35:
	.quad	.LC34
.LC37:
	.quad	.LC36
.LC39:
	.quad	.LC38
.LC41:
	.quad	.LC40
.LC43:
	.quad	.LC42
.LC45:
	.quad	.LC44
.LC47:
	.quad	.LC46
.LC49:
	.quad	.LC48
.LC51:
	.quad	.LC50
.LC53:
	.quad	.LC52
.LC55:
	.quad	.LC54
.LC57:
	.quad	.LC56
.LC59:
	.quad	.LC58
.LC61:
	.quad	.LC60
.LC63:
	.quad	.LC62
.LC65:
	.quad	.LC64
	.section	".text"
	.align 2
	.globl main
	.type	main, @function
main:
.LFB0:
	.loc 1 43 1
	.cfi_startproc
.LCF0:
0:	addis 2,12,.TOC.-.LCF0@ha
	addi 2,2,.TOC.-.LCF0@l
	.localentry	main,.-main
	mflr %r0
	std %r0,16(%r1)
	stfd %f20,-96(%r1)
	stfd %f21,-88(%r1)
	stfd %f22,-80(%r1)
	stfd %f23,-72(%r1)
	stfd %f24,-64(%r1)
	stfd %f25,-56(%r1)
	stfd %f26,-48(%r1)
	stfd %f27,-40(%r1)
	stfd %f28,-32(%r1)
	stfd %f29,-24(%r1)
	stfd %f30,-16(%r1)
	stfd %f31,-8(%r1)
	std %r30,-112(%r1)
	std %r31,-104(%r1)
	stdu %r1,-496(%r1)
	.cfi_def_cfa_offset 496
	.cfi_offset 65, 16
	.cfi_offset 52, -96
	.cfi_offset 53, -88
	.cfi_offset 54, -80
	.cfi_offset 55, -72
	.cfi_offset 56, -64
	.cfi_offset 57, -56
	.cfi_offset 58, -48
	.cfi_offset 59, -40
	.cfi_offset 60, -32
	.cfi_offset 61, -24
	.cfi_offset 62, -16
	.cfi_offset 63, -8
	.cfi_offset 30, -112
	.cfi_offset 31, -104
	mr %r31,%r1
	.cfi_def_cfa_register 31
	ld %r30,.LCTOC0@toc(%r2)
	mr %r9,%r3
	std %r4,376(%r31)
	stw %r9,368(%r31)
	.loc 1 82 20
	addi %r9,%r31,104
	ld %r10,.LC6-.LCTOC1(%r30)
	lxv %vs0,0(%r10)
	stxv %vs0,0(%r9)
	.loc 1 83 20
	addi %r9,%r31,120
	ld %r10,.LC7-.LCTOC1(%r30)
	lxv %vs0,0(%r10)
	stxv %vs0,0(%r9)
	.loc 1 86 21
	ld %r9,.LC8-.LCTOC1(%r30)
	lxv %vs12,0(%r9)
	lxv %vs0,16(%r9)
	li %r9,136
	stxvx %vs12,%r31,%r9
	li %r9,152
	stxvx %vs0,%r31,%r9
	.loc 1 87 21
	ld %r9,.LC9-.LCTOC1(%r30)
	lxv %vs12,0(%r9)
	lxv %vs0,16(%r9)
	li %r9,168
	stxvx %vs12,%r31,%r9
	li %r9,184
	stxvx %vs0,%r31,%r9
	.loc 1 95 26
	ld %r9,.LC10-.LCTOC1(%r30)
	lxv %vs10,0(%r9)
	lxv %vs11,16(%r9)
	lxv %vs12,32(%r9)
	lxv %vs0,48(%r9)
	stxv %vs10,208(%r31)
	stxv %vs11,224(%r31)
	stxv %vs12,240(%r31)
	stxv %vs0,256(%r31)
	.loc 1 96 26
	ld %r9,.LC11-.LCTOC1(%r30)
	lxv %vs10,0(%r9)
	lxv %vs11,16(%r9)
	lxv %vs12,32(%r9)
	lxv %vs0,48(%r9)
	stxv %vs10,272(%r31)
	stxv %vs11,288(%r31)
	stxv %vs12,304(%r31)
	stxv %vs0,320(%r31)
	.loc 1 105 5
	ld %r3,.LC13-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 106 10
	bl endian
	mr %r9,%r3
	.loc 1 106 8
	cmpwi %cr0,%r9,0
	beq %cr0,.L2
	.loc 1 107 9
	ld %r3,.LC15-.LCTOC1(%r30)
	bl printf
	nop
	b .L3
.L2:
	.loc 1 109 9
	ld %r3,.LC17-.LCTOC1(%r30)
	bl printf
	nop
.L3:
	.loc 1 111 5
	ld %r3,.LC19-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 112 5
	ld %r3,.LC21-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 114 5
	ld %r3,.LC23-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 121 11
	addi %r9,%r31,104
	lfs %f12,0(%r9)
	.loc 1 121 18
	addi %r9,%r31,120
	lfs %f0,0(%r9)
	.loc 1 121 15
	fmuls %f12,%f12,%f0
	.loc 1 125 11
	addi %r9,%r31,104
	lfs %f11,4(%r9)
	.loc 1 125 18
	addi %r9,%r31,120
	lfs %f0,4(%r9)
	.loc 1 125 15
	fmuls %f0,%f11,%f0
	.loc 1 123 10
	fadds %f12,%f12,%f0
	.loc 1 129 11
	addi %r9,%r31,104
	lfs %f11,8(%r9)
	.loc 1 129 18
	addi %r9,%r31,120
	lfs %f0,8(%r9)
	.loc 1 129 15
	fmuls %f0,%f11,%f0
	.loc 1 127 10
	fadds %f12,%f12,%f0
	.loc 1 133 11
	addi %r9,%r31,104
	lfs %f11,12(%r9)
	.loc 1 133 18
	addi %r9,%r31,120
	lfs %f0,12(%r9)
	.loc 1 133 15
	fmuls %f0,%f11,%f0
	.loc 1 131 10
	fadds %f0,%f12,%f0
	.loc 1 119 16
	stfs %f0,336(%r31)
	.loc 1 136 5
	lfs %f0,336(%r31)
	mfvsrd %r9,%vs0
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	mtvsrd %vs0,%r10
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC25-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 138 5
	ld %r3,.LC27-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 139 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 139 5
	b .L4
.L5:
	.loc 1 140 51 discriminator 3
	addi %r10,%r31,336
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 140 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 139 33 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L4:
	.loc 1 139 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,3
	ble %cr0,.L5
	.loc 1 142 5
	ld %r3,.LC31-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 190 13
	lfd %f12,136(%r31)
	.loc 1 190 22
	lfd %f0,168(%r31)
	.loc 1 190 17
	fmul %f12,%f12,%f0
	.loc 1 194 13
	lfd %f11,144(%r31)
	.loc 1 194 22
	lfd %f0,176(%r31)
	.loc 1 194 17
	fmul %f0,%f11,%f0
	.loc 1 192 10
	fadd %f12,%f12,%f0
	.loc 1 198 13
	lfd %f11,152(%r31)
	.loc 1 198 22
	lfd %f0,184(%r31)
	.loc 1 198 17
	fmul %f0,%f11,%f0
	.loc 1 196 10
	fadd %f12,%f12,%f0
	.loc 1 202 13
	lfd %f11,160(%r31)
	.loc 1 202 22
	lfd %f0,192(%r31)
	.loc 1 202 17
	fmul %f0,%f11,%f0
	.loc 1 200 10
	fadd %f0,%f12,%f0
	.loc 1 188 16
	stfd %f0,344(%r31)
	.loc 1 204 5
	lfd %f0,344(%r31)
	mfvsrd %r9,%vs0
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	mtvsrd %vs0,%r10
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC33-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 205 5
	ld %r3,.LC35-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 206 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 206 5
	b .L6
.L7:
	.loc 1 207 51 discriminator 3
	addi %r10,%r31,344
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 207 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 206 34 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L6:
	.loc 1 206 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,7
	ble %cr0,.L7
	.loc 1 209 5
	ld %r3,.LC31-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 222 14
	addi %r9,%r31,208
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	.loc 1 222 24
	addi %r9,%r31,272
	lfd %f12,0(%r9)
	lfd %f13,8(%r9)
	.loc 1 222 18
	fmr %f3,%f12
	fmr %f4,%f13
	fmr %f2,%f1
	fmr %f1,%f0
	bl __gcc_qmul
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f31,%f1
	fmr %f30,%f0
	.loc 1 226 14
	addi %r9,%r31,224
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	.loc 1 226 24
	addi %r9,%r31,288
	lfd %f12,0(%r9)
	lfd %f13,8(%r9)
	.loc 1 226 18
	fmr %f3,%f12
	fmr %f4,%f13
	fmr %f2,%f1
	fmr %f1,%f0
	bl __gcc_qmul
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	.loc 1 224 10
	fmr %f4,%f1
	fmr %f3,%f0
	fmr %f1,%f30
	fmr %f2,%f31
	bl __gcc_qadd
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f31,%f1
	fmr %f30,%f0
	.loc 1 230 14
	addi %r9,%r31,240
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	.loc 1 230 24
	addi %r9,%r31,304
	lfd %f12,0(%r9)
	lfd %f13,8(%r9)
	.loc 1 230 18
	fmr %f3,%f12
	fmr %f4,%f13
	fmr %f2,%f1
	fmr %f1,%f0
	bl __gcc_qmul
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	.loc 1 228 10
	fmr %f4,%f1
	fmr %f3,%f0
	fmr %f1,%f30
	fmr %f2,%f31
	bl __gcc_qadd
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f31,%f1
	fmr %f30,%f0
	.loc 1 234 14
	addi %r9,%r31,256
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	.loc 1 234 24
	addi %r9,%r31,320
	lfd %f12,0(%r9)
	lfd %f13,8(%r9)
	.loc 1 234 18
	fmr %f3,%f12
	fmr %f4,%f13
	fmr %f2,%f1
	fmr %f1,%f0
	bl __gcc_qmul
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	.loc 1 232 10
	fmr %f4,%f1
	fmr %f3,%f0
	fmr %f1,%f30
	fmr %f2,%f31
	bl __gcc_qadd
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	.loc 1 220 17
	addi %r9,%r31,352
	stfd %f0,0(%r9)
	stfd %f1,8(%r9)
	.loc 1 236 5
	addi %r9,%r31,352
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	mfvsrd %r10,%vs0
	mfvsrd %r11,%vs1
	mr %r6,%r10
	mr %r7,%r11
	mr %r8,%r10
	mr %r9,%r11
	mr %r11,%r7
	mr %r10,%r6
	mtvsrd %vs1,%r9
	mtvsrd %vs0,%r8
	mr %r4,%r10
	mr %r5,%r11
	fmr %f2,%f1
	fmr %f1,%f0
	ld %r3,.LC37-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 237 5
	ld %r3,.LC39-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 238 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 238 5
	b .L8
.L9:
	.loc 1 239 52 discriminator 3
	addi %r10,%r31,352
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 239 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 238 39 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L8:
	.loc 1 238 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,15
	ble %cr0,.L9
	.loc 1 241 5
	ld %r3,.LC41-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 243 5
	ld %r3,.LC43-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 266 25
	addi %r9,%r31,104
	lfs %f31,12(%r9)
	.loc 1 266 31
	addi %r9,%r31,120
	lfs %f30,12(%r9)
	.loc 1 266 43
	addi %r9,%r31,104
	lfs %f29,8(%r9)
	.loc 1 266 49
	addi %r9,%r31,120
	lfs %f28,8(%r9)
	.loc 1 266 61
	addi %r9,%r31,104
	lfs %f27,4(%r9)
	.loc 1 266 67
	addi %r9,%r31,120
	lfs %f26,4(%r9)
	.loc 1 266 79
	addi %r9,%r31,104
	lfs %f0,0(%r9)
	.loc 1 266 85
	addi %r9,%r31,120
	lfs %f12,0(%r9)
	.loc 1 266 18
	xxlxor %vs3,%vs3,%vs3
	fmr %f2,%f12
	fmr %f1,%f0
	bl fmaf
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f26
	fmr %f1,%f27
	bl fmaf
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f28
	fmr %f1,%f29
	bl fmaf
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f30
	fmr %f1,%f31
	bl fmaf
	nop
	fmr %f0,%f1
	.loc 1 266 16
	stfs %f0,336(%r31)
	.loc 1 268 5
	lfs %f0,336(%r31)
	mfvsrd %r9,%vs0
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	mtvsrd %vs0,%r10
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC45-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 270 5
	ld %r3,.LC27-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 271 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 271 5
	b .L10
.L11:
	.loc 1 272 51 discriminator 3
	addi %r10,%r31,336
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 272 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 271 33 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L10:
	.loc 1 271 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,3
	ble %cr0,.L11
	.loc 1 274 5
	ld %r3,.LC31-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 278 26
	lfd %f31,160(%r31)
	.loc 1 278 34
	lfd %f30,192(%r31)
	.loc 1 278 47
	lfd %f29,152(%r31)
	.loc 1 278 55
	lfd %f28,184(%r31)
	.loc 1 278 68
	lfd %f27,144(%r31)
	.loc 1 278 76
	lfd %f26,176(%r31)
	.loc 1 278 89
	lfd %f0,136(%r31)
	.loc 1 278 97
	lfd %f12,168(%r31)
	.loc 1 278 18
	xxlxor %vs3,%vs3,%vs3
	fmr %f2,%f12
	fmr %f1,%f0
	bl fma
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f26
	fmr %f1,%f27
	bl fma
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f28
	fmr %f1,%f29
	bl fma
	nop
	fmr %f0,%f1
	fmr %f3,%f0
	fmr %f2,%f30
	fmr %f1,%f31
	bl fma
	nop
	fmr %f0,%f1
	.loc 1 278 16
	stfd %f0,344(%r31)
	.loc 1 280 5
	lfd %f0,344(%r31)
	mfvsrd %r9,%vs0
	mr %r8,%r9
	mr %r10,%r9
	mr %r9,%r8
	mtvsrd %vs0,%r10
	mr %r4,%r9
	fmr %f1,%f0
	ld %r3,.LC47-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 281 5
	ld %r3,.LC35-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 282 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 282 5
	b .L12
.L13:
	.loc 1 283 51 discriminator 3
	addi %r10,%r31,344
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 283 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 282 34 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L12:
	.loc 1 282 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,7
	ble %cr0,.L13
	.loc 1 285 5
	ld %r3,.LC31-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 289 29
	addi %r9,%r31,256
	lfd %f30,0(%r9)
	lfd %f31,8(%r9)
	.loc 1 289 38
	addi %r9,%r31,320
	lfd %f28,0(%r9)
	lfd %f29,8(%r9)
	.loc 1 289 53
	addi %r9,%r31,240
	lfd %f26,0(%r9)
	lfd %f27,8(%r9)
	.loc 1 289 62
	addi %r9,%r31,304
	lfd %f24,0(%r9)
	lfd %f25,8(%r9)
	.loc 1 289 77
	addi %r9,%r31,224
	lfd %f22,0(%r9)
	lfd %f23,8(%r9)
	.loc 1 289 86
	addi %r9,%r31,288
	lfd %f20,0(%r9)
	lfd %f21,8(%r9)
	.loc 1 289 101
	addi %r9,%r31,208
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	.loc 1 289 110
	addi %r9,%r31,272
	lfd %f12,0(%r9)
	lfd %f13,8(%r9)
	.loc 1 289 19
	xxlxor %vs5,%vs5,%vs5
	xxlxor %vs6,%vs6,%vs6
	fmr %f3,%f12
	fmr %f4,%f13
	fmr %f2,%f1
	fmr %f1,%f0
	bl fmal
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f6,%f1
	fmr %f5,%f0
	fmr %f3,%f20
	fmr %f4,%f21
	fmr %f1,%f22
	fmr %f2,%f23
	bl fmal
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f6,%f1
	fmr %f5,%f0
	fmr %f3,%f24
	fmr %f4,%f25
	fmr %f1,%f26
	fmr %f2,%f27
	bl fmal
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	fmr %f6,%f1
	fmr %f5,%f0
	fmr %f3,%f28
	fmr %f4,%f29
	fmr %f1,%f30
	fmr %f2,%f31
	bl fmal
	nop
	fmr %f0,%f1
	fmr %f1,%f2
	.loc 1 289 17
	addi %r9,%r31,352
	stfd %f0,0(%r9)
	stfd %f1,8(%r9)
	.loc 1 291 5
	addi %r9,%r31,352
	lfd %f0,0(%r9)
	lfd %f1,8(%r9)
	mfvsrd %r10,%vs0
	mfvsrd %r11,%vs1
	mr %r6,%r10
	mr %r7,%r11
	mr %r8,%r10
	mr %r9,%r11
	mr %r11,%r7
	mr %r10,%r6
	mtvsrd %vs1,%r9
	mtvsrd %vs0,%r8
	mr %r4,%r10
	mr %r5,%r11
	fmr %f2,%f1
	fmr %f1,%f0
	ld %r3,.LC49-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 292 5
	ld %r3,.LC39-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 293 11
	li %r9,0
	std %r9,96(%r31)
	.loc 1 293 5
	b .L14
.L15:
	.loc 1 294 52 discriminator 3
	addi %r10,%r31,352
	ld %r9,96(%r31)
	add %r9,%r10,%r9
	lbz %r9,0(%r9)
	.loc 1 294 9 discriminator 3
	rlwinm %r9,%r9,0,0xff
	extsw %r9,%r9
	mr %r4,%r9
	ld %r3,.LC29-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 293 39 discriminator 3
	ld %r9,96(%r31)
	addi %r9,%r9,1
	std %r9,96(%r31)
.L14:
	.loc 1 293 16 discriminator 1
	ld %r9,96(%r31)
	cmpldi %cr0,%r9,15
	ble %cr0,.L15
	.loc 1 296 5
	ld %r3,.LC51-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 298 5
	ld %r3,.LC53-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 302 5
	ld %r3,.LC55-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 303 5
	ld %r3,.LC57-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 304 5
	ld %r3,.LC59-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 305 5
	ld %r3,.LC61-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 306 5
	ld %r3,.LC63-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 308 5
	ld %r3,.LC65-.LCTOC1(%r30)
	bl printf
	nop
	.loc 1 310 12
	li %r9,42
	.loc 1 312 1
	extsw %r9,%r9
	mr %r3,%r9
	addi %r1,%r31,496
	.cfi_def_cfa 1, 0
	ld %r0,16(%r1)
	mtlr %r0
	ld %r30,-112(%r1)
	ld %r31,-104(%r1)
	lfd %f20,-96(%r1)
	lfd %f21,-88(%r1)
	lfd %f22,-80(%r1)
	lfd %f23,-72(%r1)
	lfd %f24,-64(%r1)
	lfd %f25,-56(%r1)
	lfd %f26,-48(%r1)
	lfd %f27,-40(%r1)
	lfd %f28,-32(%r1)
	lfd %f29,-24(%r1)
	lfd %f30,-16(%r1)
	lfd %f31,-8(%r1)
	blr
	.long 0
	.byte 0,0,2,1,140,2,0,1
	.cfi_endproc
.LFE0:
	.size	main,.-main
	.align 2
	.type	endian, @function
endian:
.LFB1:
	.loc 1 315 1
	.cfi_startproc
	std %r31,-8(%r1)
	stdu %r1,-64(%r1)
	.cfi_def_cfa_offset 64
	.cfi_offset 31, -8
	mr %r31,%r1
	.cfi_def_cfa_register 31
	.loc 1 316 9
	li %r9,1
	stw %r9,32(%r31)
	.loc 1 317 25
	addi %r9,%r31,32
	.loc 1 317 14
	lbz %r9,0(%r9)
	.loc 1 317 42
	rlwinm %r9,%r9,0,0xff
	xori %r9,%r9,0x1
	cntlzw %r9,%r9
	srwi %r9,%r9,5
	xori %r9,%r9,0x1
	rlwinm %r9,%r9,0,0xff
	.loc 1 317 11
	stw %r9,32(%r31)
	.loc 1 318 12
	lwz %r9,32(%r31)
	extsw %r9,%r9
	.loc 1 319 1
	mr %r3,%r9
	addi %r1,%r31,64
	.cfi_def_cfa 1, 0
	ld %r31,-8(%r1)
	blr
	.long 0
	.byte 0,0,0,0,128,1,0,1
	.cfi_endproc
.LFE1:
	.size	endian,.-endian
.Letext0:
	.file 2 "/opt/gcc-12.2.0/lib/gcc/powerpc64le-linux-gnu/12.2.0/include/stddef.h"
	.file 3 "/usr/include/powerpc64le-linux-gnu/bits/types.h"
	.file 4 "/usr/include/powerpc64le-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/usr/include/powerpc64le-linux-gnu/bits/mathcalls.h"
	.file 6 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x285
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0xc
	.4byte	.LASF26
	.4byte	.LASF27
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0xd
	.4byte	0x41
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
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.4byte	0x4d
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x7
	.4byte	0x41
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x69
	.uleb128 0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	0x9b
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	0xa7
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x5
	.2byte	0x14f
	.byte	0x1
	.4byte	0xd4
	.4byte	0xd4
	.uleb128 0x2
	.4byte	0xd4
	.uleb128 0x2
	.4byte	0xd4
	.uleb128 0x2
	.4byte	0xd4
	.byte	0
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	0xd4
	.uleb128 0xf
	.string	"fma"
	.byte	0x5
	.2byte	0x14f
	.byte	0x1
	.4byte	0xa7
	.4byte	0x101
	.uleb128 0x2
	.4byte	0xa7
	.uleb128 0x2
	.4byte	0xa7
	.uleb128 0x2
	.4byte	0xa7
	.byte	0
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x14f
	.byte	0x1
	.4byte	0x9b
	.4byte	0x122
	.uleb128 0x2
	.4byte	0x9b
	.uleb128 0x2
	.4byte	0x9b
	.uleb128 0x2
	.4byte	0x9b
	.byte	0
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x6
	.2byte	0x14c
	.byte	0xc
	.4byte	0x7c
	.4byte	0x13a
	.uleb128 0x2
	.4byte	0x13f
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.4byte	0x48
	.uleb128 0x11
	.4byte	0x13a
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x13a
	.byte	0xc
	.4byte	0x7c
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x178
	.uleb128 0x13
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x13c
	.byte	0x9
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x14
	.4byte	.LASF29
	.byte	0x1
	.byte	0x2a
	.byte	0x5
	.4byte	0x7c
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x247
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0xe
	.4byte	0x7c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x1b
	.4byte	0x247
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x4
	.string	"a"
	.byte	0x52
	.byte	0x14
	.4byte	0x25b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -392
	.uleb128 0x4
	.string	"b"
	.byte	0x53
	.byte	0x14
	.4byte	0x25b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -376
	.uleb128 0x4
	.string	"a64"
	.byte	0x56
	.byte	0x15
	.4byte	0x26f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -360
	.uleb128 0x4
	.string	"b64"
	.byte	0x57
	.byte	0x15
	.4byte	0x26f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x5f
	.byte	0x1a
	.4byte	0x283
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x60
	.byte	0x1a
	.4byte	0x283
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x63
	.byte	0x14
	.4byte	0xa2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x64
	.byte	0x15
	.4byte	0xae
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x65
	.byte	0x1a
	.4byte	0xdb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x4
	.string	"j"
	.byte	0x67
	.byte	0xc
	.4byte	0x2e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.byte	0
	.uleb128 0x7
	.4byte	0x8a
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x25b
	.uleb128 0xa
	.4byte	0x3a
	.byte	0
	.uleb128 0x3
	.4byte	0x24c
	.uleb128 0x9
	.4byte	0xae
	.4byte	0x26f
	.uleb128 0xa
	.4byte	0x3a
	.byte	0
	.uleb128 0x3
	.4byte	0x260
	.uleb128 0x9
	.4byte	0xdb
	.4byte	0x283
	.uleb128 0xa
	.4byte	0x3a
	.byte	0
	.uleb128 0x3
	.4byte	0x274
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x21
	.sleb128 3
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
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
.LASF7:
	.string	"__uint8_t"
.LASF6:
	.string	"size_t"
.LASF11:
	.string	"float"
.LASF22:
	.string	"dotme_fp32"
.LASF10:
	.string	"uint8_t"
.LASF26:
	.string	"fmad.c"
.LASF21:
	.string	"b128"
.LASF2:
	.string	"unsigned char"
.LASF24:
	.string	"dotme_fp128"
.LASF0:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF12:
	.string	"double"
.LASF29:
	.string	"main"
.LASF28:
	.string	"endian"
.LASF4:
	.string	"unsigned int"
.LASF1:
	.string	"char"
.LASF19:
	.string	"eflag"
.LASF17:
	.string	"argc"
.LASF23:
	.string	"dotme_fp64"
.LASF27:
	.string	"/home/dclarke/pgm/bw/floating_point"
.LASF16:
	.string	"printf"
.LASF15:
	.string	"fmaf"
.LASF8:
	.string	"short int"
.LASF18:
	.string	"argv"
.LASF20:
	.string	"a128"
.LASF9:
	.string	"long int"
.LASF25:
	.ascii	"GNU C99 12.2.0 -m64 -mcpu=po"
	.string	"wer9 -mno-isel -mno-crypto -mno-htm -mno-quad-memory-atomic -mfloat128-hardware -mfull-toc -mno-multiple -mupdate -mno-avoid-indexed-addresses -mregnames -mno-recip -g -O0 -pedantic-errors -std=c99 -fno-builtin -fno-unsafe-math-optimizations -fno-fast-math"
.LASF13:
	.string	"long double"
.LASF5:
	.string	"signed char"
.LASF14:
	.string	"fmal"
	.ident	"GCC: (mrw 12.2.0-1) 12.2.0"
	.gnu_attribute 4, 5
	.section	.note.GNU-stack,"",@progbits
