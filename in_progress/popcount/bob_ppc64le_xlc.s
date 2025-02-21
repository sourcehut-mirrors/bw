.set r0,0; .set SP,1; .set RTOC,2; .set r3,3; .set r4,4
.set r5,5; .set r6,6; .set r7,7; .set r8,8; .set r9,9
.set r10,10; .set r11,11; .set r12,12; .set r13,13; .set r14,14
.set r15,15; .set r16,16; .set r17,17; .set r18,18; .set r19,19
.set r20,20; .set r21,21; .set r22,22; .set r23,23; .set r24,24
.set r25,25; .set r26,26; .set r27,27; .set r28,28; .set r29,29
.set r30,30; .set r31,31
.set fp0,0; .set fp1,1; .set fp2,2; .set fp3,3; .set fp4,4
.set fp5,5; .set fp6,6; .set fp7,7; .set fp8,8; .set fp9,9
.set fp10,10; .set fp11,11; .set fp12,12; .set fp13,13; .set fp14,14
.set fp15,15; .set fp16,16; .set fp17,17; .set fp18,18; .set fp19,19
.set fp20,20; .set fp21,21; .set fp22,22; .set fp23,23; .set fp24,24
.set fp25,25; .set fp26,26; .set fp27,27; .set fp28,28; .set fp29,29
.set fp30,30; .set fp31,31
.set v0,0; .set v1,1; .set v2,2; .set v3,3; .set v4,4
.set v5,5; .set v6,6; .set v7,7; .set v8,8; .set v9,9
.set v10,10; .set v11,11; .set v12,12; .set v13,13; .set v14,14
.set v15,15; .set v16,16; .set v17,17; .set v18,18; .set v19,19
.set v20,20; .set v21,21; .set v22,22; .set v23,23; .set v24,24
.set v25,25; .set v26,26; .set v27,27; .set v28,28; .set v29,29
.set v30,30; .set v31,31
.set x0,0; .set x1,1; .set x2,2; .set x3,3; .set x4,4
.set x5,5; .set x6,6; .set x7,7; .set x8,8; .set x9,9
.set x10,10; .set x11,11; .set x12,12; .set x13,13; .set x14,14
.set x15,15; .set x16,16; .set x17,17; .set x18,18; .set x19,19
.set x20,20; .set x21,21; .set x22,22; .set x23,23; .set x24,24
.set x25,25; .set x26,26; .set x27,27; .set x28,28; .set x29,29
.set x30,30; .set x31,31; .set x32,32; .set x33,33; .set x34,34
.set x35,35; .set x36,36; .set x37,37; .set x38,38; .set x39,39
.set x40,40; .set x41,41; .set x42,42; .set x43,43; .set x44,44
.set x45,45; .set x46,46; .set x47,47; .set x48,48; .set x49,49
.set x50,50; .set x51,51; .set x52,52; .set x53,53; .set x54,54
.set x55,55; .set x56,56; .set x57,57; .set x58,58; .set x59,59
.set x60,60; .set x61,61; .set x62,62; .set x63,63
.set q0,0; .set q1,1; .set q2,2; .set q3,3; .set q4,4
.set q5,5; .set q6,6; .set q7,7; .set q8,8; .set q9,9
.set q10,10; .set q11,11; .set q12,12; .set q13,13; .set q14,14
.set q15,15; .set q16,16; .set q17,17; .set q18,18; .set q19,19
.set q20,20; .set q21,21; .set q22,22; .set q23,23; .set q24,24
.set q25,25; .set q26,26; .set q27,27; .set q28,28; .set q29,29
.set q30,30; .set q31,31
.set MQ,0; .set XER,1; .set DSCR,3; .set FROM_RTCU,4; .set FROM_RTCL,5
.set FROM_DEC,6; .set LR,8; .set CTR,9; .set AMR,13; .set TID,17; .set DSISR,18
.set DAR,19; .set TO_RTCU,20; .set TO_RTCL,21; .set TO_DEC,22; .set SDR_0,24
.set SDR_1,25; .set SRR_0,26; .set SRR_1,27
.set BO_dCTR_NZERO_AND_NOT,0; .set BO_dCTR_NZERO_AND_NOT_1,1
.set BO_dCTR_ZERO_AND_NOT,2; .set BO_dCTR_ZERO_AND_NOT_1,3
.set BO_IF_NOT,4; .set BO_IF_NOT_1,5; .set BO_IF_NOT_2,6
.set BO_IF_NOT_3,7; .set BO_dCTR_NZERO_AND,8; .set BO_dCTR_NZERO_AND_1,9
.set BO_dCTR_ZERO_AND,10; .set BO_dCTR_ZERO_AND_1,11; .set BO_IF,12
.set BO_IF_1,13; .set BO_IF_2,14; .set BO_IF_3,15; .set BO_dCTR_NZERO,16
.set BO_dCTR_NZERO_1,17; .set BO_dCTR_ZERO,18; .set BO_dCTR_ZERO_1,19
.set BO_ALWAYS,20; .set BO_ALWAYS_1,21; .set BO_ALWAYS_2,22
.set BO_ALWAYS_3,23; .set BO_dCTR_NZERO_8,24; .set BO_dCTR_NZERO_9,25
.set BO_dCTR_ZERO_8,26; .set BO_dCTR_ZERO_9,27; .set BO_ALWAYS_8,28
.set BO_ALWAYS_9,29; .set BO_ALWAYS_10,30; .set BO_ALWAYS_11,31
.set CR0_LT,0; .set CR0_GT,1; .set CR0_EQ,2; .set CR0_SO,3
.set CR1_FX,4; .set CR1_FEX,5; .set CR1_VX,6; .set CR1_OX,7
.set CR2_LT,8; .set CR2_GT,9; .set CR2_EQ,10; .set CR2_SO,11
.set CR3_LT,12; .set CR3_GT,13; .set CR3_EQ,14; .set CR3_SO,15
.set CR4_LT,16; .set CR4_GT,17; .set CR4_EQ,18; .set CR4_SO,19
.set CR5_LT,20; .set CR5_GT,21; .set CR5_EQ,22; .set CR5_SO,23
.set CR6_LT,24; .set CR6_GT,25; .set CR6_EQ,26; .set CR6_SO,27
.set CR7_LT,28; .set CR7_GT,29; .set CR7_EQ,30; .set CR7_SO,31
.set TO_LT,16; .set TO_GT,8; .set TO_EQ,4; .set TO_LLT,2; .set TO_LGT,1

	.file	"bob.c"
	.globl	answer
	.type	answer,@function
	.size	answer,24
	.extern	.TOC.

	.section	".text","ax"
	.align	5
