	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.file	"div2.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI0_1:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "/home/dclarke/pgm/lastmiles/floating_point" "div2.c"
	.loc	1 30 0                          # div2.c:30:0
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -176
	.cfi_def_cfa_offset 176
	sd	ra, 168(sp)
	sd	s0, 160(sp)
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 176
	.cfi_def_cfa s0, 0
	add	a2, zero, a0
	mv	a3, zero
	sw	a3, -20(s0)
	sw	a0, -24(s0)
	sd	a1, -32(s0)
	lui	a0, 4279
	addiw	a0, a0, 73
	slli	a0, a0, 12
	addi	a0, a0, -1951
	slli	a0, a0, 13
	addi	a0, a0, -1089
	slli	a0, a0, 13
	addi	a0, a0, -448
.Ltmp0:
	.loc	1 36 21 prologue_end            # div2.c:36:21
	sd	a0, -104(s0)
	.loc	1 38 5                          # div2.c:38:5
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	add	a0, zero, a3
	sd	a2, -112(s0)
	sd	a3, -120(s0)
	call	setlocale
	.loc	1 39 5                          # div2.c:39:5
	sd	a0, -128(s0)
	call	sysinfo
	addi	a1, s0, -72
.Ltmp1:
	.loc	1 41 10                         # div2.c:41:10
	ld	a2, -120(s0)
	sd	a0, -136(s0)
	add	a0, zero, a2
	call	clock_gettime
	addi	a1, zero, -1
.Ltmp2:
	.loc	1 41 10 is_stmt 0               # div2.c:41:10
	bne	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:                                # %if.then
.Ltmp3:
	.loc	1 43 17 is_stmt 1               # div2.c:43:17
	lui	a0, %hi(__stderrp)
	ld	a0, %lo(__stderrp)(a0)
	.loc	1 43 9 is_stmt 0                # div2.c:43:9
	lui	a1, %hi(.L.str.1)
	addi	a1, a1, %lo(.L.str.1)
	call	fprintf
	addi	a1, zero, 1
	.loc	1 44 9 is_stmt 1                # div2.c:44:9
	sw	a1, -20(s0)
	j	.LBB0_14
.Ltmp4:
.LBB0_2:                                # %if.end
	.loc	1 0 9 is_stmt 0                 # div2.c:0:9
	mv	a0, zero
	.loc	1 47 9 is_stmt 1                # div2.c:47:9
	sd	a0, -96(s0)
.Ltmp5:
	.loc	1 48 13                         # div2.c:48:13
	sw	a0, -36(s0)
	.loc	1 48 11 is_stmt 0               # div2.c:48:11
	j	.LBB0_3
.LBB0_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
.Ltmp6:
	.loc	1 48 18                         # div2.c:48:18
	lw	a0, -36(s0)
	lui	a1, 244
	addiw	a1, a1, 575
.Ltmp7:
	.loc	1 48 5                          # div2.c:48:5
	bltu	a1, a0, .LBB0_6
	j	.LBB0_4
.LBB0_4:                                # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
.Ltmp8:
	.loc	1 49 16 is_stmt 1               # div2.c:49:16
	fld	ft0, -104(s0)
	.loc	1 49 36 is_stmt 0               # div2.c:49:36
	lwu	a0, -36(s0)
	.loc	1 49 28                         # div2.c:49:28
	fcvt.d.lu	ft1, a0
	.loc	1 49 25                         # div2.c:49:25
	fadd.d	ft0, ft0, ft1
	lui	a0, %hi(.LCPI0_1)
	fld	ft1, %lo(.LCPI0_1)(a0)
	.loc	1 49 40                         # div2.c:49:40
	fdiv.d	ft0, ft0, ft1
	.loc	1 49 13                         # div2.c:49:13
	fsd	ft0, -96(s0)
	.loc	1 50 5 is_stmt 1                # div2.c:50:5
	j	.LBB0_5
.Ltmp9:
.LBB0_5:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=1
	.loc	1 48 30                         # div2.c:48:30
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	.loc	1 48 5 is_stmt 0                # div2.c:48:5
	j	.LBB0_3
