	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zmmul1p0"
	.file	"popcount.c"
	.globl	popcount                        # -- Begin function popcount
	.p2align	1
	.type	popcount,@function
popcount:                               # @popcount
	.cfi_startproc
# %bb.0:                                # %entry
	srli	a1, a0, 1
	lui	a2, 349525
	addiw	a2, a2, 1365
	slli	a3, a2, 32
	add	a2, a2, a3
	and	a1, a1, a2
	sub	a0, a0, a1
	srli	a1, a0, 2
	lui	a2, 209715
	addiw	a2, a2, 819
	slli	a3, a2, 32
	add	a2, a2, a3
	and	a1, a1, a2
	and	a0, a0, a2
	add	a0, a0, a1
	srli	a1, a0, 4
	add	a0, a0, a1
	lui	a1, 61681
	addiw	a1, a1, -241
	slli	a2, a1, 32
	add	a1, a1, a2
	and	a0, a0, a1
	srli	a1, a0, 31
	add	a0, a0, a1
	srli	a1, a0, 8
	add	a0, a0, a1
	andi	a0, a0, 127
	ret
.Lfunc_end0:
	.size	popcount, .Lfunc_end0-popcount
	.cfi_endproc
                                        # -- End function
	.ident	"FreeBSD clang version 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd708029e0b2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
