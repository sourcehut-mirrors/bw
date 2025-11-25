
	.section	".text",#alloc,#execinstr,#progbits
	.file	"swap_eight.c"

	.section	".data",#alloc,#write,#progbits

Ddata.data:

	.section	".rodata",#alloc,#progbits
!
! CONSTANT POOL
!

Drodata.rodata:
	.align	8
!
! CONSTANT POOL
!

.L17:
	.skip	64
	.size	.L17,64
	.type	.L17,#object

	.section	".picdata",#alloc,#write

Dpicdata.picdata:

	.section	".bss",#alloc,#write,#nobits

Bbss.bss:

	.section	".text",#alloc,#execinstr,#progbits
/* 000000	   0 */		.align	8
/* 000000	     */		.word	65536
/* 0x0004	     */		.word	65536,65536,65536
/* 0x0010	     */		.align	16
! FILE swap_eight.c

!    2		      !/*********************************************************************
!    3		      ! * swap_eight.c : in a C90 clean way? we rotate around a 64bit data
!    4		      ! *                element for big endian and little endian systems
!    5		      ! *
!    6		      ! * Copyright Dennis M. Clarke 2019
!    7		      ! *
!    8		      ! *    Permission is hereby granted, free of charge, to any person
!    9		      ! *    obtaining a copy of this software and associated documentation
!   10		      ! *    files (the "Software"), to deal in the Software without
!   11		      ! *    restriction, including without limitation the rights to use,
!   12		      ! *    copy, modify, merge, publish, distribute, sublicense, and/or
!   13		      ! *    sell copies of the Software, and to permit persons to whom the
!   14		      ! *    Software is furnished to do so, subject to the following
!   15		      ! *    conditions:
!   16		      ! *
!   17		      ! *    The above copyright notice and this permission notice shall be
!   18		      ! *    included in all copies or substantial portions of the Software.
!   19		      ! *
!   20		      ! *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
!   21		      ! *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
!   22		      ! *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
!   23		      ! *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
!   24		      ! *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
!   25		      ! *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
!   26		      ! *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
!   27		      ! *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
!   28		      ! * ------------------------------------------------------------------
!   29		      ! */
!   31		      !/*********************************************************************
!   32		      ! * The Open Group Base Specifications Issue 6
!   33		      ! * IEEE Std 1003.1, 2004 Edition
!   34		      ! *
!   35		      ! *    An XSI-conforming application should ensure that the feature
!   36		      ! *    test macro _XOPEN_SOURCE is defined with the value 600 before
!   37		      ! *    inclusion of any header. This is needed to enable the
!   38		      ! *    functionality described in The _POSIX_C_SOURCE Feature Test
!   39		      ! *    Macro and in addition to enable the XSI extension.
!   40		      ! *
!   41		      ! *********************************************************************/
!   42		      !#if ! defined (_XOPEN_SOURCE)
!   43		      !#define _XOPEN_SOURCE 600
!   44		      !#endif
!   46		      !#include <inttypes.h>
!   47		      !uint64_t swap_eight(uint64_t x)
!   48		      !{

!
! SUBROUTINE swap_eight
!
! OFFSET    SOURCE LINE	LABEL	INSTRUCTION

                       	.global swap_eight
                       

			swap_eight:
                       
! predecessor blocks: swap_eight

			.L900000109:
/* 000000	   0 */		sethi	%hi(0xff000000),%g5

!   50		      !    uint64_t result, b[8] = {0,0,0,0,0,0,0,0};
!   52		      !    b[0] = ( ( x & 0xff ) << 56 );
!   53		      !    b[1] = ( ( x & 0xff00 ) << 40 );
!   54		      !    b[2] = ( ( x & 0xff0000 ) << 24 );
!   55		      !    b[3] = ( ( x & 0xff000000 ) << 8 );
!   56		      !    b[4] = ( ( x & 0xff00000000 ) >> 8 );
!   57		      !    b[5] = ( ( x & 0xff0000000000 ) >> 24 );
!   58		      !    b[6] = ( ( x & 0xff000000000000 ) >> 40 );
!   59		      !    b[7] = ( x >> 56 );
!   61		      !    result = b[0] | b[1] | b[2] | b[3] | b[4] | b[5] | b[6] | b[7];
!   63		      !    return result;

/* 0x0004	  63 */		sethi	%hi(0xfc00),%g4
/* 0x0008	     */		and	%o0,%g5,%o5
/* 0x000c	     */		sllx	%g5,24,%g5
/* 0x0010	     */		sllx	%o5,8,%o1
/* 0x0014	     */		sethi	%hi(0xff0000),%o4
/* 0x0018	     */		add	%g4,768,%g1
/* 0x001c	     */		and	%o0,%o4,%o3
/* 0x0020	     */		sllx	%o3,24,%o2
/* 0x0024	     */		sllx	%o0,56,%o3
/* 0x0028	     */		and	%o0,%g1,%o5
/* 0x002c	     */		or	%o1,%o2,%o2
/* 0x0030	     */		sllx	%o5,40,%o4
/* 0x0034	     */		sethi	%hi(0x3fc0000),%g1
/* 0x0038	     */		sllx	%g1,22,%o5
/* 0x003c	     */		or	%o3,%o4,%o1
/* 0x0040	     */		sethi	%hi(0x3fc00),%o3
/* 0x0044	     */		or	%o1,%o2,%g4
/* 0x0048	     */		sllx	%o3,22,%o2
/* 0x004c	     */		and	%o0,%o5,%o4
/* 0x0050	     */		srlx	%o4,24,%o1
/* 0x0054	     */		and	%o0,%o2,%g1
/* 0x0058	     */		srlx	%g1,8,%o5
/* 0x005c	     */		and	%o0,%g5,%o3
/* 0x0060	     */		srlx	%o0,56,%o0
/* 0x0064	     */		srlx	%o3,40,%o2
/* 0x0068	     */		or	%o1,%g4,%o4
/* 0x006c	     */		or	%o0,%o2,%g1
/* 0x0070	     */		or	%o5,%o4,%g4

!   65		      !}