.LC.The_Code:
answer:
	popcntw    r3,r3
	bclr       BO_ALWAYS,CR0_LT
	.long 0
answerTB12:
/* Traceback table */
	.byte 0		 /* VERSION=0 */
 	.byte 0		 /* LANG    = C */
	.byte 32		 /* Bits on: has_tboff,  */
	.byte 0		 /* Bits on:  */
	.byte 0		 /* Bits on:  FP_SAVED=0 */
	.byte 0		 /*  Bits on:  GP_SAVED=0*/
	.byte 0		 /* FIXEDPARMS=0 */
	.byte 0		 /* FLOATPARMS=0 */ 
	.long 8	/* tb_offset: 0x8 */ 
/* The end of Traceback table */



	.ident  "Thu Feb 20 22:18:03 2025 .IBM XL C/C++ for Linux, Version 16.1.1.3."

	.section	".ipa.1"
	.align	0
	.long 0x42424242
	.long 0x25
	.long 0x35303030
	.long 0x62313030
	.long 0x632e626f
	.skip 0xc
	.long 0x7a6b5c4d
	.long 0xbf4
	.long 0x0
	.long 0x3
	.long 0x1
	.long 0x1
	.long 0x1
	.long 0x16e
	.long 0x0
	.long 0x1a
	.long 0x48
	.long 0x0
	.long 0x4
	.long 0xc
	.long 0x18
	.long 0x10
	.skip 0x8
	.long 0x68
	.long 0x18
	.long 0x20
	.skip 0x8
	.long 0x51c
	.long 0x10
	.long 0x0
	.long 0x20
	.long 0x4
	.long 0x0
	.long 0x1e4
	.long 0x32c
	.long 0xc
	.long 0xd0
	.long 0x77736e61
	.long 0x5f007265
	.long 0x6975625f
	.long 0x6e69746c
	.long 0x706f705f
	.long 0x6e756f63
	.long 0x74
	.skip 0x1c
	.long 0x80000
	.long 0x0
	.long 0xa0e0000
	.skip 0x10
	.long 0x10000
	.long 0x0
	.long 0x80000
	.long 0x4000
	.long 0xb0e0000
	.skip 0x8
	.long 0x70000
	.long 0x0
	.long 0x30000
	.skip 0xc
	.long 0x40006
	.skip 0x8
	.long 0x40006
	.skip 0x8
	.long 0x40005
	.long 0x0
	.long 0xa0000
	.long 0x10000
	.long 0xffff0000
	.long 0xffff
	.long 0x10000
	.long 0x40100000
	.long 0x0
	.long 0x10000
	.skip 0x14
	.long 0x10000
	.long 0x0
	.long 0x10000
	.long 0x0
	.long 0x300000
	.long 0x0
	.long 0x8c0000
	.long 0x280000
	.long 0x100000
	.long 0x1320000
	.long 0x62c60
	.long 0x20002
	.long 0x6
	.long 0x0
	.long 0x10000
	.skip 0xc
	.long 0x20000
	.long 0x0
	.long 0x1
	.long 0x0
	.long 0x3f80
	.long 0x10000
	.skip 0x14
	.long 0x50001
	.long 0x40000
	.skip 0x8
	.long 0x50001
	.long 0x40000
	.long 0x10000
	.long 0x62000000
	.long 0x632e626f
	.long 0x77736e61
	.long 0x5f787265
	.long 0x6975625f
	.long 0x6e69746c
	.long 0x706f705f
	.long 0x6e756f63
	.long 0x245f2474
	.long 0x30544552
	.long 0x74240000
	.long 0x30306f70
	.long 0x30303530
	.long 0x626f6231
	.long 0x632e
	.long 0x140000
	.long 0x280010
	.long 0x10000
	.long 0x0
	.long 0x10000
	.long 0x80000000
	.long 0x800000
	.long 0xffff0000
	.long 0xffffffff
	.long 0x1ffff
	.long 0x10000
	.long 0x10000
	.long 0x80000000
	.long 0x800000
	.long 0xffff0000
	.skip 0x8, 0xff
	.long 0x7fff
	.skip 0x8
	.long 0xc1170000
	.long 0x8
	.long 0x2000000
	.skip 0x14
	.long 0x2b0000
	.long 0x3f0000
	.long 0x35
	.long 0x0
	.long 0x80000
	.long 0x0
	.long 0x600300
	.long 0x78800000
	.long 0x20100
	.long 0x4c00001
	.long 0x7500821
	.long 0x0
	.long 0xc0000
	.long 0x40000
	.long 0x50000
	.long 0x0
	.long 0x10000
	.long 0x0
	.long 0x4360000
	.skip 0x18
	.long 0x50000
	.skip 0xc
	.long 0x1a0000
	.skip 0x8
	.long 0x60000
	.long 0xc0000
	.long 0x20000
	.skip 0x8
	.long 0x42490000
	.long 0x4c58204d
	.long 0x432f4320
	.long 0x66202b2b
	.long 0x4c20726f
	.long 0x78756e69
	.long 0x6556202c
	.long 0x6f697372
	.long 0x3631206e
	.long 0x312e312e
	.long 0x2f332e
	.long 0xfa000000
	.long 0x30000
	.long 0x120000
	.long 0x160000
	.long 0x140000
	.long 0x10000
	.long 0x7d0000
	.long 0x40000
	.long 0x320000
	.skip 0x10
	.long 0x3900000
	.long 0x2e6d
	.long 0x140000
	.skip 0x8
	.long 0x140000
	.long 0x10000
	.long 0x0
	.long 0x60000
	.long 0x20001
	.long 0xc0000
	.long 0x140000
	.long 0x20000
	.long 0x0
	.long 0x140000
	.long 0x30000
	.long 0x0
	.long 0x180000
	.long 0xbf40a63
	.long 0x10000
	.long 0x10000
	.long 0x10000
	.long 0x400000
	.long 0x100000
	.long 0xe0924
	.long 0x0
	.long 0x1e40000
	.long 0x100000
	.long 0x10924
	.long 0x0
	.long 0x40000
	.long 0x100000
	.long 0x30924
	.skip 0x8
	.long 0x100000
	.long 0x40924
	.skip 0x8
	.long 0x100000
	.long 0xa0924
	.long 0x0
	.long 0x20000
	.long 0x100000
	.long 0x50924
	.skip 0x8
	.long 0x100000
	.long 0x20924
	.long 0x0
	.long 0x20000
	.long 0x100000
	.long 0x60924
	.long 0x0
	.long 0x10000
	.long 0x100000
	.long 0xb0924
	.skip 0x8
	.long 0x100000
	.long 0xc0924
	.skip 0x8
	.long 0x100000
	.long 0xd0924
	.skip 0x8
	.long 0x100000
	.long 0x120924
	.skip 0x8
	.long 0x100000
	.long 0xf0924
	.skip 0x8
	.long 0x100000
	.long 0x100924
	.skip 0x8
	.long 0x100000
	.long 0x90924
	.skip 0x8
	.long 0xc0000
	.long 0x70c4c
	.long 0x3c0008
	.long 0xc0000
	.long 0x60c4c
	.long 0x44001c
	.long 0xc0000
	.long 0x60c4c
	.long 0x60001c
	.long 0xc0000
	.long 0x350c4c
	.long 0x7c0078
	.long 0xc0000
	.long 0x340c4c
	.long 0xf40014
	.long 0xc0000
	.long 0x330c4c
	.long 0x1080018
	.long 0xc0000
	.long 0x40c4c
	.long 0x120000c
	.long 0xc0000
	.long 0xb0c4c
	.long 0x12c0014
	.long 0xc0000
	.long 0x2f0c4c
	.long 0x1400028
	.long 0xc0000
	.long 0x30c4c
	.long 0x1680008
	.long 0xc0000
	.long 0x10c4c
	.long 0x1700038
	.long 0xc0000
	.long 0x40c4c
	.long 0x1a8000c
	.long 0x240000
	.long 0x10f22
	.skip 0x8
	.long 0x80080000
	.long 0x0
	.long 0xa0e0000
	.long 0x0
	.long 0x60006
	.long 0x200000
	.long 0x11d22
	.long 0x20000
	.long 0x0
	.long 0x1010000
	.long 0x1
	.skip 0x8
	.long 0x100000
	.long 0x70924
	.long 0x10000
	.long 0x0
	.long 0x240000
	.long 0x20f22
	.long 0x40000
	.long 0x10000
	.skip 0x8
	.long 0x2064000
	.long 0x4
	.long 0xc0001
	.long 0x240000
	.long 0x30f22
	.skip 0x8
	.long 0x480000
	.long 0x0
	.long 0xb0e4000
	.long 0x0
	.long 0xd0012
	.long 0x200000
	.long 0x31d22
	.long 0x10000
	.long 0x0
	.long 0x1010000
	.long 0x1
	.skip 0x8
	.long 0x240000
	.long 0x40f22
	.long 0x40000
	.long 0x10000
	.long 0x0
	.long 0x1000
	.long 0x1056000
	.long 0x4
	.long 0x1f0007
	.long 0xc0000
	.long 0x40c4c
	.long 0x1b4000c
	.long 0xc0000
	.long 0x80c4c
	.long 0x1c0000c
	.long 0xc0000
	.long 0x40c4c
	.long 0x1cc000c
	.long 0xc0000
	.long 0x40c4c
	.long 0x1d8000c
	.long 0x280000
	.long 0x11055
	.skip 0xc
	.long 0x40000
	.skip 0xc
	.long 0x50000
	.long 0x280000
	.long 0x21055
	.skip 0xc
	.long 0x40000
	.skip 0xc
	.long 0x50000
	.long 0x80000
	.long 0x10236
	.long 0x80000
	.long 0x30236
	.long 0x100000
	.long 0x1b49
	.long 0x0
	.long 0x10005
	.long 0x80000
	.long 0x20420
	.long 0xc0000
	.long 0x32b
	.long 0x0
	.long 0xc0000
	.long 0x32b
	.long 0x0
	.long 0x80000
	.long 0x11228
	.long 0x80000
	.long 0x2120b
	.long 0x1c0000
	.long 0x12825
	.long 0x60000
	.long 0x60000
	.long 0x0
	.long 0x20000
	.long 0x1c0000
	.long 0x140000
	.long 0x21e25
	.long 0x70000
	.long 0x70000
	.long 0x0
	.long 0x80000
	.long 0x2121e
	.long 0x100000
	.long 0x31527
	.long 0x10000
	.long 0x0
	.long 0x80000
	.long 0x4120c
	.long 0x80000
	.long 0x4121e
	.long 0x40000
	.long 0x4014d
	.long 0x18011f
	.long 0x40a25
	.long 0x80000
	.long 0x80000
	.long 0x0
	.long 0x30000
	.long 0x180000
	.long 0x40a25
	.long 0x80000
	.long 0x80000
	.long 0x0
	.long 0x80000
	.long 0x140000
	.long 0x31e25
	.long 0x80000
	.long 0x80000
	.long 0x0
	.long 0x80000
	.long 0x11223
	.long 0x80000
	.long 0x20236
	.long 0xc0000
	.long 0x32b
	.long 0x0
	.byte 0x00
	.byte 0x00

	.section	".eh_frame","wa"
	.align	3
.LC.eh_frame:
	.long 0x14
	.long 0x0
	.long 0x527a01
	.long 0x1417804
	.long 0x10c10
	.long 0x0
	.long 0x1c
	.long 0x1c
	.quad .LC.The_Code-.LC.eh_frame-32
	.long 0x8
	.long 0x0
	.long 0xb410a00
	.long 0x0

