	.text
	.file	"div2.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0x42dc12218377de40              # double 123456789012345
.LCPI0_1:
	.quad	0x3fe0000000000000              # double 0.5
.LCPI0_2:
	.quad	0x4000000000000000              # double 2
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	1 "/home/dclarke/pgm/lastmiles/floating_point" "div2.c"
	.loc	1 30 0                          # div2.c:30:0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	xorl	%eax, %eax
	movsd	.LCPI0_0(%rip), %xmm0           # xmm0 = mem[0],zero
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
.Ltmp0:
	.loc	1 36 21 prologue_end            # div2.c:36:21
	movsd	%xmm0, -88(%rbp)
	.loc	1 38 5                          # div2.c:38:5
	movl	%eax, %edi
	movabsq	$.L.str, %rsi
	callq	setlocale
	movq	%rax, -96(%rbp)                 # 8-byte Spill
	.loc	1 39 5                          # div2.c:39:5
	callq	sysinfo
	xorl	%edi, %edi
.Ltmp1:
	.loc	1 41 10                         # div2.c:41:10
	leaq	-56(%rbp), %rsi
	movl	%eax, -100(%rbp)                # 4-byte Spill
	callq	clock_gettime
	.loc	1 41 47 is_stmt 0               # div2.c:41:47
	cmpl	$-1, %eax
.Ltmp2:
	.loc	1 41 10                         # div2.c:41:10
	jne	.LBB0_2
# %bb.1:                                # %if.then
.Ltmp3:
	.loc	1 43 17 is_stmt 1               # div2.c:43:17
	movq	__stderrp, %rdi
	.loc	1 43 9 is_stmt 0                # div2.c:43:9
	movabsq	$.L.str.1, %rsi
	movb	$0, %al
	callq	fprintf
	.loc	1 44 9 is_stmt 1                # div2.c:44:9
	movl	$1, -4(%rbp)
	jmp	.LBB0_14
.Ltmp4:
.LBB0_2:                                # %if.end
	.loc	1 47 13                         # div2.c:47:13
	movl	$0, -20(%rbp)
.LBB0_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
.Ltmp5:
	.loc	1 47 19 is_stmt 0               # div2.c:47:19
	cmpl	$1000000, -20(%rbp)             # imm = 0xF4240
.Ltmp6:
	.loc	1 47 5                          # div2.c:47:5
	jae	.LBB0_6
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
	.loc	1 0 5                           # div2.c:0:5
	movsd	.LCPI0_2(%rip), %xmm0           # xmm0 = mem[0],zero
.Ltmp7:
	.loc	1 48 16 is_stmt 1               # div2.c:48:16
	movsd	-88(%rbp), %xmm1                # xmm1 = mem[0],zero
	.loc	1 48 36 is_stmt 0               # div2.c:48:36
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	.loc	1 48 28                         # div2.c:48:28
	cvtsi2sd	%rcx, %xmm2
	.loc	1 48 25                         # div2.c:48:25
	addsd	%xmm2, %xmm1
	.loc	1 48 40                         # div2.c:48:40
	divsd	%xmm0, %xmm1
	.loc	1 48 13                         # div2.c:48:13
	movsd	%xmm1, -80(%rbp)
.Ltmp8:
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=1
	.loc	1 47 30 is_stmt 1               # div2.c:47:30
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	.loc	1 47 5 is_stmt 0                # div2.c:47:5
	jmp	.LBB0_3
.Ltmp9:
.LBB0_6:                                # %for.end
	.loc	1 0 5                           # div2.c:0:5
	xorl	%edi, %edi
	.loc	1 50 5 is_stmt 1                # div2.c:50:5
	leaq	-72(%rbp), %rsi
	callq	clock_gettime
	.loc	1 51 20                         # div2.c:51:20
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movl	%eax, -104(%rbp)                # 4-byte Spill
	callq	timediff
	.loc	1 51 18 is_stmt 0               # div2.c:51:18
	movq	%rax, -32(%rbp)
	.loc	1 52 53 is_stmt 1               # div2.c:52:53
	movq	-32(%rbp), %rsi
	.loc	1 52 5 is_stmt 0                # div2.c:52:5
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
.Ltmp10:
	.loc	1 54 13 is_stmt 1               # div2.c:54:13
	movl	$0, -20(%rbp)
.LBB0_7:                                # %for.cond8
                                        # =>This Inner Loop Header: Depth=1
.Ltmp11:
	.loc	1 54 19 is_stmt 0               # div2.c:54:19
	cmpl	$1000000, -20(%rbp)             # imm = 0xF4240
.Ltmp12:
	.loc	1 54 5                          # div2.c:54:5
	jae	.LBB0_10
# %bb.8:                                # %for.body11
                                        #   in Loop: Header=BB0_7 Depth=1
	.loc	1 0 5                           # div2.c:0:5
	movsd	.LCPI0_1(%rip), %xmm0           # xmm0 = mem[0],zero
.Ltmp13:
	.loc	1 55 16 is_stmt 1               # div2.c:55:16
	movsd	-88(%rbp), %xmm1                # xmm1 = mem[0],zero
	.loc	1 55 36 is_stmt 0               # div2.c:55:36
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	.loc	1 55 28                         # div2.c:55:28
	cvtsi2sd	%rcx, %xmm2
	.loc	1 55 25                         # div2.c:55:25
	addsd	%xmm2, %xmm1
	.loc	1 55 40                         # div2.c:55:40
	mulsd	%xmm0, %xmm1
	.loc	1 55 13                         # div2.c:55:13
	movsd	%xmm1, -80(%rbp)
