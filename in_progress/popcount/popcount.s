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

	.file	"popcount.c"
	.globl	popcount
	.type	popcount,@function
	.size	popcount,120
	.extern	.TOC.

	.section	".text","ax"
	.align	5
.LC.The_Code:
popcount:
	rldicl     r0,r3,63,1
	addis      r4,r0,21845
	addis      r5,r0,13107
	addis      r6,r0,3855
	ori        r4,r4,0x5555
	ori        r5,r5,0x3333
	ori        r6,r6,0x0f0f
	rldimi     r4,r4,32,0
	rldimi     r5,r5,32,0
	and        r0,r0,r4
	rldimi     r6,r6,32,0
	subf       r0,r0,r3
	and        r3,r0,r5
	rldicl     r0,r0,62,2
	and        r0,r0,r5
	add        r0,r0,r3
	rldicl     r3,r0,60,4
	add        r0,r0,r3
	and        r3,r0,r6
	rldicl     r0,r3,32,32
	rlwinm     r0,r0,1,0,30
	add        r0,r0,r3
	rlwinm     r3,r0,24,8,31
	add        r0,r0,r3
	rlwinm     r3,r0,0,25,31
	bclr       BO_ALWAYS,CR0_LT
	.long 0
popcountTB108:
/* Traceback table */
	.byte 0		 /* VERSION=0 */
 	.byte 0		 /* LANG    = C */
	.byte 32		 /* Bits on: has_tboff,  */
	.byte 0		 /* Bits on:  */
	.byte 0		 /* Bits on:  FP_SAVED=0 */
	.byte 0		 /*  Bits on:  GP_SAVED=0*/
	.byte 0		 /* FIXEDPARMS=0 */
	.byte 0		 /* FLOATPARMS=0 */ 
	.long 104	/* tb_offset: 0x68 */ 
