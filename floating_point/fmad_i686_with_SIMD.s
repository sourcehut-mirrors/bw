	.text
	.file	"fmad.c"
	.file	1 "/usr/include/x86" "_types.h"
	.file	2 "/usr/include/sys" "_stdint.h"
	.section	.rodata,"a",@progbits
	.p2align	2                               # -- Begin function main
.LCPI0_0:
	.quad	0xf42c77574f722e1b              # x86_fp80 1.90760700000000000002
	.short	0x3fff
	.zero	2
.LCPI0_1:
	.quad	0xc944948486e2ddb0              # x86_fp80 -0.786202699999999999984
	.short	0xbffe
	.zero	2
.LCPI0_2:
	.quad	0x92db163baba7b917              # x86_fp80 1.14731099999999999999
	.short	0x3fff
	.zero	2
.LCPI0_3:
	.quad	0xf5dcc99a12655d52              # x86_fp80 0.960400200000000000004
	.short	0x3ffe
	.zero	2
.LCPI0_4:
	.quad	0xef7ced916872b021              # x86_fp80 -0.935500000000000000012
	.short	0xbffe
	.zero	2
.LCPI0_5:
	.quad	0xb106da0ed4af195e              # x86_fp80 -0.691510800000000000021
	.short	0xbffe
	.zero	2
.LCPI0_6:
	.quad	0xdcbb6ed6777079e6              # x86_fp80 1.72447000000000000004
	.short	0x3fff
	.zero	2
.LCPI0_7:
	.quad	0xb5b25db5bdbc8e91              # x86_fp80 -0.709752899999999999991
	.short	0xbffe
	.zero	2
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	3 "/home/dclarke/pgm/bw/floating_point" "fmad.c"
	.loc	3 43 0                          # fmad.c:43:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	andl	$-32, %esp
	subl	$544, %esp                      # imm = 0x220
	movl	12(%ebp), %eax
	movl	8(%ebp), %eax
	movl	$0, 532(%esp)