.Ltmp10:
.LBB0_6:                                # %for.end
	.loc	1 0 5                           # div2.c:0:5
	mv	a0, zero
	addi	a1, s0, -88
	.loc	1 51 5 is_stmt 1                # div2.c:51:5
	sd	a0, -144(s0)
	call	clock_gettime
	.loc	1 52 20                         # div2.c:52:20
	ld	a1, -64(s0)
	ld	a2, -72(s0)
	ld	a3, -80(s0)
	ld	a4, -88(s0)
	sd	a0, -152(s0)
	add	a0, zero, a2
	add	a2, zero, a4
	call	timediff
	.loc	1 52 18 is_stmt 0               # div2.c:52:18
	sd	a0, -48(s0)
	.loc	1 53 53 is_stmt 1               # div2.c:53:53
	ld	a1, -48(s0)
	.loc	1 53 5 is_stmt 0                # div2.c:53:5
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	.loc	1 54 5 is_stmt 1                # div2.c:54:5
	ld	a1, -96(s0)
	lui	a2, %hi(.L.str.3)
	addi	a2, a2, %lo(.L.str.3)
	sd	a0, -160(s0)
	add	a0, zero, a2
	call	printf
	.loc	1 56 9                          # div2.c:56:9
	ld	a1, -144(s0)
	sd	a1, -96(s0)
.Ltmp11:
	.loc	1 57 13                         # div2.c:57:13
	sw	a1, -36(s0)
	.loc	1 57 11 is_stmt 0               # div2.c:57:11
	j	.LBB0_7
.LBB0_7:                                # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
.Ltmp12:
	.loc	1 57 18                         # div2.c:57:18
	lw	a0, -36(s0)
	lui	a1, 244
	addiw	a1, a1, 575
.Ltmp13:
	.loc	1 57 5                          # div2.c:57:5
	bltu	a1, a0, .LBB0_10
	j	.LBB0_8
.LBB0_8:                                # %for.body12
                                        #   in Loop: Header=BB0_7 Depth=1
.Ltmp14:
	.loc	1 58 16 is_stmt 1               # div2.c:58:16
	fld	ft0, -104(s0)
	.loc	1 58 36 is_stmt 0               # div2.c:58:36
	lwu	a0, -36(s0)
	.loc	1 58 28                         # div2.c:58:28
	fcvt.d.lu	ft1, a0
	.loc	1 58 25                         # div2.c:58:25
	fadd.d	ft0, ft0, ft1
	lui	a0, %hi(.LCPI0_0)
	fld	ft1, %lo(.LCPI0_0)(a0)
	.loc	1 58 40                         # div2.c:58:40
	fmul.d	ft0, ft0, ft1
	.loc	1 58 13                         # div2.c:58:13
	fsd	ft0, -96(s0)
	.loc	1 59 5 is_stmt 1                # div2.c:59:5
	j	.LBB0_9
.Ltmp15:
.LBB0_9:                                # %for.inc15
                                        #   in Loop: Header=BB0_7 Depth=1
	.loc	1 57 30                         # div2.c:57:30
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	.loc	1 57 5 is_stmt 0                # div2.c:57:5
	j	.LBB0_7
.Ltmp16:
.LBB0_10:                               # %for.end17
	.loc	1 0 5                           # div2.c:0:5
	mv	a0, zero
	addi	a1, s0, -72
	.loc	1 60 5 is_stmt 1                # div2.c:60:5
	call	clock_gettime
	.loc	1 61 20                         # div2.c:61:20
	ld	a1, -80(s0)
	ld	a2, -88(s0)
	ld	a3, -64(s0)
	ld	a4, -72(s0)
	sd	a0, -168(s0)
	add	a0, zero, a2
	add	a2, zero, a4
	call	timediff
	.loc	1 61 18 is_stmt 0               # div2.c:61:18
	sd	a0, -56(s0)
	.loc	1 62 53 is_stmt 1               # div2.c:62:53
	ld	a1, -56(s0)
	.loc	1 62 5 is_stmt 0                # div2.c:62:5
	lui	a0, %hi(.L.str.2)
	addi	a0, a0, %lo(.L.str.2)
	call	printf
	.loc	1 63 5 is_stmt 1                # div2.c:63:5
	ld	a1, -96(s0)
	lui	a2, %hi(.L.str.4)
	addi	a2, a2, %lo(.L.str.4)
	sd	a0, -176(s0)
	add	a0, zero, a2
	call	printf
.Ltmp17:
	.loc	1 64 10                         # div2.c:64:10
	ld	a1, -48(s0)
	.loc	1 64 25 is_stmt 0               # div2.c:64:25
	ld	a2, -56(s0)
.Ltmp18:
	.loc	1 64 10                         # div2.c:64:10
	bgeu	a1, a2, .LBB0_12
	j	.LBB0_11
.LBB0_11:                               # %if.then24
.Ltmp19:
	.loc	1 65 9 is_stmt 1                # div2.c:65:9
	lui	a0, %hi(.L.str.5)
	addi	a0, a0, %lo(.L.str.5)
	call	printf
	.loc	1 66 5                          # div2.c:66:5
	j	.LBB0_13
.Ltmp20:
.LBB0_12:                               # %if.else
	.loc	1 67 9                          # div2.c:67:9
	lui	a0, %hi(.L.str.6)
	addi	a0, a0, %lo(.L.str.6)
	call	printf
	j	.LBB0_13
.Ltmp21:
.LBB0_13:                               # %if.end27
	.loc	1 0 9 is_stmt 0                 # div2.c:0:9
	mv	a0, zero
	.loc	1 70 5 is_stmt 1                # div2.c:70:5
	sw	a0, -20(s0)
	j	.LBB0_14
.LBB0_14:                               # %return
	.loc	1 72 1                          # div2.c:72:1
	lw	a0, -20(s0)
	ld	s0, 160(sp)
	ld	ra, 168(sp)
	addi	sp, sp, 176
	ret
.Ltmp22:
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

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"     : div2\n"
	.size	.L.str.5, 13

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"     : mult 0.5\n"
	.size	.L.str.6, 17

	.file	2 "/usr/include/machine" "_types.h"
	.file	3 "/usr/include/sys" "_stdint.h"
	.file	4 "/usr/include" "time.h"
	.file	5 "/usr/include/sys" "_timespec.h"
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
	.byte	4                               # Abbreviation Code
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
	.byte	5                               # Abbreviation Code
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
	.byte	6                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
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
	.byte	8                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	4                               # DWARF version number
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x15e DW_TAG_compile_unit
	.word	.Linfo_string0                  # DW_AT_producer
	.half	12                              # DW_AT_language
	.word	.Linfo_string1                  # DW_AT_name
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.word	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x7 DW_TAG_base_type
	.word	.Linfo_string3                  # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x31:0x9c DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string4                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	205                             # DW_AT_type
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0x4a:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string6                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.word	205                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x58:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.word	.Linfo_string7                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.word	212                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x66:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	92
	.word	.Linfo_string9                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	32                              # DW_AT_decl_line
	.word	229                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x74:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.word	258                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x82:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string17                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.word	258                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x90:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.word	.Linfo_string18                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.word	287                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x9f:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.word	.Linfo_string26                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.word	287                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0xae:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.word	.Linfo_string27                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	35                              # DW_AT_decl_line
	.word	42                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0xbd:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.word	.Linfo_string28                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	36                              # DW_AT_decl_line
	.word	42                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0xcd:0x7 DW_TAG_base_type
	.word	.Linfo_string5                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0xd4:0x5 DW_TAG_pointer_type
	.word	217                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xd9:0x5 DW_TAG_pointer_type
	.word	222                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0xde:0x7 DW_TAG_base_type
	.word	.Linfo_string8                  # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0xe5:0xb DW_TAG_typedef
	.word	240                             # DW_AT_type
	.word	.Linfo_string12                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0xf0:0xb DW_TAG_typedef
	.word	251                             # DW_AT_type
	.word	.Linfo_string11                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	50                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0xfb:0x7 DW_TAG_base_type
	.word	.Linfo_string10                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x102:0xb DW_TAG_typedef
	.word	269                             # DW_AT_type
	.word	.Linfo_string16                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	71                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x10d:0xb DW_TAG_typedef
	.word	280                             # DW_AT_type
	.word	.Linfo_string15                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	52                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x118:0x7 DW_TAG_base_type
	.word	.Linfo_string14                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x11f:0x21 DW_TAG_structure_type
	.word	.Linfo_string25                 # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	5                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x127:0xc DW_TAG_member
	.word	.Linfo_string19                 # DW_AT_name
	.word	320                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	47                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x133:0xc DW_TAG_member
	.word	.Linfo_string24                 # DW_AT_name
	.word	353                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x140:0xb DW_TAG_typedef
	.word	331                             # DW_AT_type
	.word	.Linfo_string23                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	67                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x14b:0xb DW_TAG_typedef
	.word	342                             # DW_AT_type
	.word	.Linfo_string22                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	79                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x156:0xb DW_TAG_typedef
	.word	353                             # DW_AT_type
	.word	.Linfo_string21                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x161:0x7 DW_TAG_base_type
	.word	.Linfo_string20                 # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"FreeBSD clang version 11.0.0 (git@github.com:llvm/llvm-project.git llvmorg-11.0.0-0-g176249bd673)" # string offset=0