.Ltmp14:
# %bb.9:                                # %for.inc14
                                        #   in Loop: Header=BB0_7 Depth=1
	.loc	1 54 30 is_stmt 1               # div2.c:54:30
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	.loc	1 54 5 is_stmt 0                # div2.c:54:5
	jmp	.LBB0_7
.Ltmp15:
.LBB0_10:                               # %for.end16
	.loc	1 0 5                           # div2.c:0:5
	xorl	%edi, %edi
	.loc	1 57 5 is_stmt 1                # div2.c:57:5
	leaq	-56(%rbp), %rsi
	callq	clock_gettime
	.loc	1 58 20                         # div2.c:58:20
	movq	-72(%rbp), %rdi
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movl	%eax, -108(%rbp)                # 4-byte Spill
	callq	timediff
	.loc	1 58 18 is_stmt 0               # div2.c:58:18
	movq	%rax, -40(%rbp)
	.loc	1 59 53 is_stmt 1               # div2.c:59:53
	movq	-40(%rbp), %rsi
	.loc	1 59 5 is_stmt 0                # div2.c:59:5
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
.Ltmp16:
	.loc	1 60 10 is_stmt 1               # div2.c:60:10
	movq	-32(%rbp), %rcx
	.loc	1 60 23 is_stmt 0               # div2.c:60:23
	cmpq	-40(%rbp), %rcx
.Ltmp17:
	.loc	1 60 10                         # div2.c:60:10
	jae	.LBB0_12
# %bb.11:                               # %if.then22
.Ltmp18:
	.loc	1 61 9 is_stmt 1                # div2.c:61:9
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf
	.loc	1 62 5                          # div2.c:62:5
	jmp	.LBB0_13
.Ltmp19:
.LBB0_12:                               # %if.else
	.loc	1 63 9                          # div2.c:63:9
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
.Ltmp20:
.LBB0_13:                               # %if.end25
	.loc	1 66 5                          # div2.c:66:5
	movl	$0, -4(%rbp)
.LBB0_14:                               # %return
	.loc	1 68 1                          # div2.c:68:1
	movl	-4(%rbp), %eax
	addq	$112, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp21:
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
	.asciz	"     : div2\n"
	.size	.L.str.3, 13

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"     : mult 0.5\n"
	.size	.L.str.4, 17

	.file	2 "/usr/include/x86" "_types.h"
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
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                               # DWARF version number
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x15d DW_TAG_compile_unit
	.long	.Linfo_string0                  # DW_AT_producer
	.short	12                              # DW_AT_language
	.long	.Linfo_string1                  # DW_AT_name
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.long	.Linfo_string2                  # DW_AT_comp_dir
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x7 DW_TAG_base_type
	.long	.Linfo_string3                  # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x31:0x9b DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string4                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	204                             # DW_AT_type
                                        # DW_AT_external
	.byte	4                               # Abbrev [4] 0x4a:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	120
	.long	.Linfo_string6                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.long	204                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x58:0xe DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	112
	.long	.Linfo_string7                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	29                              # DW_AT_decl_line
	.long	211                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x66:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	108
	.long	.Linfo_string9                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	32                              # DW_AT_decl_line
	.long	228                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x74:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.long	.Linfo_string13                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.long	257                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x82:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.long	.Linfo_string17                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	33                              # DW_AT_decl_line
	.long	257                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x90:0xe DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	72
	.long	.Linfo_string18                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.long	286                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x9e:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	.Linfo_string26                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	34                              # DW_AT_decl_line
	.long	286                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0xad:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	.Linfo_string27                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	35                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0xbc:0xf DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	.Linfo_string28                 # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	36                              # DW_AT_decl_line
	.long	42                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0xcc:0x7 DW_TAG_base_type
	.long	.Linfo_string5                  # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0xd3:0x5 DW_TAG_pointer_type
	.long	216                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xd8:0x5 DW_TAG_pointer_type
	.long	221                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0xdd:0x7 DW_TAG_base_type
	.long	.Linfo_string8                  # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0xe4:0xb DW_TAG_typedef
	.long	239                             # DW_AT_type
	.long	.Linfo_string12                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	66                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0xef:0xb DW_TAG_typedef
	.long	250                             # DW_AT_type
	.long	.Linfo_string11                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0xfa:0x7 DW_TAG_base_type
	.long	.Linfo_string10                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x101:0xb DW_TAG_typedef
	.long	268                             # DW_AT_type
	.long	.Linfo_string16                 # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	71                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x10c:0xb DW_TAG_typedef
	.long	279                             # DW_AT_type
	.long	.Linfo_string15                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	63                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x117:0x7 DW_TAG_base_type
	.long	.Linfo_string14                 # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x11e:0x21 DW_TAG_structure_type
	.long	.Linfo_string25                 # DW_AT_name
	.byte	16                              # DW_AT_byte_size
	.byte	5                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x126:0xc DW_TAG_member
	.long	.Linfo_string19                 # DW_AT_name
	.long	319                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	47                              # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x132:0xc DW_TAG_member
	.long	.Linfo_string24                 # DW_AT_name
	.long	352                             # DW_AT_type
	.byte	5                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x13f:0xb DW_TAG_typedef
	.long	330                             # DW_AT_type
	.long	.Linfo_string23                 # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	67                              # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x14a:0xb DW_TAG_typedef
	.long	341                             # DW_AT_type
	.long	.Linfo_string22                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	108                             # DW_AT_decl_line
	.byte	7                               # Abbrev [7] 0x155:0xb DW_TAG_typedef
	.long	352                             # DW_AT_type
	.long	.Linfo_string21                 # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x160:0x7 DW_TAG_base_type
	.long	.Linfo_string20                 # DW_AT_name
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