/* The end of Traceback table */



	.ident  "Thu Feb 20 22:19:50 2025 .IBM XL C/C++ for Linux, Version 16.1.1.3."

	.section	".ipa.1"
	.align	0
	.long 0x42424242
	.long 0x25
	.long 0x61303030
	.long 0x70313030
	.long 0x6f63706f
	.long 0x2e746e75
	.long 0x63
	.long 0x0
	.long 0x7a6b5c4d
	.long 0xbf4
	.long 0x0
	.long 0x3
	.long 0x1
	.long 0x1
	.long 0x1
	.long 0xf5
	.long 0x0
	.long 0x9
	.long 0x24
	.long 0x0
	.long 0x4
	.long 0xc
	.long 0x0
	.long 0x10
	.skip 0x8
	.long 0x68
	.long 0x0
	.long 0x20
	.skip 0x8
	.long 0x5a0
	.long 0x10
	.long 0x0
	.long 0x10
	.skip 0x8
	.long 0x1ec
	.long 0x3a8
	.long 0xc
	.long 0x29c
	.long 0x63706f70
	.long 0x746e756f
	.skip 0x20
	.long 0x800
	.long 0x0
	.long 0xa0e00
	.skip 0x10
	.long 0x100
	.skip 0x8
	.long 0x6000000
	.long 0x800
	.long 0x0
	.long 0xa00
	.long 0x100
	.long 0xffffff00
	.long 0xff
	.long 0x401000
	.long 0x0
	.long 0x100
	.skip 0x24
	.long 0x3000
	.long 0x0
	.long 0x25800
	.long 0x5800
	.long 0x1000
	.long 0x3410f800
	.long 0x2000611
	.long 0x6000200
	.skip 0x8
	.long 0x100
	.skip 0x1c
	.long 0x1000000
	.long 0x600
	.long 0x100
	.long 0x0
	.long 0x6f700000
	.long 0x756f6370
	.long 0x632e746e
	.long 0x63706f70
	.long 0x746e756f
	.long 0x78327861
	.long 0x6e722e32
	.long 0x396e
	.long 0x70742400
	.long 0x3030306f
	.long 0x31303061
	.long 0x63706f70
	.long 0x746e756f
	.long 0x632e
	.long 0x15001400
	.long 0x2000
	.long 0x100
	.long 0x0
	.long 0x100
	.long 0x800000
	.long 0x8000
	.long 0xffffff00
	.long 0xffffffff
	.long 0x1ff
	.long 0x100
	.long 0x100
	.long 0x800000
	.long 0x8000
	.long 0xffffff00
	.skip 0x8, 0xff
	.long 0x7f
	.skip 0x8
	.long 0x8c11700
	.long 0x0
	.long 0x20000
	.skip 0x14
	.long 0x2b00
	.long 0x35003f00
	.skip 0x8
	.long 0x800
	.long 0x0
	.long 0x6003
	.long 0x788000
	.long 0x1000201
	.long 0x2104c000
	.long 0x75008
	.long 0x0
	.long 0xc00
	.long 0x400
	.long 0x500
	.long 0x0
	.long 0x100
	.long 0x0
	.long 0x43600
	.skip 0x18
	.long 0x500
	.skip 0xc
	.long 0x1a00
	.skip 0x8
	.long 0x600
	.long 0xc00
	.long 0x200
	.skip 0x8
	.long 0x4d424900
	.long 0x204c5820
	.long 0x2b432f43
	.long 0x6f66202b
	.long 0x694c2072
	.long 0x2c78756e
	.long 0x72655620
	.long 0x6e6f6973
	.long 0x2e363120
	.long 0x2e312e31
	.long 0x2f33
	.long 0xfa0000
	.long 0x3200
	.long 0x1300
	.long 0x1600
	.long 0x1400
	.long 0x100
	.long 0x7d00
	.long 0x400
	.long 0x3200
	.skip 0x10
	.long 0x4e039000
	.long 0x36
	.long 0x1400
	.skip 0x8
	.long 0x1400
	.long 0x100
	.long 0x0
	.long 0x1000600
	.long 0x200
	.long 0x1300
	.long 0x1400
	.long 0x200
	.long 0x0
	.long 0x2000600
	.long 0x300
	.long 0x1400
	.long 0x1400
	.long 0x300
	.long 0x0
	.long 0x63001800
	.long 0xbf40a
	.long 0x100
	.long 0x100
	.long 0x100
	.long 0x4000
	.long 0x24001000
	.long 0xe09
	.long 0x0
	.long 0x1ec00
	.long 0x24001000
	.long 0x109
	.long 0x0
	.long 0x300
	.long 0x24001000
	.long 0x309
	.skip 0x8
	.long 0x24001000
	.long 0x409
	.skip 0x8
	.long 0x24001000
	.long 0xa09
	.long 0x0
	.long 0x100
	.long 0x24001000
	.long 0x509
	.long 0x0
	.long 0xa00
	.long 0x24001000
	.long 0x209
	.long 0x0
	.long 0x100
	.long 0x24001000
	.long 0x609
	.long 0x0
	.long 0x100
	.long 0x24001000
	.long 0xb09
	.skip 0x8
	.long 0x24001000
	.long 0xc09
	.skip 0x8
	.long 0x24001000
	.long 0xd09
	.skip 0x8
	.long 0x24001000
	.long 0x1209
	.skip 0x8
	.long 0x24001000
	.long 0xf09
	.skip 0x8
	.long 0x24001000
	.long 0x1009
	.skip 0x8
	.long 0x24001000
	.long 0x909
	.skip 0x8
	.long 0x4c000c00
	.long 0x800070c
	.long 0x3800
	.long 0x4c000c00
	.long 0x1c00060c
	.long 0x4000
	.long 0x4c000c00
	.long 0x1c00060c
	.long 0x5c00
	.long 0x4c000c00
	.long 0x7800350c
	.long 0x7800
	.long 0x4c000c00
	.long 0x1400340c
	.long 0xf000
	.long 0x4c000c00
	.long 0x1800330c
	.long 0x10400
	.long 0x4c000c00
	.long 0xc00040c
	.long 0x11c00
	.long 0x4c000c00
	.long 0x14000b0c
	.long 0x12800
	.long 0x4c000c00
	.long 0x28002f0c
	.long 0x13c00
	.long 0x4c000c00
	.long 0x800030c
	.long 0x16400
	.long 0x4c000c00
	.long 0x3800010c
	.long 0x16c00
	.long 0x4c000c00
	.long 0xc00040c
	.long 0x1a400
	.long 0x5c001000
	.long 0x118
	.long 0x500
	.long 0x100
	.long 0x5c001c00
	.long 0x217
	.long 0x800
	.long 0x0
	.long 0x10600
	.long 0x55555500
	.long 0x55555555
	.long 0x5c001055
	.long 0x318
	.long 0x500
	.long 0x200
	.long 0x5c001c00
	.long 0x417
	.long 0x800
	.long 0x0
	.long 0x10600
	.long 0x33333300
	.long 0x33333333
	.long 0x5c001033
	.long 0x518
	.long 0x500
	.long 0x400
	.long 0x5c001c00
	.long 0x617
	.long 0x800
	.long 0x0
	.long 0x10600
	.long 0xf0f0f00
	.long 0xf0f0f0f
	.long 0x5c00100f
	.long 0x718
	.long 0x500
	.long 0x2000
	.long 0x5c001000
	.long 0x818
	.long 0x500
	.long 0x800
	.long 0x5c001c00
	.long 0x917
	.long 0x800
	.long 0x0
	.long 0x10600
	.long 0x7f00
	.long 0x0
	.long 0x5c001c00
	.long 0xa17
	.long 0x800
	.long 0x0
	.long 0x10600
	.long 0x200
	.long 0x0
	.long 0x22002400
	.long 0x10f
	.skip 0x8
	.long 0x800a00
	.long 0x0
	.long 0xa0e00
	.long 0x8000000
	.long 0xb00
	.long 0x22002000
	.long 0x11d
	.long 0x100
	.long 0x0
	.long 0x1010100
	.skip 0xc
	.long 0x24001000
	.long 0x709
	.long 0x100
	.long 0x0
	.long 0x22002400
	.long 0x20f
	.long 0x800
	.long 0x100
	.skip 0x8
	.long 0x8020640
	.long 0x1000000
	.long 0x1300
	.long 0x22002400
	.long 0x30f
	.long 0x800
	.long 0x100
	.skip 0x8
	.long 0x8010660
	.long 0x7000000
	.long 0x1600
	.long 0x4c000c00
	.long 0xc00040c
	.long 0x1b000
	.long 0x4c000c00
	.long 0xc00080c
	.long 0x1bc00
	.long 0x4c000c00
	.long 0xc00040c
	.long 0x1c800
	.long 0x4c000c00
	.long 0xc00080c
	.long 0x1d400
	.long 0x4c000c00
	.long 0xc00040c
	.long 0x1e000
	.long 0x55002800
	.long 0x110
	.skip 0xc
	.long 0x100
	.skip 0xc
	.long 0x600
	.long 0x36000800
	.long 0x102
	.long 0x36000800
	.long 0x302
	.long 0x49001000
	.long 0x1b
	.long 0xa000000
	.long 0x100
	.long 0x20000800
	.long 0x204
	.long 0x2b000c00
	.long 0x3
	.long 0x0
	.long 0x2b000c00
	.long 0x3
	.long 0x0
	.long 0x28000800
	.long 0x112
	.long 0xb000800
	.long 0x212
	.long 0x25001c00
	.long 0x128
	.long 0x2400
	.long 0x2400
	.long 0x0
	.long 0x200
	.long 0x100
	.long 0x25001400
	.long 0xc1e
	.long 0x5700
	.long 0x5700
	.long 0x0
	.long 0x1e000800
	.long 0x212
	.long 0x1e000800
	.long 0x212
	.long 0x1b000800
	.long 0x112
	.long 0x33000400
	.long 0x1b000801
	.long 0x212
	.long 0x2c000400
	.long 0x11000401
	.long 0x1b000801
	.long 0x412
	.long 0x2c000400
	.long 0x1e000801
	.long 0x212
	.long 0x1e000800
	.long 0x212
	.long 0x1b000800
	.long 0x112
	.long 0x33000400
	.long 0x1b000801
	.long 0x212
	.long 0x2c000400
	.long 0x11000401
	.long 0x1b000801
	.long 0x312
	.long 0x33000400
	.long 0x1b000801
	.long 0x412
	.long 0x2c000400
	.long 0xd000401
	.long 0x1b000801
	.long 0x512
	.long 0x33000400
	.long 0x1e000801
	.long 0x212
	.long 0x1e000800
	.long 0x212
	.long 0x1b000800
	.long 0x112
	.long 0x33000400
	.long 0x1b000801
	.long 0x212
	.long 0x2c000400
	.long 0x11000401
	.long 0x1b000801
	.long 0x412
	.long 0x2c000400
	.long 0x1e000801
	.long 0x212
	.long 0x1e000800
	.long 0x212
	.long 0x1b000800
	.long 0x112
	.long 0x33000400
	.long 0x1b000801
	.long 0x212
	.long 0x2c000400
	.long 0x11000401
	.long 0x1b000801
	.long 0x312
	.long 0x33000400
	.long 0x1b000801
	.long 0x412
	.long 0x2c000400
	.long 0xd000401
	.long 0xd000401
	.long 0x1b000801
	.long 0x612
	.long 0x2c000400
	.long 0xc000801
	.long 0x312
	.long 0x25001400
	.long 0x131e
	.long 0x7300
	.long 0x7300
	.long 0x0
	.long 0x1e000800
	.long 0x312
	.long 0x1e000800
	.long 0x312
	.long 0x1b000800
	.long 0x712
	.long 0x33000400
	.long 0x1b000801
	.long 0xa12
	.long 0x10000400
	.long 0xd000401
	.long 0x41001001
	.long 0x106
	.long 0x400
	.long 0x600
	.long 0x41000c00
	.long 0x805
	.long 0x600
	.long 0x1e000800
	.long 0x312
	.long 0x1e000800
	.long 0x312
	.long 0x1b000800
	.long 0x712
	.long 0x33000400
	.long 0x1b000801
	.long 0xa12
	.long 0x10000400
	.long 0xd000401
	.long 0x41001001
	.long 0x106
	.long 0x400
	.long 0x600
	.long 0x1b000800
	.long 0x812
	.long 0x33000400
	.long 0x41000c01
	.long 0x805
	.long 0x600
	.long 0xd000400
	.long 0x1b000801
	.long 0x912
	.long 0x2c000400
	.long 0x41001001
	.long 0x106
	.long 0x100
	.long 0x600
	.long 0x4d000400
	.long 0x1f000401
	.long 0x25001801
	.long 0x150a
	.long 0x7500
	.long 0x7500
	.long 0x0
	.long 0x300
	.long 0x25001800
	.long 0x150a
	.long 0x7500
	.long 0x7500
	.long 0x0
	.long 0x800
	.long 0x25001400
	.long 0x141e
	.long 0x7500
	.long 0x7500
	.long 0x0
	.long 0x23000800
	.long 0x112
	.long 0x36000800
	.long 0x202
	.long 0x2b000c00
	.long 0x3
	.long 0x0
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
	.long 0x68
	.long 0x0
	.long 0xb590a00
	.long 0x0