.Ltmp0:
	.loc	3 82 20 prologue_end            # fmad.c:82:20
	vmovdqu	.L__const.main.a, %xmm0
	vmovdqa	%xmm0, 512(%esp)
	.loc	3 83 20                         # fmad.c:83:20
	vmovdqu	.L__const.main.b, %xmm0
	vmovdqa	%xmm0, 496(%esp)
	.loc	3 86 21                         # fmad.c:86:21
	vmovups	.L__const.main.a64, %ymm0
	vmovaps	%ymm0, 448(%esp)
	.loc	3 87 21                         # fmad.c:87:21
	vmovups	.L__const.main.b64, %ymm0
	vmovaps	%ymm0, 416(%esp)
	vxorps	%xmm1, %xmm1, %xmm1
	.loc	3 95 26                         # fmad.c:95:26
	vmovsd	%xmm1, 392(%esp)
	vmovsd	%xmm1, 384(%esp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%ymm0, 352(%esp)
	fldt	.LCPI0_0
	fstpt	352(%esp)
	fldt	.LCPI0_1
	fstpt	364(%esp)
	fldt	.LCPI0_2
	fstpt	376(%esp)
	fldt	.LCPI0_3
	fstpt	388(%esp)
	.loc	3 96 26                         # fmad.c:96:26
	vmovsd	%xmm1, 328(%esp)
	vmovsd	%xmm1, 320(%esp)
	vmovaps	%ymm0, 288(%esp)
	fldt	.LCPI0_4
	fstpt	288(%esp)
	fldt	.LCPI0_5
	fstpt	300(%esp)
	fldt	.LCPI0_6
	fstpt	312(%esp)
	fldt	.LCPI0_7
	fstpt	324(%esp)
	.loc	3 105 5                         # fmad.c:105:5
	leal	.L.str, %eax
	movl	%eax, (%esp)
	vzeroupper
	calll	printf
.Ltmp1:
	.loc	3 106 10                        # fmad.c:106:10
	calll	endian
	cmpl	$0, %eax
.Ltmp2:
	.loc	3 106 10 is_stmt 0              # fmad.c:106:10
	je	.LBB0_2
# %bb.1:
.Ltmp3:
	.loc	3 107 9 is_stmt 1               # fmad.c:107:9
	leal	.L.str.1, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 108 5                         # fmad.c:108:5
	jmp	.LBB0_3
.Ltmp4:
.LBB0_2:
	.loc	3 109 9                         # fmad.c:109:9
	leal	.L.str.2, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp5:
.LBB0_3:
	.loc	3 111 5                         # fmad.c:111:5
	leal	.L.str.3, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 112 5                         # fmad.c:112:5
	leal	.L.str.4, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 114 5                         # fmad.c:114:5
	leal	.L.str.5, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 121 10                        # fmad.c:121:10
	vmovss	512(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 121 17 is_stmt 0              # fmad.c:121:17
	vmovss	496(%esp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	.loc	3 125 10 is_stmt 1              # fmad.c:125:10
	vmovss	516(%esp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	.loc	3 125 17 is_stmt 0              # fmad.c:125:17
	vmovss	500(%esp), %xmm3                # xmm3 = mem[0],zero,zero,zero
	.loc	3 125 15                        # fmad.c:125:15
	vmulss	%xmm3, %xmm2, %xmm2
	.loc	3 123 10 is_stmt 1              # fmad.c:123:10
	vfmadd213ss	%xmm2, %xmm0, %xmm1     # xmm1 = (xmm0 * xmm1) + xmm2
	.loc	3 129 10                        # fmad.c:129:10
	vmovss	520(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 129 17 is_stmt 0              # fmad.c:129:17
	vmovss	504(%esp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	.loc	3 127 10 is_stmt 1              # fmad.c:127:10
	vfmadd213ss	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	.loc	3 133 10                        # fmad.c:133:10
	vmovss	524(%esp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	.loc	3 133 17 is_stmt 0              # fmad.c:133:17
	vmovss	508(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 131 10 is_stmt 1              # fmad.c:131:10
	vfmadd213ss	%xmm2, %xmm1, %xmm0     # xmm0 = (xmm1 * xmm0) + xmm2
	.loc	3 119 16                        # fmad.c:119:16
	vmovss	%xmm0, 284(%esp)
	.loc	3 136 51                        # fmad.c:136:51
	vmovss	284(%esp), %xmm1                # xmm1 = mem[0],zero,zero,zero
                                        # implicit-def: $xmm0
	.loc	3 136 43 is_stmt 0              # fmad.c:136:43
	vcvtss2sd	%xmm1, %xmm0, %xmm0
	.loc	3 136 5                         # fmad.c:136:5
	leal	.L.str.6, %eax
	movl	%eax, (%esp)
	vmovsd	%xmm0, 4(%esp)
	calll	printf
	.loc	3 138 5 is_stmt 1               # fmad.c:138:5
	leal	.L.str.7, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp6:
	.loc	3 139 11                        # fmad.c:139:11
	movl	$0, 256(%esp)
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
.Ltmp7:
	.loc	3 139 16 is_stmt 0              # fmad.c:139:16
	cmpl	$4, 256(%esp)
.Ltmp8:
	.loc	3 139 5                         # fmad.c:139:5
	jae	.LBB0_7
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
.Ltmp9:
	.loc	3 140 52 is_stmt 1              # fmad.c:140:52
	movl	256(%esp), %eax
	.loc	3 140 27 is_stmt 0              # fmad.c:140:27
	movzbl	284(%esp,%eax), %eax
	.loc	3 140 9                         # fmad.c:140:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp10:
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	.loc	3 139 33 is_stmt 1              # fmad.c:139:33
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 139 5 is_stmt 0               # fmad.c:139:5
	jmp	.LBB0_4
.Ltmp11:
.LBB0_7:
	.loc	3 142 5 is_stmt 1               # fmad.c:142:5
	leal	.L.str.9, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 190 10                        # fmad.c:190:10
	vmovsd	448(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 190 19 is_stmt 0              # fmad.c:190:19
	vmovsd	416(%esp), %xmm1                # xmm1 = mem[0],zero
	.loc	3 194 10 is_stmt 1              # fmad.c:194:10
	vmovsd	456(%esp), %xmm2                # xmm2 = mem[0],zero
	.loc	3 194 19 is_stmt 0              # fmad.c:194:19
	vmovsd	424(%esp), %xmm3                # xmm3 = mem[0],zero
	.loc	3 194 17                        # fmad.c:194:17
	vmulsd	%xmm3, %xmm2, %xmm2
	.loc	3 192 10 is_stmt 1              # fmad.c:192:10
	vfmadd213sd	%xmm2, %xmm0, %xmm1     # xmm1 = (xmm0 * xmm1) + xmm2
	.loc	3 198 10                        # fmad.c:198:10
	vmovsd	464(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 198 19 is_stmt 0              # fmad.c:198:19
	vmovsd	432(%esp), %xmm2                # xmm2 = mem[0],zero
	.loc	3 196 10 is_stmt 1              # fmad.c:196:10
	vfmadd213sd	%xmm1, %xmm0, %xmm2     # xmm2 = (xmm0 * xmm2) + xmm1
	.loc	3 202 10                        # fmad.c:202:10
	vmovsd	472(%esp), %xmm1                # xmm1 = mem[0],zero
	.loc	3 202 19 is_stmt 0              # fmad.c:202:19
	vmovsd	440(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 200 10 is_stmt 1              # fmad.c:200:10
	vfmadd213sd	%xmm2, %xmm1, %xmm0     # xmm0 = (xmm1 * xmm0) + xmm2
	.loc	3 188 16                        # fmad.c:188:16
	vmovsd	%xmm0, 272(%esp)
	.loc	3 204 43                        # fmad.c:204:43
	vmovsd	272(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 204 5 is_stmt 0               # fmad.c:204:5
	leal	.L.str.10, %eax
	movl	%eax, (%esp)
	vmovsd	%xmm0, 4(%esp)
	calll	printf
	.loc	3 205 5 is_stmt 1               # fmad.c:205:5
	leal	.L.str.11, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp12:
	.loc	3 206 11                        # fmad.c:206:11
	movl	$0, 256(%esp)
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
.Ltmp13:
	.loc	3 206 16 is_stmt 0              # fmad.c:206:16
	cmpl	$8, 256(%esp)
.Ltmp14:
	.loc	3 206 5                         # fmad.c:206:5
	jae	.LBB0_11
# %bb.9:                                #   in Loop: Header=BB0_8 Depth=1
.Ltmp15:
	.loc	3 207 52 is_stmt 1              # fmad.c:207:52
	movl	256(%esp), %eax
	.loc	3 207 27 is_stmt 0              # fmad.c:207:27
	movzbl	272(%esp,%eax), %eax
	.loc	3 207 9                         # fmad.c:207:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp16:
# %bb.10:                               #   in Loop: Header=BB0_8 Depth=1
	.loc	3 206 34 is_stmt 1              # fmad.c:206:34
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 206 5 is_stmt 0               # fmad.c:206:5
	jmp	.LBB0_8
.Ltmp17:
.LBB0_11:
	.loc	3 209 5 is_stmt 1               # fmad.c:209:5
	movl	%esp, %eax
	movl	$.L.str.9, (%eax)
	calll	printf
	.loc	3 222 10                        # fmad.c:222:10
	fldt	352(%esp)
	.loc	3 222 20 is_stmt 0              # fmad.c:222:20
	fldt	288(%esp)
	.loc	3 226 10 is_stmt 1              # fmad.c:226:10
	fldt	364(%esp)
	.loc	3 226 20 is_stmt 0              # fmad.c:226:20
	fldt	300(%esp)
	.loc	3 226 18                        # fmad.c:226:18
	fmulp	%st, %st(1)
	.loc	3 224 10 is_stmt 1              # fmad.c:224:10
	fxch	%st(2)
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	.loc	3 230 10                        # fmad.c:230:10
	fldt	376(%esp)
	.loc	3 230 20 is_stmt 0              # fmad.c:230:20
	fldt	312(%esp)
	.loc	3 228 10 is_stmt 1              # fmad.c:228:10
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	.loc	3 234 10                        # fmad.c:234:10
	fldt	388(%esp)
	.loc	3 234 20 is_stmt 0              # fmad.c:234:20
	fldt	324(%esp)
	.loc	3 232 10 is_stmt 1              # fmad.c:232:10
	fmulp	%st, %st(1)
	faddp	%st, %st(1)
	.loc	3 220 17                        # fmad.c:220:17
	fstpt	260(%esp)
	.loc	3 236 44                        # fmad.c:236:44
	fldt	260(%esp)
	.loc	3 236 5 is_stmt 0               # fmad.c:236:5
	movl	%esp, %eax
	fstpt	4(%eax)
	movl	$.L.str.12, (%eax)
	calll	printf
	.loc	3 237 5 is_stmt 1               # fmad.c:237:5
	leal	.L.str.13, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp18:
	.loc	3 238 11                        # fmad.c:238:11
	movl	$0, 256(%esp)
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
.Ltmp19:
	.loc	3 238 16 is_stmt 0              # fmad.c:238:16
	cmpl	$12, 256(%esp)
.Ltmp20:
	.loc	3 238 5                         # fmad.c:238:5
	jae	.LBB0_15
# %bb.13:                               #   in Loop: Header=BB0_12 Depth=1
.Ltmp21:
	.loc	3 239 53 is_stmt 1              # fmad.c:239:53
	movl	256(%esp), %eax
	.loc	3 239 27 is_stmt 0              # fmad.c:239:27
	movzbl	260(%esp,%eax), %eax
	.loc	3 239 9                         # fmad.c:239:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp22:
# %bb.14:                               #   in Loop: Header=BB0_12 Depth=1
	.loc	3 238 39 is_stmt 1              # fmad.c:238:39
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 238 5 is_stmt 0               # fmad.c:238:5
	jmp	.LBB0_12
.Ltmp23:
.LBB0_15:
	.loc	3 241 5 is_stmt 1               # fmad.c:241:5
	leal	.L.str.14, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 243 5                         # fmad.c:243:5
	leal	.L.str.15, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 266 24                        # fmad.c:266:24
	vmovss	524(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 200(%esp)                # 4-byte Spill
	.loc	3 266 30 is_stmt 0              # fmad.c:266:30
	vmovss	508(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 204(%esp)                # 4-byte Spill
	.loc	3 266 42                        # fmad.c:266:42
	vmovss	520(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 192(%esp)                # 4-byte Spill
	.loc	3 266 48                        # fmad.c:266:48
	vmovss	504(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 196(%esp)                # 4-byte Spill
	.loc	3 266 60                        # fmad.c:266:60
	vmovss	516(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 184(%esp)                # 4-byte Spill
	.loc	3 266 66                        # fmad.c:266:66
	vmovss	500(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 188(%esp)                # 4-byte Spill
	.loc	3 266 78                        # fmad.c:266:78
	vmovss	512(%esp), %xmm2                # xmm2 = mem[0],zero,zero,zero
	.loc	3 266 84                        # fmad.c:266:84
	vmovss	496(%esp), %xmm1                # xmm1 = mem[0],zero,zero,zero
	.loc	3 266 72                        # fmad.c:266:72
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm2, (%esp)
	vmovss	%xmm1, 4(%esp)
	vmovss	%xmm0, 8(%esp)
	calll	fmaf
	vmovss	184(%esp), %xmm2                # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	188(%esp), %xmm1                # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	fstps	240(%esp)
	movss	240(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 266 54                        # fmad.c:266:54
	vmovss	%xmm2, (%esp)
	vmovss	%xmm1, 4(%esp)
	vmovss	%xmm0, 8(%esp)
	calll	fmaf
	vmovss	192(%esp), %xmm2                # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	196(%esp), %xmm1                # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	fstps	244(%esp)
	movss	244(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 266 36                        # fmad.c:266:36
	vmovss	%xmm2, (%esp)
	vmovss	%xmm1, 4(%esp)
	vmovss	%xmm0, 8(%esp)
	calll	fmaf
	vmovss	200(%esp), %xmm2                # 4-byte Reload
                                        # xmm2 = mem[0],zero,zero,zero
	vmovss	204(%esp), %xmm1                # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	fstps	248(%esp)
	movss	248(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 266 18                        # fmad.c:266:18
	vmovss	%xmm2, (%esp)
	vmovss	%xmm1, 4(%esp)
	vmovss	%xmm0, 8(%esp)
	calll	fmaf
	fstps	252(%esp)
	movss	252(%esp), %xmm0                # xmm0 = mem[0],zero,zero,zero
	.loc	3 266 16                        # fmad.c:266:16
	vmovss	%xmm0, 284(%esp)
	.loc	3 268 51 is_stmt 1              # fmad.c:268:51
	vmovss	284(%esp), %xmm1                # xmm1 = mem[0],zero,zero,zero
                                        # implicit-def: $xmm0
	.loc	3 268 43 is_stmt 0              # fmad.c:268:43
	vcvtss2sd	%xmm1, %xmm0, %xmm0
	.loc	3 268 5                         # fmad.c:268:5
	leal	.L.str.16, %eax
	movl	%eax, (%esp)
	vmovsd	%xmm0, 4(%esp)
	calll	printf
	.loc	3 270 5 is_stmt 1               # fmad.c:270:5
	leal	.L.str.7, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp24:
	.loc	3 271 11                        # fmad.c:271:11
	movl	$0, 256(%esp)
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
.Ltmp25:
	.loc	3 271 16 is_stmt 0              # fmad.c:271:16
	cmpl	$4, 256(%esp)
.Ltmp26:
	.loc	3 271 5                         # fmad.c:271:5
	jae	.LBB0_19
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=1
.Ltmp27:
	.loc	3 272 52 is_stmt 1              # fmad.c:272:52
	movl	256(%esp), %eax
	.loc	3 272 27 is_stmt 0              # fmad.c:272:27
	movzbl	284(%esp,%eax), %eax
	.loc	3 272 9                         # fmad.c:272:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp28:
# %bb.18:                               #   in Loop: Header=BB0_16 Depth=1
	.loc	3 271 33 is_stmt 1              # fmad.c:271:33
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 271 5 is_stmt 0               # fmad.c:271:5
	jmp	.LBB0_16
.Ltmp29:
.LBB0_19:
	.loc	3 274 5 is_stmt 1               # fmad.c:274:5
	leal	.L.str.9, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 278 23                        # fmad.c:278:23
	vmovsd	472(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 168(%esp)                # 8-byte Spill
	.loc	3 278 31 is_stmt 0              # fmad.c:278:31
	vmovsd	440(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 176(%esp)                # 8-byte Spill
	.loc	3 278 44                        # fmad.c:278:44
	vmovsd	464(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 152(%esp)                # 8-byte Spill
	.loc	3 278 52                        # fmad.c:278:52
	vmovsd	432(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 160(%esp)                # 8-byte Spill
	.loc	3 278 65                        # fmad.c:278:65
	vmovsd	456(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 136(%esp)                # 8-byte Spill
	.loc	3 278 73                        # fmad.c:278:73
	vmovsd	424(%esp), %xmm0                # xmm0 = mem[0],zero
	vmovsd	%xmm0, 144(%esp)                # 8-byte Spill
	.loc	3 278 86                        # fmad.c:278:86
	vmovsd	448(%esp), %xmm2                # xmm2 = mem[0],zero
	.loc	3 278 94                        # fmad.c:278:94
	vmovsd	416(%esp), %xmm1                # xmm1 = mem[0],zero
	.loc	3 278 81                        # fmad.c:278:81
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	%xmm2, (%esp)
	vmovsd	%xmm1, 8(%esp)
	vmovsd	%xmm0, 16(%esp)
	calll	fma
	vmovsd	136(%esp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	144(%esp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	fstpl	208(%esp)
	movsd	208(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 278 60                        # fmad.c:278:60
	vmovsd	%xmm2, (%esp)
	vmovsd	%xmm1, 8(%esp)
	vmovsd	%xmm0, 16(%esp)
	calll	fma
	vmovsd	152(%esp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	160(%esp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	fstpl	216(%esp)
	movsd	216(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 278 39                        # fmad.c:278:39
	vmovsd	%xmm2, (%esp)
	vmovsd	%xmm1, 8(%esp)
	vmovsd	%xmm0, 16(%esp)
	calll	fma
	vmovsd	168(%esp), %xmm2                # 8-byte Reload
                                        # xmm2 = mem[0],zero
	vmovsd	176(%esp), %xmm1                # 8-byte Reload
                                        # xmm1 = mem[0],zero
	fstpl	224(%esp)
	movsd	224(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 278 18                        # fmad.c:278:18
	vmovsd	%xmm2, (%esp)
	vmovsd	%xmm1, 8(%esp)
	vmovsd	%xmm0, 16(%esp)
	calll	fma
	fstpl	232(%esp)
	movsd	232(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 278 16                        # fmad.c:278:16
	vmovsd	%xmm0, 272(%esp)
	.loc	3 280 43 is_stmt 1              # fmad.c:280:43
	vmovsd	272(%esp), %xmm0                # xmm0 = mem[0],zero
	.loc	3 280 5 is_stmt 0               # fmad.c:280:5
	leal	.L.str.17, %eax
	movl	%eax, (%esp)
	vmovsd	%xmm0, 4(%esp)
	calll	printf
	.loc	3 281 5 is_stmt 1               # fmad.c:281:5
	leal	.L.str.11, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp30:
	.loc	3 282 11                        # fmad.c:282:11
	movl	$0, 256(%esp)
.LBB0_20:                               # =>This Inner Loop Header: Depth=1
.Ltmp31:
	.loc	3 282 16 is_stmt 0              # fmad.c:282:16
	cmpl	$8, 256(%esp)
.Ltmp32:
	.loc	3 282 5                         # fmad.c:282:5
	jae	.LBB0_23
# %bb.21:                               #   in Loop: Header=BB0_20 Depth=1
.Ltmp33:
	.loc	3 283 52 is_stmt 1              # fmad.c:283:52
	movl	256(%esp), %eax
	.loc	3 283 27 is_stmt 0              # fmad.c:283:27
	movzbl	272(%esp,%eax), %eax
	.loc	3 283 9                         # fmad.c:283:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp34:
# %bb.22:                               #   in Loop: Header=BB0_20 Depth=1
	.loc	3 282 34 is_stmt 1              # fmad.c:282:34
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 282 5 is_stmt 0               # fmad.c:282:5
	jmp	.LBB0_20
.Ltmp35:
.LBB0_23:
	.loc	3 285 5 is_stmt 1               # fmad.c:285:5
	movl	%esp, %eax
	movl	$.L.str.9, (%eax)
	calll	printf
	.loc	3 289 25                        # fmad.c:289:25
	fldt	388(%esp)
	fstpt	124(%esp)                       # 10-byte Folded Spill
	.loc	3 289 34 is_stmt 0              # fmad.c:289:34
	fldt	324(%esp)
	fstpt	112(%esp)                       # 10-byte Folded Spill
	.loc	3 289 49                        # fmad.c:289:49
	fldt	376(%esp)
	fstpt	100(%esp)                       # 10-byte Folded Spill
	.loc	3 289 58                        # fmad.c:289:58
	fldt	312(%esp)
	fstpt	88(%esp)                        # 10-byte Folded Spill
	.loc	3 289 73                        # fmad.c:289:73
	fldt	364(%esp)
	fstpt	76(%esp)                        # 10-byte Folded Spill
	.loc	3 289 82                        # fmad.c:289:82
	fldt	300(%esp)
	fstpt	64(%esp)                        # 10-byte Folded Spill
	.loc	3 289 97                        # fmad.c:289:97
	fldt	352(%esp)
	.loc	3 289 106                       # fmad.c:289:106
	fldt	288(%esp)
	.loc	3 289 91                        # fmad.c:289:91
	movl	%esp, %eax
	fldz
	fstpt	24(%eax)
	fstpt	12(%eax)
	fstpt	(%eax)
	calll	fmal
	fldt	64(%esp)                        # 10-byte Folded Reload
	fldt	76(%esp)                        # 10-byte Folded Reload
	.loc	3 289 67                        # fmad.c:289:67
	movl	%esp, %eax
	fxch	%st(2)
	fstpt	24(%eax)
	fstpt	12(%eax)
	fstpt	(%eax)
	calll	fmal
	fldt	88(%esp)                        # 10-byte Folded Reload
	fldt	100(%esp)                       # 10-byte Folded Reload
	.loc	3 289 43                        # fmad.c:289:43
	movl	%esp, %eax
	fxch	%st(2)
	fstpt	24(%eax)
	fstpt	12(%eax)
	fstpt	(%eax)
	calll	fmal
	fldt	112(%esp)                       # 10-byte Folded Reload
	fldt	124(%esp)                       # 10-byte Folded Reload
	.loc	3 289 19                        # fmad.c:289:19
	movl	%esp, %eax
	fxch	%st(2)
	fstpt	24(%eax)
	fstpt	12(%eax)
	fstpt	(%eax)
	calll	fmal
	.loc	3 289 17                        # fmad.c:289:17
	fstpt	260(%esp)
	.loc	3 291 44 is_stmt 1              # fmad.c:291:44
	fldt	260(%esp)
	.loc	3 291 5 is_stmt 0               # fmad.c:291:5
	movl	%esp, %eax
	fstpt	4(%eax)
	movl	$.L.str.18, (%eax)
	calll	printf
	.loc	3 292 5 is_stmt 1               # fmad.c:292:5
	leal	.L.str.13, %eax
	movl	%eax, (%esp)
	calll	printf
.Ltmp36:
	.loc	3 293 11                        # fmad.c:293:11
	movl	$0, 256(%esp)
.LBB0_24:                               # =>This Inner Loop Header: Depth=1
.Ltmp37:
	.loc	3 293 16 is_stmt 0              # fmad.c:293:16
	cmpl	$12, 256(%esp)
.Ltmp38:
	.loc	3 293 5                         # fmad.c:293:5
	jae	.LBB0_27
# %bb.25:                               #   in Loop: Header=BB0_24 Depth=1
.Ltmp39:
	.loc	3 294 53 is_stmt 1              # fmad.c:294:53
	movl	256(%esp), %eax
	.loc	3 294 27 is_stmt 0              # fmad.c:294:27
	movzbl	260(%esp,%eax), %eax
	.loc	3 294 9                         # fmad.c:294:9
	leal	.L.str.8, %ecx
	movl	%ecx, (%esp)
	movl	%eax, 4(%esp)
	calll	printf
.Ltmp40:
# %bb.26:                               #   in Loop: Header=BB0_24 Depth=1
	.loc	3 293 39 is_stmt 1              # fmad.c:293:39
	movl	256(%esp), %eax
	addl	$1, %eax
	movl	%eax, 256(%esp)
	.loc	3 293 5 is_stmt 0               # fmad.c:293:5
	jmp	.LBB0_24
.Ltmp41:
.LBB0_27:
	.loc	3 296 5 is_stmt 1               # fmad.c:296:5
	leal	.L.str.19, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 298 5                         # fmad.c:298:5
	leal	.L.str.20, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 302 5                         # fmad.c:302:5
	leal	.L.str.21, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 303 5                         # fmad.c:303:5
	leal	.L.str.22, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 304 5                         # fmad.c:304:5
	leal	.L.str.23, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 305 5                         # fmad.c:305:5
	leal	.L.str.24, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 306 5                         # fmad.c:306:5
	leal	.L.str.25, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 308 5                         # fmad.c:308:5
	leal	.L.str.26, %eax
	movl	%eax, (%esp)
	calll	printf
	.loc	3 310 5                         # fmad.c:310:5
	movl	$42, %eax
	movl	%ebp, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp42:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function endian
	.type	endian,@function
endian:                                 # @endian
.Lfunc_begin1:
	.loc	3 315 0                         # fmad.c:315:0
	.cfi_startproc
# %bb.0:
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register %ebp
	pushl	%eax
.Ltmp43:
	.loc	3 316 9 prologue_end            # fmad.c:316:9
	movl	$1, -4(%ebp)
	.loc	3 317 14                        # fmad.c:317:14
	movzbl	-4(%ebp), %edx
	.loc	3 317 13 is_stmt 0              # fmad.c:317:13
	movl	$1, %eax
	xorl	%ecx, %ecx
	.loc	3 317 32                        # fmad.c:317:32
	cmpl	$1, %edx
	.loc	3 317 13                        # fmad.c:317:13
	cmovel	%ecx, %eax
	.loc	3 317 11                        # fmad.c:317:11
	movl	%eax, -4(%ebp)
	.loc	3 318 12 is_stmt 1              # fmad.c:318:12
	movl	-4(%ebp), %eax
	.loc	3 318 5 is_stmt 0               # fmad.c:318:5
	addl	$4, %esp
	popl	%ebp
	.cfi_def_cfa %esp, 4
	retl
.Ltmp44:
.Lfunc_end1:
	.size	endian, .Lfunc_end1-endian
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.a,@object        # @__const.main.a
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	2
.L__const.main.a:
	.long	0x3ff42c77                      # float 1.90760696
	.long	0xbf494495                      # float -0.786202728
	.long	0x3f92db16                      # float 1.14731097
	.long	0x3f75dcca                      # float 0.960400223
	.size	.L__const.main.a, 16

	.type	.L__const.main.b,@object        # @__const.main.b
	.p2align	2
.L__const.main.b:
	.long	0xbf6f7cee                      # float -0.935500025
	.long	0xbf3106da                      # float -0.691510797
	.long	0x3fdcbb6f                      # float 1.72447002
	.long	0xbf35b25e                      # float -0.709752917
	.size	.L__const.main.b, 16

	.type	.L__const.main.a64,@object      # @__const.main.a64
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	3
.L__const.main.a64:
	.quad	0x3ffe858eeae9ee46              # double 1.9076070000000001
	.quad	0xbfe928929090dc5c              # double -0.78620270000000003
	.quad	0x3ff25b62c77574f7              # double 1.147311
	.quad	0x3feebb9933424cac              # double 0.96040020000000003
	.size	.L__const.main.a64, 32

	.type	.L__const.main.b64,@object      # @__const.main.b64
	.p2align	3
.L__const.main.b64:
	.quad	0xbfedef9db22d0e56              # double -0.9355
	.quad	0xbfe620db41da95e3              # double -0.69151079999999998
	.quad	0x3ffb976ddaceee0f              # double 1.7244699999999999
	.quad	0xbfe6b64bb6b7b792              # double -0.70975290000000002
	.size	.L__const.main.b64, 32

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"NOTE : this machine is a "
	.size	.L.str, 26

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"big"
	.size	.L.str.1, 4

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"little"
	.size	.L.str.2, 7

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	" endian architecture.\n"
	.size	.L.str.3, 23

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"     : Be sure to adjust your brain accordingly.\n\n\n"
	.size	.L.str.4, 52

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"--------------- Maybe no FMA Calls ---------------\n\n"
	.size	.L.str.5, 53

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"        fp32  = %-+24.18e\n"
	.size	.L.str.6, 27

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	" dotme_fp32  is "
	.size	.L.str.7, 17

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"0x%02x "
	.size	.L.str.8, 8

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"\n\n"
	.size	.L.str.9, 3

	.type	.L.str.10,@object               # @.str.10
.L.str.10:
	.asciz	"        fp64  = %-+24.18e\n"
	.size	.L.str.10, 27

	.type	.L.str.11,@object               # @.str.11
.L.str.11:
	.asciz	" dotme_fp64  is "
	.size	.L.str.11, 17

	.type	.L.str.12,@object               # @.str.12
.L.str.12:
	.asciz	"        fp128 = %-+24.18Le\n"
	.size	.L.str.12, 28

	.type	.L.str.13,@object               # @.str.13
.L.str.13:
	.asciz	" dotme_fp128 is "
	.size	.L.str.13, 17

	.type	.L.str.14,@object               # @.str.14
.L.str.14:
	.asciz	"\n\n\n\n"
	.size	.L.str.14, 5

	.type	.L.str.15,@object               # @.str.15
.L.str.15:
	.asciz	"-------------------- FMA Calls -------------------\n\n"
	.size	.L.str.15, 53

	.type	.L.str.16,@object               # @.str.16
.L.str.16:
	.asciz	"  fmaf fp32   = %-+24.18e\n"
	.size	.L.str.16, 27

	.type	.L.str.17,@object               # @.str.17
.L.str.17:
	.asciz	"  fma  fp64   = %-+24.18e\n"
	.size	.L.str.17, 27

	.type	.L.str.18,@object               # @.str.18
.L.str.18:
	.asciz	"  fmal fp128  = %-+24.18Le\n"
	.size	.L.str.18, 28

	.type	.L.str.19,@object               # @.str.19
.L.str.19:
	.asciz	"\n\n\n"
	.size	.L.str.19, 4

	.type	.L.str.20,@object               # @.str.20
.L.str.20:
	.asciz	"--------------------------------------------------\n\n"
	.size	.L.str.20, 53

	.type	.L.str.21,@object               # @.str.21
.L.str.21:
	.asciz	"\nCorrect result is +5.595788259858e-02\n"
	.size	.L.str.21, 40

	.type	.L.str.22,@object               # @.str.22
.L.str.22:
	.asciz	"or this    0x3faca682f76db9b9 from ARMv8\n"
	.size	.L.str.22, 42

	.type	.L.str.23,@object               # @.str.23
.L.str.23:
	.asciz	"or maybe   0x3faca682f76db9b9 on Fujitsu SPARC VII+\n"
	.size	.L.str.23, 53

	.type	.L.str.24,@object               # @.str.24
.L.str.24:
	.asciz	"Same thing on Intel Core i5-7300U K8-class CPU\n"
	.size	.L.str.24, 48

	.type	.L.str.25,@object               # @.str.25
.L.str.25:
	.asciz	"also fp128 0x3ffaca682f76db9db367bf4a016eb28a\n"
	.size	.L.str.25, 47

	.type	.L.str.26,@object               # @.str.26
.L.str.26:
	.asciz	"\nNOTE : IBM Power systems may report strange fp128 hex values\n"
	.size	.L.str.26, 63

	.file	4 "/usr/include" "stdio.h"
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	53                              # DW_TAG_volatile_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	4                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x1bb DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.long	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x26:0x7 DW_TAG_base_type
	.long	.Linfo_string3                  # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x2d:0x5 DW_TAG_pointer_type
	.long	50                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x32:0xb DW_TAG_typedef
	.long	61                              # DW_AT_type
	.long	.Linfo_string6                  # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.byte	4                               # Abbrev [4] 0x3d:0xb DW_TAG_typedef
	.long	72                              # DW_AT_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x48:0x7 DW_TAG_base_type
	.long	.Linfo_string4                  # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x4f:0xc8 DW_TAG_subprogram
	.long	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string7                  # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	42                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	317                             # DW_AT_type
                                        # DW_AT_external
	.byte	6                               # Abbrev [6] 0x64:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	8
	.long	.Linfo_string10                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	42                              # DW_AT_decl_line
	.long	317                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x72:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	12
	.long	.Linfo_string11                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	42                              # DW_AT_decl_line
	.long	324                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x80:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\200\004"
	.long	.Linfo_string13                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	82                              # DW_AT_decl_line
	.long	341                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x8f:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\360\003"
	.long	.Linfo_string16                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	83                              # DW_AT_decl_line
	.long	341                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x9e:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\300\003"
	.long	.Linfo_string17                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	86                              # DW_AT_decl_line
	.long	372                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xad:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\240\003"
	.long	.Linfo_string18                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	87                              # DW_AT_decl_line
	.long	372                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xbc:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\340\002"
	.long	.Linfo_string19                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	95                              # DW_AT_decl_line
	.long	389                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xcb:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\240\002"
	.long	.Linfo_string21                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	96                              # DW_AT_decl_line
	.long	389                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xda:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\234\002"
	.long	.Linfo_string22                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	99                              # DW_AT_decl_line
	.long	353                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xe9:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\220\002"
	.long	.Linfo_string23                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	100                             # DW_AT_decl_line
	.long	384                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xf8:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\204\002"
	.long	.Linfo_string24                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	101                             # DW_AT_decl_line
	.long	401                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x107:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	116
	.ascii	"\200\002"
	.long	.Linfo_string25                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	103                             # DW_AT_decl_line
	.long	413                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x117:0x26 DW_TAG_subprogram
	.long	.Lfunc_begin1                   # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	85
	.long	.Linfo_string9                  # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	314                             # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	317                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x12d:0xf DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	124
	.long	.Linfo_string30                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.short	316                             # DW_AT_decl_line
	.long	317                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x13d:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x144:0x5 DW_TAG_pointer_type
	.long	329                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x149:0x5 DW_TAG_pointer_type
	.long	334                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x14e:0x7 DW_TAG_base_type
	.long	.Linfo_string12                 # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x155:0xc DW_TAG_array_type
	.long	353                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x15a:0x6 DW_TAG_subrange_type
	.long	365                             # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	12                              # Abbrev [12] 0x161:0x5 DW_TAG_volatile_type
	.long	358                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x166:0x7 DW_TAG_base_type
	.long	.Linfo_string14                 # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	13                              # Abbrev [13] 0x16d:0x7 DW_TAG_base_type
	.long	.Linfo_string15                 # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	10                              # Abbrev [10] 0x174:0xc DW_TAG_array_type
	.long	384                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x179:0x6 DW_TAG_subrange_type
	.long	365                             # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	12                              # Abbrev [12] 0x180:0x5 DW_TAG_volatile_type
	.long	38                              # DW_AT_type
	.byte	10                              # Abbrev [10] 0x185:0xc DW_TAG_array_type
	.long	401                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x18a:0x6 DW_TAG_subrange_type
	.long	365                             # DW_AT_type
	.byte	4                               # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	12                              # Abbrev [12] 0x191:0x5 DW_TAG_volatile_type
	.long	406                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x196:0x7 DW_TAG_base_type
	.long	.Linfo_string20                 # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	12                              # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x19d:0xb DW_TAG_typedef
	.long	424                             # DW_AT_type
	.long	.Linfo_string29                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	50                              # DW_AT_decl_line
	.byte	4                               # Abbrev [4] 0x1a8:0xb DW_TAG_typedef
	.long	435                             # DW_AT_type
	.long	.Linfo_string28                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	115                             # DW_AT_decl_line
	.byte	4                               # Abbrev [4] 0x1b3:0xb DW_TAG_typedef
	.long	446                             # DW_AT_type
	.long	.Linfo_string27                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x1be:0x7 DW_TAG_base_type
	.long	.Linfo_string26                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"FreeBSD clang version 14.0.5 (https://github.com/llvm/llvm-project.git llvmorg-14.0.5-0-gc12386ae247c)" # string offset=0
.Linfo_string1:
	.asciz	"fmad.c"                        # string offset=103
.Linfo_string2:
	.asciz	"/home/dclarke/pgm/bw/floating_point" # string offset=110
.Linfo_string3:
	.asciz	"double"                        # string offset=146
.Linfo_string4:
	.asciz	"unsigned char"                 # string offset=153
.Linfo_string5:
	.asciz	"__uint8_t"                     # string offset=167
.Linfo_string6:
	.asciz	"uint8_t"                       # string offset=177
.Linfo_string7:
	.asciz	"main"                          # string offset=185
.Linfo_string8:
	.asciz	"int"                           # string offset=190
.Linfo_string9:
	.asciz	"endian"                        # string offset=194
.Linfo_string10:
	.asciz	"argc"                          # string offset=201
.Linfo_string11:
	.asciz	"argv"                          # string offset=206
.Linfo_string12:
	.asciz	"char"                          # string offset=211
.Linfo_string13:
	.asciz	"a"                             # string offset=216
.Linfo_string14:
	.asciz	"float"                         # string offset=218
.Linfo_string15:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=224
.Linfo_string16:
	.asciz	"b"                             # string offset=244
.Linfo_string17:
	.asciz	"a64"                           # string offset=246
.Linfo_string18:
	.asciz	"b64"                           # string offset=250
.Linfo_string19:
	.asciz	"a128"                          # string offset=254
.Linfo_string20:
	.asciz	"long double"                   # string offset=259
.Linfo_string21:
	.asciz	"b128"                          # string offset=271
.Linfo_string22:
	.asciz	"dotme_fp32"                    # string offset=276
.Linfo_string23:
	.asciz	"dotme_fp64"                    # string offset=287
.Linfo_string24:
	.asciz	"dotme_fp128"                   # string offset=298
.Linfo_string25:
	.asciz	"j"                             # string offset=310
.Linfo_string26:
	.asciz	"unsigned int"                  # string offset=312
.Linfo_string27:
	.asciz	"__uint32_t"                    # string offset=325
.Linfo_string28:
	.asciz	"__size_t"                      # string offset=336
.Linfo_string29:
	.asciz	"size_t"                        # string offset=345
.Linfo_string30:
	.asciz	"eflag"                         # string offset=352
	.ident	"FreeBSD clang version 14.0.5 (https://github.com/llvm/llvm-project.git llvmorg-14.0.5-0-gc12386ae247c)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym endian
	.addrsig_sym fmaf
	.addrsig_sym fma
	.addrsig_sym fmal
	.section	.debug_line,"",@progbits
.Lline_table_start0:
