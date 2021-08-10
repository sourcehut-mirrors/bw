	.file	"div2.c"
	.text
.Ltext0:
	.section	.rodata
.LC1:
	.string	"C"
	.align 4
.LC2:
	.string	"ERROR : could not attain CLOCK_REALTIME\n"
.LC4:
	.string	"     : time delta %llu nsecs\n"
.LC5:
	.string	" foo = %32.26e\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "./div2.c"
	.loc 1 30 1
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$64, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	.loc 1 36 21
	fldl	.LC0@GOTOFF(%ebx)
	fstpl	16(%esp)
	.loc 1 38 5
	leal	.LC1@GOTOFF(%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$6, (%esp)
	call	setlocale@PLT
	.loc 1 39 5
	call	sysinfo@PLT
	.loc 1 41 10
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime@PLT
	.loc 1 41 8
	cmpl	$-1, %eax
	jne	.L2
	.loc 1 43 9
	movl	stderr@GOT(%ebx), %eax
	movl	(%eax), %eax
	leal	.LC2@GOTOFF(%ebx), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf@PLT
	.loc 1 44 15
	movl	$1, %eax
	jmp	.L8
.L2:
	.loc 1 47 13
	movl	$0, %esi
	.loc 1 47 5
	jmp	.L4
.L5:
	.loc 1 48 25 discriminator 3
	fldl	16(%esp)
	.loc 1 48 28 discriminator 3
	movl	%esi, 24(%esp)
	movl	$0, 28(%esp)
	fildq	24(%esp)
	fstpl	24(%esp)
	fldl	24(%esp)
	.loc 1 48 25 discriminator 3
	faddp	%st, %st(1)
	.loc 1 48 40 discriminator 3
	fldt	.LC3@GOTOFF(%ebx)
	fdivrp	%st, %st(1)
	.loc 1 48 13 discriminator 3
	fstpl	24(%esp)
	.loc 1 47 30 discriminator 3
	incl	%esi
.L4:
	.loc 1 47 5 discriminator 1
	cmpl	$999999, %esi
	jbe	.L5
	.loc 1 50 5
	leal	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime@PLT
	.loc 1 51 19
	movl	40(%esp), %eax
	movl	44(%esp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	timediff@PLT
	movl	%eax, 56(%esp)
	movl	%edx, 60(%esp)
	.loc 1 52 5
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	leal	.LC4@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	printf@PLT
	.loc 1 53 5
	fldl	24(%esp)
	fstpl	4(%esp)
	leal	.LC5@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	printf@PLT
	.loc 1 55 13
	movl	$0, %esi
	.loc 1 55 5
	jmp	.L6
.L7:
	.loc 1 56 25 discriminator 3
	fldl	16(%esp)
	.loc 1 56 28 discriminator 3
	movl	%esi, 24(%esp)
	movl	$0, 28(%esp)
	fildq	24(%esp)
	fstpl	24(%esp)
	fldl	24(%esp)
	.loc 1 56 25 discriminator 3
	faddp	%st, %st(1)
	.loc 1 56 40 discriminator 3
	fldt	.LC6@GOTOFF(%ebx)
	fmulp	%st, %st(1)
	.loc 1 56 13 discriminator 3
	fstpl	24(%esp)
	.loc 1 55 30 discriminator 3
	incl	%esi
.L6:
	.loc 1 55 5 discriminator 1
	cmpl	$999999, %esi
	jbe	.L7
	.loc 1 58 5
	leal	48(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	clock_gettime@PLT
	.loc 1 59 19
	movl	48(%esp), %eax
	movl	52(%esp), %edx
	movl	%eax, 8(%esp)
	movl	%edx, 12(%esp)
	movl	40(%esp), %eax
	movl	44(%esp), %edx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	timediff@PLT
	movl	%eax, 56(%esp)
	movl	%edx, 60(%esp)
	.loc 1 60 5
	movl	56(%esp), %eax
	movl	60(%esp), %edx
	movl	%eax, 4(%esp)
	movl	%edx, 8(%esp)
	leal	.LC4@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	printf@PLT
	.loc 1 61 5
	fldl	24(%esp)
	fstpl	4(%esp)
	leal	.LC5@GOTOFF(%ebx), %eax
	movl	%eax, (%esp)
	call	printf@PLT
	.loc 1 63 12
	movl	$0, %eax
.L8:
	.loc 1 65 1 discriminator 1
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	-2089296320
	.long	1121718817
	.align 16
.LC3:
	.long	0
	.long	-2147483648
	.long	16384
	.align 16
.LC6:
	.long	0
	.long	-2147483648
	.long	16382
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE1:
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/i686-linux-gnu/10/include/stddef.h"
	.file 3 "/usr/include/i386-linux-gnu/bits/types.h"
	.file 4 "/usr/include/i386-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/i386-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/i386-linux-gnu/bits/stdint-uintn.h"
	.file 7 "/usr/include/i386-linux-gnu/bits/types/struct_timespec.h"
	.file 8 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3a6
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF62
	.byte	0xc
	.long	.LASF63
	.long	.LASF64
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.long	0x2b
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF8
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x45
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.long	.LASF9
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x45
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x2f
	.byte	0x2c
	.long	0x8e
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x2e
	.long	0xa1
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x5
	.long	.LASF14
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x4c
	.uleb128 0x5
	.long	.LASF15
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x82
	.uleb128 0x5
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x4c
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x5
	.long	.LASF17
	.byte	0x3
	.byte	0xc4
	.byte	0x21
	.long	0x4c
	.uleb128 0x7
	.long	.LASF53
	.byte	0x98
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x261
	.uleb128 0x8
	.long	.LASF18
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x32
	.byte	0
	.uleb128 0x8
	.long	.LASF19
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x25
	.byte	0x4
	.uleb128 0x8
	.long	.LASF20
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x25
	.byte	0x8
	.uleb128 0x8
	.long	.LASF21
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x25
	.byte	0xc
	.uleb128 0x8
	.long	.LASF22
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x25
	.byte	0x10
	.uleb128 0x8
	.long	.LASF23
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x25
	.byte	0x14
	.uleb128 0x8
	.long	.LASF24
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x25
	.byte	0x18
	.uleb128 0x8
	.long	.LASF25
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x25
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF26
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x25
	.byte	0x20
	.uleb128 0x8
	.long	.LASF27
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x25
	.byte	0x24
	.uleb128 0x8
	.long	.LASF28
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x25
	.byte	0x28
	.uleb128 0x8
	.long	.LASF29
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x25
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF30
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x27a
	.byte	0x30
	.uleb128 0x8
	.long	.LASF31
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x280
	.byte	0x34
	.uleb128 0x8
	.long	.LASF32
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x32
	.byte	0x38
	.uleb128 0x8
	.long	.LASF33
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x32
	.byte	0x3c
	.uleb128 0x8
	.long	.LASF34
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xa8
	.byte	0x40
	.uleb128 0x8
	.long	.LASF35
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x5a
	.byte	0x44
	.uleb128 0x8
	.long	.LASF36
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x68
	.byte	0x46
	.uleb128 0x8
	.long	.LASF37
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x286
	.byte	0x47
	.uleb128 0x8
	.long	.LASF38
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x296
	.byte	0x48
	.uleb128 0x8
	.long	.LASF39
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xb4
	.byte	0x50
	.uleb128 0x8
	.long	.LASF40
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2a1
	.byte	0x58
	.uleb128 0x8
	.long	.LASF41
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2ac
	.byte	0x5c
	.uleb128 0x8
	.long	.LASF42
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x280
	.byte	0x60
	.uleb128 0x8
	.long	.LASF43
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0xcc
	.byte	0x64
	.uleb128 0x8
	.long	.LASF44
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x39
	.byte	0x68
	.uleb128 0x8
	.long	.LASF45
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x32
	.byte	0x6c
	.uleb128 0x8
	.long	.LASF46
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2b2
	.byte	0x70
	.byte	0
	.uleb128 0x5
	.long	.LASF47
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xda
	.uleb128 0x9
	.long	.LASF65
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xa
	.long	.LASF48
	.uleb128 0x2
	.byte	0x4
	.long	0x275
	.uleb128 0x2
	.byte	0x4
	.long	0xda
	.uleb128 0xb
	.long	0x2b
	.long	0x296
	.uleb128 0xc
	.long	0x45
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.long	0x26d
	.uleb128 0xa
	.long	.LASF49
	.uleb128 0x2
	.byte	0x4
	.long	0x29c
	.uleb128 0xa
	.long	.LASF50
	.uleb128 0x2
	.byte	0x4
	.long	0x2a7
	.uleb128 0xb
	.long	0x2b
	.long	0x2c2
	.uleb128 0xc
	.long	0x45
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.long	0x261
	.uleb128 0xd
	.long	.LASF66
	.byte	0x8
	.byte	0x8b
	.byte	0xe
	.long	0x2c2
	.uleb128 0x5
	.long	.LASF51
	.byte	0x6
	.byte	0x1a
	.byte	0x14
	.long	0x76
	.uleb128 0x5
	.long	.LASF52
	.byte	0x6
	.byte	0x1b
	.byte	0x14
	.long	0x95
	.uleb128 0x7
	.long	.LASF54
	.byte	0x8
	.byte	0x7
	.byte	0xa
	.byte	0x8
	.long	0x314
	.uleb128 0x8
	.long	.LASF55
	.byte	0x7
	.byte	0xc
	.byte	0xc
	.long	0xc0
	.byte	0
	.uleb128 0x8
	.long	.LASF56
	.byte	0x7
	.byte	0x10
	.byte	0x15
	.long	0xce
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.long	.LASF67
	.byte	0x1
	.byte	0x1d
	.byte	0x5
	.long	0x32
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x39c
	.uleb128 0xf
	.long	.LASF57
	.byte	0x1
	.byte	0x1d
	.byte	0x10
	.long	0x32
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.long	.LASF58
	.byte	0x1
	.byte	0x1d
	.byte	0x1d
	.long	0x39c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.string	"k"
	.byte	0x1
	.byte	0x20
	.byte	0x17
	.long	0x2d4
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x11
	.long	.LASF59
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.long	0x2e0
	.uleb128 0x2
	.byte	0x74
	.sleb128 56
	.uleb128 0x10
	.string	"t0"
	.byte	0x1
	.byte	0x22
	.byte	0x15
	.long	0x2ec
	.uleb128 0x2
	.byte	0x74
	.sleb128 48
	.uleb128 0x10
	.string	"t1"
	.byte	0x1
	.byte	0x22
	.byte	0x19
	.long	0x2ec
	.uleb128 0x2
	.byte	0x74
	.sleb128 40
	.uleb128 0x12
	.string	"foo"
	.byte	0x1
	.byte	0x23
	.byte	0x15
	.long	0x3a2
	.uleb128 0x13
	.long	.LASF60
	.byte	0x1
	.byte	0x24
	.byte	0x15
	.long	0x3a2
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.long	0x25
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF61
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
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
	.uleb128 0x11
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x13
	.uleb128 0x34
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"__off_t"
.LASF19:
	.string	"_IO_read_ptr"
.LASF31:
	.string	"_chain"
.LASF64:
	.string	"/home/dclarke/pgm/lastmiles/floating_point"
.LASF8:
	.string	"size_t"
.LASF37:
	.string	"_shortbuf"
.LASF25:
	.string	"_IO_buf_base"
.LASF13:
	.string	"long long unsigned int"
.LASF10:
	.string	"__int64_t"
.LASF40:
	.string	"_codecvt"
.LASF11:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF32:
	.string	"_fileno"
.LASF20:
	.string	"_IO_read_end"
.LASF2:
	.string	"long int"
.LASF18:
	.string	"_flags"
.LASF26:
	.string	"_IO_buf_end"
.LASF35:
	.string	"_cur_column"
.LASF49:
	.string	"_IO_codecvt"
.LASF61:
	.string	"double"
.LASF34:
	.string	"_old_offset"
.LASF39:
	.string	"_offset"
.LASF9:
	.string	"__uint32_t"
.LASF48:
	.string	"_IO_marker"
.LASF1:
	.string	"unsigned int"
.LASF43:
	.string	"_freeres_buf"
.LASF5:
	.string	"long unsigned int"
.LASF23:
	.string	"_IO_write_ptr"
.LASF4:
	.string	"short unsigned int"
.LASF27:
	.string	"_IO_save_base"
.LASF38:
	.string	"_lock"
.LASF59:
	.string	"tdelta_nsec"
.LASF33:
	.string	"_flags2"
.LASF45:
	.string	"_mode"
.LASF56:
	.string	"tv_nsec"
.LASF55:
	.string	"tv_sec"
.LASF17:
	.string	"__syscall_slong_t"
.LASF63:
	.string	"./div2.c"
.LASF24:
	.string	"_IO_write_end"
.LASF52:
	.string	"uint64_t"
.LASF65:
	.string	"_IO_lock_t"
.LASF53:
	.string	"_IO_FILE"
.LASF12:
	.string	"__uint64_t"
.LASF30:
	.string	"_markers"
.LASF3:
	.string	"unsigned char"
.LASF7:
	.string	"short int"
.LASF50:
	.string	"_IO_wide_data"
.LASF54:
	.string	"timespec"
.LASF36:
	.string	"_vtable_offset"
.LASF47:
	.string	"FILE"
.LASF51:
	.string	"uint32_t"
.LASF0:
	.string	"char"
.LASF60:
	.string	"some_num"
.LASF15:
	.string	"__off64_t"
.LASF21:
	.string	"_IO_read_base"
.LASF29:
	.string	"_IO_save_end"
.LASF62:
	.ascii	"GNU C99 10.2.0 -m32 -march=i686 -mtune=i686 -malign-double -"
	.ascii	"mpc80 -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-ssse3 -mno-"
	.ascii	"sse4 -mno-sse4a -mno-sse4.1 -mno-sse4.2 -mno-avx -mno-avx2 -"
	.ascii	"mno-avx512f -mno-avx512pf -mno-avx512er -mno-avx512cd -mno-a"
	.ascii	"vx512vl -mno-avx512bw -mno-avx512dq -mno-avx512ifma -mno-avx"
	.ascii	"512vbmi -mno-sha -mno-aes -mno-pclmul -mno-clflushopt -mno-c"
	.ascii	"lwb -mno-fsgsbase -mno-rdrnd -mno-f16c -mno-fma -mno-pconfig"
	.ascii	" -mno-wbnoinvd -mno-fma4 -mno-prfchw -mno-rdpid -mno-prefetc"
	.ascii	"hwt1 -mno-rdseed -mno-sgx -mno-xop -mno-lwp -mno-3dnow -mno-"
	.ascii	"3dnowa -mno-popcnt -mno-abm -mno-adx -mno-bmi -mno-bmi2 -mno"
	.ascii	"-lzcnt -mno-fxsr -mno-xsave -mno-xsaveopt -mno-xsavec -mno-x"
	.ascii	"saves -mno-rtm -mno-hle -mno-tbm -mno-m"
	.string	"waitx -mno-clzero -mno-pku -mno-avx512vbmi2 -mno-gfni -mno-vaes -mno-vpclmulqdq -mno-avx512bitalg -mno-movdiri -mno-movdir64b -mno-avx512vpopcntdq -mno-avx5124fmaps -mno-avx512vnni -mno-avx5124vnniw -g -O0 -std=c99 -fno-builtin -fasynchronous-unwind-tables"
.LASF44:
	.string	"__pad5"
.LASF16:
	.string	"__time_t"
.LASF46:
	.string	"_unused2"
.LASF66:
	.string	"stderr"
.LASF58:
	.string	"argv"
.LASF28:
	.string	"_IO_backup_base"
.LASF57:
	.string	"argc"
.LASF42:
	.string	"_freeres_list"
.LASF41:
	.string	"_wide_data"
.LASF67:
	.string	"main"
.LASF22:
	.string	"_IO_write_base"
	.ident	"GCC: (Debian 10.2.0-15) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
