	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zmmul1p0"
	.file	"mcounter.c"
	.globl	mcounter                        # -- Begin function mcounter
	.p2align	1
	.type	mcounter,@function
mcounter:                               # @mcounter
	.cfi_startproc
# %bb.0:                                # %entry
	li	a1, 0
.LBB0_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	andi	a2, a0, 1
	sraiw	a0, a0, 1
	addw	a1, a1, a2
	bnez	a0, .LBB0_1
# %bb.2:                                # %do.end
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	mcounter, .Lfunc_end0-mcounter
	.cfi_endproc
                                        # -- End function
	.ident	"FreeBSD clang version 19.1.7 (https://github.com/llvm/llvm-project.git llvmorg-19.1.7-0-gcd708029e0b2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
