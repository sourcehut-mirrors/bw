	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"div2.c"
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)
	sd	s0, 64(sp)
	sd	s1, 56(sp)
	sd	s2, 48(sp)
	sd	s3, 40(sp)
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	.cfi_offset s3, -40
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	mv	a0, zero
	call	setlocale
	call	sysinfo
	addi	a1, sp, 24
	mv	a0, zero
	call	clock_gettime
	addi	a1, zero, -1
	beq	a0, a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a1, sp, 8
	mv	a0, zero
	call	clock_gettime
	ld	a0, 24(sp)
	ld	a1, 32(sp)
	ld	a2, 8(sp)
	ld	a3, 16(sp)
	call	timediff
	add	s2, zero, a0
	lui	a0, %hi(.L.str.2)
	addi	s3, a0, %lo(.L.str.2)
	add	a0, zero, s3
	add	a1, zero, s2
	call	printf
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	lui	a1, 8550
	addiw	a1, a1, 145
	slli	a1, a1, 13
	addi	a1, a1, 391
	slli	a1, a1, 12
	addi	a1, a1, 1159
	slli	a1, a1, 12
	addi	s0, a1, -512
	add	a1, zero, s0
	call	printf
	addi	a1, sp, 24
	mv	a0, zero
	call	clock_gettime
	ld	a0, 8(sp)
	ld	a1, 16(sp)
	ld	a2, 24(sp)
	ld	a3, 32(sp)
	call	timediff
	add	s1, zero, a0
	add	a0, zero, s3
	add	a1, zero, s1
	call	printf
	lui	a0, %hi(.L.str.4)
	addi	a0, a0, %lo(.L.str.4)
	add	a1, zero, s0
	call	printf
	bgeu	s2, s1, .LBB0_4
# %bb.2:                                # %if.then24
	lui	a0, %hi(.Lstr.7)
	addi	a0, a0, %lo(.Lstr.7)
	j	.LBB0_5
.LBB0_3:                                # %if.then
	lui	a0, %hi(__stderrp)
	ld	a3, %lo(__stderrp)(a0)
	lui	a0, %hi(.L.str.1)
	addi	a0, a0, %lo(.L.str.1)
	addi	a1, zero, 40
	addi	a2, zero, 1
	addi	s0, zero, 1
	call	fwrite
	j	.LBB0_6
.LBB0_4:                                # %if.else
	lui	a0, %hi(.Lstr)
	addi	a0, a0, %lo(.Lstr)
.LBB0_5:                                # %cleanup
	call	puts
	mv	s0, zero
.LBB0_6:                                # %cleanup
	add	a0, zero, s0
	ld	s3, 40(sp)
	ld	s2, 48(sp)
	ld	s1, 56(sp)
	ld	s0, 64(sp)
	ld	ra, 72(sp)
	addi	sp, sp, 80
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"C"
	.size	.L.str, 2

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"ERROR : could not attain CLOCK_REALTIME\n"
	.size	.L.str.1, 41

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"     : time delta %lu nsecs\n"
	.size	.L.str.2, 29

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	" foo div result =  %-+16.12e\n"
	.size	.L.str.3, 30

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"foo mult result =  %-+16.12e\n"
	.size	.L.str.4, 30

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"     : mult 0.5"
	.size	.Lstr, 16

	.type	.Lstr.7,@object                 # @str.7
.Lstr.7:
	.asciz	"     : div2"
	.size	.Lstr.7, 12

	.ident	"FreeBSD clang version 11.0.0 (git@github.com:llvm/llvm-project.git llvmorg-11.0.0-0-g176249bd673)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