/* 0x0074	  65 */		retl	! Result =  %o0
/* 0x0078	  63 */		or	%g4,%g1,%o0
/* 0x007c	   0 */		.type	swap_eight,#function
/* 0x007c	   0 */		.size	swap_eight,(.-swap_eight)
                       

			.L900000110:

	.section	".text",#alloc,#execinstr,#progbits
                       

			.L900000111:

	.section	".annotate",#exclude,#progbits
/* 000000	   0 */		.asciz	"anotate"
/* 0x0008	   0 */		.word	6,0
/* 0x0010	   0 */		.xword	56
/* 0x0018	   0 */		.word	0,16
/* 0x0020	   0 */		.xword	(.L900000111-0x8c)
/* 0x0028	   0 */		.xword	140
/* 0x0030	   0 */		.word	1,24
/* 0x0038	   0 */		.xword	.L900000109
/* 0x0040	   0 */		.xword	(.L900000110-.L900000109)
/* 0x0048	   0 */		.word	-2145908224,0

	.section	".compcom"
/* 000000	   0 */		.align	8
/* 000000	   0 */		.word	0
/* 0x0004	   0 */		.word	1
/* 0x0008	   0 */		.word	0
/* 0x000c	   0 */		.word	0
/* 0x0010	   0 */		.word	1
/* 0x0014	   0 */		.word	13
/* 0x0018	   0 */		.asciz	"swap_eight.c"

! Begin Disassembling Debug Info

! Begin sdCreateSection
	.section ".debug_info"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x02,0x2c,0x00,0x02
!	<reloc> off=14 kind=2 l1=.debug_abbrev loff=0
	.uaxword %section_symbol(".debug_abbrev")
	.byte 0x08,0x01
	.ascii "swap_eight.c\0"
	.byte 0x01
	.ascii "DBG_GEN 5.7.6\0"
	.ascii "/export/home/dclarke/pgm/bw/xmand/\0"
	.ascii "/opt/developerstudio12.6/bin/cc -std=iso9899:1990 -m64 -xarch=sparc -g -xO3 -mc -xs -xregs=no%appl -D_XOPEN_SOURCE='500' -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS='64' -S  swap_eight.c -W0,-xp\\$XAMMCEsmuTJp23t.\0"
	.ascii "Xa;g=dtpvlc;di;O;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>;G=$XAMMCEsmuTJp23t.;\0"
!	<reloc> off=392 kind=2 l1=.debug_line loff=0
	.uaxword %section_symbol(".debug_line")
	.byte 0x02
	.ascii "swap_eight\0"
	.byte 0x01,0x02,0x01,0x30
!	<reloc> off=416 kind=0 l1=swap_eight loff=0
	.uaxword swap_eight
!	<reloc> off=424 kind=0 l1=swap_eight loff=124
	.uaxword swap_eight+124
	.byte 0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x02
	.byte 0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x01
	.byte 0xf6,0x03,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x02,0x07
	.ascii "x\0"
!	<reloc> off=460 kind=2 l1=.debug_loc loff=0
	.uaxword %section_symbol(".debug_loc")
	.byte 0x04,0x44,0x01,0x04,0x05
	.ascii "result\0"
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x07
	.byte 0x01,0x05
	.ascii "b\0"
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x02,0x21
	.byte 0x01,0x00,0x06
	.ascii "unsigned long\0"
	.byte 0x07,0x08,0x07,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x01,0xf6
	.ascii "uint64_t\0"
	.byte 0x06
	.ascii "long\0"
	.byte 0x05,0x08,0x08,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x02,0x07,0x40,0x09,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x02,0x19,0x07,0x00,0x00
	.byte 0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_line"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x49,0x00,0x02,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x20,0x04,0x00
	.byte 0xff,0x04,0x0a,0x00,0x01,0x01,0x01,0x01
	.byte 0x00,0x00,0x00,0x01,0x00,0x73,0x77,0x61
	.byte 0x70,0x5f,0x65,0x69,0x67,0x68,0x74,0x2e
	.byte 0x63,0x00,0x00,0x00,0x00,0x00,0x00,0x09
	.byte 0x02
!	<reloc> off=57 kind=0 l1=swap_eight loff=0
	.uaxword swap_eight
	.byte 0x06,0x03,0x2f,0x01,0x02,0x01,0x03,0x0f
	.byte 0x01,0x7d,0x02,0x01,0x03,0x7e,0x01,0x02
	.byte 0x01,0x00,0x01,0x01
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_abbrev"
	.byte 0x01,0x11,0x01,0x03,0x08,0x13,0x0b,0x25
	.byte 0x08,0x1b,0x08,0x85,0x44,0x08,0x87,0x44
	.byte 0x08,0x10,0x07,0x00,0x00,0x02,0x2e,0x01
	.byte 0x03,0x08,0x3f,0x0c,0x17,0x0b,0x3a,0x0b
	.byte 0x3b,0x0b,0x11,0x01,0x12,0x01,0x27,0x0c
	.byte 0x49,0x14,0x01,0x14,0x00,0x00,0x03,0x05
	.byte 0x00,0x49,0x14,0x03,0x08,0x02,0x07,0x00
	.byte 0x00,0x04,0x86,0x84,0x01,0x00,0x92,0x44
	.byte 0x0b,0x91,0x44,0x09,0x00,0x00,0x05,0x34
	.byte 0x00,0x03,0x08,0x49,0x14,0x17,0x0b,0x00
	.byte 0x00,0x06,0x24,0x00,0x03,0x08,0x3e,0x0b
	.byte 0x0b,0x0b,0x00,0x00,0x07,0x16,0x00,0x49
	.byte 0x14,0x03,0x08,0x00,0x00,0x08,0x01,0x01
	.byte 0x49,0x14,0x0b,0x0b,0x00,0x00,0x09,0x21
	.byte 0x00,0x49,0x14,0x2f,0x0b,0x00,0x00,0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_loc"
	.byte 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
!	<reloc> off=8 kind=0 l1=swap_eight loff=0
	.uaxword swap_eight
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x64
	.byte 0x00,0x01,0x58,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00
! End sdCreateSection
	.xstabs ".stab.index","/export/home/dclarke/pgm/bw/xmand/",100,0,0,0
	.xstabs ".stab.index","swap_eight.c",100,0,3,0
	.xstabs ".stab.index","",56,0,0,0
	.xstabs ".stab.index","",56,0,0,0
	.xstabs ".stab.index","V=10.0;DBG_GEN=5.7.6;Xa;g=dtpvlc;di;O;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>;G=$XAMMCEsmuTJp23t.",60,0,0,1764047782
	.xstabs ".stab.index","/export/home/dclarke/pgm/bw/xmand; /opt/developerstudio12.6/bin/cc -std=iso9899:1990 -m64 -xarch=sparc -g -xO3 -mc -xs -xregs=no%appl -D_XOPEN_SOURCE='500' -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS='64' -S  swap_eight.c -W0,-xp\\$XAMMCEsmuTJp23t.",52,0,0,0
	.xstabs ".stab.index","swap_eight",36,0,0,48

! End Disassembling Debug Info

! Begin Disassembling Ident
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
	.ident	"acomp: Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"iropt: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
! End Disassembling Ident
