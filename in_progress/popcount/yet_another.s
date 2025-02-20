	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zmmul1p0"
	.file	"yet_another.c"
	.globl	popcount                        # -- Begin function popcount
	.p2align	1
	.type	popcount,@function
popcount:                               # @popcount
	.cfi_startproc
# %bb.0:                                # %entry
	li	a1, 0
	beqz	a0, .LBB0_2
.LBB0_1:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	addiw	a2, a0, -1
	and	a0, a0, a2
	addiw	a1, a1, 1
	bnez	a0, .LBB0_1
.LBB0_2:                                # %for.end
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	popcount, .Lfunc_end0-popcount
	.cfi_endproc
                                        # -- End function
	.ident	"FreeBSD clang version 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd708029e0b2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