.Linfo_string1:
	.asciz	"div2.c"                        # string offset=98
.Linfo_string2:
	.asciz	"/home/dclarke/pgm/lastmiles/floating_point" # string offset=105
.Linfo_string3:
	.asciz	"double"                        # string offset=148
.Linfo_string4:
	.asciz	"main"                          # string offset=155
.Linfo_string5:
	.asciz	"int"                           # string offset=160
.Linfo_string6:
	.asciz	"argc"                          # string offset=164
.Linfo_string7:
	.asciz	"argv"                          # string offset=169
.Linfo_string8:
	.asciz	"char"                          # string offset=174
.Linfo_string9:
	.asciz	"k"                             # string offset=179
.Linfo_string10:
	.asciz	"unsigned int"                  # string offset=181
.Linfo_string11:
	.asciz	"__uint32_t"                    # string offset=194
.Linfo_string12:
	.asciz	"uint32_t"                      # string offset=205
.Linfo_string13:
	.asciz	"tdelta_nsec0"                  # string offset=214
.Linfo_string14:
	.asciz	"long unsigned int"             # string offset=227
.Linfo_string15:
	.asciz	"__uint64_t"                    # string offset=245
.Linfo_string16:
	.asciz	"uint64_t"                      # string offset=256
.Linfo_string17:
	.asciz	"tdelta_nsec1"                  # string offset=265
.Linfo_string18:
	.asciz	"t0"                            # string offset=278
.Linfo_string19:
	.asciz	"tv_sec"                        # string offset=281
.Linfo_string20:
	.asciz	"long int"                      # string offset=288
.Linfo_string21:
	.asciz	"__int64_t"                     # string offset=297
.Linfo_string22:
	.asciz	"__time_t"                      # string offset=307
.Linfo_string23:
	.asciz	"time_t"                        # string offset=316
.Linfo_string24:
	.asciz	"tv_nsec"                       # string offset=323
.Linfo_string25:
	.asciz	"timespec"                      # string offset=331
.Linfo_string26:
	.asciz	"t1"                            # string offset=340
.Linfo_string27:
	.asciz	"foo"                           # string offset=343
.Linfo_string28:
	.asciz	"some_num"                      # string offset=347
	.ident	"FreeBSD clang version 11.0.0 (git@github.com:llvm/llvm-project.git llvmorg-11.0.0-0-g176249bd673)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym setlocale
	.addrsig_sym sysinfo
	.addrsig_sym clock_gettime
	.addrsig_sym fprintf
	.addrsig_sym timediff
	.addrsig_sym printf
	.addrsig_sym __stderrp
	.section	.debug_line,"",@progbits
.Lline_table_start0:
