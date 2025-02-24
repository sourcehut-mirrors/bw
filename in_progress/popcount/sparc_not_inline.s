
	.section	".text",#alloc,#execinstr,#progbits
	.file	"sparc_not_inline.c"

	.section	".data",#alloc,#write,#progbits

Ddata.data:

	.section	".rodata",#alloc,#progbits
!
! CONSTANT POOL
!

Drodata.rodata:

	.section	".picdata",#alloc,#write

Dpicdata.picdata:

	.section	".bss",#alloc,#write,#nobits

Bbss.bss:

	.section	".rodata1",#alloc,#progbits
	.align	4
!
! CONSTANT POOL
!

.L18:
	.ascii	"%d\n\000"
	.size	.L18,4
	.type	.L18,#object

	.section	".text",#alloc,#execinstr,#progbits
/* 000000	   0 */		.align	8
/* 000000	     */		.word	65536,65536,65536,65536,65536,65536,65536,65536
/* 0x0020	     */		.align	16
! FILE sparc_not_inline.c

!    2		      !/*
!    3		      ! * trying to get whatever the assembler opcodes are
!    4		      ! * for sparcv9
!    5		      ! */
!    7		      !#define _XOPEN_SOURCE 600
!    9		      !#include <stdio.h>
!   10		      !#include <stdlib.h>
!   12		      !int
!   13		      !main ( int argc, char **argv )
!   14		      !{

!
! SUBROUTINE main
!
! OFFSET    SOURCE LINE	LABEL	INSTRUCTION

                       	.global main
                       

			main:
                       
! predecessor blocks: main

			.L900000107:
/* 000000	  14 */		save	%sp,-224,%sp
                       

			.L900000104:
/* 0x0004	  14 */		rd	%pc,%l0
/* 0x0008	     */		sethi	%pc22(_GLOBAL_OFFSET_TABLE_-(.L900000104-.)),%g1
/* 0x000c	     */		add	%g1,%pc10(_GLOBAL_OFFSET_TABLE_-(.L900000104-.)),%g1
/* 0x0010	     */		add	%g1,%l0,%l0

!   17		      !    int src = 1;

/* 0x0014	  17 */		mov	1,%o0

!   18		      !    int dst;   
!   20		      !    dst = src + 1;

/* 0x0018	  20 */		add	%o0,1,%o0

!   22		      !    printf("%d\n", dst);

/* 0x001c	  22 */		sethi	%gdop_hix22(.L18),%o1
/* 0x0020	     */		xor	%o1,%gdop_lox10(.L18),%o1
/* 0x0024	     */		ldx	[%l0+%o1],%o1,%gdop(.L18)
/* 0x0028	     */		sra	%o0,0,%o0
/* 0x002c	     */		stx	%o0,[%fp+2007]
/* 0x0030	     */		mov	%o1,%o0
/* 0x0034	     */		ldx	[%fp+2007],%o1
/* 0x0038	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x003c	     */		nop

!   24		      !    return EXIT_SUCCESS;

/* 0x0040	  24 */		sra	%g0,0,%i0
/* 0x0044	     */		ret	! Result =  %i0
/* 0x0048	     */		restore	%g0,%g0,%g0
/* 0x004c	   0 */		.type	main,#function
/* 0x004c	   0 */		.size	main,(.-main)
/* 0x004c	   0 */		.global	__fsr_init_value
/* 0x004c	     */		 __fsr_init_value=0
                       

			.L900000108:

	.section	".text",#alloc,#execinstr,#progbits
                       

			.L900000113:

	.section	".annotate",#exclude,#progbits
/* 000000	   0 */		.asciz	"anotate"
/* 0x0008	   0 */		.word	6,0
/* 0x0010	   0 */		.xword	120
/* 0x0018	   0 */		.word	0,16
/* 0x0020	   0 */		.xword	(.L900000113-0x6c)
/* 0x0028	   0 */		.xword	108
/* 0x0030	   0 */		.word	1,24
/* 0x0038	   0 */		.xword	.L900000107
/* 0x0040	   0 */		.xword	(.L900000108-.L900000107)
/* 0x0048	   0 */		.word	-2145873792,0
/* 0x0050	   0 */		.word	5,24
/* 0x0058	   0 */		.xword	(.L900000104+0x4)
/* 0x0060	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0068	   0 */		.xword	.L900000104
/* 0x0070	   0 */		.word	6,24
/* 0x0078	   0 */		.xword	(.L900000104+0x8)
/* 0x0080	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0088	   0 */		.xword	.L900000104

! Begin Disassembling Debug Info

! Begin sdCreateSection
	.section ".debug_info"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x02,0x37,0x00,0x02
!	<reloc> off=14 kind=2 l1=.debug_abbrev loff=0
	.uaxword %section_symbol(".debug_abbrev")
	.byte 0x08,0x01
	.ascii "sparc_not_inline.c\0"
	.byte 0x0c
	.ascii "DBG_GEN 5.7.6\0"
	.ascii "/export/home/dclarke/pgm/bw/in_progress/popcount/\0"
	.ascii "/opt/developerstudio12.6/bin/c99 -Xa -m64 -xarch=sparc -xO0 -mc -xs -errfmt=error -xatomic=studio -erroff=%none -errshort=full -errtags=yes -errwarn=%none -ftrap=%none -xbuiltin=%none -xildoff -xlibmieee -xstrconst -xcode=pic32 -xmemalign=8s -xnolibmil -xunroll=1 -xdepend=no -xregs=no%appl -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_TS_ERRNO -D_FILE_OFFSET_BITS='64' -S  sparc_not_inline.c\0"
	.ascii "Xa;P;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>;\0"
!	<reloc> off=570 kind=2 l1=.debug_line loff=0
	.uaxword %section_symbol(".debug_line")
	.byte 0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_line"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x30,0x00,0x02,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x26,0x04,0x00
	.byte 0xff,0x04,0x0a,0x00,0x01,0x01,0x01,0x01
	.byte 0x00,0x00,0x00,0x01,0x00,0x73,0x70,0x61
	.byte 0x72,0x63,0x5f,0x6e,0x6f,0x74,0x5f,0x69
	.byte 0x6e,0x6c,0x69,0x6e,0x65,0x2e,0x63,0x00
	.byte 0x00,0x00,0x00,0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_abbrev"
	.byte 0x01,0x11,0x00,0x03,0x08,0x13,0x0b,0x25
	.byte 0x08,0x1b,0x08,0x85,0x44,0x08,0x87,0x44
	.byte 0x08,0x10,0x07,0x00,0x00,0x00
! End sdCreateSection
	.xstabs ".stab.index","V=10.0;DBG_GEN=5.7.6;Xa;P;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>",60,0,0,0
	.xstabs ".stab.index","/export/home/dclarke/pgm/bw/in_progress/popcount; /opt/developerstudio12.6/bin/c99 -Xa -m64 -xarch=sparc -xO0 -mc -xs -errfmt=error -xatomic=studio -erroff=%none -errshort=full -errtags=yes -errwarn=%none -ftrap=%none -xbuiltin=%none -xildoff -xlibmieee -xstrconst -xcode=pic32 -xmemalign=8s -xnolibmil -xunroll=1 -xdepend=no -xregs=no%appl -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_TS_ERRNO -D_FILE_OFFSET_BITS='64' -S  sparc_not_inline.c",52,0,0,0
	.xstabs ".stab.index","main",42,0,0,14

! End Disassembling Debug Info

! Begin Disassembling Ident
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
	.ident	"@(#)stdio.h\t1.86\t13/09/11 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)feature_tests.h\t1.26\t11/04/12 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)ccompile.h\t1.2\t04/11/08 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)isa_defs.h\t1.30\t11/03/31 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdio_iso.h\t1.8\t05/08/16 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)va_list.h\t1.15\t04/11/19 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdio_tag.h\t1.4\t04/09/28 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdio_impl.h\t1.15\t07/03/05 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdio_c99.h\t1.2\t04/03/29 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdlib.h\t1.52\t12/08/01 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdlib_iso.h\t1.9\t04/09/28 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)stdlib_c99.h\t1.2\t04/03/29 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)wait.h\t1.23\t04/06/03 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)types.h\t1.90\t14/04/07 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)machtypes.h\t1.13\t99/05/04 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)int_types.h\t1.10\t04/09/28 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)resource.h\t1.37\t07/02/07 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)time.h\t2.79\t13/07/01 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)select.h\t1.19\t04/01/28 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)time_impl.h\t1.11\t05/05/19 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)siginfo.h\t1.59\t04/07/15 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)machsig.h\t1.15\t99/08/15 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)time_std_impl.h\t1.3\t04/01/21 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)procset.h\t1.26\t11/04/18 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)signal.h\t1.67\t13/09/11 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)signal_iso.h\t1.6\t03/05/02 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)unistd.h\t1.46\t12/01/17 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)ucontext.h\t1.31\t03/12/18 SMI"	! (NO SOURCE LINE)
	.ident	"@(#)regset.h\t1.29\t07/09/06 SMI"	! (NO SOURCE LINE)
	.ident	"acomp: Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
! End Disassembling Ident
