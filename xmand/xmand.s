
	.section	".text",#alloc,#execinstr,#progbits
	.file	"xmand.c"

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
	.align	8
!
! CONSTANT POOL
!

.L20:
	.ascii	"FAIL : calloc returns ENOMEM at %s:%d\n\000"
	.size	.L20,39
	.type	.L20,#object
	.align	4
!
! CONSTANT POOL
!

.L21:
	.ascii	"xmand.c\000"
	.size	.L21,8
	.type	.L21,#object
	.align	8
!
! CONSTANT POOL
!

.L23:
	.ascii	"FAIL : calloc fails at %s:%d\n\000"
	.size	.L23,30
	.type	.L23,#object
	.align	2
!
! CONSTANT POOL
!

.L24:
	.ascii	"FAIL \000"
	.size	.L24,6
	.type	.L24,#object
	.align	1
!
! CONSTANT POOL
!

.L35:
	.ascii	"C\000"
	.size	.L35,2
	.type	.L35,#object
	.align	1
!
! CONSTANT POOL
!

.L36:
	.ascii	"TZ\000"
	.size	.L36,3
	.type	.L36,#object
	.align	2
!
! CONSTANT POOL
!

.L37:
	.ascii	"GMT0\000"
	.size	.L37,5
	.type	.L37,#object
	.align	8
!
! CONSTANT POOL
!

.L40:
	.ascii	"FAIL : can not set timezone TZ = GMT0\n\000"
	.size	.L40,39
	.type	.L40,#object
	.align	8
!
! CONSTANT POOL
!

.L43:
	.ascii	"ERROR : could not attain CLOCK_REALTIME\n\000"
	.size	.L43,41
	.type	.L43,#object
	.align	8
!
! CONSTANT POOL
!

.L44:
	.ascii	"\n\n--------- _XOPEN_SOURCE 600 -------\n\000"
	.size	.L44,39
	.type	.L44,#object
	.align	8
!
! CONSTANT POOL
!

.L45:
	.ascii	"_POSIX_CHILD_MAX   = %i\n\000"
	.size	.L45,25
	.type	.L45,#object
	.align	8
!
! CONSTANT POOL
!

.L46:
	.ascii	"_POSIX_NGROUPS_MAX = %i\n\000"
	.size	.L46,25
	.type	.L46,#object
	.align	8
!
! CONSTANT POOL
!

.L47:
	.ascii	"_POSIX_OPEN_MAX    = %i\n\000"
	.size	.L47,25
	.type	.L47,#object
	.align	8
!
! CONSTANT POOL
!

.L48:
	.ascii	"_POSIX_PATH_MAX    = %i\n\000"
	.size	.L48,25
	.type	.L48,#object
	.align	8
!
! CONSTANT POOL
!

.L49:
	.ascii	"_POSIX_TZNAME_MAX  = %i\n\000"
	.size	.L49,25
	.type	.L49,#object
	.align	8
!
! CONSTANT POOL
!

.L50:
	.ascii	"---------------------------------------\n\000"
	.size	.L50,41
	.type	.L50,#object
	.align	8
!
! CONSTANT POOL
!

.L51:
	.ascii	"INFO : baseline tdelta = %14lu nsec\n\000"
	.size	.L51,37
	.type	.L51,#object
	.align	8
!
! CONSTANT POOL
!

.L55:
	.ascii	"FAIL : insufficient arguments provided\n\000"
	.size	.L55,40
	.type	.L55,#object
	.align	8
!
! CONSTANT POOL
!

.L56:
	.ascii	"     : usage %s bail_out_integer \\\n\000"
	.size	.L56,36
	.type	.L56,#object
	.align	8
!
! CONSTANT POOL
!

.L57:
	.ascii	"     :          magnify_integer \\\n\000"
	.size	.L57,35
	.type	.L57,#object
	.align	8
!
! CONSTANT POOL
!

.L58:
	.ascii	"     :          double_real \\\n\000"
	.size	.L58,31
	.type	.L58,#object
	.align	8
!
! CONSTANT POOL
!

.L59:
	.ascii	"     :          double_imaginary\\\n\000"
	.size	.L59,35
	.type	.L59,#object
	.align	8
!
! CONSTANT POOL
!

.L60:
	.ascii	"     :          pthread_count\n\000"
	.size	.L60,31
	.type	.L60,#object
	.align	8
!
! CONSTANT POOL
!

.L61:
	.ascii	"     : quitting.\n\000"
	.size	.L61,18
	.type	.L61,#object
	.align	8
!
! CONSTANT POOL
!

.L68:
	.ascii	"FAIL : bail_out_integer not understood\n\000"
	.size	.L68,40
	.type	.L68,#object
	.align	2
!
! CONSTANT POOL
!

.L69:
	.ascii	"     \000"
	.size	.L69,6
	.type	.L69,#object
	.align	8
!
! CONSTANT POOL
!

.L74:
	.ascii	"WARN : mandlebrot bail out is unreasonable\n\000"
	.size	.L74,44
	.type	.L74,#object
	.align	8
!
! CONSTANT POOL
!

.L75:
	.ascii	"     : we shall assume 4096 and proceed.\n\000"
	.size	.L75,42
	.type	.L75,#object
	.align	2
!
! CONSTANT POOL
!

.L78:
	.ascii	"%lld\000"
	.size	.L78,5
	.type	.L78,#object
	.align	8
!
! CONSTANT POOL
!

.L80:
	.ascii	"INFO : magnify not understood as long long int\n\000"
	.size	.L80,48
	.type	.L80,#object
	.align	2
!
! CONSTANT POOL
!

.L83:
	.ascii	"dBUG \000"
	.size	.L83,6
	.type	.L83,#object
	.align	8
!
! CONSTANT POOL
!

.L88:
	.ascii	"FAIL : magnify_integer not understood\n\000"
	.size	.L88,39
	.type	.L88,#object
	.align	8
!
! CONSTANT POOL
!

.L93:
	.ascii	"WARN : magnify_integer is unreasonable\n\000"
	.size	.L93,40
	.type	.L93,#object
	.align	8
!
! CONSTANT POOL
!

.L94:
	.ascii	"     : we shall assume 1 and proceed.\n\000"
	.size	.L94,39
	.type	.L94,#object
	.align	8
!
! CONSTANT POOL
!

.L97:
	.ascii	"INFO : magnify accepted as long long int\n\000"
	.size	.L97,42
	.type	.L97,#object
	.align	8
!
! CONSTANT POOL
!

.L100:
	.ascii	"INFO : FP Exception raised is\000"
	.size	.L100,30
	.type	.L100,#object
	.align	8
!
! CONSTANT POOL
!

.L103:
	.ascii	" FE_INEXACT\000"
	.size	.L103,12
	.type	.L103,#object
	.align	8
!
! CONSTANT POOL
!

.L106:
	.ascii	" FE_DIVBYZERO\000"
	.size	.L106,14
	.type	.L106,#object
	.align	8
!
! CONSTANT POOL
!

.L109:
	.ascii	" FE_UNDERFLOW\000"
	.size	.L109,14
	.type	.L109,#object
	.align	8
!
! CONSTANT POOL
!

.L112:
	.ascii	" FE_OVERFLOW\000"
	.size	.L112,13
	.type	.L112,#object
	.align	8
!
! CONSTANT POOL
!

.L115:
	.ascii	" FE_INVALID\000"
	.size	.L115,12
	.type	.L115,#object
	.align	1
!
! CONSTANT POOL
!

.L118:
	.ascii	"\n\000"
	.size	.L118,2
	.type	.L118,#object
	.align	8
!
! CONSTANT POOL
!

.L121:
	.ascii	"real : Perfectly safe to ignore FE_INEXACT\n\000"
	.size	.L121,44
	.type	.L121,#object
	.align	8
!
! CONSTANT POOL
!

.L126:
	.ascii	"FAIL : double real coordinate not understood\n\000"
	.size	.L126,46
	.type	.L126,#object
	.align	8
!
! CONSTANT POOL
!

.L130:
	.ascii	"FAIL : double real coordinate is not normal\n\000"
	.size	.L130,45
	.type	.L130,#object
	.align	8
!
! CONSTANT POOL
!

.L131:
	.ascii	"     : looks like %-+18.12e\n\000"
	.size	.L131,29
	.type	.L131,#object
	.align	8
!
! CONSTANT POOL
!

.L136:
	.ascii	"WARN : double real coordinate is out of range\n\000"
	.size	.L136,47
	.type	.L136,#object
	.align	8
!
! CONSTANT POOL
!

.L137:
	.ascii	"     : value seen = %-+18.12e\n\000"
	.size	.L137,31
	.type	.L137,#object
	.align	8
!
! CONSTANT POOL
!

.L138:
	.ascii	"     : we shall assume zero.\n\000"
	.size	.L138,30
	.type	.L138,#object
	.align	8
!
! CONSTANT POOL
!

.L154:
	.ascii	"imag : Perfectly safe to ignore FE_INEXACT\n\000"
	.size	.L154,44
	.type	.L154,#object
	.align	8
!
! CONSTANT POOL
!

.L159:
	.ascii	"FAIL : double imaginary coordinate not understood\n\000"
	.size	.L159,51
	.type	.L159,#object
	.align	8
!
! CONSTANT POOL
!

.L163:
	.ascii	"FAIL : double imaginary coordinate is not normal\n\000"
	.size	.L163,50
	.type	.L163,#object
	.align	8
!
! CONSTANT POOL
!

.L168:
	.ascii	"WARN : double imaginary coordinate is out of range\n\000"
	.size	.L168,52
	.type	.L168,#object
	.align	8
!
! CONSTANT POOL
!

.L174:
	.ascii	"FAIL : pthread_limit not understood\n\000"
	.size	.L174,37
	.type	.L174,#object
	.align	8
!
! CONSTANT POOL
!

.L179:
	.ascii	"WARN : pthread_limit is unreasonable\n\000"
	.size	.L179,38
	.type	.L179,#object
	.align	8
!
! CONSTANT POOL
!

.L192:
	.ascii	"WARN : pthread_limit is not a perfect\n\000"
	.size	.L192,39
	.type	.L192,#object
	.align	8
!
! CONSTANT POOL
!

.L193:
	.ascii	"     : power of two. We shall assume\n\000"
	.size	.L193,38
	.type	.L193,#object
	.align	8
!
! CONSTANT POOL
!

.L194:
	.ascii	"     : %i POSIX thread(s).\n\000"
	.size	.L194,28
	.type	.L194,#object
	.align	8
!
! CONSTANT POOL
!

.L198:
	.ascii	"WARN : No arguments received thus we have\n\000"
	.size	.L198,43
	.type	.L198,#object
	.align	8
!
! CONSTANT POOL
!

.L199:
	.ascii	"     : some hard coded values ... enjoy.\n\000"
	.size	.L199,42
	.type	.L199,#object
	.align	8
!
! CONSTANT POOL
!

.L200:
	.ascii	"\n    mand_bail = %i\n\000"
	.size	.L200,21
	.type	.L200,#object
	.align	8
!
! CONSTANT POOL
!

.L201:
	.ascii	"pthread_limit = %i\n\000"
	.size	.L201,20
	.type	.L201,#object
	.align	8
!
! CONSTANT POOL
!

.L202:
	.ascii	"    translate = ( %-+32.26e , %-+32.26e )\n\000"
	.size	.L202,43
	.type	.L202,#object
	.align	8
!
! CONSTANT POOL
!

.L203:
	.ascii	"      magnify = %-+32.26e\n\n\000"
	.size	.L203,28
	.type	.L203,#object
	.align	4
!
! CONSTANT POOL
!

.L204:
	.ascii	"\n X11 : \000"
	.size	.L204,9
	.type	.L204,#object
	.align	8
!
! CONSTANT POOL
!

.L205:
	.ascii	"default width=%4i height=%4i\n\000"
	.size	.L205,30
	.type	.L205,#object
	.align	8
!
! CONSTANT POOL
!

.L208:
	.ascii	"%s: no X server?? \'%s\'\n\000"
	.size	.L208,24
	.type	.L208,#object
	.align	8
!
! CONSTANT POOL
!

.L209:
	.ascii	"     : connection number %i\n\000"
	.size	.L209,29
	.type	.L209,#object
	.align	8
!
! CONSTANT POOL
!

.L210:
	.ascii	"     : screen number %i\n\000"
	.size	.L210,25
	.type	.L210,#object
	.align	8
!
! CONSTANT POOL
!

.L211:
	.ascii	"     : default depth is %i\n\000"
	.size	.L211,28
	.type	.L211,#object
	.align	8
!
! CONSTANT POOL
!

.L212:
	.ascii	"lucidasanstypewriter-10\000"
	.size	.L212,24
	.type	.L212,#object
	.align	8
!
! CONSTANT POOL
!

.L213:
	.ascii	"     : display seems to be %i wide and %i high.\n\000"
	.size	.L213,49
	.type	.L213,#object
	.align	8
!
! CONSTANT POOL
!

.L218:
	.ascii	"ERROR: screen is too small\n\n\000"
	.size	.L218,29
	.type	.L218,#object
	.align	8
!
! CONSTANT POOL
!

.L219:
	.ascii	"     : offset x=%i y=%i\n\000"
	.size	.L219,25
	.type	.L219,#object
	.align	4
!
! CONSTANT POOL
!

.L221:
	.ascii	"red\000"
	.size	.L221,4
	.type	.L221,#object
	.align	8
!
! CONSTANT POOL
!

.L223:
	.ascii	"XAllocNamedColor - no red color?\n\000"
	.size	.L223,34
	.type	.L223,#object
	.align	2
!
! CONSTANT POOL
!

.L225:
	.ascii	"green\000"
	.size	.L225,6
	.type	.L225,#object
	.align	8
!
! CONSTANT POOL
!

.L227:
	.ascii	"XAllocNamedColor - red works but green no??\n\000"
	.size	.L227,45
	.type	.L227,#object
	.align	2
!
! CONSTANT POOL
!

.L229:
	.ascii	"blue\000"
	.size	.L229,5
	.type	.L229,#object
	.align	8
!
! CONSTANT POOL
!

.L231:
	.ascii	"XAllocNamedColor - red and green okay but blue??\n\000"
	.size	.L231,50
	.type	.L231,#object
	.align	2
!
! CONSTANT POOL
!

.L233:
	.ascii	"yellow\000"
	.size	.L233,7
	.type	.L233,#object
	.align	8
!
! CONSTANT POOL
!

.L235:
	.ascii	"XAllocNamedColor - yellow bork bork bork!\n\000"
	.size	.L235,43
	.type	.L235,#object
	.align	2
!
! CONSTANT POOL
!

.L237:
	.ascii	"cyan\000"
	.size	.L237,5
	.type	.L237,#object
	.align	8
!
! CONSTANT POOL
!

.L239:
	.ascii	"XAllocNamedColor - cyan bork bork bork!\n\000"
	.size	.L239,41
	.type	.L239,#object
	.align	4
!
! CONSTANT POOL
!

.L241:
	.ascii	"magenta\000"
	.size	.L241,8
	.type	.L241,#object
	.align	8
!
! CONSTANT POOL
!

.L243:
	.ascii	"XAllocNamedColor - magenta bork bork!\n\000"
	.size	.L243,39
	.type	.L243,#object
	.align	8
!
! CONSTANT POOL
!

.L245:
	.ascii	"cornflowerblue\000"
	.size	.L245,15
	.type	.L245,#object
	.align	8
!
! CONSTANT POOL
!

.L247:
	.ascii	"XAllocNamedColor - cornflowerblue fails.\n\000"
	.size	.L247,42
	.type	.L247,#object
	.align	8
!
! CONSTANT POOL
!

.L250:
	.ascii	"XAllocColor - royal_blue fails.\n\000"
	.size	.L250,33
	.type	.L250,#object
	.align	8
!
! CONSTANT POOL
!

.L253:
	.ascii	"XAllocColor - oldlace fails.\n\000"
	.size	.L253,30
	.type	.L253,#object
	.align	8
!
! CONSTANT POOL
!

.L256:
	.ascii	"XAllocColor - very_dark_grey fails.\n\000"
	.size	.L256,37
	.type	.L256,#object
	.align	8
!
! CONSTANT POOL
!

.L259:
	.ascii	"XAllocColor - gee .. mandlebrot fail.\n\000"
	.size	.L259,39
	.type	.L259,#object
	.align	8
!
! CONSTANT POOL
!

.L260:
	.ascii	"     : eff_width = %5i    eff_height = %5i\n\n\000"
	.size	.L260,45
	.type	.L260,#object
	.align	8
!
! CONSTANT POOL
!

.L261:
	.ascii	"--------------------------------------------\n\000"
	.size	.L261,46
	.type	.L261,#object
	.align	8
!
! CONSTANT POOL
!

.L262:
	.ascii	"pixel_real_w = %-+32.26e\n\000"
	.size	.L262,26
	.type	.L262,#object
	.align	8
!
! CONSTANT POOL
!

.L263:
	.ascii	"pixel_imag_h = %-+32.26e\n\000"
	.size	.L263,26
	.type	.L263,#object
	.align	2
!
! CONSTANT POOL
!

.L264:
	.ascii	"REPLOT\000"
	.size	.L264,7
	.type	.L264,#object
	.align	2
!
! CONSTANT POOL
!

.L265:
	.ascii	"TMPDIR\000"
	.size	.L265,7
	.type	.L265,#object
	.align	4
!
! CONSTANT POOL
!

.L273:
	.ascii	"No TMPDIR\000"
	.size	.L273,10
	.type	.L273,#object
	.align	2
!
! CONSTANT POOL
!

.L274:
	.ascii	"DUMPER\000"
	.size	.L274,7
	.type	.L274,#object
	.align	8
!
! CONSTANT POOL
!

.L296:
	.ascii	"[0000] tdelta = %14lu nsec\000"
	.size	.L296,27
	.type	.L296,#object
	.align	8
!
! CONSTANT POOL
!

.L305:
	.ascii	"FAIL : calloc says ENOMEM\n\000"
	.size	.L305,27
	.type	.L305,#object
	.align	8
!
! CONSTANT POOL
!

.L306:
	.ascii	"     : so best buy some more.\n\000"
	.size	.L306,31
	.type	.L306,#object
	.align	8
!
! CONSTANT POOL
!

.L323:
	.ascii	"raw  [ %-4i , %-4i ]\000"
	.size	.L323,21
	.type	.L323,#object
	.align	4
!
! CONSTANT POOL
!

.L324:
	.ascii	"%s\n\000"
	.size	.L324,4
	.type	.L324,#object
	.align	8
!
! CONSTANT POOL
!

.L332:
	.ascii	"vbox  [ %03i , %03i ]\000"
	.size	.L332,22
	.type	.L332,#object
	.align	8
!
! CONSTANT POOL
!

.L333:
	.ascii	"fp64( %-+10.8e , %-+10.8e )\000"
	.size	.L333,28
	.type	.L333,#object
	.align	8
!
! CONSTANT POOL
!

.L334:
	.ascii	"fp64( %-+32.26e,\n      %-+32.26e )\n\000"
	.size	.L334,36
	.type	.L334,#object
	.align	8
!
! CONSTANT POOL
!

.L335:
	.ascii	"c = ( %-+32.26e,\n      %-+32.26e )\n\000"
	.size	.L335,36
	.type	.L335,#object
	.align	8
!
! CONSTANT POOL
!

.L336:
	.ascii	" select = %-+16.12e, %-+16.12e  \000"
	.size	.L336,33
	.type	.L336,#object
	.align	8
!
! CONSTANT POOL
!

.L337:
	.ascii	"bailout = %-8i with a pthread_limit = %-3i\000"
	.size	.L337,43
	.type	.L337,#object
	.align	8
!
! CONSTANT POOL
!

.L338:
	.ascii	"magnify = %-12.10e\000"
	.size	.L338,19
	.type	.L338,#object
	.align	8
!
! CONSTANT POOL
!

.L339:
	.ascii	" centre = %-+16.12e, %-+16.12e  \000"
	.size	.L339,33
	.type	.L339,#object
	.align	8
!
! CONSTANT POOL
!

.L340:
	.ascii	"pixel_real_w = %-+16.12e\000"
	.size	.L340,25
	.type	.L340,#object
	.align	8
!
! CONSTANT POOL
!

.L341:
	.ascii	"pixel_imag_h = %-+16.12e\000"
	.size	.L341,25
	.type	.L341,#object
	.align	8
!
! CONSTANT POOL
!

.L353:
	.ascii	"PTHRD: join %i done\n\000"
	.size	.L353,21
	.type	.L353,#object
	.align	8
!
! CONSTANT POOL
!

.L355:
	.ascii	"[join] = %14lu nsec   %08.6e sec\000"
	.size	.L355,33
	.type	.L355,#object
	.align	8
!
! CONSTANT POOL
!

.L386:
	.ascii	"[plot] = %14lu nsec   %08.6e sec\000"
	.size	.L386,33
	.type	.L386,#object
	.align	8
!
! CONSTANT POOL
!

.L398:
	.ascii	"f(%-+2i) = %-9.5e  \000"
	.size	.L398,20
	.type	.L398,#object
	.align	8
!
! CONSTANT POOL
!

.L412:
	.ascii	"  factor set to 1  \000"
	.size	.L412,20
	.type	.L412,#object
	.align	4
!
! CONSTANT POOL
!

.L424:
	.ascii	">REPLOT<\000"
	.size	.L424,9
	.type	.L424,#object
	.align	4
!
! CONSTANT POOL
!

.L426:
	.ascii	" REPLOT \000"
	.size	.L426,9
	.type	.L426,#object
	.align	8
!
! CONSTANT POOL
!

.L427:
	.ascii	"INFO : mand_bail changed to %u\n\000"
	.size	.L427,32
	.type	.L427,#object
	.align	8
!
! CONSTANT POOL
!

.L428:
	.ascii	"INFO : magnify changed to %-+16.10e\n\000"
	.size	.L428,37
	.type	.L428,#object
	.align	8
!
! CONSTANT POOL
!

.L429:
	.ascii	"INFO : c = %-+16.12e, %-+16.12e  \000"
	.size	.L429,34
	.type	.L429,#object
	.align	4
!
! CONSTANT POOL
!

.L453:
	.ascii	">DUMPER<\000"
	.size	.L453,9
	.type	.L453,#object
	.align	8
!
! CONSTANT POOL
!

.L454:
	.ascii	"INFO : dumper_flag = 1\n\000"
	.size	.L454,24
	.type	.L454,#object
	.align	4
!
! CONSTANT POOL
!

.L468:
	.ascii	"Data Ready\000"
	.size	.L468,11
	.type	.L468,#object
	.align	8
!
! CONSTANT POOL
!

.L469:
	.ascii	"%Y%m%d%H%M%S\000"
	.size	.L469,13
	.type	.L469,#object
	.align	1
!
! CONSTANT POOL
!

.L470:
	.ascii	"/\000"
	.size	.L470,2
	.type	.L470,#object
	.align	8
!
! CONSTANT POOL
!

.L473:
	.ascii	"FAIL : file %s can not be created.\n\000"
	.size	.L473,36
	.type	.L473,#object
	.align	1
!
! CONSTANT POOL
!

.L475:
	.ascii	"wb\000"
	.size	.L475,3
	.type	.L475,#object
	.align	8
!
! CONSTANT POOL
!

.L479:
	.ascii	"INFO : file %s dump begins.\n\000"
	.size	.L479,29
	.type	.L479,#object
	.align	8
!
! CONSTANT POOL
!

.L486:
	.ascii	"     : %2lu byte uint32_t num_elements num_written = %lu\n\000"
	.size	.L486,58
	.type	.L486,#object
	.align	8
!
! CONSTANT POOL
!

.L487:
	.ascii	"     : num_elements = %8i\n\000"
	.size	.L487,27
	.type	.L487,#object
	.align	8
!
! CONSTANT POOL
!

.L491:
	.ascii	"     : %2lu byte uint32_t mand_bail    num_written = %lu\n\000"
	.size	.L491,58
	.type	.L491,#object
	.align	8
!
! CONSTANT POOL
!

.L492:
	.ascii	"     : mand_bail = %8i\n\000"
	.size	.L492,24
	.type	.L492,#object
	.align	8
!
! CONSTANT POOL
!

.L496:
	.ascii	"     : %2lu byte double magnify        num_written = %lu\n\000"
	.size	.L496,58
	.type	.L496,#object
	.align	8
!
! CONSTANT POOL
!

.L497:
	.ascii	"     :        magnify = %-+32.26e\n\000"
	.size	.L497,35
	.type	.L497,#object
	.align	8
!
! CONSTANT POOL
!

.L501:
	.ascii	"DBUG : %2lu byte double real_translate num_written = %lu\n\000"
	.size	.L501,58
	.type	.L501,#object
	.align	8
!
! CONSTANT POOL
!

.L502:
	.ascii	"     : real_translate = %-+32.26e\n\000"
	.size	.L502,35
	.type	.L502,#object
	.align	8
!
! CONSTANT POOL
!

.L506:
	.ascii	"     : %2lu byte double imag_translate num_written = %lu\n\000"
	.size	.L506,58
	.type	.L506,#object
	.align	8
!
! CONSTANT POOL
!

.L507:
	.ascii	"     : imag_translate = %-+32.26e\n\000"
	.size	.L507,35
	.type	.L507,#object
	.align	8
!
! CONSTANT POOL
!

.L511:
	.ascii	"INFO : file %s closed.\n\000"
	.size	.L511,24
	.type	.L511,#object
	.align	4
!
! CONSTANT POOL
!

.L514:
	.ascii	"Bad TMPDIR\000"
	.size	.L514,11
	.type	.L514,#object
	.align	8
!
! CONSTANT POOL
!

.L516:
	.ascii	"INFO : dumper_flag = 0\n\000"
	.size	.L516,24
	.type	.L516,#object
	.align	4
!
! CONSTANT POOL
!

.L518:
	.ascii	"No Data\000"
	.size	.L518,8
	.type	.L518,#object
	.align	8
!
! CONSTANT POOL
!

.L527:
	.ascii	"DBUG : sample space [ %-6i, %-6i ]\n\000"
	.size	.L527,36
	.type	.L527,#object
	.align	8
!
! CONSTANT POOL
!

.L528:
	.ascii	"fp64( %-10.8e , %-10.8e )\000"
	.size	.L528,26
	.type	.L528,#object
	.align	4
!
! CONSTANT POOL
!

.L529:
	.ascii	"     : %s\n\000"
	.size	.L529,11
	.type	.L529,#object
	.align	8
!
! CONSTANT POOL
!

.L530:
	.ascii	"     : win_r = %-+32.26e\n\000"
	.size	.L530,26
	.type	.L530,#object
	.align	8
!
! CONSTANT POOL
!

.L531:
	.ascii	"     : win_j = %-+32.26e\n\000"
	.size	.L531,26
	.type	.L531,#object
	.align	8
!
! CONSTANT POOL
!

.L532:
	.ascii	"fp64( %-+10.8e , %-+10.8e )  \000"
	.size	.L532,30
	.type	.L532,#object
	.align	8
!
! CONSTANT POOL
!

.L533:
	.ascii	"     : after translation\n\000"
	.size	.L533,26
	.type	.L533,#object
	.align	8
!
! CONSTANT POOL
!

.L534:
	.ascii	"     : r_trn   = %-+32.26e\n\000"
	.size	.L534,28
	.type	.L534,#object
	.align	8
!
! CONSTANT POOL
!

.L535:
	.ascii	"     : j_trn   = %-+32.26e\n\000"
	.size	.L535,28
	.type	.L535,#object
	.align	8
!
! CONSTANT POOL
!

.L536:
	.ascii	"     : x_prime = %-+32.26e\n\000"
	.size	.L536,28
	.type	.L536,#object
	.align	8
!
! CONSTANT POOL
!

.L537:
	.ascii	"     : y_prime = %-+32.26e\n\000"
	.size	.L537,28
	.type	.L537,#object
	.align	8
!
! CONSTANT POOL
!

.L538:
	.ascii	"bailout = %-8i          \000"
	.size	.L538,25
	.type	.L538,#object
	.align	8
!
! CONSTANT POOL
!

.L539:
	.ascii	"     : magnify = %-18.12e\n\000"
	.size	.L539,27
	.type	.L539,#object
	.align	8
!
! CONSTANT POOL
!

.L596:
	.ascii	"[vbox] = %14lu nsec   %08.6e sec\000"
	.size	.L596,33
	.type	.L596,#object
	.align	8
!
! CONSTANT POOL
!

.L599:
	.ascii	"[mand] = %14lu nsec   %08.6e sec\000"
	.size	.L599,33
	.type	.L599,#object
	.align	2
!
! CONSTANT POOL
!

.L600:
	.ascii	"%s\n\n\000"
	.size	.L600,5
	.type	.L600,#object
	.align	8
!
! CONSTANT POOL
!

.L601:
	.ascii	"\nraw data values -------------------------------------------------------\n\000"
	.size	.L601,74
	.type	.L601,#object
	.align	8
!
! CONSTANT POOL
!

.L602:
	.ascii	"     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n\000"
	.size	.L602,38
	.type	.L602,#object
	.align	8
!
! CONSTANT POOL
!

.L603:
	.ascii	"     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n\000"
	.size	.L603,38
	.type	.L603,#object
	.align	8
!
! CONSTANT POOL
!

.L604:
	.ascii	"     :       mand_height = %9i\n\000"
	.size	.L604,32
	.type	.L604,#object
	.align	8
!
! CONSTANT POOL
!

.L605:
	.ascii	"     : r[ 7][ 7][63][63] = %-+32.26e\n\000"
	.size	.L605,38
	.type	.L605,#object
	.align	8
!
! CONSTANT POOL
!

.L606:
	.ascii	"     : j[ 7][ 7][63][63] = %-+32.26e\n\000"
	.size	.L606,38
	.type	.L606,#object
	.align	8
!
! CONSTANT POOL
!

.L607:
	.ascii	"     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n\000"
	.size	.L607,38
	.type	.L607,#object
	.align	8
!
! CONSTANT POOL
!

.L608:
	.ascii	"     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n\000"
	.size	.L608,38
	.type	.L608,#object
	.align	8
!
! CONSTANT POOL
!

.L609:
	.ascii	"     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n\000"
	.size	.L609,38
	.type	.L609,#object
	.align	8
!
! CONSTANT POOL
!

.L610:
	.ascii	"     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n\000"
	.size	.L610,38
	.type	.L610,#object
	.align	8
!
! CONSTANT POOL
!

.L611:
	.ascii	"     : r[ 8][ 8][32][32] = %-+32.26e\n\000"
	.size	.L611,38
	.type	.L611,#object
	.align	8
!
! CONSTANT POOL
!

.L612:
	.ascii	"     : j[ 8][ 8][32][32] = %-+32.26e\n\000"
	.size	.L612,38
	.type	.L612,#object
	.align	8
!
! CONSTANT POOL
!

.L613:
	.ascii	"     : r[ 3][12][44][21] = %-+32.26e\n\000"
	.size	.L613,38
	.type	.L613,#object
	.align	8
!
! CONSTANT POOL
!

.L614:
	.ascii	"     : j[ 3][12][44][21] = %-+32.26e\n\000"
	.size	.L614,38
	.type	.L614,#object
	.align	8
!
! CONSTANT POOL
!

.L615:
	.ascii	"     : r[15][15][63][63] = %-+32.26e\n\000"
	.size	.L615,38
	.type	.L615,#object
	.align	8
!
! CONSTANT POOL
!

.L616:
	.ascii	"     : j[15][15][63][63] = %-+32.26e\n\000"
	.size	.L616,38
	.type	.L616,#object
	.align	8
!
! CONSTANT POOL
!

.L617:
	.ascii	"--------------------------- full plot done -----------------------------\n\000"
	.size	.L617,74
	.type	.L617,#object
	.align	8
!
! CONSTANT POOL
!

.L621:
	.ascii	"right click\n\000"
	.size	.L621,13
	.type	.L621,#object
	.align	8
!
! CONSTANT POOL
!

.L622:
	.ascii	"[%04i] tdelta = %14lu nsec\000"
	.size	.L622,27
	.type	.L622,#object
	.align	1
!
! CONSTANT POOL
!

.L625:
	.ascii	"\n\n\000"
	.size	.L625,3
	.type	.L625,#object
	.align	4
!
! CONSTANT POOL
!

.L629:
	.ascii	"roll up\n\000"
	.size	.L629,9
	.type	.L629,#object
	.align	4
!
! CONSTANT POOL
!

.L633:
	.ascii	"roll down\n\000"
	.size	.L633,11
	.type	.L633,#object
	.align	8
!
! CONSTANT POOL
!

.L635:
	.ascii	"\n ??? unknown button ???\n\000"
	.size	.L635,26
	.type	.L635,#object
	.align	8
!
! CONSTANT POOL
!

.L636:
	.ascii	"click at %d %d \n\000"
	.size	.L636,17
	.type	.L636,#object

	.section	".text",#alloc,#execinstr,#progbits
/* 000000	   0 */		.align	8
!
! CONSTANT POOL
!
                       

			.L___const_seg_900000101:
/* 000000	   0 */		.word	1074790400,0
/* 0x0008	     */		.word	1075838976,0
/* 0x0010	     */		.word	1072693248,0
/* 0x0018	     */		.word	1127219200,0
/* 0x0020	     */		.word	1106247680,0
/* 0x0028	     */		.word	1073741824,0
/* 0x0030	     */		.word	1024
/* 0x0034	   0 */		.align	8
/* 0x0038	   0 */		.word	1074266112,0
/* 0x0040	     */		.word	1104006501,0
/* 0x0048	     */		.word	1081081856,0
/* 0x0050	     */		.word	1030854553,-2127697391
/* 0x0058	     */		.word	1073532108,-858993459
/* 0x0060	     */		.word	1074003968,0
/* 0x0068	     */		.word	1074340347,1413754136
/* 0x0070	     */		.word	1075052544,0
/* 0x0078	     */		.word	1069745575,149808459
/* 0x0080	     */		.word	1073514041,-706436221
/* 0x0088	     */		.word	1071644672,0
/* 0x0090	     */		.word	1070773389,988186075
/* 0x0098	     */		.word	1072497143,1359271250
/* 0x00a0	     */		.word	1073713449,-2003859942
/* 0x00a8	     */		.word	1081073664,0
/* 0x00b0	     */		.word	1076887552,0
/* 0x00b8	     */		.word	1078984704,0
/* 0x00c0	     */		.word	1105199104,0
/* 0x00c8	   0 */		.type	.L___const_seg_900000101,#object
/* 0x00c8	   0 */		.size	.L___const_seg_900000101,(.-.L___const_seg_900000101)
/* 0x00c8	   0 */		.align	8
/* 0x00c8	     */		.word	65536
/* 0x00cc	     */		.word	65536,65536,65536,65536,65536,65536,65536,65536,65536,65536,65536,65536,65536
/* 0x0100	     */		.align	64
! FILE xmand.c

!    2		      !/*
!    3		      ! * xmand.c draw the mandelbrot set with libX11 calls and POSIX threads
!    4		      ! *
!    5		      ! *     WARNING : this entire mess is a big long hack thrown
!    6		      ! *               together while streaming on twitch
!    7		      ! *
!    8		      ! * Copyright (C) Dennis Clarke 2019
!    9		      ! *
!   10		      ! * This program is free software: you can redistribute it and/or modify
!   11		      ! * it under the terms of the GNU General Public License as published by
!   12		      ! * the Free Software Foundation, either version 3 of the License, or
!   13		      ! * (at your option) any later version.
!   14		      ! *
!   15		      ! * This program is distributed in the hope that it will be useful,
!   16		      ! * but WITHOUT ANY WARRANTY; without even the implied warranty of
!   17		      ! * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!   18		      ! * GNU General Public License for more details.
!   19		      ! *
!   20		      ! * You should have received a copy of the GNU General Public License
!   21		      ! * along with this program. If not, see <https://www.gnu.org/licenses/>.
!   22		      ! *
!   23		      ! * https://www.gnu.org/licenses/gpl-3.0.txt
!   24		      ! */
!   26		      !/*********************************************************************
!   27		      ! * The Open Group Base Specifications Issue 6
!   28		      ! * IEEE Std 1003.1, 2004 Edition
!   29		      ! *
!   30		      ! *    An XSI-conforming application should ensure that the feature
!   31		      ! *    test macro _XOPEN_SOURCE is defined with the value 600 before
!   32		      ! *    inclusion of any header. This is needed to enable the
!   33		      ! *    functionality described in The _POSIX_C_SOURCE Feature Test
!   34		      ! *    Macro and in addition to enable the XSI extension.
!   35		      ! *
!   36		      ! *********************************************************************/
!   37		      !#define _XOPEN_SOURCE 600
!   39		      !#include <X11/Xlib.h>
!   40		      !#include <pthread.h>
!   41		      !#include <stdio.h>
!   42		      !#include <stdlib.h>
!   43		      !#include <stdint.h>
!   44		      !#include <string.h>
!   45		      !#include <sched.h>
!   46		      !#include <time.h>
!   47		      !#include <math.h>
!   48		      !#include <limits.h>
!   50		      !/* for a good read about fused multiply add operations please
!   51		      ! * see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=37845 */
!   52		      !#include <fenv.h>
!   53		      !#pragma STDC FENV_ACCESS ON
!   54		      !#pragma STDC FP_CONTRACT ON
!   56		      !#define __STDC_FORMAT_MACROS
!   57		      !#include <inttypes.h>
!   59		      !#include <locale.h>
!   60		      !#include <unistd.h>
!   61		      !#include <math.h>
!   62		      !#include <errno.h>
!   64		      !#include <pthread.h>
!   66		      !#include <fcntl.h>
!   67		      !#include <sys/stat.h>
!   69		      !#include "mandelbrot.h"
!   71		      !int main(int argc, char*argv[])
!   72		      !{

!
! SUBROUTINE main
!
! OFFSET    SOURCE LINE	LABEL	INSTRUCTION

                       	.global main
                       

			main:

! Registers live out of main: 
! g2 g3 o0 o1 o2 sp l2 l4 l7 i0 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: main

			.L900001172:
/* 000000	  72 */		save	%sp,-176,%sp
/* 0x0004	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%l7
/* 0x0008	  72 */		sethi	%hi(0x401400),%l0
/* 0x000c	   0 */		xor	%l7,%gdop_lox10(.L___const_seg_900000101),%i2
/* 0x0010	  72 */		xor	%l0,-64,%l0
/* 0x0014	     */		call	_stack_grow	!params=  %o0	!result=  %o0
/* 0x0018	     */		add	%sp,%l0,%o0
/* 0x001c	     */		add	%sp,%l0,%sp
                       

			.L900001058:
/* 0x0020	  72 */		call	(.+0x8)	! getpc
/* 0x0024	     */		mov	%o7,%o7
/* 0x0028	     */		sethi	%pc22(_GLOBAL_OFFSET_TABLE_-(.L900001058-.)),%l5

!   73		      !    pthread_t tid[MAX_THREADS]; /* array of thread IDs */
!   74		      !    /* our display and window and graphics context */
!   75		      !    Display *dsp;
!   76		      !    Window win, win2, win3;
!   77		      !    GC gc, gc2, gc3;
!   78		      !    Colormap screen_colormap;
!   79		      !    XEvent event;
!   80		      !    Font type_font;
!   82		      !    /* a very few colours */
!   83		      !    XColor red, green, blue, yellow, cyan, magenta;
!   84		      !    XColor cornflowerblue, royal_blue, very_dark_grey;
!   85		      !    XColor oldlace, mandlebrot;
!   87		      !    /* pre-loaded 8-bit color map */
!   88		      !    unsigned long lsd_trippy[256];
!   90		      !    /* We have a whole new method of dealing with color for
!   91		      !     * the mandlebrot and thus we need some intermediate vars */
!   92		      !    double t_param, t_param_exponent, gamma, hue, rotation;
!   93		      !    double shift, gamma_factor;
!   94		      !    uint8_t red_bits, green_bits, blue_bits;
!   95		      !    double red_level, green_level, blue_level;
!   97		      !    /* we can swap back and forth on the colour method with
!   98		      !     * a trivial flag */
!   99		      !    int colour_method_flag = 0;
!  100		      !    int invert_me_dammit = 0;
!  102		      !    /* we need a double click on replot to trigger */
!  103		      !    int replot_flag = 0;
!  105		      !    /* we need a double click on the file dumper also */
!  106		      !    int dumper_flag = 0;
!  108		      !    /* please see https://arxiv.org/abs/1108.5083
!  109		      !     * A colour scheme for the display of astronomical intensity images
!  110		      !     * D. A. Green 25 Aug 2011 (v1), revised 30 Aug 2011
!  111		      !     *
!  112		      !     * I describe a colour scheme that is appropriate for the screen
!  113		      !     * display of intensity images. This -- unlike many currently
!  114		      !     * available schemes -- is designed to be monotonically increasing
!  115		      !     * in terms of its perceived brightness.
!  116		      !     */
!  118		      !    /* setup mouse x and y */
!  119		      !    int mouse_x = -1, mouse_y = -1;
!  120		      !    int invert_mouse_y;
!  121		      !    int mouse_x_raw, mouse_y_raw;
!  123		      !    /* these next five are just mouse button counters where the
!  124		      !     * roll_up and roll_dn are mouse wheel events */
!  125		      !    int button = 0;
!  126		      !    int left_count, mid_count, right_count, roll_up, roll_dn;
!  127		      !    left_count = 0;
!  128		      !    mid_count = 0;
!  129		      !    right_count = 0;
!  130		      !    roll_up = 0;
!  131		      !    roll_dn = 0;
!  133		      !    uint64_t t_delta;
!  135		      !    struct timespec t0, t1, now_time;
!  136		      !    struct timespec vbox_t0, vbox_t1;
!  137		      !    struct timespec soln_t0, soln_t1;
!  139		      !    /* lets assume the user will specify some number of
!  140		      !     * threads to dispatch at once. For now we will hard
!  141		      !     * code a silly limit */
!  142		      !    int pthread_limit = 1;
!  144		      !    /* some primordial vars */
!  145		      !    int disp_width, disp_height;
!  146		      !    unsigned int width, height;
!  147		      !    int conn_num, screen_num, depth;
!  148		      !    int j, k, p, q, pt, offset_x, offset_y;
!  149		      !    int lx, ly, ux, uy;
!  150		      !    int gc2_x, gc2_y;
!  151		      !    int eff_width, eff_height, vbox_w, vbox_h;
!  152		      !    double obs_real, obs_imag;
!  153		      !    double sub_pixel_real, sub_pixel_imag;
!  154		      !    double pixel_real_width, pixel_imag_height;
!  155		      !    double magnify, real_translate, imag_translate;
!  157		      !    /* what is the default width and height on the complex plane ? */
!  158		      !    double default_real = DEFAULT_REAL_WIDTH;
!  159		      !    double default_imag = DEFAULT_IMAG_HEIGHT;
!  162		      !    /* ensure these are initialized */
!  163		      !    double x_prime = -8.0;
!  164		      !    double y_prime = -8.0;
!  166		      !    /* eventually we will need to refer to a digital coordinate
!  167		      !     * that overlaps the complex coordinate space */
!  168		      !    int sample_r, sample_j;
!  170		      !    /* use the vbox lower left coords as reference */
!  171		      !    int vbox_ll_x, vbox_ll_y;
!  173		      !    /* we need to track when a vbox has been computed
!  174		      !     * as well as displayed via libX11. For now we just
!  175		      !     * don't want to recompute the same region over and
!  176		      !     * over and over. */
!  177		      !    int vbox_flag[VBOX_REAL_COUNT][VBOX_IMAG_COUNT];
!  178		      !    /* ensure we start with clear vbox flags */
!  179		      !    memset(&vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_IMAG_COUNT)*sizeof(int
!  179		      >));

/* 0x002c	 179 */		add	%fp,-1057,%o0
/* 0x0030	  72 */		add	%l5,%pc10(_GLOBAL_OFFSET_TABLE_-(.L900001058-.)),%l5
/* 0x0034	 179 */		mov	1024,%o2
/* 0x0038	  72 */		add	%l5,%o7,%l7
/* 0x003c	 179 */		mov	0,%o1
/* 0x0040	   0 */		ldx	[%l7+%i2],%i3,%gdop(.L___const_seg_900000101)

!  181		      !    /* Also we finally have use for the little box grid that we
!  182		      !     * lay out and thus we will need the box coordinates */
!  183		      !    int vbox_r, vbox_j;
!  185		      !    /* It is a surprise to me that this array fits into the stack
!  186		      !     * memory of modern linux systems. We shall get this to the
!  187		      !     * heap real soon now. Consider that a TODO.
!  188		      !     *
!  189		      !     * Why hasn't this been done?
!  190		      !     * */
!  191		      !    uint32_t mandel_val[VBOX_REAL_COUNT][VBOX_IMAG_COUNT][VBOX_SAMPLE_REAL][VBOX_
!  191		      >SAMPLE_IMAG];
!  192		      !    uint32_t num_elements =  VBOX_SAMPLE_REAL * VBOX_SAMPLE_IMAG
!  193		      !                           * VBOX_REAL_COUNT  * VBOX_IMAG_COUNT;

/* 0x0044	 193 */		sethi	%hi(0x100000),%i5
/* 0x0048	   0 */		sethi	%hi(0x800000),%l6
/* 0x004c	  72 */		mov	%i1,%i4
/* 0x0050	     */		mov	%i0,%l2
/* 0x0054	 163 */		ldd	[%i3+8],%f34
/* 0x0058	 158 */		ldd	[%i3],%f32
/* 0x005c	 159 */		std	%f32,[%sp+2999]
/* 0x0060	 158 */		std	%f32,[%sp+2991]
/* 0x0064	 163 */		fnegd	%f34,%f32
/* 0x0068	 164 */		std	%f32,[%sp+2831]
/* 0x006c	 179 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0070	 163 */		std	%f32,[%sp+2823]

!  195		      !    memset(&mandel_val, 0x00,(size_t)num_elements * sizeof(uint32_t));

/* 0x0074	 195 */		mov	0,%o1
/* 0x0078	     */		sethi	%hi(0x400000),%o2
/* 0x007c	 193 */		st	%i5,[%sp+2275]
/* 0x0080	 195 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0084	     */		add	%sp,3215,%o0

!  197		      !    double *coord_r = calloc((size_t)num_elements, sizeof(double));

/* 0x0088	 197 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x008c	     */		mov	%l6,%o0
/* 0x0090	     */		brz,pn	%o0,.L77002740
/* 0x0094	1473 */		mov	%l6,%o2

!  199		      !    if ( coord_r == NULL ) {
!  200		      !        /* really? possible ENOMEM? */
!  201		      !        if ( errno == ENOMEM ) {
!  202		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
!  203		      !                    __FILE__, __LINE__ );
!  204		      !        } else {
!  205		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
!  206		      !                    __FILE__, __LINE__ );
!  207		      !        }
!  208		      !        perror("FAIL ");
!  209		      !        /* NOTE : it is very nasty to bail out this way
!  210		      !         *        but why bother to continue ?
!  211		      !         */
!  212		      !        return EXIT_FAILURE;
!  213		      !    }
!  216		      !    double *coord_j = calloc((size_t)num_elements, sizeof(double));
!  218		      !    if ( coord_j == NULL ) {
!  219		      !        /* really? possible ENOMEM? */
!  220		      !        if ( errno == ENOMEM ) {
!  221		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
!  222		      !                    __FILE__, __LINE__ );
!  223		      !        } else {
!  224		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
!  225		      !                    __FILE__, __LINE__ );
!  226		      !        }
!  227		      !        perror("FAIL ");
!  228		      !        /* NOTE : it is very nasty to bail out this way
!  229		      !         *        but why bother to continue ?
!  230		      !         */
!  231		      !        return EXIT_FAILURE;
!  232		      !    }
!  234		      !    /* pre-fill the lsd trippy color map */
!  235		      !    for ( k=0; k<256; k++ ) {
!  236		      !        lsd_trippy[k] = mandle_col((uint8_t)k);
!  237		      !    }
!  239		      !    int candidate_int = 0;
!  240		      !    long long unsigned int candidate_magnify = 0;
!  242		      !    /* the janky slider for magnify shall be a trivial
!  243		      !     * position that gets mapped to a binary logarithmic
!  244		      !     * scale from 2^(-10) to 2^(10) and thus we need
!  245		      !     * no more than 21 possible values. The initial
!  246		      !     * value shall be 2^0 == 1 as a factor and that
!  247		      !     * must map to positive 10 on the scale. */
!  248		      !    uint8_t magnify_jank_in, magnify_jank = 10;
!  249		      !    double magnify_factor = 1.0;
!  251		      !    /* the janky slider for bail_out will be nearly
!  252		      !     * identical to the magnify except that we will
!  253		      !     * trap for stupid bail_out values */
!  254		      !    uint8_t bail_out_jank_in, bail_out_jank = 10;
!  255		      !    double bail_out_factor = 1.0;
!  257		      !    double candidate_double = 0.0;
!  258		      !    int fpe_raised = 0;
!  259		      !    uint32_t mand_height, mand_bail;
!  261		      !    int mand_x_pix, mand_y_pix;
!  263		      !    /* These are the initial values within the viewport.
!  264		      !     * They have the domain  -1.0 < win_r < +1.0 and 
!  265		      !     * also the same for win_j. */
!  266		      !    double win_r, win_j;
!  267		      !    /* general purpose fp64 coordinates to toss around */
!  268		      !    fp64 coord;
!  270		      !    /* small general purpose char buffer */
!  271		      !    char *buf = calloc((size_t)128,sizeof(unsigned char));
!  273		      !    char *disp_name = NULL;
!  275		      !    /* I am not checking the status of the setlocale call here
!  276		      !     * because it had better be impossible to fail for a "C"
!  277		      !     * or POSIX locale : 
!  278		      !     *
!  279		      !     * RETURN VALUES
!  280		      !     *     Upon successful completion, setlocale() returns the string
!  281		      !     *     associated with the specified category for the requested
!  282		      !     *     locale.  The setlocale() function returns NULL and fails
!  283		      !     *     to change the locale if the given combination of category
!  284		      !     *     and locale makes no sense.
!  285		      !     */
!  286		      !    setlocale(LC_ALL, "C");
!  288		      !    int status = setenv("TZ", "GMT0", 1);
!  289		      !    if ( status < 0 ) {
!  290		      !        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
!  291		      !        return EXIT_FAILURE;
!  292		      !    }
!  294		      !    /* Get the REALTIME_CLOCK time in a timespec struct */
!  295		      !    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {
!  296		      !        /* We could not get the clock. Bail out. */
!  297		      !        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
!  298		      !        return EXIT_FAILURE;
!  299		      !    } else {
!  300		      !        /* call srand48() with the sub-second time data */
!  301		      !        srand48( (long) now_time.tv_nsec );
!  302		      !    }
!  303		      !    sysinfo(VERBOSE);
!  305		      !    printf("\n\n--------- _XOPEN_SOURCE 600 -------\n");
!  306		      !    printf("_POSIX_CHILD_MAX   = %i\n", _POSIX_CHILD_MAX);
!  307		      !    printf("_POSIX_NGROUPS_MAX = %i\n", _POSIX_NGROUPS_MAX);
!  308		      !    printf("_POSIX_OPEN_MAX    = %i\n", _POSIX_OPEN_MAX);
!  309		      !    printf("_POSIX_PATH_MAX    = %i\n", _POSIX_PATH_MAX);
!  310		      !    printf("_POSIX_TZNAME_MAX  = %i\n", _POSIX_TZNAME_MAX);
!  311		      !    printf("---------------------------------------\n");
!  313		      !#ifdef FLT_EVAL_METHOD
!  314		      !    printf("FLT_EVAL_METHOD    = %i\n", FLT_EVAL_METHOD);
!  315		      !#endif
!  317		      !    /* these two calls are silly and not of much value other than
!  318		      !     * to determine the speed of the clock_gettime() call. Which
!  319		      !     * we don't care much about as it had better be a microsecond. */
!  320		      !    clock_gettime(CLOCK_REALTIME, &soln_t0 );
!  321		      !    clock_gettime(CLOCK_REALTIME, &soln_t1 );
!  322		      !    t_delta = timediff( soln_t0, soln_t1 );
!  323		      !    /* this t_delta is a baseline offset value that we seem to ignore
!  324		      !     * anyways. */
!  325		      !    printf("INFO : baseline tdelta = %14" PRIu64 " nsec\n", t_delta);
!  327		      !    errno = 0;
!  328		      !    if ( ( argc < 6 ) && ( argc > 1 ) ) {
!  329		      !        fprintf(stderr,"FAIL : insufficient arguments provided\n");
!  330		      !        fprintf(stderr,"     : usage %s bail_out_integer \\\n",argv[0]);
!  331		      !        fprintf(stderr,"     :          magnify_integer \\\n");
!  332		      !        fprintf(stderr,"     :          double_real \\\n");
!  333		      !        fprintf(stderr,"     :          double_imaginary\\\n");
!  334		      !        fprintf(stderr,"     :          pthread_count\n");
!  335		      !        fprintf(stderr,"     : quitting.\n");
!  336		      !        return EXIT_FAILURE;
!  337		      !    } else if ( argc >= 6 ) {
!  338		      !        errno = 0;
!  339		      !        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
!  340		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  341		      !            fprintf(stderr,"FAIL : bail_out_integer not understood\n");
!  342		      !            perror("     ");
!  343		      !            return EXIT_FAILURE;
!  344		      !        }
!  345		      !        if ( ( candidate_int < 256 ) || ( candidate_int > 134217728 ) ){
!  346		      !            fprintf(stderr,"WARN : mandlebrot bail out is unreasonable\n");
!  347		      !            fprintf(stderr,"     : we shall assume 4096 and proceed.\n");
!  348		      !            mand_bail = (uint32_t)4096;
!  349		      !        } else {
!  350		      !            mand_bail = (uint32_t)candidate_int;
!  351		      !        }
!  353		      !        errno = 0;
!  354		      !        if ( sscanf( argv[2], "%lld", &candidate_magnify ) == 0 ) {
!  355		      !            fprintf(stderr,"INFO : magnify not understood as long long int\n");
!  356		      !            if ( errno != 0 ) perror("dBUG ");
!  358		      !            /* note that we failed to process argv[2] as a unsigned long long
!  359		      !             * wherein we should have more than 32bits available. We may now
!  360		      !             * fall back to a trivial int type which should be only 32bits */
!  361		      !            errno = 0;
!  362		      !            candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
!  363		      !            if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  364		      !                fprintf(stderr,"FAIL : magnify_integer not understood\n");
!  365		      !                perror("     ");
!  366		      !                return EXIT_FAILURE;
!  367		      !            }
!  368		      !            if ( ( candidate_int < 1 ) || ( candidate_int > ( 1<<30 ) ) ){
!  369		      !                fprintf(stderr,"WARN : magnify_integer is unreasonable\n");
!  370		      !                fprintf(stderr,"     : we shall assume 1 and proceed.\n");
!  371		      !                magnify = 1.0;
!  372		      !            } else {
!  373		      !                magnify = (double)candidate_int;
!  374		      !            }
!  375		      !        } else {
!  376		      !            fprintf(stderr,"INFO : magnify accepted as long long int\n");
!  377		      !            magnify = (double)candidate_magnify;
!  378		      !        }
!  380		      !        errno = 0;
!  381		      !        feclearexcept(FE_ALL_EXCEPT);
!  382		      !        candidate_double = strtod(argv[3], (char **)NULL);
!  383		      !        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
!  384		      !        if (fpe_raised!=0){
!  385		      !            printf("INFO : FP Exception raised is");
!  386		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  387		      !            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
!  388		      !            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
!  389		      !            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
!  390		      !            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
!  391		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  392		      !            printf("\n");
!  393		      !        }
!  394		      !        if ( fpe_raised & FE_INEXACT ) {
!  395		      !            printf("real : Perfectly safe to ignore FE_INEXACT\n");
!  396		      !        }
!  397		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  398		      !            fprintf(stderr,"FAIL : double real coordinate not understood\n");
!  399		      !            perror("     ");
!  400		      !            return EXIT_FAILURE;
!  401		      !        }
!  402		      !        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
!  403		      !            fprintf(stderr,"FAIL : double real coordinate is not normal\n");
!  404		      !            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
!  405		      !            return EXIT_FAILURE;
!  406		      !        }
!  407		      !        feclearexcept(FE_ALL_EXCEPT);
!  408		      !        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
!  409		      !            fprintf(stderr,"WARN : double real coordinate is out of range\n");
!  410		      !            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
!  411		      !            fprintf(stderr,"     : we shall assume zero.\n");
!  412		      !            real_translate = 0.0;
!  413		      !        } else {
!  414		      !            real_translate = candidate_double;
!  415		      !        }
!  417		      !        errno = 0;
!  418		      !        feclearexcept(FE_ALL_EXCEPT);
!  419		      !        candidate_double = strtod(argv[4], (char **)NULL);
!  420		      !        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
!  421		      !        if (fpe_raised!=0){
!  422		      !            printf("INFO : FP Exception raised is");
!  423		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  424		      !            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
!  425		      !            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
!  426		      !            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
!  427		      !            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
!  428		      !            printf("\n");
!  429		      !        }
!  430		      !        if ( fpe_raised & FE_INEXACT ) {
!  431		      !            printf("imag : Perfectly safe to ignore FE_INEXACT\n");
!  432		      !        }
!  433		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  434		      !            fprintf(stderr,"FAIL : double imaginary coordinate not understood\n")
!  434		      >;
!  435		      !            perror("     ");
!  436		      !            return EXIT_FAILURE;
!  437		      !        }
!  438		      !        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
!  439		      !            fprintf(stderr,"FAIL : double imaginary coordinate is not normal\n");
!  440		      !            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
!  441		      !            return EXIT_FAILURE;
!  442		      !        }
!  443		      !        feclearexcept(FE_ALL_EXCEPT);
!  444		      !        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
!  445		      !            fprintf(stderr,"WARN : double imaginary coordinate is out of range\n"
!  445		      >);
!  446		      !            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
!  447		      !            fprintf(stderr,"     : we shall assume zero.\n");
!  448		      !            imag_translate = 0.0;
!  449		      !        } else {
!  450		      !            imag_translate = candidate_double;
!  451		      !        }
!  453		      !        candidate_int = (int)strtol(argv[5], (char **)NULL, 10);
!  454		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  455		      !            fprintf(stderr,"FAIL : pthread_limit not understood\n");
!  456		      !            perror("     ");
!  457		      !            return EXIT_FAILURE;
!  458		      !        }
!  459		      !        if ( ( candidate_int < 1 ) || ( candidate_int > 64 ) ){
!  460		      !            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
!  461		      !            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
!  462		      !            pthread_limit = 1;
!  463		      !        } else {
!  465		      !            if ( candidate_int > 1 ) {
!  467		      !                /* snazzy little bit shifting and counting follows
!  468		      !                 * where this is not at all efficient but is sort of
!  469		      !                 * fun */
!  471		      !                k = 0; /* number of '1' bits in candidate_int */
!  472		      !                j = candidate_int;
!  473		      !                p = 0; /* bit position being tested */
!  474		      !                while (j) {
!  475		      !                    if ( j & 1 ) { /* test the LSB position */
!  476		      !                        k += 1;    /* count the '1' bit */
!  477		      !                    }
!  478		      !                    j = j >> 1;    /* shift left */
!  479		      !                    p += 1;        /* keep track of the bit position */
!  480		      !                }
!  481		      !                if ( k > 1 ) {
!  482		      !                    fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
!  483		      !                    fprintf(stderr,"     : power of two. We shall assume\n");
!  484		      !                    pthread_limit = 1 << ( p - 1 );
!  485		      !                    fprintf(stderr,"     : %i POSIX thread(s).\n", pthread_limit)
!  485		      >;
!  486		      !                } else {
!  487		      !                    pthread_limit = candidate_int;
!  488		      !                }
!  490		      !            } else {
!  491		      !                pthread_limit = 1;
!  492		      !            }
!  493		      !        }
!  495		      !    } else {
!  496		      !        fprintf(stderr,"WARN : No arguments received thus we have\n");
!  497		      !        fprintf(stderr,"     : some hard coded values ... enjoy.\n");
!  498		      !        mand_bail = DEFAULT_BAILOUT;
!  499		      !        magnify = DEFAULT_MAGNIFY;
!  500		      !        real_translate = DEFAULT_REAL_CENTRE;
!  501		      !        imag_translate = DEFAULT_IMAG_CENTRE;
!  502		      !    }
!  504		      !    printf("\n    mand_bail = %i\n", mand_bail);
!  505		      !    printf("pthread_limit = %i\n", pthread_limit);
!  507		      !    printf("    translate = ( %-+32.26e , %-+32.26e )\n",
!  508		      !                                      real_translate, imag_translate );
!  510		      !    printf("      magnify = %-+32.26e\n\n", magnify );
!  512		      !    /* TODO allow adjustment of these colourscheme values */
!  513		      !    gamma = 2.5;
!  514		      !    hue = 1.8;
!  515		      !    rotation = 5.0;
!  516		      !    shift = 1.0;
!  517		      !    t_param_exponent = 1.8;
!  519		      !    /* TODO perhaps use the terms real and imaginary for the
!  520		      !     * data axi and not just x and y. However x and y are nice
!  521		      !     * and short */
!  522		      !    obs_real = default_real / magnify;
!  523		      !    obs_imag = default_imag / magnify;
!  525		      !    width = WIN_WIDTH;
!  526		      !    height = WIN_HEIGHT;
!  527		      !    printf("\n X11 : ");
!  528		      !    printf("default width=%4i height=%4i\n", width, height);
!  530		      !    XSetErrorHandler(X_error_handler);
!  532		      !    /* should work with a null display name */
!  533		      !    dsp = XOpenDisplay(disp_name);
!  534		      !    if (dsp == NULL) {
!  535		      !        fprintf(stderr, "%s: no X server?? '%s'\n",
!  536		      !            argv[0], disp_name);
!  537		      !        return EXIT_FAILURE;
!  538		      !    }
!  539		      !    conn_num = XConnectionNumber(dsp);
!  540		      !    printf("     : connection number %i\n", conn_num);
!  542		      !    screen_num = DefaultScreen(dsp);
!  543		      !    printf("     : screen number %i\n", screen_num);
!  545		      !    depth = XDefaultDepth(dsp,screen_num);
!  546		      !    printf("     : default depth is %i\n", depth);
!  548		      !    /* really we need to get a list of the available fonts and then
!  549		      !     * use one that should work in the correct size
!  550		      !     */
!  551		      !    type_font = XLoadFont(dsp, "lucidasanstypewriter-10");
!  553		      !    disp_width = DisplayWidth(dsp, screen_num);
!  554		      !    disp_height = DisplayHeight(dsp, screen_num);
!  556		      !    printf("     : display seems to be %i wide and %i high.\n",
!  557		      !                                   disp_width, disp_height);
!  559		      !    if ( ( disp_width < (int)width )
!  560		      !         ||
!  561		      !         ( disp_height < (int)height ) ) {
!  562		      !        fprintf(stderr, "ERROR: screen is too small\n\n");
!  563		      !        return EXIT_FAILURE;
!  564		      !    }
!  566		      !    /* These are entirely temporary hard coded screen offsets */
!  567		      !    int win_offset_x = 20;
!  568		      !    int win_offset_y = 20;
!  570		      !    printf("     : offset x=%i y=%i\n", win_offset_x, win_offset_y);
!  572		      !    /* Our primary plotting window has a pale grey background
!  573		      !     * but for debugging mouse locations then it may be nice
!  574		      !     * to use Rebecca Purple 0x663399 */
!  575		      !    unsigned long gc_bg = 0x0f0f0f;
!  576		      !    win = create_borderless_topwin(dsp, width, height,
!  577		      !                                        win_offset_x, win_offset_y,
!  578		      !                                        gc_bg);
!  579		      !    gc = create_gc(dsp, win);
!  581		      !    /* create a smaller darker window to the right */
!  582		      !    unsigned long gc2_bg = 0x040004;
!  583		      !    win2 = create_borderless_topwin(dsp, 400, 330, 1070, 740, gc2_bg );
!  584		      !    gc2 = create_gc(dsp, win2);
!  585		      !    XSetBackground(dsp, gc2, gc2_bg);
!  587		      !    /* create another small window below that */
!  588		      !    unsigned long gc3_bg = 0x000810;
!  589		      !    win3 = create_borderless_topwin(dsp, 440, 330, 1470, 740, gc3_bg );
!  590		      !    gc3 = create_gc(dsp, win2);
!  591		      !    XSetBackground(dsp, gc3, gc3_bg);
!  593		      !    XSync(dsp, False);
!  595		      !    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));
!  596		      !    if (XAllocNamedColor(dsp,
!  597		      !                         screen_colormap,
!  598		      !                         "red", &red, &red) == 0) {
!  599		      !        fprintf(stderr, "XAllocNamedColor - no red color?\n");
!  600		      !        return EXIT_FAILURE;
!  601		      !    }
!  602		      !    if (XAllocNamedColor(dsp,
!  603		      !                         screen_colormap,
!  604		      !                         "green", &green, &green) == 0) {
!  605		      !        fprintf(stderr, "XAllocNamedColor - red works but green no??\n");
!  606		      !        return EXIT_FAILURE;
!  607		      !    }
!  608		      !    if (XAllocNamedColor(dsp,
!  609		      !                         screen_colormap,
!  610		      !                         "blue", &blue, &blue) == 0) {
!  611		      !        fprintf(stderr, "XAllocNamedColor - red and green okay but blue??\n");
!  612		      !        return EXIT_FAILURE;
!  613		      !    }
!  614		      !    if (XAllocNamedColor(dsp,
!  615		      !                         screen_colormap,
!  616		      !                         "yellow", &yellow, &yellow) == 0) {
!  617		      !        fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");
!  618		      !        return EXIT_FAILURE;
!  619		      !    }
!  621		      !    if (XAllocNamedColor(dsp,
!  622		      !                         screen_colormap,
!  623		      !                         "cyan", &cyan, &cyan) == 0) {
!  624		      !        fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");
!  625		      !        return EXIT_FAILURE;
!  626		      !    }
!  628		      !    if (XAllocNamedColor(dsp,
!  629		      !                         screen_colormap,
!  630		      !                         "magenta", &magenta, &magenta) == 0) {
!  631		      !        fprintf(stderr, "XAllocNamedColor - magenta bork bork!\n");
!  632		      !        return EXIT_FAILURE;
!  633		      !    }
!  635		      !    /* cornflowerblue is #6495ED */
!  636		      !    if (XAllocNamedColor(dsp,
!  637		      !                         screen_colormap,
!  638		      !                         "cornflowerblue",
!  639		      !                         &cornflowerblue, &cornflowerblue) == 0) {
!  640		      !        fprintf(stderr, "XAllocNamedColor - cornflowerblue fails.\n");
!  641		      !        return EXIT_FAILURE;
!  642		      !    }
!  644		      !    /* request Royal Blue which should be #4169E1 however we
!  645		      !     * will get whatever the hardware can map closest to the
!  646		      !     * request */
!  647		      !    royal_blue.flags= DoRed | DoGreen | DoBlue;
!  648		      !    royal_blue.red = 0x4100;
!  649		      !    royal_blue.green = 0x6900;
!  650		      !    royal_blue.blue = 0xe100;
!  651		      !    if ( XAllocColor(dsp, screen_colormap, &royal_blue) == 0 ) {
!  652		      !        fprintf(stderr, "XAllocColor - royal_blue fails.\n");
!  653		      !        return EXIT_FAILURE;
!  654		      !    }
!  656		      !    /* possible idea for a progress bar to show that a file
!  657		      !     * is being dumped */
!  658		      !    oldlace.flags= DoRed | DoGreen | DoBlue;
!  659		      !    oldlace.red = 0xfd00;
!  660		      !    oldlace.green = 0xf500;
!  661		      !    oldlace.blue = 0xe600;
!  662		      !    if ( XAllocColor(dsp, screen_colormap, &oldlace) == 0 ) {
!  663		      !        fprintf(stderr, "XAllocColor - oldlace fails.\n");
!  664		      !        return EXIT_FAILURE;
!  665		      !    }
!  667		      !    /* We need an inner grid which in our main plot window
!  668		      !     * which should be a subtle very very dark grey.
!  669		      !     * Here we manually define the rgb components using 16bit
!  670		      !     * values and then create the new color */
!  671		      !    very_dark_grey.flags= DoRed | DoGreen | DoBlue;
!  672		      !    very_dark_grey.red = 0x1f00;
!  673		      !    very_dark_grey.green = 0x1f00;
!  674		      !    very_dark_grey.blue = 0x1f00;
!  675		      !    if ( XAllocColor(dsp, screen_colormap, &very_dark_grey) == 0 ) {
!  676		      !        fprintf(stderr, "XAllocColor - very_dark_grey fails.\n");
!  677		      !        return EXIT_FAILURE;
!  678		      !    }
!  680		      !    /* this is a hack color data value that we will abuse later
!  681		      !     * inside the main mandlebrot computation loop. Colors to
!  682		      !     * be determined via a smooth function brought to you by
!  683		      !     * Patrick Scheibe. */
!  684		      !    mandlebrot.flags= DoRed | DoGreen | DoBlue;
!  685		      !    /* some dummy values */
!  686		      !    mandlebrot.green = 0x0000;
!  687		      !    mandlebrot.blue  = 0x0000;
!  688		      !    mandlebrot.red   = 0xff00;
!  690		      !    if ( XAllocColor(dsp, screen_colormap, &mandlebrot) == 0 ) {
!  691		      !        fprintf(stderr, "XAllocColor - gee .. mandlebrot fail.\n");
!  692		      !        return EXIT_FAILURE;
!  693		      !    }
!  695		      !    /* main plot window yellow pixel at each corner 5 pixels indent */
!  696		      !    XSetForeground(dsp, gc, yellow.pixel);
!  697		      !    XDrawPoint(dsp, win, gc, 5, 5);
!  698		      !    XDrawPoint(dsp, win, gc, 5, (int)height - 5);
!  699		      !    XDrawPoint(dsp, win, gc, (int)width - 5, 5);
!  700		      !    XDrawPoint(dsp, win, gc, (int)width - 5, (int)height - 5);
!  702		      !    XSetLineAttributes(dsp, gc2, 1, LineSolid,
!  703		      !                                    CapButt,
!  704		      !                                    JoinMiter);
!  706		      !    /* janky magnify slider container */
!  707		      !    XSetForeground(dsp, gc2, yellow.pixel);
!  708		      !    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);
!  710		      !    /* janky bail_out slider container */
!  711		      !    XSetForeground(dsp, gc2, WhitePixel(dsp, screen_num));
!  712		      !    XDrawRectangle(dsp, win2, gc2, 215, 60, 176, 12);
!  714		      !    /* draw a blue box inside the second window */
!  715		      !    XSetForeground(dsp, gc2, blue.pixel);
!  716		      !    XDrawRectangle(dsp, win2, gc2, 5, 5, 390, 320);
!  717		      !    XSetForeground(dsp, gc2, cyan.pixel);
!  719		      !    /* a little window to plot the vbox data into with a 3x3 grid
!  720		      !     * for each pixel we sample.  This shall be the 64x64 actual
!  721		      !     * vbox region with room to plot each of the 3x3 samples and
!  722		      !     * we also need room for the one pixel borders.
!  723		      !     *
!  724		      !     * Note : please see the defined VBOX_SAMPLE_REAL and
!  725		      !     *        VBOX_SAMPLE_IMAG values
!  726		      !     */
!  727		      !    XDrawRectangle(dsp, win2, gc2, 10, 10, 202, 202);
!  728		      !    XSetForeground(dsp, gc2, red.pixel);
!  730		      !    /* draw a blue box inside the third window */
!  731		      !    XSetForeground(dsp, gc3, blue.pixel);
!  732		      !    XSetLineAttributes(dsp, gc3, 1, LineSolid,
!  733		      !                                    CapButt,
!  734		      !                                    JoinMiter);
!  736		      !    XDrawRectangle(dsp, win3, gc3, 5, 5, 430, 320);
!  738		      !    /* set our graph box inside by OFFSET pixels
!  739		      !     * use them as interior offset distances for our plot */
!  740		      !    offset_x = 10;
!  741		      !    offset_y = 10;
!  743		      !    /* X11 upper left pixel in a plot region */
!  744		      !    ux = offset_x;
!  745		      !    uy = offset_y;
!  747		      !    /* X11 lower right pixel in a plot region */
!  748		      !    lx = (int)width - offset_x;
!  749		      !    ly = (int)height - offset_y;
!  751		      !    /* therefore we have effective box width and height */
!  752		      !    eff_width = lx - ux;
!  753		      !    eff_height = ly - uy;
!  755		      !    printf("     : eff_width = %5i    eff_height = %5i\n\n",
!  756		      !                           eff_width, eff_height);
!  757		      !    printf("--------------------------------------------\n");
!  759		      !    /* What is the real and imaginary axi pixel width which
!  760		      !     * gets used by the physical screen ?
!  761		      !     *
!  762		      !     * These values will change of course.
!  763		      !     * */
!  764		      !    pixel_real_width = obs_real / (double)eff_width;
!  765		      !    pixel_imag_height = obs_imag / (double)eff_height;
!  766		      !    printf("pixel_real_w = %-+32.26e\n",pixel_real_width);
!  767		      !    printf("pixel_imag_h = %-+32.26e\n",pixel_imag_height);
!  769		      !    XSetLineAttributes(dsp, gc, 1, LineSolid,
!  770		      !                                   CapButt,
!  771		      !                                   JoinMiter);
!  773		      !    XSetForeground(dsp, gc, WhitePixel(dsp, screen_num));
!  774		      !    XSetForeground(dsp, gc2, green.pixel);
!  775		      !    XSetFont(dsp, gc2, type_font);
!  776		      !    XSetFont(dsp, gc3, type_font);
!  778		      !    /* big dumb red box for the REPLOT button */
!  779		      !    XSetForeground(dsp, gc2, cyan.pixel);
!  780		      !    XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
!  781		      !    sprintf(buf,"REPLOT");
!  782		      !    XDrawImageString( dsp, win2, gc2, 332, 207, buf, (int)strlen(buf));
!  784		      !    /* maybe create a file dump button */
!  785		      !    char *tmpdir = getenv("TMPDIR");
!  786		      !    /* most compilers won't care that I separate these two checks */
!  787		      !    if (tmpdir == NULL) {
!  788		      !        dumper_flag = -1;
!  789		      !    } else if (strlen(tmpdir) > _POSIX_PATH_MAX) {
!  790		      !        dumper_flag = -1;
!  791		      !    }
!  793		      !    if ( dumper_flag == -1 ) {
!  794		      !        /* forget the dumper for now */
!  795		      !        sprintf(buf,"No TMPDIR");
!  796		      !        XSetForeground(dsp, gc2, red.pixel);
!  797		      !        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
!  798		      !        XDrawImageString(dsp, win2, gc2, 220, 178, buf, (int)strlen(buf));
!  799		      !        sprintf(buf,"DUMPER");
!  800		      !        XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));
!  801		      !        XDrawLine(dsp, win2, gc2, 320, 162, 392, 182);
!  802		      !        XDrawLine(dsp, win2, gc2, 320, 182, 392, 162);
!  803		      !    } else {
!  804		      !        XSetForeground(dsp, gc2, magenta.pixel);
!  805		      !        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
!  806		      !        sprintf(buf,"DUMPER");
!  807		      !        XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));
!  808		      !    }
!  810		      !    /****************************************************************
!  811		      !     * NOTE : see VBOX_REAL_COUNT and VBOX_IMAG_COUNT
!  812		      !     *
!  813		      !     * The viewport is made up of a neat grid of 16 x 16 little box
!  814		      !     * areas and we can lay down a lightly colored dashed lines to
!  815		      !     * indicate where they are. We may as well refer to these little
!  816		      !     * boxes as view box regions. Starting from the lower left at
!  817		      !     * vbox [0] [0] upwards to the upper most right corner which
!  818		      !     * we can call vbox [15] [15].
!  819		      !     *
!  820		      !     * Each of these vbox elements has a height and width in the
!  821		      !     * on screen pixels of :
!  822		      !     *
!  823		      !     *     vbox_w = eff_width/VBOX_REAL_COUNT
!  824		      !     *
!  825		      !     *     vbox_h = eff_height/VBOX_IMAG_COUNT
!  826		      !     *
!  827		      !     * A given vbox has VBOX_SAMPLE_REAL * VBOX_SAMPLE_IMAGE points
!  828		      !     * of interest with a real width of sample_w and an imaginary
!  829		      !     * or complex height of sample_h.
!  830		      !     ****************************************************************/
!  831		      !    vbox_w = eff_width/VBOX_REAL_COUNT;
!  832		      !    vbox_h = eff_height/VBOX_IMAG_COUNT;
!  834		      !    double vbox_real_width = obs_real / ( 1.0 * VBOX_REAL_COUNT );
!  835		      !    double vbox_imag_height = obs_imag / ( 1.0 * VBOX_IMAG_COUNT );
!  836		      !    double sample_real_width = vbox_real_width / ( 1.0 * VBOX_SAMPLE_REAL );
!  837		      !    double sample_imag_height = vbox_imag_height / ( 1.0 * VBOX_SAMPLE_IMAG );
!  838		      !    double half_sample_offset_real = sample_real_width / 2.0;
!  839		      !    double half_sample_offset_imag = sample_imag_height / 2.0;
!  841		      !    /* horizontal tic marks */
!  842		      !    for ( j=offset_x + vbox_w; j<lx; j+=vbox_w ){
!  843		      !        XDrawLine(dsp, win, gc, j, 8, j, 12);
!  844		      !        XDrawLine(dsp, win, gc, j, (int)height - 8, j, (int)height - 12);
!  845		      !    }
!  846		      !    XFlush(dsp);
!  848		      !    /* vertical minor tic marks at every 16th of the interior viewport
!  849		      !     * drawing area */
!  850		      !    for ( j = offset_y + vbox_h; j < ly; j += vbox_h ){
!  851		      !        XDrawLine(dsp, win, gc, 8, j, 12, j);
!  852		      !        XDrawLine(dsp, win, gc, (int)width - 8, j, (int)width - 12, j);
!  853		      !    }
!  854		      !    XFlush(dsp);
!  856		      !    /* now we use the very dark grey color we created */
!  857		      !    XSetForeground(dsp,gc,very_dark_grey.pixel);
!  859		      !    /* draw the vertical lines */
!  860		      !    for ( j= offset_x + vbox_w; j<lx; j+=vbox_w ){
!  861		      !        XDrawLine(dsp, win, gc, j, 13, j, (int)height - 13);
!  862		      !    }
!  864		      !    /* draw the horizontal lines */
!  865		      !    for ( j = offset_y + vbox_h; j<ly; j+=vbox_h ){
!  866		      !        XDrawLine(dsp, win, gc, 13, j, (int)width - 13, j);
!  867		      !    }
!  869		      !    /* gc3 green text as default */
!  870		      !    XSetForeground(dsp, gc3, green.pixel);
!  872		      !    /* royal blue border around the main viewport */
!  873		      !    XSetForeground(dsp, gc, royal_blue.pixel);
!  874		      !    XDrawLine(dsp, win, gc, 11, 11, (int)width - 11, 11);
!  875		      !    XDrawLine(dsp, win, gc, (int)width - 11, 11, (int)width - 11, (int)height - 1
!  875		      >0);
!  876		      !    XDrawLine(dsp, win, gc, (int)width - 10, (int)height - 10, 10, (int)height - 
!  876		      >10);
!  877		      !    XDrawLine(dsp, win, gc, 10, (int)height - 10, 10, 11);
!  879		      !    XFlush(dsp);
!  881		      !    /* TODO : at the moment the only events we are trapping are
!  882		      !     * the mouse buttons but in the future we will want to redraw
!  883		      !     * and re-expose the window if there other event types */
!  885		      !    XGrabPointer(dsp, win, False, ButtonPressMask, GrabModeAsync,
!  886		      !                           GrabModeAsync, None, None, CurrentTime);
!  888		      !    XSelectInput(dsp, win, ButtonPressMask);
!  890		      !    /* some initial time data before anyone clicks anything */
!  891		      !    clock_gettime(CLOCK_REALTIME, &t0 );
!  892		      !    clock_gettime(CLOCK_REALTIME, &t1 );
!  893		      !    t_delta = timediff( t0, t1 );
!  894		      !    /* this t_delta is a baseline offset value wherein we at least
!  895		      !     * know how long the clock_gettime takes. Mostly. */
!  897		      !    sprintf(buf,"[0000] tdelta = %14" PRIu64 " nsec", t_delta);
!  898		      !    XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));
!  900		      !    /* TODO WTF ??
!  901		      !     * plot some points on the grid that we created
!  902		      !    XSetForeground(dsp, gc, yellow.pixel);
!  903		      !    XDrawPoint(dsp, win, gc, 5, 5);
!  904		      !    */
!  906		      !    /* TODO
!  907		      !     * someday we are going to provide zoom controls and colour edit
!  908		      !     * controls and need to bounce way back up here and setup a
!  909		      !     * whole new plot globally. For now we are going to get our threads
!  910		      !     * setup. */
!  911		      !    thread_parm *parm[MAX_THREADS];
!  912		      !    errno = 0;
!  914		      !    for ( pt = 0; pt < pthread_limit; pt++ ){
!  915		      !        parm[pt] = calloc( (size_t) 1, (size_t) sizeof(thread_parm) );
!  916		      !        /* ERRORS
!  917		      !         *  The malloc(), calloc(), and realloc() functions will fail
!  918		      !         *  if:
!  919		      !         *
!  920		      !         *  ENOMEM    The physical limits of the system are exceeded by
!  921		      !         *            size bytes of memory which cannot be allocated.
!  922		      !         *
!  923		      !         *  EAGAIN    There is not enough memory available to allocate
!  924		      !         *            size bytes of memory; but the application could
!  925		      !         *            try again later.
!  926		      !         *
!  927		      !         * TODO put in a clean bail out procedure wherein we free up
!  928		      !         * and thread structures that were already calloc'd
!  929		      !         */
!  930		      !        if ( parm[pt] == NULL ) {
!  931		      !            if ( errno == ENOMEM ) {
!  932		      !                fprintf(stderr,"FAIL : calloc says ENOMEM\n");
!  933		      !                fprintf(stderr,"     : so best buy some more.\n");
!  934		      !                perror("     ");
!  935		      !                return EXIT_FAILURE;
!  936		      !            }
!  937		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ )
!  937		      >;
!  938		      !            perror("FAIL ");
!  939		      !            return EXIT_FAILURE;
!  940		      !        }
!  941		      !    }
!  943		      !    /* TODO at some point check for why we are fetching the x and y
!  944		      !     * values over and over and over inside the switch-case */
!  945		      !    while(1){
!  947		      !        XNextEvent(dsp,&event);
!  948		      !        /* in the future this will not be wise
!  949		      !         * if we track mouse drags */
!  950		      !        mouse_x=event.xbutton.x;
!  951		      !        mouse_y=event.xbutton.y;
!  953		      !        switch(event.type){
!  954		      !            case ButtonPress:
!  955		      !                switch(event.xbutton.button){
!  956		      !                    case Button1: /* left mouse button */
!  957		      !                        button=Button1;
!  958		      !                        left_count += 1;
!  959		      !                        break;
!  961		      !                    case Button2: /* middle mouse scroll button */
!  962		      !                        button=Button2;
!  963		      !                        mid_count += 1;
!  964		      !                        break;
!  966		      !                    case Button3: /* right mouse button */
!  967		      !                        button=Button3;
!  968		      !                        right_count += 1;
!  969		      !                        break;
!  971		      !                    case Button4: /* mouse scroll wheel up */
!  972		      !                        button=Button4;
!  973		      !                        roll_up += 1;
!  974		      !                        break;
!  976		      !                    case Button5: /* mouse scroll wheel down */
!  977		      !                        button=Button5;
!  978		      !                        roll_dn += 1;
!  979		      !                        break;
!  981		      !                    default:
!  982		      !                        break;
!  983		      !                }
!  984		      !            break;
!  985		      !        default:
!  986		      !            break;
!  987		      !        }
!  989		      !        mouse_x_raw = mouse_x;
!  990		      !        mouse_y_raw = mouse_y;
!  991		      !        XSetForeground(dsp, gc3, red.pixel);
!  992		      !        sprintf(buf,"raw  [ %-4i , %-4i ]", mouse_x_raw, mouse_y_raw);
!  993		      !        fprintf(stderr,"%s\n", buf);
!  994		      !        XDrawImageString( dsp, win3, gc3, 10, 40, buf, (int)strlen(buf));
!  996		      !        /* jank adjustment of one or two pixels
!  997		      !         * we see that the arrow tip of the 
!  998		      !         * mouse cursor seems to be off by a little
!  999		      !         * figgle smush these numbers a little
! 1000		      !         * and also we keep the mouse_x_raw and mouse_y_raw data */
! 1001		      !        mouse_x = mouse_x - 1;
! 1002		      !        mouse_y = mouse_y - 2;
! 1004		      !        /* check left mouse button first */
! 1005		      !        if ( button == Button1 ){
! 1006		      !            /* are we inside the main plot region? */
! 1007		      !            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
! 1008		      !                 && ( mouse_x < ( eff_width + offset_x ) )
! 1009		      !                 && ( mouse_y < ( eff_height + offset_y ) ) ) {
! 1011		      !                /* invert the y axis because X11 is upside down */
! 1012		      !                invert_mouse_y = eff_height - mouse_y + offset_y;
! 1014		      !                sample_r = ( mouse_x - offset_x );
! 1015		      !                sample_j = invert_mouse_y;
! 1017		      !                fp_region(sample_r, sample_j, eff_width, eff_height, &coord);
! 1018		      !                win_r = coord.r;
! 1019		      !                win_j = coord.j;
! 1021		      !                XSetForeground(dsp, gc2, green.pixel);
! 1023		      !                /* a useful value is the vbox coordinates for
! 1024		      !                 * each of the 16x16 grid we previously laid out.
! 1025		      !                 * Since these are all integers we don't need to
! 1026		      !                 * care about rounding or fractional results. */
! 1027		      !                vbox_r = ( mouse_x - offset_x ) / vbox_w;
! 1028		      !                vbox_j = ( eff_height - mouse_y + offset_y ) / vbox_h;
! 1029		      !                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_r, vbox_j );
! 1030		      !                fprintf(stderr,"%s\n", buf);
! 1031		      !                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf))
! 1031		      >;
! 1033		      !                XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1034		      !                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )", win_r, win_j );
! 1035		      !                XDrawImageString(dsp, win2, gc2, 10, 290, buf, (int)strlen(buf));
! 1036		      !                printf("fp64( %-+32.26e,\n      %-+32.26e )\n", win_r, win_j );
! 1038		      !                /* At this moment we have normalized values for a
! 1039		      !                 * location within the observation viewport. We can
! 1040		      !                 * scale those values by half of the viewport width
! 1041		      !                 * and height to get actual x_prime and y_prime
! 1042		      !                 * values.
! 1043		      !                 */
! 1045		      !                /* translation and offset into the centre of a sample region */
! 1046		      !                fp_translate(win_r, win_j, magnify, real_translate, imag_translat
! 1046		      >e, &coord);
! 1048		      !                x_prime = coord.r;
! 1049		      !                y_prime = coord.j;
! 1051		      !                printf("c = ( %-+32.26e,\n      %-+32.26e )\n", x_prime, y_prime 
! 1051		      >);
! 1053		      !                XSetForeground(dsp, gc3, red.pixel);
! 1054		      !                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime 
! 1054		      >);
! 1055		      !                XDrawImageString(dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));
! 1057		      !                XSetForeground(dsp, gc3, green.pixel);
! 1058		      !                sprintf(buf,"bailout = %-8i with a pthread_limit = %-3i", mand_ba
! 1058		      >il, pthread_limit);
! 1059		      !                XDrawImageString(dsp, win3, gc3, 10, 100, buf, (int)strlen(buf));
! 1061		      !                sprintf(buf,"magnify = %-12.10e", magnify);
! 1062		      !                XDrawImageString(dsp, win3, gc3, 10, 120, buf, (int)strlen(buf));
! 1064		      !                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, i
! 1064		      >mag_translate);
! 1065		      !                XDrawImageString(dsp, win3, gc3, 10, 140, buf, (int)strlen(buf));
! 1067		      !                /* what is the real and imaginary axi pixel width which
! 1068		      !                 * gets used by the physical screen ? */
! 1069		      !                pixel_real_width = obs_real / (double)eff_width;
! 1070		      !                printf("pixel_real_w = %-+32.26e\n",pixel_real_width);
! 1071		      !                sprintf(buf,"pixel_real_w = %-+16.12e",pixel_real_width);
! 1072		      !                XDrawImageString(dsp, win3, gc3, 10, 180, buf, (int)strlen(buf));
! 1074		      !                pixel_imag_height = obs_imag / (double)eff_height;
! 1075		      !                printf("pixel_imag_h = %-+32.26e\n",pixel_imag_height);
! 1076		      !                sprintf(buf,"pixel_imag_h = %-+16.12e",pixel_imag_height);
! 1077		      !                XDrawImageString(dsp, win3, gc3, 10, 200, buf, (int)strlen(buf));
! 1079		      !                XSetForeground(dsp, gc3, cyan.pixel);
! 1081		      !                /* time the computation before we dispatch a thread */
! 1082		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );
! 1084		      !                /* TODO : perhaps accept another CLI argv flag to determine
! 1085		      !                 *        if we always do the computation here or not.
! 1086		      !                 *        That is to say, do we always recompute the data in
! 1087		      !                 *        a selected vbox regardless if we have already done
! 1088		      !                 *        the whole process before, either globally or with
! 1089		      !                 *        a single left mouse click. 
! 1090		      !                 *
! 1091		      !                 * The key issue here is should we redo the computation if the
! 1092		      !                 * data already exists in the vbox? It is quite normal to paint
! 1093		      !                 * the entire screen first and thus every vbox_flag[][] will be
! 1094		      !                 * set to 1 as already computed. Therefore doing a dispatch of
! 1095		      !                 * a pile of threads to redo the computation serves no purpose
! 1096		      !                 * other then to grind the gears and get a timing report.
! 1097		      !                 *
! 1098		      !                 * Therefore we may use the strange conditional here of 
! 1099		      !                 *     ( 1 || ( vbox_flag[vbox_r][vbox_j] == 0 ) )
! 1100		      !                 * which will forever be true. Thus we grind the gears and do
! 1101		      !                 * the thread dispatch every time.
! 1102		      !                 *
! 1103		      !                 * 22 Jun 2022 :
! 1104		      !                 * Sadly the threads are doing the wrong computation. At this
! 1105		      !                 * time.
! 1106		      !                 */
! 1107		      !                if ( vbox_flag[vbox_r][vbox_j] == 0 ) {
! 1108		      !                    for ( pt = 0; pt < pthread_limit; pt++ ) {
! 1109		      !                        parm[pt]->t_num = pt;
! 1110		      !                        parm[pt]->t_total = pthread_limit;
! 1111		      !                        parm[pt]->r_translate = real_translate;
! 1112		      !                        parm[pt]->i_translate = imag_translate;
! 1113		      !                        parm[pt]->magnify = magnify;
! 1114		      !                        parm[pt]->obs_real = obs_real;
! 1115		      !                        parm[pt]->obs_imag = obs_imag;
! 1116		      !                        parm[pt]->vbox_r = vbox_r;
! 1117		      !                        parm[pt]->vbox_j = vbox_j;
! 1118		      !                        parm[pt]->eff_width = eff_width;
! 1119		      !                        parm[pt]->eff_height = eff_height;
! 1120		      !                        parm[pt]->vbox_w = vbox_w;
! 1121		      !                        parm[pt]->vbox_h = vbox_h;
! 1122		      !                        parm[pt]->bail_out = mand_bail;
! 1124		      !                        /* pass along a pointer to where we want a result integer
! 1124		      > */
! 1125		      !                        parm[pt]->v = &mandel_val;
! 1126		      !                        parm[pt]->ret_val = 0;
! 1128		      !                        pthread_create( &tid[pt], NULL, mbrot_vbox_pthread, (void
! 1128		      > *)parm[pt] );
! 1129		      !                        /* TODO at some point maybe check the pthread_create err 
! 1129		      >status
! 1130		      !                         *
! 1131		      !                         * The pthread_create() function can return any of the fo
! 1131		      >llowing errors:
! 1132		      !                         *
! 1133		      !                         * [ENOMEM]  The system lacked the necessary resources to
! 1133		      > create
! 1134		      !                         *           another thread.
! 1135		      !                         *
! 1136		      !                         * [EAGAIN]  The system-imposed limit on the total number
! 1136		      > of
! 1137		      !                         *           threads in a process [PTHREAD_THREADS_MAX] w
! 1137		      >ould be
! 1138		      !                         *           exceeded.
! 1139		      !                         *
! 1140		      !                         * [EAGAIN]  The RACCT_NTHR limit would be exceeded; see 
! 1140		      >racct(2).
! 1141		      !                         *
! 1142		      !                         * [EPERM]   The caller does not have permission to set t
! 1142		      >he
! 1143		      !                         *           scheduling parameters or scheduling policy.
! 1144		      !                         *
! 1145		      !                         * [EINVAL]  A value specified by attr is invalid.
! 1146		      !                         *
! 1147		      !                         * [EDEADLK] The CPU set specified by attr would prevent 
! 1147		      >the thread
! 1148		      !                         *           from running on any CPU.
! 1149		      !                         *
! 1150		      !                         * [EFAULT]  The stack base specified by attr is invalid,
! 1150		      > or the
! 1151		      !                         *           kernel was unable to put required initial da
! 1151		      >ta on the
! 1152		      !                         *           stack.
! 1153		      !                         */
! 1154		      !                    }
! 1155		      !                    /* Blocking call here to gather up all the threads */
! 1156		      !                    for ( pt = 0; pt < pthread_limit; pt++ ) {
! 1157		      !                        pthread_join( tid[pt], NULL );
! 1158		      !                        printf("PTHRD: join %i done\n", pt);
! 1159		      !                    }
! 1160		      !                    vbox_flag[vbox_r][vbox_j] = 1;
! 1161		      !                }
! 1162		      !                clock_gettime(CLOCK_REALTIME, &soln_t1 );
! 1164		      !                t_delta = timediff( soln_t0, soln_t1 );
! 1165		      !                sprintf(buf,"[join] = %14" PRIu64 " nsec   %08.6e sec", t_delta, 
! 1165		      >((double)t_delta)/1.0e9);
! 1166		      !                fprintf(stderr,"%s\n",buf);
! 1167		      !                XSetForeground(dsp, gc3, magenta.pixel);
! 1168		      !                XDrawImageString( dsp, win3, gc3, 10, 270, buf, (int)strlen(buf))
! 1168		      >;
! 1170		      !                for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix++ ) {
! 1171		      !                    vbox_ll_y = vbox_j * vbox_h + mand_y_pix;
! 1172		      !                    sample_j = vbox_ll_y;
! 1173		      !                    for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x_pix++ ) {
! 1174		      !                        vbox_ll_x = vbox_r * vbox_w + mand_x_pix;
! 1175		      !                        sample_r = vbox_ll_x;
! 1177		      !                        /* use the data returned by the thread computation */
! 1178		      !                        mand_height = mandel_val[vbox_r][vbox_j][mand_x_pix][mand
! 1178		      >_y_pix];
! 1180		      !                        fp_region(sample_r, sample_j, eff_width, eff_height, &coo
! 1180		      >rd);
! 1181		      !                        win_r = coord.r;
! 1182		      !                        win_j = coord.j;
! 1184		      !                        /* BORK see if fp_vbox computes the same results *
! 1185		      !                        fp_vbox(vbox_r, vbox_j, mand_x_pix, mand_y_pix, eff_width
! 1185		      >, eff_height, &coord);
! 1186		      !                        if ( ( ( coord.r - win_r ) > EPSILON ) || ( ( coord.j - w
! 1186		      >in_j ) > EPSILON ) ) {
! 1187		      !                            fprintf(stderr,"BORK : v[%2i][%2i][%2i][%2i]\n", vbox
! 1187		      >_r, vbox_j, mand_x_pix, mand_y_pix);
! 1188		      !                        }
! 1189		      !                        */
! 1191		      !                        fp_translate(win_r, win_j, magnify, real_translate, imag_
! 1191		      >translate, &coord);
! 1192		      !                        x_prime = coord.r;
! 1193		      !                        y_prime = coord.j;
! 1194		      !                        /* TODO put the result of (x_prime,y_prime) in to the arr
! 1194		      >ay coord_r
! 1195		      !                         * and coord_j */
! 1197		      !                        if ( mand_height == mand_bail ) {
! 1198		      !                            /* really we should use the color Black for portable 
! 1198		      >stuff */
! 1199		      !                            XSetForeground(dsp, gc, (unsigned long)0 );
! 1200		      !                        } else {
! 1201		      !                            mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand_height 
! 1201		      >& 0xff) ];
! 1202		      !                            XSetForeground(dsp, gc, mandlebrot.pixel);
! 1203		      !                        }
! 1205		      !                        /* plot onto the main plot graphics context gc */
! 1206		      !                        XDrawPoint(dsp, win, gc,
! 1207		      !                                   vbox_ll_x + offset_x,
! 1208		      !                                   ( eff_height - vbox_ll_y + offset_y ) );
! 1210		      !                        /* A few manual offsets of ( 16, 13 ) pixels to centre th
! 1210		      >e
! 1211		      !                         * plot data into a subwindow of gc2 */
! 1212		      !                        gc2_x = 16 + ( 3 * mand_x_pix );
! 1213		      !                        gc2_y = 13 + ( 192 - ( 3 * mand_y_pix ) );
! 1215		      !                        /* walk around the samples clock wise and begin with
! 1216		      !                         * offset the real coord by one third of pixel width */
! 1217		      !                        for ( p = 0; p < 3; p++ ) {
! 1218		      !                            for ( q = 0; q < 3; q++ ) {
! 1220		      !                                /* these are the complex coordinates of the sub-s
! 1220		      >ample location */
! 1221		      !                                sub_pixel_real = x_prime + ( p - 1 ) * pixel_real
! 1221		      >_width / 3.0;
! 1222		      !                                sub_pixel_imag = y_prime + ( q - 1 ) * pixel_imag
! 1222		      >_height / -3.0;
! 1224		      !                                if ((p!=1)&&(q!=1)) {
! 1225		      !                                    mand_height = mbrot(sub_pixel_real, sub_pixel
! 1225		      >_imag, mand_bail);
! 1226		      !                                } else {
! 1227		      !                                    /* TODO just use the previously computed valu
! 1227		      >e
! 1228		      !                                    mand_height = mbrot(sub_pixel_real, sub_pixel
! 1228		      >_imag, mand_bail);
! 1229		      !                                    */
! 1230		      !                                    mand_height = mandel_val[vbox_r][vbox_j][mand
! 1230		      >_x_pix][mand_y_pix];
! 1231		      !                                }
! 1233		      !                                /* check if we landed in a maximal black region *
! 1233		      >/
! 1234		      !                                if ( mand_height == mand_bail ) {
! 1235		      !                                    XSetForeground(dsp, gc2, (unsigned long)0 );
! 1236		      !                                } else {
! 1237		      !                                    /* use a trivial color computation here */
! 1238		      !                                    mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand
! 1238		      >_height & 0xff) ];
! 1239		      !                                    XSetForeground(dsp, gc2, mandlebrot.pixel);
! 1240		      !                                }
! 1242		      !                                XDrawPoint( dsp, win2, gc2, gc2_x + p, gc2_y + q 
! 1242		      >);
! 1244		      !                            }
! 1245		      !                        }
! 1246		      !                        /* TODO we have the opportunity here to average the resul
! 1246		      >t
! 1247		      !                         * of the above 3x3 sub-pixel computation. Then plot some
! 1247		      > 
! 1248		      !                         * resultant average into the main window. 
! 1249		      !                         *
! 1250		      !                         * However unless we always do sub-pixel sample computati
! 1250		      >on
! 1251		      !                         * the result of a given vbox will be something strange t
! 1251		      >hat
! 1252		      !                         * looks like none of its neighbours. 
! 1253		      !                         */
! 1254		      !                    }
! 1255		      !                }
! 1257		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );
! 1259		      !                t_delta = timediff( soln_t1, soln_t0 );
! 1260		      !                sprintf(buf,"[plot] = %14" PRIu64 " nsec   %08.6e sec", t_delta, 
! 1260		      >((double)t_delta)/1.0e9);
! 1261		      !                fprintf(stderr,"%s\n",buf);
! 1262		      !                XSetForeground(dsp, gc3, green.pixel);
! 1263		      !                XDrawImageString( dsp, win3, gc3, 10, 290, buf, (int)strlen(buf))
! 1263		      >;
! 1265		      !            } else {
! 1267		      !                /* We need to locate the mouse in graphics context gc2 and here
! 1268		      !                 * the raw values for mouse position serve correctly. Thus the
! 1269		      !                 * question is are we inside the top jank slider for magnify ? */
! 1270		      !                if (   ( mouse_x_raw > 1268 ) && ( mouse_y_raw > 733 )
! 1271		      !                    && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < 742 ) ) {
! 1273		      !                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter
! 1273		      >);
! 1274		      !                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
! 1275		      !                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);
! 1277		      !                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter
! 1277		      >);
! 1278		      !                    /*
! 1279		      !                    XSetForeground(dsp, gc2, yellow.pixel);
! 1280		      !                    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);
! 1281		      !                    */
! 1283		      !                    /* horizontal midline */
! 1284		      !                    XSetForeground(dsp, gc2, green.pixel);
! 1285		      !                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);
! 1287		      !                    /* The slider shall have 21 possible positions where
! 1288		      !                     * they map to the values -10 upwards to positive 10.
! 1289		      !                     * These values in turn are used to select a factor
! 1290		      !                     * to modify the magnify value from 2^(-10) upwards
! 1291		      !                     * to 2^10 == 1024 which would be a reasonable upper
! 1292		      !                     * limit given the whole plotting surface is 1024^2.
! 1293		      !                     *
! 1294		      !                     * We did start with an initial value of 10 which maps
! 1295		      !                     * to the centre position at the zero spot.
! 1296		      !                     *
! 1297		      !                     * Let's draw the 21 possible locations on the scale.
! 1298		      !                     */
! 1299		      !                    XSetForeground(dsp, gc2, cyan.pixel);
! 1300		      !                    for ( j = 0; j<21; j++ ) {
! 1301		      !                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13,
! 1302		      !                                                  5 + 218 + 8 * j, 20 );
! 1303		      !                    }
! 1304		      !                    /* what is the current magnify_jank value ? */
! 1305		      !                    XSetForeground(dsp, gc2, red.pixel);
! 1306		      !                    XDrawLine(dsp, win2, gc2,
! 1307		      !                                           5 + 218 + 8 * magnify_jank, 13,
! 1308		      !                                           5 + 218 + 8 * magnify_jank, 20 );
! 1310		      !                    /* we know from direct tests that the centre line
! 1311		      !                     * is at 1354 raw mouse X and every tick mark left
! 1312		      !                     * or right with be 8 pixels away. */
! 1313		      !                    magnify_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 ) 
! 1313		      >/ 8);
! 1315		      !                    XDrawLine(dsp, win2, gc2,
! 1316		      !                                           4 + 218 + 8 * magnify_jank_in, 13,
! 1317		      !                                           4 + 218 + 8 * magnify_jank_in, 20 );
! 1319		      !                    XDrawLine(dsp, win2, gc2,
! 1320		      !                                           5 + 218 + 8 * magnify_jank_in, 13,
! 1321		      !                                           5 + 218 + 8 * magnify_jank_in, 20 );
! 1323		      !                    XDrawLine(dsp, win2, gc2,
! 1324		      !                                           6 + 218 + 8 * magnify_jank_in, 13,
! 1325		      !                                           6 + 218 + 8 * magnify_jank_in, 20 );
! 1327		      !                    XSetForeground(dsp, gc2, magenta.pixel);
! 1328		      !                    XDrawLine(dsp, win2, gc2,
! 1329		      !                                           5 + 218 + 8 * magnify_jank, 13,
! 1330		      !                                           5 + 218 + 8 * magnify_jank, 20 );
! 1332		      !                    magnify_factor = pow ( 2.0, magnify_jank_in - 10 );
! 1334		      !                    XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1335		      !                    sprintf(buf,"f(%-+2i) = %-9.5e  ",
! 1336		      !                                                 magnify_jank_in - 10,
! 1337		      !                                                 magnify_factor );
! 1339		      !                    XDrawImageString( dsp, win2, gc2, 215, 40, buf, (int)strlen(b
! 1339		      >uf));
! 1341		      !                    magnify_jank = magnify_jank_in;
! 1343		      !                    XFlush(dsp);
! 1345		      !                } else if ( ( mouse_x_raw > 1268 ) && ( mouse_y_raw > ( 733 + 50 
! 1345		      >) )
! 1346		      !                         && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < ( 742 + 50 
! 1346		      >) ) ) {
! 1348		      !                    /* we should be inside the janky bail_out control */
! 1349		      !                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter
! 1349		      >);
! 1350		      !                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
! 1351		      !                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);
! 1353		      !                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter
! 1353		      >);
! 1355		      !                    /* yellow horizontal midline */
! 1356		      !                    XSetForeground(dsp, gc2, yellow.pixel);
! 1357		      !                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);
! 1359		      !                    XSetForeground(dsp, gc2, cyan.pixel);
! 1360		      !                    for ( j = 0; j<21; j++ ) {
! 1361		      !                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13 + 50,
! 1362		      !                                                  5 + 218 + 8 * j, 20 + 50 );
! 1363		      !                    }
! 1364		      !                    /* what is the current bail_out_jank value ? */
! 1365		      !                    XSetForeground(dsp, gc2, red.pixel);
! 1366		      !                    XDrawLine(dsp, win2, gc2,
! 1367		      !                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
! 1368		      !                                           5 + 218 + 8 * bail_out_jank, 20 + 50 )
! 1368		      >;
! 1370		      !                    /* same as above where we did tests to locate the centre
! 1371		      !                     * and then hack along from there.  */
! 1372		      !                    bail_out_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 )
! 1372		      > / 8);
! 1374		      !                    XDrawLine(dsp, win2, gc2,
! 1375		      !                                           4 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1375		      >0,
! 1376		      !                                           4 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1376		      >0 );
! 1378		      !                    XDrawLine(dsp, win2, gc2,
! 1379		      !                                           5 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1379		      >0,
! 1380		      !                                           5 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1380		      >0 );
! 1382		      !                    XDrawLine(dsp, win2, gc2,
! 1383		      !                                           6 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1383		      >0,
! 1384		      !                                           6 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1384		      >0 );
! 1386		      !                    XSetForeground(dsp, gc2, magenta.pixel);
! 1387		      !                    XDrawLine(dsp, win2, gc2,
! 1388		      !                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
! 1389		      !                                           5 + 218 + 8 * bail_out_jank, 20 + 50 )
! 1389		      >;
! 1391		      !                    bail_out_factor = pow ( 2.0, bail_out_jank_in - 10 );
! 1392		      !                    /* perform a test to ensure that the bail_out never falls
! 1393		      !                     * below 256 */
! 1394		      !                    if ( ( (double)mand_bail * bail_out_factor ) < 256.0 ) {
! 1396		      !                        bail_out_factor = 1.0;
! 1397		      !                        XSetForeground(dsp, gc2, red.pixel);
! 1398		      !                        sprintf(buf,"  factor set to 1  ");
! 1399		      !                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
! 1400		      !                                          buf, (int)strlen(buf));
! 1402		      !                        /* force the bail_out jank to mid-point wherein
! 1403		      !                         * the bail_out_factor is 2^0 == 1 of course */
! 1404		      !                        bail_out_jank = 10;
! 1406		      !                    } else {
! 1408		      !                        XSetForeground(dsp, gc2, green.pixel);
! 1409		      !                        sprintf(buf,"f(%-+2i) = %-9.5e  ",
! 1410		      !                                                 bail_out_jank_in - 10,
! 1411		      !                                                 bail_out_factor );
! 1413		      !                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
! 1414		      !                                          buf, (int)strlen(buf));
! 1416		      !                        bail_out_jank = bail_out_jank_in;
! 1418		      !                    }
! 1420		      !                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 915 )
! 1421		      !                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 932 )
! 1422		      !                             && ( ( x_prime + 8.0 ) > EPSILON )
! 1423		      !                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {
! 1425		      !                    /* The above is a janky EPSILON check which verifies
! 1426		      !                     * the mouse location is inside the REPLOT button
! 1427		      !                     * window area.
! 1428		      !                     *
! 1429		      !                     * Also verify x_prime and y_prime are NOT the initial
! 1430		      !                     *     impossible values ( -8.0, -8.0 )
! 1431		      !                     */
! 1433		      !                    if ( replot_flag == 0 ) {
! 1434		      !                        /* we need that button to be double clicked so
! 1435		      !                         * at this time we flip the button to yellow warning stat
! 1435		      >us */
! 1436		      !                        XSetForeground(dsp, gc2, yellow.pixel);
! 1437		      !                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
! 1438		      !                        sprintf(buf,">REPLOT<");
! 1439		      !                        XDrawImageString( dsp, win2, gc2, 324, 207, buf, (int)str
! 1439		      >len(buf));
! 1440		      !                        replot_flag = 1;
! 1442		      !                    } else {
! 1443		      !                        /* we are confirmed. Switch the replot button back to
! 1444		      !                         * red and actually replot
! 1445		      !                         *
! 1446		      !                         * however we need to adjust the magnify as well as
! 1447		      !                         * other factors
! 1448		      !                         *
! 1449		      !                         * So now we have bail_out_jank and we need to trap for
! 1450		      !                         * strange values.
! 1451		      !                         */
! 1452		      !                        XSetForeground(dsp, gc2, cyan.pixel);
! 1453		      !                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
! 1454		      !                        sprintf(buf," REPLOT ");
! 1455		      !                        XDrawImageString(dsp, win2, gc2, 324, 207, buf, (int)strl
! 1455		      >en(buf));
! 1456		      !                        replot_flag = 0;
! 1457		      !                        /* we now need to figure out what minimal stuff we can do
! 1457		      > to
! 1458		      !                         * actually get a replot at the selected center and with
! 1459		      !                         * the magnify_factor * whatever the current magnify is *
! 1459		      >/
! 1461		      !                        mouse_x = 512;   /* try to be dead center */
! 1462		      !                        mouse_y = 518;   /* after a hokey adjustment */
! 1464		      !                        mand_bail = (uint32_t)((double)mand_bail * bail_out_facto
! 1464		      >r);
! 1465		      !                        fprintf(stderr,"INFO : mand_bail changed to %" PRIu32 "\n
! 1465		      >", mand_bail);
! 1467		      !                        magnify *= magnify_factor;
! 1468		      !                        fprintf(stderr,"INFO : magnify changed to %-+16.10e\n", m
! 1468		      >agnify);
! 1469		      !                        obs_real = 4.0 / magnify;
! 1470		      !                        obs_imag = 4.0 / magnify;
! 1472		      !                        colour_method_flag = 1;
! 1473		      !                        invert_me_dammit = 0;

                       
! predecessor blocks: .L900001058

			.L77002738:
/* 0x0098	1473 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x009c	     */		mov	0,%o1

! Registers live out of .L77002738: 
! g2 g3 o0 sp l2 l4 l7 i0 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002738 .L900001058

			.L77002740:
/* 0x00a0	 199 */		brz,pn	%o0,.L77001713
/* 0x00a4	 216 */		ld	[%sp+2275],%o1

! Registers live out of .L77002740: 
! g2 g3 o0 o1 sp l2 l4 l7 i0 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002740

			.L77001721:
/* 0x00a8	   0 */		sethi	%gdop_hix22(.L37),%l6
/* 0x00ac	1473 */		stx	%o0,[%sp+2463]
/* 0x00b0	   0 */		xor	%l6,%gdop_lox10(.L37),%l5
/* 0x00b4	   0 */		ldx	[%l7+%l5],%i1,%gdop(.L37)
/* 0x00b8	 216 */		sllx	%o1,3,%l5
/* 0x00bc	     */		udivx	%l5,%o1,%o4
/* 0x00c0	     */		cmp	%o4,8
/* 0x00c4	     */		be,pn	%xcc,.L77002744
/* 0x00c8	     */		nop

! Registers live out of .L77001721: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001721

			.L77002743:
/* 0x00cc	 199 */		ba	.L77002747
/* 0x00d0	     */		mov	0,%o0

! Registers live out of .L77002743: 
! g2 g3 o0 sp l2 l4 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001721

			.L77002744:
/* 0x00d4	 199 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x00d8	     */		mov	%l5,%o0
/* 0x00dc	     */		brz,pn	%o0,.L77002747
/* 0x00e0	     */		cmp	%l5,32

! Registers live out of .L77002744: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002744

			.L77002745:
/* 0x00e4	 199 */		ble,pn	%xcc,.L900000144
/* 0x00e8	     */		mov	%l5,%o2

! Registers live out of .L77002745: 
! g2 g3 o0 o1 o2 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002745

			.L900000143:
/* 0x00ec	 199 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x00f0	     */		mov	0,%o1
/* 0x00f4	     */		ba	.L77002747
/* 0x00f8	     */		nop

! Registers live out of .L900000143: 
! g2 g3 o0 sp l2 l4 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002745

			.L900000144:
/* 0x00fc	 199 */		andcc	%o0,3,%g0
/* 0x0100	     */		bne,pn	%xcc,.L900000148
/* 0x0104	     */		mov	%o0,%o7

! Registers live out of .L900000144: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000144

			.L900000146:
/* 0x0108	 199 */		cmp	%l5,3

! Registers live out of .L900000146: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000146 .L900000147

			.L900001165:
/* 0x010c	 199 */		bleu,pn	%xcc,.L900000150
/* 0x0110	     */		andcc	%l5,3,%g0

! Registers live out of .L900001165: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001165

			.L900000147:
/* 0x0114	 199 */		st	%g0,[%o7]
/* 0x0118	     */		sub	%l5,4,%l5
/* 0x011c	     */		add	%o7,4,%o7
/* 0x0120	     */		ba	.L900001165
/* 0x0124	     */		cmp	%l5,3

! Registers live out of .L900000147: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000144

			.L900000148:
/* 0x0128	 199 */		subcc	%l5,0,%g0
/* 0x012c	     */		be,pn	%xcc,.L77002747
/* 0x0130	     */		nop

! Registers live out of .L900000148: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000148 .L900001165

			.L900000150:
/* 0x0134	 199 */		be	.L77002747
/* 0x0138	     */		cmp	%l5,2

! Registers live out of .L900000150: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000150

			.L900001018:
/* 0x013c	 199 */		bl,pn	%xcc,.L900000151
/* 0x0140	     */		nop

! Registers live out of .L900001018: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001017 .L900001018

			.L900001017:
/* 0x0144	 199 */		stb	%g0,[%o7]
/* 0x0148	     */		cmp	%l5,3
/* 0x014c	     */		sub	%l5,2,%l5
/* 0x0150	     */		stb	%g0,[%o7+1]
/* 0x0154	     */		bg,pt	%xcc,.L900001017
/* 0x0158	     */		add	%o7,2,%o7

! Registers live out of .L900001017: 
! g2 g3 o0 sp o7 l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001017

			.L900001020:
/* 0x015c	 199 */		brlez,pn	%l5,.L900000152
/* 0x0160	     */		nop

! Registers live out of .L900001020: 
! g2 g3 o0 sp o7 l2 l4 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001018 .L900001020

			.L900000151:
/* 0x0164	 199 */		stb	%g0,[%o7]

! Registers live out of .L900000151: 
! g2 g3 o0 sp l2 l4 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000151 .L900001020

			.L900000152:

! Registers live out of .L900000152: 
! g2 g3 o0 sp l2 l4 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002743 .L77002744 .L900000143 .L900000148 .L900000150 .L900000152

			.L77002747:
/* 0x0168	 218 */		brz,pn	%o0,.L77001723
/* 0x016c	 235 */		sethi	%hi(0x401400),%l6

! Registers live out of .L77002747: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002747

			.L77001731:
/* 0x0170	 199 */		stx	%o0,[%sp+2695]
/* 0x0174	 235 */		mov	0,%l5
/* 0x0178	     */		add	%l6,207,%l6
/* 0x017c	 236 */		mov	0,%o0
/* 0x0180	 235 */		add	%l6,%sp,%l6
/* 0x0184	 236 */		prefetch	[%l6+256],3
/* 0x0188	     */		prefetch	[%l6+512],3
/* 0x018c	     */		prefetch	[%l6+768],3
/* 0x0190	     */		prefetch	[%l6+1024],3

! Registers live out of .L77001731: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001731 .L900001164

			.L900001164:
/* 0x0194	 236 */		call	mandle_col	!params=  %o0	!result=  %o0
/* 0x0198	 235 */		add	%l5,1,%l5
/* 0x019c	 236 */		stx	%o0,[%l6]
/* 0x01a0	     */		prefetch	[%l6+1280],3
/* 0x01a4	 235 */		add	%l6,8,%l6
/* 0x01a8	     */		cmp	%l5,255
/* 0x01ac	     */		ble,pt	%icc,.L900001164
/* 0x01b0	 236 */		and	%l5,255,%o0

! Registers live out of .L900001164: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001164

			.L77001739:
/* 0x01b4	 249 */		ldd	[%i3+16],%f44
/* 0x01b8	     */		std	%f44,[%sp+2719]
/* 0x01bc	 271 */		mov	128,%o0
/* 0x01c0	 240 */		stx	%g0,[%sp+3047]
/* 0x01c4	 271 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x01c8	     */		std	%f44,[%sp+2879]
/* 0x01cc	     */		brz,a,pt	%o0,.L900001163
/* 0x01d0	     */		ldd	[%sp+2879],%f44

! Registers live out of .L77001739: 
! g2 g3 o0 o1 sp l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001739

			.L900000130:
/* 0x01d4	 218 */		mov	128,%o2
/* 0x01d8	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x01dc	     */		mov	0,%o1
/* 0x01e0	     */		stx	%o0,[%sp+2703]
/* 0x01e4	     */		ba	.L900001162
/* 0x01e8	 286 */		nop

! Registers live out of .L900000130: 
! g2 g3 o1 sp l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001739

			.L900001163:
/* 0x01ec	 218 */		stx	%o0,[%sp+2703]
/* 0x01f0	 286 */		std	%f44,[%sp+2879]

! Registers live out of .L900001163: 
! g2 g3 o1 sp l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000130 .L900001163

			.L900001162:
/* 0x01f4	 286 */		mov	6,%o0
/* 0x01f8	     */		call	setlocale	!params=  %o0 %o1	!result= 
/* 0x01fc	     */		add	%i1,-6,%o1
/* 0x0200	 288 */		mov	1,%o2
/* 0x0204	     */		mov	%i1,%o1
/* 0x0208	     */		call	setenv	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x020c	     */		add	%i1,-4,%o0
/* 0x0210	     */		orcc	%g0,%o0,%g0
/* 0x0214	 289 */		bge,pn	%icc,.L77001743
/* 0x0218	 290 */		sethi	%gdop_hix22(__iob),%o7

! Registers live out of .L900001162: 
! g2 g3 o0 sp o7 l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001162

			.L77001741:
/* 0x021c	 290 */		xor	%o7,%gdop_lox10(__iob),%o3
/* 0x0220	     */		add	%i1,6,%o1
/* 0x0224	     */		ldx	[%l7+%o3],%i4,%gdop(__iob)
/* 0x0228	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x022c	     */		add	%i4,256,%o0
/* 0x0230	 392 */		return	%i7+8	! Result =  %i0
/* 0x0234	     */		mov	1,%o0
                       
! predecessor blocks: .L900001162

			.L77001743:
/* 0x0238	 295 */		add	%sp,3023,%o1
/* 0x023c	     */		call	clock_gettime	!params=  %o0 %o1	!result=  %o0
/* 0x0240	     */		mov	3,%o0
/* 0x0244	     */		cmp	%o0,-1
/* 0x0248	     */		bne,pn	%icc,.L77001747
/* 0x024c	 297 */		sethi	%gdop_hix22(__iob),%l4

! Registers live out of .L77001743: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001743

			.L77001745:
/* 0x0250	 297 */		xor	%l4,%gdop_lox10(__iob),%o2
/* 0x0254	     */		add	%i1,46,%o1
/* 0x0258	     */		ldx	[%l7+%o2],%l2,%gdop(__iob)
/* 0x025c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0260	     */		add	%l2,256,%o0
/* 0x0264	 392 */		return	%i7+8	! Result =  %i0
/* 0x0268	     */		mov	1,%o0
                       
! predecessor blocks: .L77001743

			.L77001747:
/* 0x026c	 301 */		call	srand48	!params=  %o0	!result= 
/* 0x0270	     */		ldx	[%sp+3031],%o0
/* 0x0274	 303 */		call	sysinfo	!params=  %o0	!result= 
/* 0x0278	     */		mov	1,%o0
/* 0x027c	 305 */		call	printf	!params=  %o0	!result= 
/* 0x0280	     */		add	%i1,94,%o0
/* 0x0284	 306 */		mov	25,%o1
/* 0x0288	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x028c	     */		add	%i1,134,%o0
/* 0x0290	 307 */		mov	8,%o1
/* 0x0294	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0298	     */		add	%i1,166,%o0
/* 0x029c	 308 */		mov	20,%o1
/* 0x02a0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x02a4	     */		add	%i1,198,%o0
/* 0x02a8	 309 */		mov	256,%o1
/* 0x02ac	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x02b0	     */		add	%i1,230,%o0
/* 0x02b4	 310 */		mov	6,%o1
/* 0x02b8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x02bc	     */		add	%i1,262,%o0
/* 0x02c0	 311 */		call	printf	!params=  %o0	!result= 
/* 0x02c4	     */		add	%i1,294,%o0
/* 0x02c8	 320 */		add	%sp,2503,%o1
/* 0x02cc	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x02d0	     */		mov	3,%o0
/* 0x02d4	 321 */		add	%sp,2551,%o1
/* 0x02d8	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x02dc	     */		mov	3,%o0
/* 0x02e0	 322 */		ldx	[%sp+2503],%o0
/* 0x02e4	     */		ldx	[%sp+2511],%o1
/* 0x02e8	     */		ldx	[%sp+2551],%o2
/* 0x02ec	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x02f0	     */		ldx	[%sp+2559],%o3
/* 0x02f4	     */		mov	%o0,%o1
/* 0x02f8	 325 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x02fc	     */		add	%i1,342,%o0
/* 0x0300	 327 */		call	___errno	!params= 	!result=  %o0
/* 0x0304	     */		nop
/* 0x0308	 328 */		add	%l2,-2,%g5
/* 0x030c	     */		cmp	%g5,4
/* 0x0310	     */		bcc,pn	%icc,.L77001753
/* 0x0314	 327 */		st	%g0,[%o0]

! Registers live out of .L77001747: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001747

			.L77001751:
/* 0x0318	   0 */		sethi	%gdop_hix22(__iob),%i0
/* 0x031c	   0 */		xor	%i0,%gdop_lox10(__iob),%g4
/* 0x0320	 329 */		add	%i1,382,%o1
/* 0x0324	   0 */		ldx	[%l7+%g4],%l7,%gdop(__iob)
/* 0x0328	   0 */		add	%l7,256,%i2
/* 0x032c	 329 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0330	     */		mov	%i2,%o0
/* 0x0334	 330 */		add	%i1,422,%o1
/* 0x0338	     */		ldx	[%i4],%o2
/* 0x033c	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x0340	     */		mov	%i2,%o0
/* 0x0344	 331 */		add	%i1,462,%o1
/* 0x0348	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x034c	     */		mov	%i2,%o0
/* 0x0350	 332 */		add	%i1,502,%o1
/* 0x0354	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0358	     */		mov	%i2,%o0
/* 0x035c	 333 */		add	%i1,534,%o1
/* 0x0360	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0364	     */		mov	%i2,%o0
/* 0x0368	 334 */		add	%i1,574,%o1
/* 0x036c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0370	     */		mov	%i2,%o0
/* 0x0374	 335 */		add	%i1,606,%o1
/* 0x0378	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x037c	     */		mov	%i2,%o0
/* 0x0380	 392 */		return	%i7+8	! Result =  %i0
/* 0x0384	     */		mov	1,%o0
                       
! predecessor blocks: .L77001747

			.L77001753:
/* 0x0388	 337 */		cmp	%l2,6
/* 0x038c	     */		bge,pn	%icc,.L77001755
/* 0x0390	   0 */		sethi	%gdop_hix22(__iob),%o4

! Registers live out of .L77001753: 
! g2 g3 o0 o4 sp l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001753

			.L77001953:
/* 0x0394	   0 */		xor	%o4,%gdop_lox10(__iob),%g1
/* 0x0398	 142 */		mov	1,%o3
/* 0x039c	     */		st	%o3,[%sp+2283]
/* 0x03a0	   0 */		ldx	[%l7+%g1],%o5,%gdop(__iob)
/* 0x03a4	 496 */		add	%i1,1806,%o1
/* 0x03a8	 499 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i5
/* 0x03ac	     */		xor	%i5,%gdop_lox10(.L___const_seg_900000101),%l3
/* 0x03b0	   0 */		add	%o5,256,%l4
/* 0x03b4	 496 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x03b8	     */		mov	%l4,%o0
/* 0x03bc	 497 */		add	%i1,1854,%o1
/* 0x03c0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x03c4	     */		mov	%l4,%o0
/* 0x03c8	 499 */		ldx	[%l7+%l3],%i0,%gdop(.L___const_seg_900000101)
/* 0x03cc	 501 */		stx	%g0,[%sp+2791]
/* 0x03d0	 498 */		sethi	%hi(0x1000),%o1
/* 0x03d4	 500 */		stx	%g0,[%sp+2783]
/* 0x03d8	 498 */		st	%o1,[%sp+2279]
/* 0x03dc	 499 */		ldd	[%i0+16],%f32
/* 0x03e0	     */		std	%f32,[%sp+2711]
/* 0x03e4	 501 */		ba	.L900001148
/* 0x03e8	 504 */		nop

! Registers live out of .L77001953: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001753

			.L77001755:
/* 0x03ec	 338 */		call	___errno	!params= 	!result=  %o0
/* 0x03f0	     */		nop
/* 0x03f4	 339 */		mov	10,%o2
/* 0x03f8	 338 */		st	%g0,[%o0]
/* 0x03fc	 339 */		mov	0,%o1
/* 0x0400	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0404	     */		ldx	[%i4+8],%o0
/* 0x0408	 340 */		call	___errno	!params= 	!result=  %o0
/* 0x040c	 339 */		mov	%o0,%i3
/* 0x0410	 340 */		ld	[%o0],%o5
/* 0x0414	     */		cmp	%o5,34
/* 0x0418	     */		be,pn	%icc,.L77001761
/* 0x041c	     */		nop

! Registers live out of .L77001755: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001755

			.L77001757:
/* 0x0420	 340 */		call	___errno	!params= 	!result=  %o0
/* 0x0424	     */		nop
/* 0x0428	     */		ld	[%o0],%g1
/* 0x042c	     */		cmp	%g1,22
/* 0x0430	     */		be,pn	%icc,.L77001761
/* 0x0434	 345 */		prefetch	[%i4+16],0

! Registers live out of .L77001757: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001757

			.L77001763:
/* 0x0438	 345 */		sethi	%hi(0x7fffc00),%o0
/* 0x043c	     */		add	%i3,-256,%o3
/* 0x0440	     */		add	%o0,768,%o7
/* 0x0444	     */		cmp	%o3,%o7
/* 0x0448	     */		bleu,pn	%icc,.L77001771
/* 0x044c	   0 */		sethi	%gdop_hix22(__iob),%g5

! Registers live out of .L77001763: 
! g2 g3 g5 o0 sp l5 l7 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001763

			.L77001769:
/* 0x0450	   0 */		xor	%g5,%gdop_lox10(__iob),%l4
/* 0x0454	 346 */		add	%i1,678,%o1
/* 0x0458	   0 */		ldx	[%l7+%l4],%o2,%gdop(__iob)
/* 0x045c	   0 */		add	%o2,256,%l2
/* 0x0460	 346 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0464	     */		mov	%l2,%o0
/* 0x0468	 347 */		add	%i1,726,%o1
/* 0x046c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0470	     */		mov	%l2,%o0
/* 0x0474	 348 */		ldd	[%sp+2879],%f44
/* 0x0478	     */		sethi	%hi(0x1000),%o1
/* 0x047c	     */		ba	.L77001773
/* 0x0480	     */		st	%o1,[%sp+2279]

! Registers live out of .L77001769: 
! g2 g3 sp l5 l7 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001763

			.L77001771:
/* 0x0484	 340 */		ldd	[%sp+2879],%f44
/* 0x0488	 350 */		st	%i3,[%sp+2279]

! Registers live out of .L77001771: 
! g2 g3 sp l5 l7 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001769 .L77001771

			.L77001773:
/* 0x048c	 353 */		call	___errno	!params= 	!result=  %o0
/* 0x0490	     */		std	%f44,[%sp+2879]
/* 0x0494	     */		st	%g0,[%o0]
/* 0x0498	 354 */		add	%i1,768,%o1
/* 0x049c	     */		ldx	[%i4+16],%o0
/* 0x04a0	   0 */		sethi	%gdop_hix22(__iob),%i0
/* 0x04a4	 354 */		call	sscanf	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x04a8	     */		add	%sp,3047,%o2
/* 0x04ac	   0 */		xor	%i0,%gdop_lox10(__iob),%g4
/* 0x04b0	   0 */		ldx	[%l7+%g4],%i2,%gdop(__iob)
/* 0x04b4	 354 */		orcc	%g0,%o0,%g0
/* 0x04b8	     */		bne,pn	%icc,.L77001799
/* 0x04bc	   0 */		add	%i2,256,%l3

! Registers live out of .L77001773: 
! g2 g3 o0 o1 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001773

			.L77001775:
/* 0x04c0	 355 */		add	%i1,774,%o1
/* 0x04c4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x04c8	     */		mov	%l3,%o0
/* 0x04cc	 356 */		call	___errno	!params= 	!result=  %o0
/* 0x04d0	     */		nop
/* 0x04d4	     */		ld	[%o0],%o5
/* 0x04d8	     */		cmp	%o5,0
/* 0x04dc	     */		bne,pn	%icc,.L77001777
/* 0x04e0	     */		nop

! Registers live out of .L77001775: 
! g2 g3 o0 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001775

			.L77001779:
/* 0x04e4	 356 */		ldd	[%sp+2879],%f44
/* 0x04e8	 361 */		std	%f44,[%sp+2879]

! Registers live out of .L77001779: 
! g2 g3 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001777 .L77001779

			.L900001061:
/* 0x04ec	 361 */		call	___errno	!params= 	!result=  %o0
/* 0x04f0	     */		nop
/* 0x04f4	 362 */		mov	10,%o2
/* 0x04f8	 361 */		st	%g0,[%o0]
/* 0x04fc	 362 */		mov	0,%o1
/* 0x0500	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0504	     */		ldx	[%i4+16],%o0
/* 0x0508	 363 */		call	___errno	!params= 	!result=  %o0
/* 0x050c	 362 */		mov	%o0,%l5
/* 0x0510	 363 */		ld	[%o0],%o4
/* 0x0514	     */		cmp	%o4,34
/* 0x0518	     */		be,pn	%icc,.L77001785
/* 0x051c	     */		nop

! Registers live out of .L900001061: 
! g2 g3 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001061

			.L77001781:
/* 0x0520	 363 */		call	___errno	!params= 	!result=  %o0
/* 0x0524	     */		nop
/* 0x0528	     */		ld	[%o0],%l6
/* 0x052c	     */		cmp	%l6,22
/* 0x0530	     */		be,pn	%icc,.L77001785
/* 0x0534	 368 */		prefetch	[%i4+24],0

! Registers live out of .L77001781: 
! g2 g3 o0 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001781

			.L77001787:
/* 0x0538	 368 */		sethi	%hi(0x3ffffc00),%l4
/* 0x053c	     */		add	%l5,-1,%o2
/* 0x0540	     */		add	%l4,1023,%o1
/* 0x0544	     */		cmp	%o2,%o1
/* 0x0548	     */		bleu,pn	%icc,.L77001795
/* 0x054c	 369 */		add	%i1,870,%o1

! Registers live out of .L77001787: 
! g2 g3 o0 o1 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001787

			.L77001793:
/* 0x0550	 369 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0554	     */		mov	%l3,%o0
/* 0x0558	 370 */		add	%i1,910,%o1
/* 0x055c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0560	     */		mov	%l3,%o0
/* 0x0564	 371 */		sethi	%gdop_hix22(.L___const_seg_900000101),%g4
/* 0x0568	     */		ldd	[%sp+2879],%f44
/* 0x056c	     */		xor	%g4,%gdop_lox10(.L___const_seg_900000101),%i2
/* 0x0570	     */		ldx	[%l7+%i2],%g5,%gdop(.L___const_seg_900000101)
/* 0x0574	     */		ldd	[%g5+16],%f32
/* 0x0578	     */		ba	.L77001801
/* 0x057c	     */		std	%f32,[%sp+2711]

! Registers live out of .L77001793: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001787

			.L77001795:
/* 0x0580	 373 */		st	%l5,[%sp+2451]
/* 0x0584	     */		ld	[%sp+2451],%f10
/* 0x0588	 363 */		ldd	[%sp+2879],%f44
/* 0x058c	 373 */		fitod	%f10,%f32
/* 0x0590	     */		ba	.L77001801
/* 0x0594	     */		std	%f32,[%sp+2711]

! Registers live out of .L77001795: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001773

			.L77001799:
/* 0x0598	 376 */		sethi	%gdop_hix22(.L97),%g1
/* 0x059c	     */		mov	%l3,%o0
/* 0x05a0	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i3
/* 0x05a4	 376 */		xor	%g1,%gdop_lox10(.L97),%l3
/* 0x05a8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x05ac	     */		ldx	[%l7+%l3],%o1,%gdop(.L97)
/* 0x05b0	   0 */		xor	%i3,%gdop_lox10(.L___const_seg_900000101),%o5
/* 0x05b4	 377 */		ldd	[%sp+3047],%f2
/* 0x05b8	     */		ldd	[%sp+2879],%f44
/* 0x05bc	     */		prefetch	[%i4+24],0
/* 0x05c0	   0 */		ldx	[%l7+%o5],%i0,%gdop(.L___const_seg_900000101)
/* 0x05c4	 377 */		fmovs	%f3,%f5
/* 0x05c8	     */		fmovs	%f2,%f7
/* 0x05cc	     */		ldd	[%i0+24],%f8
/* 0x05d0	     */		ldd	[%i0+32],%f36
/* 0x05d4	     */		fmovs	%f8,%f4
/* 0x05d8	     */		fmovs	%f8,%f6
/* 0x05dc	     */		fsubd	%f4,%f8,%f32
/* 0x05e0	     */		fsubd	%f6,%f8,%f34
/* 0x05e4	     */		fabsd	%f32,%f38
/* 0x05e8	     */		fabsd	%f34,%f32
/* 0x05ec	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x05f0	     */		std	%f32,[%sp+2711]

! Registers live out of .L77001799: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001793 .L77001795 .L77001799

			.L77001801:
/* 0x05f4	 380 */		call	___errno	!params= 	!result=  %o0
/* 0x05f8	     */		std	%f44,[%sp+2879]
/* 0x05fc	     */		st	%g0,[%o0]
/* 0x0600	 381 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x0604	     */		mov	31,%o0
/* 0x0608	 382 */		ldx	[%i4+24],%o0
/* 0x060c	     */		call	strtod	!params=  %o0 %o1	!result=  %f0 %f1
/* 0x0610	     */		mov	0,%o1
/* 0x0614	   0 */		add	%sp,3055,%l3
/* 0x0618	 382 */		std	%f0,[%sp+3055]
/* 0x061c	 383 */		call	fetestexcept	!params=  %o0	!result=  %o0
/* 0x0620	     */		mov	31,%o0
/* 0x0624	     */		ldd	[%sp+2879],%f44
/* 0x0628	     */		orcc	%g0,%o0,%i3
/* 0x062c	 384 */		be,pn	%icc,.L77001833
/* 0x0630	     */		nop

! Registers live out of .L77001801: 
! g2 g3 o0 sp l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001801

			.L77001803:
/* 0x0634	 385 */		call	printf	!params=  %o0	!result= 
/* 0x0638	     */		add	%i1,998,%o0
/* 0x063c	 386 */		ldd	[%sp+2879],%f44
/* 0x0640	     */		andcc	%i3,1,%l5
/* 0x0644	     */		be,pn	%icc,.L900001161
/* 0x0648	 387 */		andcc	%i3,2,%g0

! Registers live out of .L77001803: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001803

			.L77001805:
/* 0x064c	 386 */		call	printf	!params=  %o0	!result= 
/* 0x0650	     */		add	%i1,1030,%o0
/* 0x0654	     */		ldd	[%sp+2879],%f44
/* 0x0658	 387 */		andcc	%i3,2,%g0

! Registers live out of .L77001805: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001803 .L77001805

			.L900001161:
/* 0x065c	 387 */		be,pn	%icc,.L900001160
/* 0x0660	 388 */		andcc	%i3,4,%g0

! Registers live out of .L900001161: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001161

			.L77001809:
/* 0x0664	 387 */		std	%f44,[%sp+2879]
/* 0x0668	     */		call	printf	!params=  %o0	!result= 
/* 0x066c	     */		add	%i1,1046,%o0
/* 0x0670	     */		ldd	[%sp+2879],%f44
/* 0x0674	 388 */		andcc	%i3,4,%g0

! Registers live out of .L77001809: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001809 .L900001161

			.L900001160:
/* 0x0678	 388 */		be,pn	%icc,.L900001159
/* 0x067c	 389 */		andcc	%i3,8,%g0

! Registers live out of .L900001160: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001160

			.L77001813:
/* 0x0680	 388 */		std	%f44,[%sp+2879]
/* 0x0684	     */		call	printf	!params=  %o0	!result= 
/* 0x0688	     */		add	%i1,1062,%o0
/* 0x068c	     */		ldd	[%sp+2879],%f44
/* 0x0690	 389 */		andcc	%i3,8,%g0

! Registers live out of .L77001813: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001813 .L900001160

			.L900001159:
/* 0x0694	 389 */		be,pn	%icc,.L900001158
/* 0x0698	 390 */		andcc	%i3,16,%g0

! Registers live out of .L900001159: 
! g2 g3 o0 sp l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001159

			.L77001817:
/* 0x069c	 389 */		std	%f44,[%sp+2879]
/* 0x06a0	     */		call	printf	!params=  %o0	!result= 
/* 0x06a4	     */		add	%i1,1078,%o0
/* 0x06a8	     */		ldd	[%sp+2879],%f44
/* 0x06ac	 390 */		andcc	%i3,16,%g0

! Registers live out of .L77001817: 
! g2 g3 o0 sp l5 l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001817 .L900001159

			.L900001158:
/* 0x06b0	 390 */		be,pn	%icc,.L900001157
/* 0x06b4	 391 */		cmp	%l5,0

! Registers live out of .L900001158: 
! g2 g3 o0 sp l5 l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001158

			.L77001821:
/* 0x06b8	 390 */		std	%f44,[%sp+2879]
/* 0x06bc	     */		call	printf	!params=  %o0	!result= 
/* 0x06c0	     */		add	%i1,1094,%o0
/* 0x06c4	     */		ldd	[%sp+2879],%f44
/* 0x06c8	 391 */		cmp	%l5,0

! Registers live out of .L77001821: 
! g2 g3 o0 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001821 .L900001158

			.L900001157:
/* 0x06cc	 391 */		be,pn	%icc,.L77002880
/* 0x06d0	     */		std	%f44,[%sp+2879]

! Registers live out of .L900001157: 
! g2 g3 o0 sp l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001157

			.L77001825:
/* 0x06d4	 391 */		call	printf	!params=  %o0	!result= 
/* 0x06d8	     */		add	%i1,1030,%o0
/* 0x06dc	 392 */		call	printf	!params=  %o0	!result= 
/* 0x06e0	     */		add	%i1,1106,%o0
/* 0x06e4	 395 */		call	printf	!params=  %o0	!result= 
/* 0x06e8	     */		add	%i1,1110,%o0
/* 0x06ec	     */		ldd	[%sp+2879],%f44
/* 0x06f0	     */		ba	.L77001833
/* 0x06f4	     */		nop

! Registers live out of .L77001825: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001157

			.L77002880:
/* 0x06f8	 392 */		call	printf	!params=  %o0	!result= 
/* 0x06fc	     */		add	%i1,1106,%o0
/* 0x0700	     */		ldd	[%sp+2879],%f44

! Registers live out of .L77002880: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001801 .L77001825 .L77002880

			.L77001833:
/* 0x0704	 397 */		call	___errno	!params= 	!result=  %o0
/* 0x0708	     */		std	%f44,[%sp+2879]
/* 0x070c	     */		ld	[%o0],%o4
/* 0x0710	     */		cmp	%o4,34
/* 0x0714	     */		be,pn	%icc,.L77001839
/* 0x0718	     */		nop

! Registers live out of .L77001833: 
! g2 g3 sp l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001833

			.L77001835:
/* 0x071c	 397 */		call	___errno	!params= 	!result=  %o0
/* 0x0720	     */		nop
/* 0x0724	     */		ld	[%o0],%l6
/* 0x0728	     */		cmp	%l6,22
/* 0x072c	     */		be,pn	%icc,.L77001839
/* 0x0730	 402 */		ld	[%l3],%i3

! Registers live out of .L77001835: 
! g2 g3 o0 sp l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001835

			.L77001841:
/* 0x0734	 402 */		sethi	%hi(0x7ff00000),%l2
/* 0x0738	     */		sethi	%hi(0x7fe00000),%g1
/* 0x073c	     */		ldd	[%l3],%f2
/* 0x0740	     */		and	%i3,%l2,%o5
/* 0x0744	     */		mov	%g1,%l5
/* 0x0748	     */		sub	%o5,%i5,%i0
/* 0x074c	     */		srl	%i0,0,%g4
/* 0x0750	     */		sub	%g4,%g1,%i2
/* 0x0754	     */		srlx	%i2,63,%g5
/* 0x0758	     */		cmp	%g5,0
/* 0x075c	     */		bne,pn	%icc,.L77001847
/* 0x0760	     */		st	%f2,[%fp+2015]

! Registers live out of .L77001841: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77001841

			.L77001843:
/* 0x0764	 402 */		fzero	%f32
/* 0x0768	     */		fcmpd	%fcc0,%f2,%f32
/* 0x076c	     */		fbe,pn	%fcc0,.L900001156
/* 0x0770	   0 */		sethi	%gdop_hix22(.L118),%o1

! Registers live out of .L77001843: 
! g2 g3 o0 o1 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001843

			.L77001845:
/* 0x0774	   0 */		sethi	%gdop_hix22(__iob),%i4
/* 0x0778	   0 */		sethi	%gdop_hix22(.L130),%i1
/* 0x077c	   0 */		xor	%i4,%gdop_lox10(__iob),%i5
/* 0x0780	   0 */		xor	%i1,%gdop_lox10(.L130),%l6
/* 0x0784	   0 */		ldx	[%l7+%i5],%o4,%gdop(__iob)
/* 0x0788	   0 */		ldx	[%l7+%l6],%l7,%gdop(.L130)
/* 0x078c	   0 */		add	%o4,256,%l5
/* 0x0790	 403 */		mov	%l7,%o1
/* 0x0794	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0798	     */		mov	%l5,%o0
/* 0x079c	 404 */		ldx	[%sp+3055],%o2
/* 0x07a0	     */		add	%l7,48,%o1
/* 0x07a4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x07a8	     */		mov	%l5,%o0
/* 0x07ac	 392 */		return	%i7+8	! Result =  %i0
/* 0x07b0	     */		mov	1,%o0
                       
! predecessor blocks: .L77001841

			.L77001847:
/* 0x07b4	   0 */		sethi	%gdop_hix22(.L118),%o1

! Registers live out of .L77001847: 
! g2 g3 o1 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001843 .L77001847

			.L900001156:
/* 0x07b8	 407 */		mov	31,%o0
/* 0x07bc	   0 */		xor	%o1,%gdop_lox10(.L118),%o2
/* 0x07c0	 407 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x07c4	   0 */		ldx	[%l7+%o2],%i2,%gdop(.L118)
/* 0x07c8	 408 */		prefetch	[%i4+32],0
/* 0x07cc	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o0
/* 0x07d0	   0 */		xor	%o0,%gdop_lox10(.L___const_seg_900000101),%o7
/* 0x07d4	 408 */		ldd	[%l3],%f34
/* 0x07d8	   0 */		ldx	[%l7+%o7],%o3,%gdop(.L___const_seg_900000101)
/* 0x07dc	 408 */		ldd	[%o3+40],%f32
/* 0x07e0	     */		fnegd	%f32,%f32
/* 0x07e4	     */		fcmped	%fcc1,%f34,%f32
/* 0x07e8	     */		fbl,pn	%fcc1,.L77001853
/* 0x07ec	     */		ldd	[%o3+40],%f32

! Registers live out of .L900001156: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L900001156

			.L77001849:
/* 0x07f0	 408 */		fcmped	%fcc2,%f34,%f32
/* 0x07f4	     */		fbg,pn	%fcc2,.L77001853
/* 0x07f8	     */		ldd	[%sp+2879],%f44

! Registers live out of .L77001849: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! f34 f44 
		                       
! predecessor blocks: .L77001849

			.L77001855:
/* 0x07fc	 414 */		ba	.L77001857
/* 0x0800	     */		std	%f34,[%sp+2783]

! Registers live out of .L77001855: 
! g2 g3 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001849 .L900001156

			.L77001853:
/* 0x0804	   0 */		sethi	%gdop_hix22(__iob),%i0
/* 0x0808	 409 */		add	%i2,180,%o1
/* 0x080c	   0 */		xor	%i0,%gdop_lox10(__iob),%g4
/* 0x0810	   0 */		ldx	[%l7+%g4],%g5,%gdop(__iob)
/* 0x0814	   0 */		add	%g5,256,%l4
/* 0x0818	 409 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x081c	     */		mov	%l4,%o0
/* 0x0820	 410 */		ldx	[%sp+3055],%o2
/* 0x0824	     */		add	%i2,228,%o1
/* 0x0828	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x082c	     */		mov	%l4,%o0
/* 0x0830	 411 */		mov	%l4,%o0
/* 0x0834	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0838	     */		add	%i2,260,%o1
/* 0x083c	 412 */		ldd	[%sp+2879],%f44
/* 0x0840	     */		stx	%g0,[%sp+2783]

! Registers live out of .L77001853: 
! g2 g3 sp l2 l5 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001853 .L77001855

			.L77001857:
/* 0x0844	 417 */		call	___errno	!params= 	!result=  %o0
/* 0x0848	     */		std	%f44,[%sp+2879]
/* 0x084c	     */		st	%g0,[%o0]
/* 0x0850	 418 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x0854	     */		mov	31,%o0
/* 0x0858	 419 */		ldx	[%i4+32],%o0
/* 0x085c	     */		call	strtod	!params=  %o0 %o1	!result=  %f0 %f1
/* 0x0860	     */		mov	0,%o1
/* 0x0864	   0 */		add	%sp,3079,%i3
/* 0x0868	 419 */		std	%f0,[%sp+3079]
/* 0x086c	 420 */		call	fetestexcept	!params=  %o0	!result=  %o0
/* 0x0870	     */		mov	31,%o0
/* 0x0874	 421 */		ldd	[%sp+2879],%f44
/* 0x0878	 420 */		orcc	%g0,%o0,%l6
/* 0x087c	 421 */		be,pn	%icc,.L77001881
/* 0x0880	     */		and	%o0,1,%l3

! Registers live out of .L77001857: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001857

			.L77001859:
/* 0x0884	 422 */		call	printf	!params=  %o0	!result= 
/* 0x0888	     */		add	%i2,-108,%o0
/* 0x088c	 423 */		ldd	[%sp+2879],%f44
/* 0x0890	     */		cmp	%l3,0
/* 0x0894	     */		be,pn	%icc,.L900001155
/* 0x0898	 424 */		andcc	%l6,2,%g0

! Registers live out of .L77001859: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001859

			.L77001861:
/* 0x089c	 423 */		call	printf	!params=  %o0	!result= 
/* 0x08a0	     */		add	%i2,-76,%o0
/* 0x08a4	     */		ldd	[%sp+2879],%f44
/* 0x08a8	 424 */		andcc	%l6,2,%g0

! Registers live out of .L77001861: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001859 .L77001861

			.L900001155:
/* 0x08ac	 424 */		be,pn	%icc,.L900001154
/* 0x08b0	 425 */		andcc	%l6,4,%g0

! Registers live out of .L900001155: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001155

			.L77001865:
/* 0x08b4	 424 */		std	%f44,[%sp+2879]
/* 0x08b8	     */		call	printf	!params=  %o0	!result= 
/* 0x08bc	     */		add	%i2,-60,%o0
/* 0x08c0	     */		ldd	[%sp+2879],%f44
/* 0x08c4	 425 */		andcc	%l6,4,%g0

! Registers live out of .L77001865: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001865 .L900001155

			.L900001154:
/* 0x08c8	 425 */		be,pn	%icc,.L900001153
/* 0x08cc	 426 */		andcc	%l6,8,%g0

! Registers live out of .L900001154: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001154

			.L77001869:
/* 0x08d0	 425 */		std	%f44,[%sp+2879]
/* 0x08d4	     */		call	printf	!params=  %o0	!result= 
/* 0x08d8	     */		add	%i2,-44,%o0
/* 0x08dc	     */		ldd	[%sp+2879],%f44
/* 0x08e0	 426 */		andcc	%l6,8,%g0

! Registers live out of .L77001869: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001869 .L900001154

			.L900001153:
/* 0x08e4	 426 */		be,pn	%icc,.L900001152
/* 0x08e8	 427 */		andcc	%l6,16,%g0

! Registers live out of .L900001153: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001153

			.L77001873:
/* 0x08ec	 426 */		std	%f44,[%sp+2879]
/* 0x08f0	     */		call	printf	!params=  %o0	!result= 
/* 0x08f4	     */		add	%i2,-28,%o0
/* 0x08f8	     */		ldd	[%sp+2879],%f44
/* 0x08fc	 427 */		andcc	%l6,16,%g0

! Registers live out of .L77001873: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001873 .L900001153

			.L900001152:
/* 0x0900	 427 */		be,pn	%icc,.L900001151
/* 0x0904	 428 */		std	%f44,[%sp+2879]

! Registers live out of .L900001152: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001152

			.L77001877:
/* 0x0908	 427 */		call	printf	!params=  %o0	!result= 
/* 0x090c	     */		add	%i2,-12,%o0

! Registers live out of .L77001877: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001877 .L900001152

			.L900001151:
/* 0x0910	 428 */		call	printf	!params=  %o0	!result= 
/* 0x0914	     */		mov	%i2,%o0
/* 0x0918	     */		ldd	[%sp+2879],%f44

! Registers live out of .L900001151: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001857 .L900001151

			.L77001881:
/* 0x091c	 430 */		cmp	%l3,0
/* 0x0920	     */		be,pn	%icc,.L77001885
/* 0x0924	 431 */		sethi	%gdop_hix22(.L154),%g1

! Registers live out of .L77001881: 
! g1 g2 g3 o0 sp l2 l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001881

			.L77001883:
/* 0x0928	 431 */		xor	%g1,%gdop_lox10(.L154),%o5
/* 0x092c	     */		std	%f44,[%sp+2879]
/* 0x0930	     */		call	printf	!params=  %o0	!result= 
/* 0x0934	     */		ldx	[%l7+%o5],%o0,%gdop(.L154)
/* 0x0938	     */		ldd	[%sp+2879],%f44

! Registers live out of .L77001883: 
! g2 g3 sp l2 l5 l7 i0 i1 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001881 .L77001883

			.L77001885:
/* 0x093c	 433 */		call	___errno	!params= 	!result=  %o0
/* 0x0940	     */		std	%f44,[%sp+2879]
/* 0x0944	     */		ld	[%o0],%o4
/* 0x0948	     */		cmp	%o4,34
/* 0x094c	     */		be,pn	%icc,.L77001891
/* 0x0950	     */		nop

! Registers live out of .L77001885: 
! g2 g3 sp l2 l5 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001885

			.L77001887:
/* 0x0954	 433 */		call	___errno	!params= 	!result=  %o0
/* 0x0958	     */		nop
/* 0x095c	     */		ld	[%o0],%l6
/* 0x0960	     */		cmp	%l6,22
/* 0x0964	     */		be,pn	%icc,.L77001891
/* 0x0968	 438 */		ld	[%i3],%o1

! Registers live out of .L77001887: 
! g2 g3 o0 o1 sp l2 l5 l6 l7 i0 i1 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001887

			.L77001893:
/* 0x096c	 438 */		and	%o1,%l2,%l3
/* 0x0970	     */		ldd	[%i3],%f2
/* 0x0974	     */		sub	%l3,%i5,%i0
/* 0x0978	     */		srl	%i0,0,%i3
/* 0x097c	     */		sub	%i3,%l5,%g4
/* 0x0980	     */		srlx	%g4,63,%g5
/* 0x0984	     */		cmp	%g5,0
/* 0x0988	     */		bne,pn	%icc,.L77001899
/* 0x098c	     */		st	%f2,[%fp+2015]

! Registers live out of .L77001893: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77001893

			.L77001895:
/* 0x0990	 438 */		fzero	%f32
/* 0x0994	     */		fcmpd	%fcc3,%f2,%f32
/* 0x0998	     */		fbe,pn	%fcc3,.L77001899
/* 0x099c	   0 */		sethi	%gdop_hix22(__iob),%l6

! Registers live out of .L77001895: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001895

			.L77001897:
/* 0x09a0	   0 */		sethi	%gdop_hix22(.L163),%o4
/* 0x09a4	   0 */		xor	%l6,%gdop_lox10(__iob),%g1
/* 0x09a8	   0 */		xor	%o4,%gdop_lox10(.L163),%o5
/* 0x09ac	   0 */		ldx	[%l7+%g1],%i4,%gdop(__iob)
/* 0x09b0	   0 */		ldx	[%l7+%o5],%l7,%gdop(.L163)
/* 0x09b4	   0 */		add	%i4,256,%i1
/* 0x09b8	 439 */		mov	%l7,%o1
/* 0x09bc	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x09c0	     */		mov	%i1,%o0
/* 0x09c4	 440 */		ldx	[%sp+3079],%o2
/* 0x09c8	     */		add	%l7,-248,%o1
/* 0x09cc	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x09d0	     */		mov	%i1,%o0
/* 0x09d4	 392 */		return	%i7+8	! Result =  %i0
/* 0x09d8	     */		mov	1,%o0
                       
! predecessor blocks: .L77001893 .L77001895

			.L77001899:
/* 0x09dc	   0 */		sethi	%gdop_hix22(__iob),%l2
/* 0x09e0	   0 */		sethi	%gdop_hix22(.L194),%i2
/* 0x09e4	   0 */		xor	%l2,%gdop_lox10(__iob),%o0
/* 0x09e8	   0 */		xor	%i2,%gdop_lox10(.L194),%i5
/* 0x09ec	   0 */		ldx	[%l7+%o0],%l4,%gdop(__iob)
/* 0x09f0	   0 */		ldx	[%l7+%i5],%i2,%gdop(.L194)
/* 0x09f4	 443 */		mov	31,%o0
/* 0x09f8	     */		call	feclearexcept	!params=  %o0	!result= 
/* 0x09fc	   0 */		add	%l4,256,%l2
/* 0x0a00	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o2
/* 0x0a04	 444 */		ldd	[%sp+3079],%f34
/* 0x0a08	   0 */		xor	%o2,%gdop_lox10(.L___const_seg_900000101),%o7
/* 0x0a0c	   0 */		ldx	[%l7+%o7],%o3,%gdop(.L___const_seg_900000101)
/* 0x0a10	 444 */		ldd	[%o3+40],%f32
/* 0x0a14	     */		fnegd	%f32,%f32
/* 0x0a18	     */		fcmped	%fcc0,%f34,%f32
/* 0x0a1c	     */		fbl,pn	%fcc0,.L77001905
/* 0x0a20	     */		ldd	[%o3+40],%f32

! Registers live out of .L77001899: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L77001899

			.L77001901:
/* 0x0a24	 444 */		fcmped	%fcc1,%f34,%f32
/* 0x0a28	     */		fbg,pn	%fcc1,.L77001905
/* 0x0a2c	     */		ldd	[%sp+2879],%f44

! Registers live out of .L77001901: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! f34 f44 
		                       
! predecessor blocks: .L77001901

			.L77001907:
/* 0x0a30	 450 */		std	%f34,[%sp+2791]
/* 0x0a34	     */		ba	.L900001150
/* 0x0a38	 453 */		std	%f44,[%sp+2879]

! Registers live out of .L77001907: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001899 .L77001901

			.L77001905:
/* 0x0a3c	 445 */		add	%i2,-216,%o1
/* 0x0a40	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0a44	     */		mov	%l2,%o0
/* 0x0a48	 446 */		ldx	[%sp+3079],%o2
/* 0x0a4c	     */		add	%i2,-440,%o1
/* 0x0a50	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x0a54	     */		mov	%l2,%o0
/* 0x0a58	 447 */		add	%i2,-408,%o1
/* 0x0a5c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0a60	     */		mov	%l2,%o0
/* 0x0a64	 448 */		stx	%g0,[%sp+2791]

! Registers live out of .L77001905: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001905 .L77001907

			.L900001150:
/* 0x0a68	 453 */		mov	10,%o2
/* 0x0a6c	     */		mov	0,%o1
/* 0x0a70	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0a74	     */		ldx	[%i4+40],%o0
/* 0x0a78	 454 */		call	___errno	!params= 	!result=  %o0
/* 0x0a7c	 453 */		mov	%o0,%l4
/* 0x0a80	 454 */		ld	[%o0],%l5
/* 0x0a84	     */		cmp	%l5,34
/* 0x0a88	     */		be,pn	%icc,.L77001915
/* 0x0a8c	     */		nop

! Registers live out of .L900001150: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900001150

			.L77001911:
/* 0x0a90	 454 */		call	___errno	!params= 	!result=  %o0
/* 0x0a94	     */		nop
/* 0x0a98	     */		ld	[%o0],%g5
/* 0x0a9c	     */		cmp	%g5,22
/* 0x0aa0	     */		be,pn	%icc,.L77001915
/* 0x0aa4	 459 */		add	%l4,-1,%o5

! Registers live out of .L77001911: 
! g2 g3 o0 o1 o5 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001911

			.L77001917:
/* 0x0aa8	 459 */		cmp	%o5,63
/* 0x0aac	     */		bleu,pn	%icc,.L77001925
/* 0x0ab0	 142 */		mov	1,%g1

! Registers live out of .L77001917: 
! g1 g2 g3 o0 o1 sp l2 l4 l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001917

			.L77001923:
/* 0x0ab4	 460 */		add	%i2,-120,%o1
/* 0x0ab8	 142 */		st	%g1,[%sp+2283]
/* 0x0abc	 460 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ac0	     */		mov	%l2,%o0
/* 0x0ac4	 461 */		add	%i2,-864,%o1
/* 0x0ac8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0acc	     */		mov	%l2,%o0
/* 0x0ad0	 462 */		ba	.L900001148
/* 0x0ad4	 504 */		nop

! Registers live out of .L77001923: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001917

			.L77001925:
/* 0x0ad8	 454 */		ldd	[%sp+2879],%f44
/* 0x0adc	 465 */		cmp	%l4,1
/* 0x0ae0	     */		bg,pn	%icc,.L77001927
/* 0x0ae4	 142 */		mov	1,%i3

! Registers live out of .L77001925: 
! g2 g3 o0 o1 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001925

			.L77001947:
/* 0x0ae8	 142 */		st	%i3,[%sp+2283]
/* 0x0aec	 491 */		ba	.L900001148
/* 0x0af0	 504 */		std	%f44,[%sp+2879]

! Registers live out of .L77001947: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001925

			.L77001927:
/* 0x0af4	 471 */		mov	0,%l6
/* 0x0af8	 472 */		mov	%l4,%o4
/* 0x0afc	 473 */		mov	0,%i5
/* 0x0b00	 475 */		and	%l4,1,%l5

! Registers live out of .L77001927: 
! g2 g3 o0 o1 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001927 .L77001931

			.L900001149:
/* 0x0b04	 478 */		sra	%o4,1,%o4
/* 0x0b08	 476 */		add	%l6,1,%o5
/* 0x0b0c	   0 */		mov	%l5,%g5
/* 0x0b10	 476 */		movrnz	%g5,%o5,%l6
/* 0x0b14	 474 */		cmp	%o4,0
/* 0x0b18	     */		be,pn	%icc,.L77001939
/* 0x0b1c	 479 */		add	%i5,1,%i5

! Registers live out of .L900001149: 
! g2 g3 o0 o1 o4 sp l2 l4 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001149

			.L77001931:
/* 0x0b20	 475 */		and	%o4,1,%o0
/* 0x0b24	 478 */		sra	%o4,1,%o4
/* 0x0b28	 476 */		add	%l6,1,%o2
/* 0x0b2c	   0 */		mov	%o0,%o7
/* 0x0b30	 479 */		add	%i5,1,%i5
/* 0x0b34	 476 */		movrnz	%o7,%o2,%l6
/* 0x0b38	 474 */		cmp	%o4,0
/* 0x0b3c	     */		bne,pt	%icc,.L900001149
/* 0x0b40	 475 */		and	%o4,1,%l5

! Registers live out of .L77001931: 
! g2 g3 o0 o1 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001931 .L900001149

			.L77001939:
/* 0x0b44	 481 */		cmp	%l6,1
/* 0x0b48	     */		ble,pn	%icc,.L77001943
/* 0x0b4c	 482 */		add	%i2,-80,%o1

! Registers live out of .L77001939: 
! g2 g3 o0 o1 sp l2 l4 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77001939

			.L77001941:
/* 0x0b50	 482 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0b54	     */		mov	%l2,%o0
/* 0x0b58	 483 */		add	%i2,-40,%o1
/* 0x0b5c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0b60	     */		mov	%l2,%o0
/* 0x0b64	 484 */		add	%i5,-1,%g4
/* 0x0b68	     */		mov	1,%g5
/* 0x0b6c	 485 */		mov	%i2,%o1
/* 0x0b70	 484 */		sll	%g5,%g4,%l5
/* 0x0b74	 485 */		mov	%l2,%o0
/* 0x0b78	 484 */		st	%l5,[%sp+2283]
/* 0x0b7c	 485 */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x0b80	     */		sra	%l5,0,%o2
/* 0x0b84	     */		ba	.L900001148
/* 0x0b88	 504 */		nop

! Registers live out of .L77001941: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001939

			.L77001943:
/* 0x0b8c	 487 */		st	%l4,[%sp+2283]
/* 0x0b90	 504 */		std	%f44,[%sp+2879]

! Registers live out of .L77001943: 
! g2 g3 o0 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001923 .L77001941 .L77001943 .L77001947 .L77001953

			.L900001148:
/* 0x0b94	 504 */		ld	[%sp+2279],%o1
/* 0x0b98	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0b9c	     */		add	%i1,1902,%o0
/* 0x0ba0	 505 */		add	%i1,1926,%o0
/* 0x0ba4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0ba8	     */		ldsw	[%sp+2283],%o1
/* 0x0bac	 508 */		ldx	[%sp+2783],%o1
/* 0x0bb0	     */		add	%i1,1950,%o0
/* 0x0bb4	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0bb8	     */		ldx	[%sp+2791],%o2
/* 0x0bbc	 510 */		add	%i1,1998,%o0
/* 0x0bc0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0bc4	     */		ldx	[%sp+2711],%o1
/* 0x0bc8	     */		ldd	[%sp+2711],%f36
/* 0x0bcc	 523 */		ldd	[%sp+2999],%f32
/* 0x0bd0	 522 */		ldd	[%sp+2991],%f34
/* 0x0bd4	 527 */		add	%i1,2026,%o0
/* 0x0bd8	 523 */		fdivd	%f32,%f36,%f32
/* 0x0bdc	     */		std	%f32,[%sp+2807]
/* 0x0be0	 522 */		fdivd	%f34,%f36,%f32
/* 0x0be4	 527 */		call	printf	!params=  %o0	!result= 
/* 0x0be8	 522 */		std	%f32,[%sp+2799]
/* 0x0bec	 528 */		add	%i1,2038,%o0
/* 0x0bf0	     */		mov	1044,%o2
/* 0x0bf4	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0bf8	     */		mov	1044,%o1
/* 0x0bfc	 530 */		sethi	%gdop_hix22(X_error_handler),%o2
/* 0x0c00	     */		xor	%o2,%gdop_lox10(X_error_handler),%o7
/* 0x0c04	     */		ldx	[%l7+%o7],%o0,%gdop(X_error_handler)
/* 0x0c08	     */		call	XSetErrorHandler	!params=  %o0	!result= 
/* 0x0c0c	     */		nop
/* 0x0c10	 533 */		call	XOpenDisplay	!params=  %o0	!result=  %o0
/* 0x0c14	     */		mov	0,%o0
/* 0x0c18	 534 */		brnz,pn	%o0,.L77001959
/* 0x0c1c	 536 */		add	%i1,2070,%o1

! Registers live out of .L900001148: 
! g2 g3 o0 o1 sp l6 l7 i0 i1 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900001148

			.L77001957:
/* 0x0c20	 536 */		sethi	%gdop_hix22(__iob),%o0
/* 0x0c24	     */		ldx	[%i4],%o2
/* 0x0c28	     */		xor	%o0,%gdop_lox10(__iob),%l6
/* 0x0c2c	     */		mov	0,%o3
/* 0x0c30	     */		ldx	[%l7+%l6],%i2,%gdop(__iob)
/* 0x0c34	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x0c38	     */		add	%i2,256,%o0
/* 0x0c3c	 392 */		return	%i7+8	! Result =  %i0
/* 0x0c40	     */		mov	1,%o0
                       
! predecessor blocks: .L900001148

			.L77001959:
/* 0x0c44	 539 */		call	XConnectionNumber	!params=  %o0	!result=  %o0
/* 0x0c48	 533 */		mov	%o0,%l6
/* 0x0c4c	 539 */		mov	%o0,%o1
/* 0x0c50	 540 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0c54	     */		add	%i1,2094,%o0
/* 0x0c58	 542 */		ld	[%l6+224],%i4
/* 0x0c5c	 543 */		add	%i1,2126,%o0
/* 0x0c60	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0c64	     */		sra	%i4,0,%o1
/* 0x0c68	 545 */		mov	%l6,%o0
/* 0x0c6c	     */		call	XDefaultDepth	!params=  %o0 %o1	!result=  %o0
/* 0x0c70	     */		sra	%i4,0,%o1
/* 0x0c74	 553 */		sra	%i4,0,%i0
/* 0x0c78	 545 */		mov	%o0,%o1
/* 0x0c7c	 546 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0c80	     */		add	%i1,2158,%o0
/* 0x0c84	 551 */		mov	%l6,%o0
/* 0x0c88	     */		call	XLoadFont	!params=  %o0 %o1	!result=  %o0
/* 0x0c8c	     */		add	%i1,2190,%o1
/* 0x0c90	 553 */		ldx	[%l6+232],%i3
/* 0x0c94	     */		sllx	%i0,7,%g4
/* 0x0c98	 551 */		mov	%o0,%i2
/* 0x0c9c	 553 */		stx	%g4,[%sp+2727]
/* 0x0ca0	 557 */		add	%i1,2214,%o0
/* 0x0ca4	 553 */		add	%i3,%g4,%g5
/* 0x0ca8	 554 */		ld	[%g5+28],%l2
/* 0x0cac	 553 */		ld	[%g5+24],%l5
/* 0x0cb0	 557 */		sra	%l2,0,%o2
/* 0x0cb4	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0cb8	     */		sra	%l5,0,%o1
/* 0x0cbc	 561 */		cmp	%l5,1044
/* 0x0cc0	     */		bl,pn	%icc,.L77001965
/* 0x0cc4	     */		cmp	%l2,1044

! Registers live out of .L77001959: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001959

			.L77001961:
/* 0x0cc8	 561 */		bl,pn	%icc,.L77001965
/* 0x0ccc	 570 */		mov	20,%o2

! Registers live out of .L77001961: 
! g2 g3 o0 o2 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001961

			.L77001967:
/* 0x0cd0	 570 */		mov	20,%o1
/* 0x0cd4	 583 */		sethi	%hi(0x40000),%i0
/* 0x0cd8	 570 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0cdc	     */		add	%i1,2302,%o0
/* 0x0ce0	 578 */		sethi	%hi(0xf0c00),%o1
/* 0x0ce4	     */		add	%o1,783,%o5
/* 0x0ce8	     */		mov	20,%o4
/* 0x0cec	     */		mov	20,%o3
/* 0x0cf0	     */		mov	1044,%o2
/* 0x0cf4	     */		mov	1044,%o1
/* 0x0cf8	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0cfc	     */		mov	%l6,%o0
/* 0x0d00	     */		stx	%o0,[%sp+2767]
/* 0x0d04	     */		mov	%o0,%o1
/* 0x0d08	 579 */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0d0c	     */		mov	%l6,%o0
/* 0x0d10	     */		stx	%o0,[%sp+2759]
/* 0x0d14	 583 */		mov	740,%o4
/* 0x0d18	     */		mov	1070,%o3
/* 0x0d1c	     */		mov	330,%o2
/* 0x0d20	     */		mov	400,%o1
/* 0x0d24	     */		mov	%l6,%o0
/* 0x0d28	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0d2c	     */		add	%i0,4,%o5
/* 0x0d30	     */		stx	%o0,[%sp+2743]
/* 0x0d34	     */		mov	%o0,%o1
/* 0x0d38	 584 */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0d3c	     */		mov	%l6,%o0
/* 0x0d40	     */		stx	%o0,[%sp+2735]
/* 0x0d44	     */		mov	%o0,%o1
/* 0x0d48	 585 */		add	%i0,4,%o2
/* 0x0d4c	     */		call	XSetBackground	!params=  %o0 %o1 %o2	!result= 
/* 0x0d50	     */		mov	%l6,%o0
/* 0x0d54	 589 */		mov	2064,%o5
/* 0x0d58	     */		mov	740,%o4
/* 0x0d5c	     */		mov	1470,%o3
/* 0x0d60	     */		mov	330,%o2
/* 0x0d64	     */		mov	440,%o1
/* 0x0d68	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0d6c	     */		mov	%l6,%o0
/* 0x0d70	     */		stx	%o0,[%sp+2775]
/* 0x0d74	 590 */		mov	%l6,%o0
/* 0x0d78	     */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0d7c	     */		ldx	[%sp+2743],%o1
/* 0x0d80	 591 */		mov	2064,%o2
/* 0x0d84	 590 */		stx	%o0,[%sp+2751]
/* 0x0d88	     */		mov	%o0,%o1
/* 0x0d8c	 591 */		call	XSetBackground	!params=  %o0 %o1 %o2	!result= 
/* 0x0d90	     */		mov	%l6,%o0
/* 0x0d94	 593 */		mov	0,%o1
/* 0x0d98	     */		call	XSync	!params=  %o0 %o1	!result= 
/* 0x0d9c	     */		mov	%l6,%o0
/* 0x0da0	 595 */		mov	%l6,%o0
/* 0x0da4	     */		call	XDefaultColormap	!params=  %o0 %o1	!result=  %o0
/* 0x0da8	     */		ldsw	[%l6+224],%o1
/* 0x0dac	 598 */		add	%sp,2519,%o3
/* 0x0db0	 595 */		mov	%o0,%l3
/* 0x0db4	 598 */		mov	%o3,%o4
/* 0x0db8	     */		add	%i1,2330,%o2
/* 0x0dbc	     */		mov	%l6,%o0
/* 0x0dc0	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0dc4	     */		mov	%l3,%o1
/* 0x0dc8	     */		orcc	%g0,%o0,%g0
/* 0x0dcc	     */		bne,pn	%icc,.L77001971
/* 0x0dd0	 599 */		sethi	%gdop_hix22(__iob),%o5

! Registers live out of .L77001967: 
! g2 g3 o0 o2 o5 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001967

			.L77001969:
/* 0x0dd4	 599 */		xor	%o5,%gdop_lox10(__iob),%l4
/* 0x0dd8	     */		add	%i1,2334,%o1
/* 0x0ddc	     */		ldx	[%l7+%l4],%i5,%gdop(__iob)
/* 0x0de0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0de4	     */		add	%i5,256,%o0
/* 0x0de8	 392 */		return	%i7+8	! Result =  %i0
/* 0x0dec	     */		mov	1,%o0
                       
! predecessor blocks: .L77001967

			.L77001971:
/* 0x0df0	 604 */		add	%sp,2535,%o3
/* 0x0df4	     */		mov	%l3,%o1
/* 0x0df8	     */		mov	%o3,%o4
/* 0x0dfc	     */		mov	%l6,%o0
/* 0x0e00	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0e04	     */		add	%i1,2368,%o2
/* 0x0e08	     */		orcc	%g0,%o0,%g0
/* 0x0e0c	     */		bne,pn	%icc,.L77001975
/* 0x0e10	 605 */		sethi	%gdop_hix22(__iob),%g1

! Registers live out of .L77001971: 
! g1 g2 g3 o0 o2 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001971

			.L77001973:
/* 0x0e14	 605 */		xor	%g1,%gdop_lox10(__iob),%l5
/* 0x0e18	     */		add	%i1,2374,%o1
/* 0x0e1c	     */		ldx	[%l7+%l5],%l2,%gdop(__iob)
/* 0x0e20	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0e24	     */		add	%l2,256,%o0
/* 0x0e28	 392 */		return	%i7+8	! Result =  %i0
/* 0x0e2c	     */		mov	1,%o0
                       
! predecessor blocks: .L77001971

			.L77001975:
/* 0x0e30	 610 */		add	%sp,2975,%o3
/* 0x0e34	     */		mov	%l3,%o1
/* 0x0e38	     */		mov	%o3,%o4
/* 0x0e3c	     */		mov	%l6,%o0
/* 0x0e40	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0e44	     */		add	%i1,2420,%o2
/* 0x0e48	     */		orcc	%g0,%o0,%g0
/* 0x0e4c	     */		bne,pn	%icc,.L77001979
/* 0x0e50	 611 */		sethi	%gdop_hix22(__iob),%o7

! Registers live out of .L77001975: 
! g2 g3 o0 o2 sp o7 l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001975

			.L77001977:
/* 0x0e54	 611 */		xor	%o7,%gdop_lox10(__iob),%o3
/* 0x0e58	     */		add	%i1,2430,%o1
/* 0x0e5c	     */		ldx	[%l7+%o3],%o4,%gdop(__iob)
/* 0x0e60	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0e64	     */		add	%o4,256,%o0
/* 0x0e68	 392 */		return	%i7+8	! Result =  %i0
/* 0x0e6c	     */		mov	1,%o0
                       
! predecessor blocks: .L77001975

			.L77001979:
/* 0x0e70	 616 */		add	%sp,2583,%o3
/* 0x0e74	     */		mov	%l3,%o1
/* 0x0e78	     */		mov	%o3,%o4
/* 0x0e7c	     */		mov	%l6,%o0
/* 0x0e80	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0e84	     */		add	%i1,2480,%o2
/* 0x0e88	     */		orcc	%g0,%o0,%g0
/* 0x0e8c	     */		bne,pn	%icc,.L77001983
/* 0x0e90	 617 */		add	%i1,2494,%o1

! Registers live out of .L77001979: 
! g2 g3 o0 o1 o2 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001979

			.L77001981:
/* 0x0e94	 617 */		sethi	%gdop_hix22(__iob),%l6
/* 0x0e98	     */		xor	%l6,%gdop_lox10(__iob),%o2
/* 0x0e9c	     */		ldx	[%l7+%o2],%i2,%gdop(__iob)
/* 0x0ea0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ea4	     */		add	%i2,256,%o0
/* 0x0ea8	 392 */		return	%i7+8	! Result =  %i0
/* 0x0eac	     */		mov	1,%o0
                       
! predecessor blocks: .L77001979

			.L77001983:
/* 0x0eb0	 623 */		add	%sp,2567,%o3
/* 0x0eb4	     */		mov	%l3,%o1
/* 0x0eb8	     */		mov	%o3,%o4
/* 0x0ebc	     */		mov	%l6,%o0
/* 0x0ec0	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0ec4	     */		add	%i1,2538,%o2
/* 0x0ec8	     */		orcc	%g0,%o0,%g0
/* 0x0ecc	     */		bne,pn	%icc,.L77001987
/* 0x0ed0	 624 */		sethi	%gdop_hix22(__iob),%i0

! Registers live out of .L77001983: 
! g2 g3 o0 o2 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001983

			.L77001985:
/* 0x0ed4	 624 */		xor	%i0,%gdop_lox10(__iob),%g4
/* 0x0ed8	     */		add	%i1,2550,%o1
/* 0x0edc	     */		ldx	[%l7+%g4],%g5,%gdop(__iob)
/* 0x0ee0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ee4	     */		add	%g5,256,%o0
/* 0x0ee8	 392 */		return	%i7+8	! Result =  %i0
/* 0x0eec	     */		mov	1,%o0
                       
! predecessor blocks: .L77001983

			.L77001987:
/* 0x0ef0	 630 */		add	%sp,2615,%o3
/* 0x0ef4	     */		mov	%l3,%o1
/* 0x0ef8	     */		mov	%o3,%o4
/* 0x0efc	     */		mov	%l6,%o0
/* 0x0f00	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0f04	     */		add	%i1,2594,%o2
/* 0x0f08	     */		orcc	%g0,%o0,%g0
/* 0x0f0c	     */		bne,pn	%icc,.L77001991
/* 0x0f10	 631 */		sethi	%gdop_hix22(__iob),%o0

! Registers live out of .L77001987: 
! g2 g3 o0 o2 sp l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001987

			.L77001989:
/* 0x0f14	 631 */		xor	%o0,%gdop_lox10(__iob),%i3
/* 0x0f18	     */		add	%i1,2606,%o1
/* 0x0f1c	     */		ldx	[%l7+%i3],%i4,%gdop(__iob)
/* 0x0f20	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0f24	     */		add	%i4,256,%o0
/* 0x0f28	 392 */		return	%i7+8	! Result =  %i0
/* 0x0f2c	     */		mov	1,%o0
                       
! predecessor blocks: .L77001987

			.L77001991:
/* 0x0f30	 639 */		add	%sp,2647,%o3
/* 0x0f34	     */		mov	%l3,%o1
/* 0x0f38	     */		mov	%o3,%o4
/* 0x0f3c	     */		mov	%l6,%o0
/* 0x0f40	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0f44	     */		add	%i1,2646,%o2
/* 0x0f48	     */		orcc	%g0,%o0,%g0
/* 0x0f4c	     */		bne,pn	%icc,.L77001995
/* 0x0f50	 640 */		add	%i1,2662,%o1

! Registers live out of .L77001991: 
! g2 g3 o0 o1 sp l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001991

			.L77001993:
/* 0x0f54	 640 */		sethi	%gdop_hix22(__iob),%l3
/* 0x0f58	     */		xor	%l3,%gdop_lox10(__iob),%i1
/* 0x0f5c	     */		ldx	[%l7+%i1],%l7,%gdop(__iob)
/* 0x0f60	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0f64	     */		add	%l7,256,%o0
/* 0x0f68	 392 */		return	%i7+8	! Result =  %i0
/* 0x0f6c	     */		mov	1,%o0
                       
! predecessor blocks: .L77001991

			.L77001995:
/* 0x0f70	 648 */		sethi	%hi(0x4000),%o3
/* 0x0f74	 649 */		sethi	%hi(0x6800),%o4
/* 0x0f78	 648 */		add	%o3,256,%g1
/* 0x0f7c	 649 */		add	%o4,256,%o5
/* 0x0f80	     */		sll	%g1,16,%l2
/* 0x0f84	 650 */		sethi	%hi(0xe000),%l5
/* 0x0f88	 647 */		mov	7,%i3
/* 0x0f8c	     */		stb	%i3,[%sp+2909]
/* 0x0f90	 649 */		or	%l2,%o5,%l4
/* 0x0f94	 650 */		add	%l5,256,%i5
/* 0x0f98	 649 */		st	%l4,[%sp+2903]
/* 0x0f9c	 650 */		sth	%i5,[%sp+2907]
/* 0x0fa0	 651 */		add	%sp,2895,%o2
/* 0x0fa4	     */		mov	%l3,%o1
/* 0x0fa8	     */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0fac	     */		mov	%l6,%o0
/* 0x0fb0	     */		orcc	%g0,%o0,%g0
/* 0x0fb4	     */		bne,pn	%icc,.L77001999
/* 0x0fb8	 652 */		sethi	%gdop_hix22(.L250),%o2

! Registers live out of .L77001995: 
! g2 g3 o2 sp l6 l7 i0 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77001995

			.L77001997:
/* 0x0fbc	 652 */		sethi	%gdop_hix22(__iob),%l6
/* 0x0fc0	     */		xor	%o2,%gdop_lox10(.L250),%o1
/* 0x0fc4	     */		xor	%l6,%gdop_lox10(__iob),%i2
/* 0x0fc8	     */		ldx	[%l7+%i2],%o7,%gdop(__iob)
/* 0x0fcc	     */		add	%o7,256,%o0
/* 0x0fd0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0fd4	     */		ldx	[%l7+%o1],%o1,%gdop(.L250)
/* 0x0fd8	 392 */		return	%i7+8	! Result =  %i0
/* 0x0fdc	     */		mov	1,%o0
                       
! predecessor blocks: .L77001995

			.L77001999:
/* 0x0fe0	 659 */		sethi	%hi(0xfc00),%i4
/* 0x0fe4	 660 */		sethi	%hi(0xf400),%i1
/* 0x0fe8	 658 */		stb	%i3,[%sp+3181]
/* 0x0fec	 661 */		sethi	%hi(0xe400),%o0
/* 0x0ff0	 659 */		add	%i4,256,%i0
/* 0x0ff4	     */		sth	%i0,[%sp+3175]
/* 0x0ff8	 660 */		add	%i1,256,%g4
/* 0x0ffc	 661 */		add	%o0,512,%g5
/* 0x1000	 660 */		sth	%g4,[%sp+3177]
/* 0x1004	 661 */		sth	%g5,[%sp+3179]
/* 0x1008	 662 */		add	%sp,3167,%o2
/* 0x100c	     */		mov	%l3,%o1
/* 0x1010	     */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x1014	     */		mov	%l6,%o0
/* 0x1018	     */		orcc	%g0,%o0,%g0
/* 0x101c	     */		bne,pn	%icc,.L77002003
/* 0x1020	 663 */		sethi	%gdop_hix22(.L253),%i5

! Registers live out of .L77001999: 
! g2 g3 o0 sp l6 l7 i0 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001999

			.L77002001:
/* 0x1024	 663 */		sethi	%gdop_hix22(__iob),%i4
/* 0x1028	     */		xor	%i5,%gdop_lox10(.L253),%o5
/* 0x102c	     */		xor	%i4,%gdop_lox10(__iob),%l2
/* 0x1030	     */		ldx	[%l7+%o5],%o1,%gdop(.L253)
/* 0x1034	     */		ldx	[%l7+%l2],%l4,%gdop(__iob)
/* 0x1038	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x103c	     */		add	%l4,256,%o0
/* 0x1040	 392 */		return	%i7+8	! Result =  %i0
/* 0x1044	     */		mov	1,%o0
                       
! predecessor blocks: .L77001999

			.L77002003:
/* 0x1048	   0 */		sethi	%hi(0x1c00),%o3
/* 0x104c	 675 */		add	%sp,2911,%o2
/* 0x1050	 671 */		stb	%i3,[%sp+2925]
/* 0x1054	 672 */		add	%o3,768,%l5
/* 0x1058	 675 */		mov	%l3,%o1
/* 0x105c	 673 */		sll	%l5,16,%o4
/* 0x1060	 675 */		mov	%l6,%o0
/* 0x1064	 673 */		or	%o4,%l5,%g1
/* 0x1068	     */		st	%g1,[%sp+2919]
/* 0x106c	 675 */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x1070	 674 */		sth	%l5,[%sp+2923]
/* 0x1074	 675 */		orcc	%g0,%o0,%g0
/* 0x1078	     */		bne,pn	%icc,.L77002007
/* 0x107c	 676 */		sethi	%gdop_hix22(__iob),%o2

! Registers live out of .L77002003: 
! g2 g3 o0 o2 sp l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002003

			.L77002005:
/* 0x1080	 676 */		xor	%o2,%gdop_lox10(__iob),%o1
/* 0x1084	     */		sethi	%gdop_hix22(.L256),%i2
/* 0x1088	     */		ldx	[%l7+%o1],%o7,%gdop(__iob)
/* 0x108c	     */		xor	%i2,%gdop_lox10(.L256),%i3
/* 0x1090	     */		add	%o7,256,%o0
/* 0x1094	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x1098	     */		ldx	[%l7+%i3],%o1,%gdop(.L256)
/* 0x109c	 392 */		return	%i7+8	! Result =  %i0
/* 0x10a0	     */		mov	1,%o0
                       
! predecessor blocks: .L77002003

			.L77002007:
/* 0x10a4	 688 */		add	%i4,768,%g4
/* 0x10a8	 684 */		stb	%i3,[%sp+3165]
/* 0x10ac	 690 */		add	%sp,3151,%o2
/* 0x10b0	 687 */		sth	%g0,[%sp+3163]
/* 0x10b4	 688 */		sll	%g4,16,%g5
/* 0x10b8	 690 */		mov	%l3,%o1
/* 0x10bc	 688 */		st	%g5,[%sp+3159]
/* 0x10c0	 690 */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x10c4	     */		mov	%l6,%o0
/* 0x10c8	     */		orcc	%g0,%o0,%g0
/* 0x10cc	     */		bne,pn	%icc,.L77002011
/* 0x10d0	 691 */		sethi	%gdop_hix22(.L259),%i1

! Registers live out of .L77002007: 
! g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002007

			.L77002009:
/* 0x10d4	 691 */		sethi	%gdop_hix22(__iob),%l6
/* 0x10d8	     */		xor	%i1,%gdop_lox10(.L259),%l3
/* 0x10dc	     */		xor	%l6,%gdop_lox10(__iob),%o0
/* 0x10e0	     */		ldx	[%l7+%l3],%o1,%gdop(.L259)
/* 0x10e4	     */		ldx	[%l7+%o0],%i0,%gdop(__iob)
/* 0x10e8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x10ec	     */		add	%i0,256,%o0
/* 0x10f0	 392 */		return	%i7+8	! Result =  %i0
/* 0x10f4	     */		mov	1,%o0
                       
! predecessor blocks: .L77002007

			.L77002011:
/* 0x10f8	 692 */		ldx	[%sp+2703],%l4
/* 0x10fc	   0 */		add	%sp,2583,%l3
/* 0x1100	 708 */		mov	12,%i1
/* 0x1104	 696 */		ldx	[%sp+2583],%o2
/* 0x1108	     */		ldx	[%sp+2759],%o1
/* 0x110c	 716 */		mov	320,%i3
/* 0x1110	 696 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1114	     */		mov	%l6,%o0
/* 0x1118	 697 */		ldx	[%sp+2759],%o2
/* 0x111c	     */		ldx	[%sp+2767],%o1
/* 0x1120	     */		mov	5,%o4
/* 0x1124	     */		mov	5,%o3
/* 0x1128	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x112c	     */		mov	%l6,%o0
/* 0x1130	 698 */		ldx	[%sp+2759],%o2
/* 0x1134	     */		ldx	[%sp+2767],%o1
/* 0x1138	     */		mov	1039,%o4
/* 0x113c	     */		mov	5,%o3
/* 0x1140	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x1144	     */		mov	%l6,%o0
/* 0x1148	 699 */		ldx	[%sp+2759],%o2
/* 0x114c	     */		ldx	[%sp+2767],%o1
/* 0x1150	     */		mov	5,%o4
/* 0x1154	     */		mov	1039,%o3
/* 0x1158	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x115c	     */		mov	%l6,%o0
/* 0x1160	 700 */		ldx	[%sp+2759],%o2
/* 0x1164	     */		ldx	[%sp+2767],%o1
/* 0x1168	     */		mov	1039,%o4
/* 0x116c	     */		mov	1039,%o3
/* 0x1170	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x1174	     */		mov	%l6,%o0
/* 0x1178	 704 */		ldx	[%sp+2735],%o1
/* 0x117c	     */		mov	0,%o5
/* 0x1180	     */		mov	1,%o4
/* 0x1184	     */		mov	0,%o3
/* 0x1188	     */		mov	1,%o2
/* 0x118c	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x1190	     */		mov	%l6,%o0
/* 0x1194	 707 */		ldx	[%l3],%o2
/* 0x1198	     */		ldx	[%sp+2735],%o1
/* 0x119c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x11a0	     */		mov	%l6,%o0
/* 0x11a4	 708 */		ldx	[%sp+2735],%o2
/* 0x11a8	     */		ldx	[%sp+2743],%o1
/* 0x11ac	     */		mov	176,%o5
/* 0x11b0	     */		mov	10,%o4
/* 0x11b4	     */		stx	%i1,[%sp+2223]
/* 0x11b8	     */		mov	215,%o3
/* 0x11bc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x11c0	     */		mov	%l6,%o0
/* 0x11c4	 711 */		ldx	[%l6+232],%o2
/* 0x11c8	     */		ldx	[%sp+2727],%g4
/* 0x11cc	     */		ldx	[%sp+2735],%o1
/* 0x11d0	     */		mov	%l6,%o0
/* 0x11d4	 780 */		mov	20,%l3
/* 0x11d8	 711 */		add	%g4,%o2,%g5
/* 0x11dc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x11e0	     */		ldx	[%g5+88],%o2
/* 0x11e4	 712 */		ldx	[%sp+2743],%o1
/* 0x11e8	     */		mov	176,%o5
/* 0x11ec	     */		mov	60,%o4
/* 0x11f0	     */		mov	215,%o3
/* 0x11f4	     */		mov	%l6,%o0
/* 0x11f8	     */		stx	%i1,[%sp+2223]
/* 0x11fc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1200	     */		ldx	[%sp+2735],%o2
/* 0x1204	 715 */		ldx	[%sp+2735],%o1
/* 0x1208	     */		ldx	[%sp+2975],%o2
/* 0x120c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1210	     */		mov	%l6,%o0
/* 0x1214	 716 */		ldx	[%sp+2743],%o1
/* 0x1218	     */		ldx	[%sp+2735],%o2
/* 0x121c	     */		mov	390,%o5
/* 0x1220	     */		mov	5,%o4
/* 0x1224	     */		stx	%i3,[%sp+2223]
/* 0x1228	     */		mov	5,%o3
/* 0x122c	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1230	     */		mov	%l6,%o0
/* 0x1234	 717 */		ldx	[%sp+2567],%o2
/* 0x1238	     */		ldx	[%sp+2735],%o1
/* 0x123c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1240	     */		mov	%l6,%o0
/* 0x1244	 727 */		ldx	[%sp+2735],%o2
/* 0x1248	     */		mov	202,%o5
/* 0x124c	     */		mov	10,%o4
/* 0x1250	     */		mov	10,%o3
/* 0x1254	     */		mov	202,%o1
/* 0x1258	     */		stx	%o1,[%sp+2223]
/* 0x125c	     */		ldx	[%sp+2743],%o1
/* 0x1260	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1264	     */		mov	%l6,%o0
/* 0x1268	 728 */		ldx	[%sp+2519],%o2
/* 0x126c	     */		ldx	[%sp+2735],%o1
/* 0x1270	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1274	     */		mov	%l6,%o0
/* 0x1278	 731 */		ldx	[%sp+2751],%o1
/* 0x127c	     */		ldx	[%sp+2975],%o2
/* 0x1280	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1284	     */		mov	%l6,%o0
/* 0x1288	 734 */		ldx	[%sp+2751],%o1
/* 0x128c	     */		mov	0,%o5
/* 0x1290	     */		mov	1,%o4
/* 0x1294	     */		mov	0,%o3
/* 0x1298	     */		mov	1,%o2
/* 0x129c	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x12a0	     */		mov	%l6,%o0
/* 0x12a4	 736 */		ldx	[%sp+2751],%o2
/* 0x12a8	     */		ldx	[%sp+2775],%o1
/* 0x12ac	     */		mov	430,%o5
/* 0x12b0	     */		mov	5,%o4
/* 0x12b4	     */		stx	%i3,[%sp+2223]
/* 0x12b8	     */		mov	5,%o3
/* 0x12bc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x12c0	     */		mov	%l6,%o0
/* 0x12c4	   0 */		sethi	%gdop_hix22(.L260),%o7
/* 0x12c8	   0 */		xor	%o7,%gdop_lox10(.L260),%i4
/* 0x12cc	 756 */		mov	1024,%o2
/* 0x12d0	   0 */		ldx	[%l7+%i4],%l2,%gdop(.L260)
/* 0x12d4	 756 */		mov	1024,%o1
/* 0x12d8	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x12dc	     */		mov	%l2,%o0
/* 0x12e0	 757 */		call	printf	!params=  %o0	!result= 
/* 0x12e4	     */		add	%l2,48,%o0
/* 0x12e8	 765 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o3
/* 0x12ec	     */		ldd	[%sp+2807],%f32
/* 0x12f0	 766 */		ldd	[%sp+2799],%f34
/* 0x12f4	 765 */		xor	%o3,%gdop_lox10(.L___const_seg_900000101),%o4
/* 0x12f8	 766 */		add	%l2,96,%o0
/* 0x12fc	 765 */		ldx	[%l7+%o4],%g1,%gdop(.L___const_seg_900000101)
/* 0x1300	     */		ld	[%g1+48],%f8
/* 0x1304	     */		fitod	%f8,%f36
/* 0x1308	     */		fdivd	%f32,%f36,%f38
/* 0x130c	 766 */		fdivd	%f34,%f36,%f32
/* 0x1310	     */		std	%f32,[%sp+3127]
/* 0x1314	     */		std	%f38,[%fp+2015]
/* 0x1318	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x131c	     */		ldx	[%sp+3127],%o1
/* 0x1320	 767 */		add	%l2,128,%o0
/* 0x1324	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x1328	     */		ldx	[%fp+2015],%o1
/* 0x132c	 771 */		mov	0,%o5
/* 0x1330	     */		mov	1,%o4
/* 0x1334	     */		mov	0,%o3
/* 0x1338	     */		mov	1,%o2
/* 0x133c	     */		mov	%l6,%o0
/* 0x1340	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x1344	     */		ldx	[%sp+2759],%o1
/* 0x1348	 773 */		ldx	[%l6+232],%i5
/* 0x134c	     */		ldx	[%sp+2727],%l5
/* 0x1350	     */		mov	%l6,%o0
/* 0x1354	     */		ldx	[%sp+2759],%o1
/* 0x1358	     */		add	%l5,%i5,%o5
/* 0x135c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1360	     */		ldx	[%o5+88],%o2
/* 0x1364	 774 */		ldx	[%sp+2735],%o1
/* 0x1368	     */		ldx	[%sp+2535],%o2
/* 0x136c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1370	     */		mov	%l6,%o0
/* 0x1374	 775 */		ldx	[%sp+2735],%o1
/* 0x1378	     */		mov	%l6,%o0
/* 0x137c	     */		call	XSetFont	!params=  %o0 %o1 %o2	!result= 
/* 0x1380	     */		mov	%i2,%o2
/* 0x1384	 776 */		ldx	[%sp+2751],%o1
/* 0x1388	     */		mov	%i2,%o2
/* 0x138c	     */		call	XSetFont	!params=  %o0 %o1 %o2	!result= 
/* 0x1390	     */		mov	%l6,%o0
/* 0x1394	 779 */		ldx	[%sp+2567],%o2
/* 0x1398	     */		ldx	[%sp+2735],%o1
/* 0x139c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x13a0	     */		mov	%l6,%o0
/* 0x13a4	 780 */		mov	72,%o5
/* 0x13a8	     */		mov	192,%o4
/* 0x13ac	     */		ldx	[%sp+2735],%o2
/* 0x13b0	     */		mov	320,%o3
/* 0x13b4	     */		ldx	[%sp+2743],%o1
/* 0x13b8	     */		stx	%l3,[%sp+2223]
/* 0x13bc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x13c0	     */		mov	%l6,%o0
/* 0x13c4	 781 */		add	%l2,154,%o1
/* 0x13c8	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x13cc	     */		mov	%l4,%o0
/* 0x13d0	 782 */		ldub	[%l4],%o5

! Registers live out of .L77002011: 
! g2 g3 o0 o5 sp l4 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002011 .L900000322

			.L900001147:
/* 0x13d4	 782 */		brz,pn	%o5,.L900000323
/* 0x13d8	     */		add	%l4,1,%l4

! Registers live out of .L900001147: 
! g2 g3 o0 o5 sp l4 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001147

			.L900000322:
/* 0x13dc	 782 */		ldub	[%l4],%i4
/* 0x13e0	     */		add	%l4,1,%l4
/* 0x13e4	     */		brnz,a,pt	%i4,.L900001147
/* 0x13e8	     */		ldub	[%l4],%o5

! Registers live out of .L900000322: 
! g2 g3 o0 o5 sp l4 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000322 .L900001147

			.L900000323:
/* 0x13ec	 782 */		ldx	[%sp+2703],%o5
/* 0x13f0	     */		sub	%l4,1,%l5
/* 0x13f4	     */		ldx	[%sp+2735],%o2
/* 0x13f8	     */		mov	207,%o4
/* 0x13fc	     */		ldx	[%sp+2743],%o1
/* 0x1400	     */		mov	332,%o3
/* 0x1404	     */		sub	%l5,%o5,%g5
/* 0x1408	     */		sra	%g5,0,%i2
/* 0x140c	     */		stx	%i2,[%sp+2223]
/* 0x1410	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1414	     */		mov	%l6,%o0
/* 0x1418	   0 */		sethi	%gdop_hix22(.L265),%g4
/* 0x141c	   0 */		xor	%g4,%gdop_lox10(.L265),%o0
/* 0x1420	   0 */		ldx	[%l7+%o0],%l3,%gdop(.L265)
/* 0x1424	 785 */		call	getenv	!params=  %o0	!result=  %o0
/* 0x1428	     */		mov	%l3,%o0
/* 0x142c	 787 */		brnz,pn	%o0,.L77002015
/* 0x1430	 785 */		stx	%o0,[%sp+2247]

! Registers live out of .L900000323: 
! g2 g3 o0 o1 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000323

			.L77002013:
/* 0x1434	 788 */		mov	-1,%i0
/* 0x1438	     */		st	%i0,[%sp+2295]
/* 0x143c	     */		ba	.L900001146
/* 0x1440	 795 */		ldx	[%sp+2703],%o0

! Registers live out of .L77002013: 
! g2 g3 o0 o1 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000323

			.L77002015:
/* 0x1444	 789 */		ldub	[%o0],%i3
/* 0x1448	     */		mov	%o0,%o5

! Registers live out of .L77002015: 
! g2 g3 o0 o1 o5 sp l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002015 .L900000318

			.L900001145:
/* 0x144c	 789 */		brz,pn	%i3,.L900000319
/* 0x1450	     */		add	%o5,1,%o5

! Registers live out of .L900001145: 
! g2 g3 o0 o1 o5 sp l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001145

			.L900000318:
/* 0x1454	 789 */		ldub	[%o5],%o1
/* 0x1458	     */		add	%o5,1,%o5
/* 0x145c	     */		brnz,a,pt	%o1,.L900001145
/* 0x1460	     */		ldub	[%o5],%i3

! Registers live out of .L900000318: 
! g2 g3 o0 o1 o5 sp l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000318 .L900001145

			.L900000319:
/* 0x1464	 789 */		sub	%o5,1,%o3
/* 0x1468	     */		sub	%o3,%o0,%o2
/* 0x146c	     */		cmp	%o2,256
/* 0x1470	     */		bgu,pn	%xcc,.L77002017
/* 0x1474	 804 */		mov	%l6,%o0

! Registers live out of .L900000319: 
! g2 g3 o0 o1 o2 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000319

			.L77002025:
/* 0x1478	 804 */		ldx	[%sp+2735],%o1
/* 0x147c	 106 */		st	%g0,[%sp+2295]
/* 0x1480	 805 */		mov	20,%i2
/* 0x1484	 804 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1488	     */		ldx	[%sp+2615],%o2
/* 0x148c	 805 */		ldx	[%sp+2743],%o1
/* 0x1490	     */		mov	72,%o5
/* 0x1494	     */		mov	162,%o4
/* 0x1498	     */		mov	320,%o3
/* 0x149c	     */		mov	%l6,%o0
/* 0x14a0	     */		stx	%i2,[%sp+2223]
/* 0x14a4	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x14a8	     */		ldx	[%sp+2735],%o2
/* 0x14ac	 806 */		add	%l3,20,%o1
/* 0x14b0	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x14b4	     */		ldx	[%sp+2703],%o0
/* 0x14b8	 807 */		ldx	[%sp+2703],%l5
/* 0x14bc	     */		ldub	[%l5],%g5

! Registers live out of .L77002025: 
! g2 g3 g5 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002025 .L900000306

			.L900001144:
/* 0x14c0	 807 */		brz,pn	%g5,.L900000307
/* 0x14c4	     */		add	%l5,1,%l5

! Registers live out of .L900001144: 
! g2 g3 g5 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001144

			.L900000306:
/* 0x14c8	 807 */		ldub	[%l5],%i4
/* 0x14cc	     */		add	%l5,1,%l5
/* 0x14d0	     */		brnz,a,pt	%i4,.L900001144
/* 0x14d4	     */		ldub	[%l5],%g5

! Registers live out of .L900000306: 
! g2 g3 g5 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000306 .L900001144

			.L900000307:
/* 0x14d8	 807 */		ldx	[%sp+2703],%o5
/* 0x14dc	     */		sub	%l5,1,%i2
/* 0x14e0	     */		mov	177,%o4
/* 0x14e4	     */		ldx	[%sp+2735],%o2
/* 0x14e8	     */		mov	332,%o3
/* 0x14ec	     */		ldx	[%sp+2743],%o1
/* 0x14f0	     */		sub	%i2,%o5,%g4
/* 0x14f4	     */		sra	%g4,0,%o0
/* 0x14f8	     */		stx	%o0,[%sp+2223]
/* 0x14fc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1500	     */		mov	%l6,%o0
/* 0x1504	     */		ldd	[%sp+2879],%f44
/* 0x1508	     */		ba	.L900001143
/* 0x150c	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o0

! Registers live out of .L900000307: 
! g2 g3 o0 o5 sp l6 l7 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000319

			.L77002017:
/* 0x1510	 795 */		ldx	[%sp+2703],%o0
/* 0x1514	 790 */		mov	-1,%l2
/* 0x1518	     */		st	%l2,[%sp+2295]

! Registers live out of .L77002017: 
! g2 g3 o0 o1 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002013 .L77002017

			.L900001146:
/* 0x151c	 795 */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x1520	     */		add	%l3,10,%o1
/* 0x1524	 796 */		ldx	[%sp+2519],%o2
/* 0x1528	     */		ldx	[%sp+2735],%o1
/* 0x152c	 797 */		mov	20,%i5
/* 0x1530	 796 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1534	     */		mov	%l6,%o0
/* 0x1538	 797 */		ldx	[%sp+2735],%o2
/* 0x153c	     */		ldx	[%sp+2743],%o1
/* 0x1540	     */		mov	72,%o5
/* 0x1544	     */		mov	162,%o4
/* 0x1548	     */		stx	%i5,[%sp+2223]
/* 0x154c	     */		mov	320,%o3
/* 0x1550	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1554	     */		mov	%l6,%o0
/* 0x1558	 798 */		ldx	[%sp+2703],%i2
/* 0x155c	     */		ldub	[%i2],%g1

! Registers live out of .L900001146: 
! g1 g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000314 .L900001146

			.L900001142:
/* 0x1560	 798 */		brz,pn	%g1,.L900000315
/* 0x1564	     */		add	%i2,1,%i2

! Registers live out of .L900001142: 
! g1 g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001142

			.L900000314:
/* 0x1568	 798 */		ldub	[%i2],%l4
/* 0x156c	     */		add	%i2,1,%i2
/* 0x1570	     */		brnz,a,pt	%l4,.L900001142
/* 0x1574	     */		ldub	[%i2],%g1

! Registers live out of .L900000314: 
! g1 g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000314 .L900001142

			.L900000315:
/* 0x1578	 798 */		ldx	[%sp+2703],%o5
/* 0x157c	     */		sub	%i2,1,%o4
/* 0x1580	     */		mov	220,%o3
/* 0x1584	     */		ldx	[%sp+2735],%o2
/* 0x1588	     */		ldx	[%sp+2743],%o1
/* 0x158c	     */		sub	%o4,%o5,%o7
/* 0x1590	     */		mov	%o5,%i4
/* 0x1594	     */		sra	%o7,0,%g1
/* 0x1598	     */		mov	178,%o4
/* 0x159c	     */		stx	%g1,[%sp+2223]
/* 0x15a0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x15a4	     */		mov	%l6,%o0
/* 0x15a8	 799 */		add	%l3,20,%o1
/* 0x15ac	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x15b0	     */		mov	%i4,%o0
/* 0x15b4	 800 */		ldub	[%i4],%g4
/* 0x15b8	     */		mov	%i4,%g5

! Registers live out of .L900000315: 
! g2 g3 g4 g5 o0 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000310 .L900000315

			.L900001141:
/* 0x15bc	 800 */		brz,pn	%g4,.L900000311
/* 0x15c0	     */		add	%g5,1,%g5

! Registers live out of .L900001141: 
! g2 g3 g4 g5 o0 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001141

			.L900000310:
/* 0x15c4	 800 */		ldub	[%g5],%l5
/* 0x15c8	     */		add	%g5,1,%g5
/* 0x15cc	     */		brnz,a,pt	%l5,.L900001141
/* 0x15d0	     */		ldub	[%g5],%g4

! Registers live out of .L900000310: 
! g2 g3 g4 g5 o0 sp l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000310 .L900001141

			.L900000311:
/* 0x15d4	 800 */		sub	%g5,1,%l2
/* 0x15d8	     */		mov	177,%o4
/* 0x15dc	     */		ldx	[%sp+2703],%o5
/* 0x15e0	     */		ldx	[%sp+2735],%o2
/* 0x15e4	     */		mov	332,%o3
/* 0x15e8	 801 */		mov	182,%i3
/* 0x15ec	 800 */		ldx	[%sp+2743],%o1
/* 0x15f0	     */		sub	%l2,%o5,%i5
/* 0x15f4	     */		sra	%i5,0,%i0
/* 0x15f8	     */		stx	%i0,[%sp+2223]
/* 0x15fc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1600	     */		mov	%l6,%o0
/* 0x1604	 801 */		ldx	[%sp+2735],%o2
/* 0x1608	     */		mov	392,%o5
/* 0x160c	     */		ldx	[%sp+2743],%o1
/* 0x1610	     */		mov	162,%o4
/* 0x1614	     */		mov	320,%o3
/* 0x1618	     */		stx	%i3,[%sp+2223]
/* 0x161c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1620	     */		mov	%l6,%o0
/* 0x1624	 802 */		mov	162,%o5
/* 0x1628	     */		stx	%o5,[%sp+2223]
/* 0x162c	     */		ldx	[%sp+2735],%o2
/* 0x1630	     */		mov	392,%o5
/* 0x1634	     */		ldx	[%sp+2743],%o1
/* 0x1638	     */		mov	182,%o4
/* 0x163c	     */		mov	320,%o3
/* 0x1640	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1644	     */		mov	%l6,%o0
/* 0x1648	     */		ldd	[%sp+2879],%f44
/* 0x164c	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o0

! Registers live out of .L900000311: 
! g2 g3 o0 o5 sp l6 l7 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000307 .L900000311

			.L900001143:
/* 0x1650	   0 */		xor	%o0,%gdop_lox10(.L___const_seg_900000101),%g1
/* 0x1654	 838 */		ldd	[%sp+2799],%f38
/* 0x1658	 839 */		ldd	[%sp+2807],%f40
/* 0x165c	 842 */		mov	74,%i5
/* 0x1660	   0 */		ldx	[%l7+%g1],%i0,%gdop(.L___const_seg_900000101)
/* 0x1664	 843 */		sra	%i5,0,%o3
/* 0x1668	 838 */		ldd	[%i0+16],%f36
/* 0x166c	     */		ldd	[%i0+176],%f32
/* 0x1670	   0 */		add	%i0,16,%l5
/* 0x1674	 838 */		ldd	[%i0+184],%f34
/* 0x1678	     */		ldd	[%i0+136],%f42
/* 0x167c	     */		fmuld	%f36,%f32,%f32
/* 0x1680	     */		fmuld	%f36,%f34,%f36
/* 0x1684	     */		fdivd	%f38,%f32,%f34
/* 0x1688	 839 */		fdivd	%f40,%f32,%f32
/* 0x168c	 838 */		fdivd	%f34,%f36,%f34
/* 0x1690	 839 */		fdivd	%f32,%f36,%f36
/* 0x1694	 838 */		fmuld	%f34,%f42,%f32
/* 0x1698	 839 */		fmuld	%f36,%f42,%f32

! Registers live out of .L900001143: 
! g2 g3 o3 o5 sp l5 l6 l7 i1 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001140 .L900001143

			.L900001140:
/* 0x169c	 843 */		mov	8,%o4
/* 0x16a0	     */		mov	%l6,%o0
/* 0x16a4	     */		ldx	[%sp+2759],%o2
/* 0x16a8	     */		ldx	[%sp+2767],%o1
/* 0x16ac	     */		stx	%i1,[%sp+2223]
/* 0x16b0	     */		std	%f44,[%sp+2879]
/* 0x16b4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x16b8	     */		mov	%o3,%o5
/* 0x16bc	 844 */		sra	%i5,0,%o5
/* 0x16c0	     */		sra	%i5,0,%o3
/* 0x16c4	     */		ldx	[%sp+2759],%o2
/* 0x16c8	     */		ldx	[%sp+2767],%o1
/* 0x16cc	     */		mov	1032,%o7
/* 0x16d0	 842 */		add	%i5,64,%i5
/* 0x16d4	 844 */		stx	%o7,[%sp+2223]
/* 0x16d8	     */		mov	1036,%o4
/* 0x16dc	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x16e0	     */		mov	%l6,%o0
/* 0x16e4	 842 */		ldd	[%sp+2879],%f44
/* 0x16e8	     */		cmp	%i5,1033
/* 0x16ec	     */		ble,pt	%icc,.L900001140
/* 0x16f0	 843 */		sra	%i5,0,%o3

! Registers live out of .L900001140: 
! g2 g3 o0 o3 o5 sp l5 l6 l7 i1 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001140

			.L77002685:
/* 0x16f4	 850 */		mov	74,%l4
/* 0x16f8	 846 */		call	XFlush	!params=  %o0	!result= 
/* 0x16fc	     */		mov	%l6,%o0
/* 0x1700	 850 */		ldd	[%sp+2879],%f44
/* 0x1704	 851 */		sra	%l4,0,%o4

! Registers live out of .L77002685: 
! g2 g3 o0 o4 sp l4 l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002685 .L900001139

			.L900001139:
/* 0x1708	 851 */		mov	12,%o5
/* 0x170c	     */		mov	8,%o3
/* 0x1710	     */		ldx	[%sp+2759],%o2
/* 0x1714	     */		ldx	[%sp+2767],%o1
/* 0x1718	     */		stx	%o4,[%sp+2223]
/* 0x171c	     */		std	%f44,[%sp+2879]
/* 0x1720	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1724	     */		mov	%l6,%o0
/* 0x1728	 852 */		sra	%l4,0,%o3
/* 0x172c	     */		sra	%l4,0,%o4
/* 0x1730	     */		stx	%o3,[%sp+2223]
/* 0x1734	     */		ldx	[%sp+2759],%o2
/* 0x1738	     */		ldx	[%sp+2767],%o1
/* 0x173c	 850 */		add	%l4,64,%l4
/* 0x1740	 852 */		mov	1032,%o5
/* 0x1744	     */		mov	1036,%o3
/* 0x1748	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x174c	     */		mov	%l6,%o0
/* 0x1750	 850 */		ldd	[%sp+2879],%f44
/* 0x1754	     */		cmp	%l4,1033
/* 0x1758	     */		ble,pt	%icc,.L900001139
/* 0x175c	 851 */		sra	%l4,0,%o4

! Registers live out of .L900001139: 
! g2 g3 o0 o4 sp l4 l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001139

			.L77002687:
/* 0x1760	 860 */		mov	74,%l3
/* 0x1764	 854 */		call	XFlush	!params=  %o0	!result= 
/* 0x1768	     */		mov	%l6,%o0
/* 0x176c	 857 */		ldx	[%sp+2759],%o1
/* 0x1770	     */		ldx	[%sp+2911],%o2
/* 0x1774	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1778	     */		mov	%l6,%o0
/* 0x177c	 861 */		sra	%l3,0,%o3
/* 0x1780	 860 */		ldd	[%sp+2879],%f44

! Registers live out of .L77002687: 
! g2 g3 o3 o5 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002687 .L900001138

			.L900001138:
/* 0x1784	 861 */		mov	1031,%o1
/* 0x1788	     */		ldx	[%sp+2759],%o2
/* 0x178c	 860 */		add	%l3,64,%l3
/* 0x1790	 861 */		stx	%o1,[%sp+2223]
/* 0x1794	     */		mov	13,%o4
/* 0x1798	     */		mov	%l6,%o0
/* 0x179c	     */		ldx	[%sp+2767],%o1
/* 0x17a0	     */		std	%f44,[%sp+2879]
/* 0x17a4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x17a8	     */		mov	%o3,%o5
/* 0x17ac	 860 */		ldd	[%sp+2879],%f44
/* 0x17b0	     */		cmp	%l3,1033
/* 0x17b4	     */		ble,pt	%icc,.L900001138
/* 0x17b8	 861 */		sra	%l3,0,%o3

! Registers live out of .L900001138: 
! g2 g3 o0 o3 o5 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001138

			.L77002051:
/* 0x17bc	 865 */		mov	74,%i5
/* 0x17c0	 866 */		sra	%i5,0,%o4

! Registers live out of .L77002051: 
! g2 g3 o0 o4 sp l5 l6 l7 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002051 .L900001137

			.L900001137:
/* 0x17c4	 866 */		ldx	[%sp+2759],%o2
/* 0x17c8	 865 */		add	%i5,64,%i5
/* 0x17cc	 866 */		mov	1031,%o5
/* 0x17d0	     */		ldx	[%sp+2767],%o1
/* 0x17d4	     */		mov	13,%o3
/* 0x17d8	     */		stx	%o4,[%sp+2223]
/* 0x17dc	     */		std	%f44,[%sp+2879]
/* 0x17e0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x17e4	     */		mov	%l6,%o0
/* 0x17e8	 865 */		ldd	[%sp+2879],%f44
/* 0x17ec	     */		cmp	%i5,1033
/* 0x17f0	     */		ble,pt	%icc,.L900001137
/* 0x17f4	 866 */		sra	%i5,0,%o4

! Registers live out of .L900001137: 
! g2 g3 o0 o4 sp l5 l6 l7 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001137

			.L77002059:
/* 0x17f8	 870 */		ldx	[%sp+2535],%o2
/* 0x17fc	 874 */		mov	11,%i4
/* 0x1800	 875 */		mov	1034,%l2
/* 0x1804	 870 */		ldx	[%sp+2751],%o1
/* 0x1808	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x180c	     */		mov	%l6,%o0
/* 0x1810	 873 */		ldx	[%sp+2759],%o1
/* 0x1814	     */		ldx	[%sp+2895],%o2
/* 0x1818	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x181c	     */		mov	%l6,%o0
/* 0x1820	 874 */		mov	1033,%o5
/* 0x1824	     */		ldx	[%sp+2759],%o2
/* 0x1828	     */		mov	11,%o4
/* 0x182c	     */		mov	11,%o3
/* 0x1830	     */		ldx	[%sp+2767],%o1
/* 0x1834	     */		stx	%i4,[%sp+2223]
/* 0x1838	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x183c	     */		mov	%l6,%o0
/* 0x1840	 875 */		mov	1033,%o5
/* 0x1844	     */		ldx	[%sp+2759],%o2
/* 0x1848	     */		mov	11,%o4
/* 0x184c	     */		mov	1033,%o3
/* 0x1850	     */		ldx	[%sp+2767],%o1
/* 0x1854	     */		stx	%l2,[%sp+2223]
/* 0x1858	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x185c	     */		mov	%l6,%o0
/* 0x1860	 876 */		mov	10,%o5
/* 0x1864	     */		ldx	[%sp+2759],%o2
/* 0x1868	     */		ldx	[%sp+2767],%o1
/* 0x186c	     */		mov	1034,%o4
/* 0x1870	     */		mov	1034,%o3
/* 0x1874	     */		stx	%l2,[%sp+2223]
/* 0x1878	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x187c	     */		mov	%l6,%o0
/* 0x1880	 877 */		ldx	[%sp+2759],%o2
/* 0x1884	     */		ldx	[%sp+2767],%o1
/* 0x1888	     */		mov	10,%o5
/* 0x188c	     */		mov	1034,%o4
/* 0x1890	     */		stx	%i4,[%sp+2223]
/* 0x1894	     */		mov	10,%o3
/* 0x1898	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x189c	     */		mov	%l6,%o0
/* 0x18a0	 879 */		call	XFlush	!params=  %o0	!result= 
/* 0x18a4	     */		mov	%l6,%o0
/* 0x18a8	 886 */		ldx	[%sp+2767],%o1
/* 0x18ac	     */		mov	1,%o5
/* 0x18b0	     */		mov	1,%o4
/* 0x18b4	     */		mov	4,%o3
/* 0x18b8	     */		stx	%g0,[%sp+2223]
/* 0x18bc	     */		stx	%g0,[%sp+2231]
/* 0x18c0	     */		mov	0,%o2
/* 0x18c4	     */		stx	%g0,[%sp+2239]
/* 0x18c8	     */		call	XGrabPointer	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223 %sp+2231 %sp+2239	!result= 
/* 0x18cc	     */		mov	%l6,%o0
/* 0x18d0	 888 */		ldx	[%sp+2767],%o1
/* 0x18d4	     */		mov	4,%o2
/* 0x18d8	     */		call	XSelectInput	!params=  %o0 %o1 %o2	!result= 
/* 0x18dc	     */		mov	%l6,%o0
/* 0x18e0	 891 */		add	%sp,2631,%o1
/* 0x18e4	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x18e8	     */		mov	3,%o0
/* 0x18ec	 892 */		add	%sp,2599,%o1
/* 0x18f0	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x18f4	     */		mov	3,%o0
/* 0x18f8	 893 */		ldx	[%sp+2599],%o2
/* 0x18fc	     */		ldx	[%sp+2631],%o0
/* 0x1900	     */		ldx	[%sp+2639],%o1
/* 0x1904	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x1908	     */		ldx	[%sp+2607],%o3
/* 0x190c	     */		mov	%o0,%o2
/* 0x1910	 897 */		sethi	%gdop_hix22(.L296),%o3
/* 0x1914	     */		xor	%o3,%gdop_lox10(.L296),%o4
/* 0x1918	     */		ldx	[%l7+%o4],%o1,%gdop(.L296)
/* 0x191c	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1920	     */		ldx	[%sp+2703],%o0
/* 0x1924	 898 */		ldx	[%sp+2703],%g1
/* 0x1928	     */		ldub	[%g1],%o7

! Registers live out of .L77002059: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002059 .L900000302

			.L900001136:
/* 0x192c	 898 */		brz,pn	%o7,.L900000303
/* 0x1930	     */		add	%g1,1,%g1

! Registers live out of .L900001136: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900001136

			.L900000302:
/* 0x1934	 898 */		ldub	[%g1],%l3
/* 0x1938	     */		add	%g1,1,%g1
/* 0x193c	     */		brnz,a,pt	%l3,.L900001136
/* 0x1940	     */		ldub	[%g1],%o7

! Registers live out of .L900000302: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000302 .L900001136

			.L900000303:
/* 0x1944	 898 */		ldx	[%sp+2703],%o5
/* 0x1948	     */		sub	%g1,1,%i1
/* 0x194c	     */		ldx	[%sp+2775],%o1
/* 0x1950	     */		mov	20,%o4
/* 0x1954	     */		sub	%i1,%o5,%o3
/* 0x1958	     */		sra	%o3,0,%o2
/* 0x195c	     */		stx	%o2,[%sp+2223]
/* 0x1960	     */		ldx	[%sp+2751],%o2
/* 0x1964	     */		mov	10,%o3
/* 0x1968	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x196c	     */		mov	%l6,%o0
/* 0x1970	 912 */		call	___errno	!params= 	!result=  %o0
/* 0x1974	     */		nop
/* 0x1978	 914 */		ld	[%sp+2283],%o1
/* 0x197c	     */		ldd	[%sp+2879],%f44
/* 0x1980	     */		cmp	%o1,0
/* 0x1984	     */		bg,pn	%icc,.L77002783
/* 0x1988	 912 */		st	%g0,[%o0]

! Registers live out of .L900000303: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000303

			.L77003010:
/* 0x198c	 129 */		st	%g0,[%sp+2291]
/* 0x1990	     */		ba	.L900001135
/* 0x1994	  99 */		stx	%g0,[%sp+3135]

! Registers live out of .L77003010: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000303

			.L77002783:
/* 0x1998	 914 */		sethi	%hi(0x400c00),%i0
/* 0x199c	     */		mov	0,%i1
/* 0x19a0	 930 */		std	%f44,[%sp+2879]
/* 0x19a4	 914 */		add	%i0,719,%i0
/* 0x19a8	     */		add	%i0,%sp,%i0

! 1475		      !                        button = Button2;
! 1477		      !                        /* trigger a recalc and thus flush vbox_flag to zero */
! 1478		      !                        memset( &vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_I
! 1478		      >MAG_COUNT)*sizeof(int));
! 1480		      !                        real_translate = x_prime;
! 1481		      !                        imag_translate = y_prime;
! 1482		      !                        fprintf(stderr,"INFO : c = %-+16.12e, %-+16.12e  ", x_pri
! 1482		      >me, y_prime);
! 1484		      !                        /* flush away all the data we computed before */
! 1485		      !                        for ( vbox_r=0; vbox_r<VBOX_REAL_COUNT; vbox_r++ ) {
! 1486		      !                            for ( vbox_j=0; vbox_j<VBOX_IMAG_COUNT; vbox_j++ ) {
! 1487		      !                                vbox_flag[vbox_r][vbox_j] = 0;
! 1488		      !                            }
! 1489		      !                        }
! 1491		      !                        goto replot;
! 1493		      !                    }
! 1495		      !                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 885 )
! 1496		      !                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 903 )
! 1497		      !                             && ( ( x_prime + 8.0 ) > EPSILON )
! 1498		      !                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {
! 1500		      !                    /* The above is a janky EPSILON check which verifies
! 1501		      !                     * the mouse location is inside the DUMPER button
! 1502		      !                     * window area.
! 1503		      !                     *
! 1504		      !                     * Also verify x_prime and y_prime are NOT the initial
! 1505		      !                     *     impossible values ( -8.0, -8.0 )
! 1506		      !                     */
! 1508		      !                    if ( dumper_flag > -1 ) {
! 1510		      !                        if ( dumper_flag == 0 ) {
! 1511		      !                            /* we need that button to be double clicked so
! 1512		      !                             * at this time we flip the button to cornflowerblue 
! 1512		      >*/
! 1513		      !                            XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1514		      !                            XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
! 1515		      !                            sprintf(buf,">DUMPER<");
! 1516		      !                            XDrawImageString( dsp, win2, gc2, 324, 177, buf, (int
! 1516		      >)strlen(buf));
! 1517		      !                            dumper_flag = 1;
! 1518		      !                            fprintf(stderr,"INFO : dumper_flag = 1\n");
! 1519		      !    
! 1520		      !                        } else {
! 1521		      !    
! 1522		      !                            /* We are confirmed. Switch the dumper button back to
! 1523		      !                             * magenta and create a new data file in the users TM
! 1523		      >PDIR
! 1524		      !                             * if we can.
! 1525		      !                             */
! 1526		      !    
! 1527		      !                            XSetForeground(dsp, gc2, magenta.pixel);
! 1528		      !                            XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
! 1529		      !                            sprintf(buf,"DUMPER");
! 1530		      !                            XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)
! 1530		      >strlen(buf));
! 1531		      !    
! 1532		      !                            /* dump some file data if we have the data ready */
! 1534		      !                            int data_ready = 1;
! 1535		      !                            for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ 
! 1535		      >) {
! 1536		      !                                for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_
! 1536		      >r++ ) {
! 1537		      !                                    data_ready &= vbox_flag[vbox_r][vbox_j];
! 1538		      !                                }
! 1539		      !                            }
! 1541		      !                            if ( data_ready ) {
! 1543		      !                                /* indicate that the data is ready */
! 1544		      !                                sprintf(buf,"Data Ready");
! 1545		      !                                XSetForeground(dsp, gc2, green.pixel);
! 1546		      !                                XDrawImageString(dsp, win2, gc2, 220, 178, buf, (
! 1546		      >int)strlen(buf));
! 1548		      !                                FILE *fp;
! 1549		      !                                struct stat status_buffer;
! 1550		      !                                time_t time_now;
! 1552		      !                                char timestamp[32];
! 1553		      !                                time(&time_now);
! 1554		      !                                struct tm *ptm = gmtime(&time_now);
! 1556		      !                                size_t filename_len = strftime(timestamp, 32, "%Y
! 1556		      >%m%d%H%M%S", ptm);
! 1557		      !                                char *timestamp_filename = calloc(_POSIX_PATH_MAX
! 1557		      >,sizeof(unsigned char));
! 1559		      !                                /* at the moment we are not even using the error 
! 1559		      >status return */
! 1560		      !                                char *err_status = strcat(timestamp_filename, tmp
! 1560		      >dir);
! 1561		      !                                err_status = strcat(timestamp_filename, "/");
! 1562		      !                                err_status = strcat(timestamp_filename, timestamp
! 1562		      >);
! 1564		      !                                status = stat(timestamp_filename, &status_buffer)
! 1564		      >;
! 1565		      !                                if ( status == 0 ) {

/* 0x19ac	1565 */		prefetch	[%i0+256],3

! Registers live out of .L77002783: 
! g2 g3 o0 sp l5 l6 l7 i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002771 .L77002783

			.L900001134:
/* 0x19b0	 930 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x19b4	     */		mov	96,%o0
/* 0x19b8	     */		brnz,pn	%o0,.L900000104
/* 0x19bc	     */		ldd	[%sp+2879],%f44

! Registers live out of .L900001134: 
! g2 g3 o0 o1 sp l5 l6 l7 i0 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001134

			.L77002773:
/* 0x19c0	 930 */		ba	.L77002772
/* 0x19c4	     */		mov	%o0,%o4

! Registers live out of .L77002773: 
! g2 g3 o0 o4 sp l5 l6 l7 i0 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001134

			.L900000104:
/* 0x19c8	1565 */		mov	96,%o2
/* 0x19cc	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x19d0	     */		mov	0,%o1
/* 0x19d4	     */		ldd	[%sp+2879],%f44
/* 0x19d8	     */		mov	%o0,%o4

! Registers live out of .L900000104: 
! g2 g3 o0 o4 sp l5 l6 l7 i0 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002773 .L900000104

			.L77002772:
/* 0x19dc	 930 */		brz,pn	%o4,.L77002065
/* 0x19e0	 914 */		ld	[%sp+2283],%o5

! Registers live out of .L77002772: 
! g2 g3 o0 o4 o5 sp l5 l6 l7 i0 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002772

			.L77002771:
/* 0x19e4	 914 */		add	%i1,1,%i1
/* 0x19e8	1565 */		stx	%o4,[%i0]
/* 0x19ec	     */		prefetch	[%i0+512],3
/* 0x19f0	 914 */		add	%i0,8,%i0
/* 0x19f4	     */		cmp	%i1,%o5
/* 0x19f8	     */		bl,a,pt	%icc,.L900001134
/* 0x19fc	 930 */		std	%f44,[%sp+2879]

! Registers live out of .L77002771: 
! g2 g3 o0 sp l5 l6 l7 i0 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002771

			.L77003032:
/* 0x1a00	 129 */		st	%g0,[%sp+2291]
/* 0x1a04	  99 */		stx	%g0,[%sp+3135]

! Registers live out of .L77003032: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77003010 .L77003032

			.L900001135:
/* 0x1a08	  99 */		st	%g0,[%sp+2299]
/* 0x1a0c	     */		ld	[%sp+2283],%l4
/* 0x1a10	 254 */		mov	10,%o2
/* 0x1a14	   0 */		add	%fp,-2017,%i1
/* 0x1a18	 248 */		stb	%o2,[%sp+2271]
/* 0x1a1c	 254 */		stb	%o2,[%sp+2272]
/* 0x1a20	 125 */		st	%g0,[%sp+2303]
/* 0x1a24	 100 */		st	%g0,[%sp+2307]
/* 0x1a28	 103 */		st	%g0,[%sp+2311]
/* 0x1a2c	  99 */		add	%l4,-1,%o4
/* 0x1a30	     */		st	%o4,[%sp+2287]

! Registers live out of .L900001135: 
! g2 g3 o0 sp l5 l6 l7 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001067 .L900001135

			.L900001065:
/* 0x1a34	 947 */		add	%fp,-2017,%o1
/* 0x1a38	     */		std	%f44,[%sp+2879]
/* 0x1a3c	     */		call	XNextEvent	!params=  %o0 %o1	!result= 
/* 0x1a40	     */		mov	%l6,%o0
/* 0x1a44	 953 */		ld	[%i1],%i3
/* 0x1a48	 951 */		ldx	[%fp-1953],%o0
/* 0x1a4c	     */		srl	%o0,0,%i1
/* 0x1a50	 953 */		cmp	%i3,4
/* 0x1a54	     */		bne,pn	%icc,.L77002097
/* 0x1a58	 951 */		srlx	%o0,32,%i3

! Registers live out of .L900001065: 
! g2 g3 o0 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001065

			.L77002079:
/* 0x1a5c	 955 */		ld	[%fp-1933],%o7
/* 0x1a60	     */		cmp	%o7,4
/* 0x1a64	     */		bge,pn	%icc,.L900000992
/* 0x1a68	     */		nop

! Registers live out of .L77002079: 
! g2 g3 o0 sp o7 l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002079

			.L900000994:
/* 0x1a6c	 955 */		cmp	%o7,1
/* 0x1a70	     */		be,pn	%icc,.L77002081
/* 0x1a74	     */		cmp	%o7,2

! Registers live out of .L900000994: 
! g2 g3 o0 sp o7 l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000994

			.L900000995:
/* 0x1a78	 955 */		be,pt	%icc,.L900001133
/* 0x1a7c	 962 */		mov	2,%g5

! Registers live out of .L900000995: 
! g2 g3 g5 o0 sp o7 l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000995

			.L900000996:
/* 0x1a80	 955 */		cmp	%o7,3
/* 0x1a84	     */		bne,pn	%icc,.L77002097
/* 0x1a88	 968 */		ld	[%sp+2291],%l4

! Registers live out of .L900000996: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000996

			.L77002085:
/* 0x1a8c	 967 */		mov	3,%o2
/* 0x1a90	     */		st	%o2,[%sp+2303]
/* 0x1a94	 968 */		add	%l4,1,%g4
/* 0x1a98	     */		st	%g4,[%sp+2291]
/* 0x1a9c	 969 */		ba	.L900001132
/* 0x1aa0	 991 */		ldx	[%sp+2519],%o2

! Registers live out of .L77002085: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000995

			.L900001133:
/* 0x1aa4	 962 */		st	%g5,[%sp+2303]
/* 0x1aa8	 964 */		ba	.L900001132
/* 0x1aac	 991 */		ldx	[%sp+2519],%o2

! Registers live out of .L900001133: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000994

			.L77002081:
/* 0x1ab0	 957 */		mov	1,%i4
/* 0x1ab4	     */		st	%i4,[%sp+2303]
/* 0x1ab8	 959 */		ba	.L900001132
/* 0x1abc	 991 */		ldx	[%sp+2519],%o2

! Registers live out of .L77002081: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002079

			.L900000992:
/* 0x1ac0	 955 */		be,pn	%icc,.L77002087
/* 0x1ac4	     */		cmp	%o7,5

! Registers live out of .L900000992: 
! g2 g3 o0 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000992

			.L900000997:
/* 0x1ac8	 955 */		bne,pn	%icc,.L77002097
/* 0x1acc	 977 */		mov	5,%o5

! Registers live out of .L900000997: 
! g2 g3 o0 o5 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000997

			.L77002089:
/* 0x1ad0	 977 */		st	%o5,[%sp+2303]
/* 0x1ad4	     */		ba	.L900001132
/* 0x1ad8	 991 */		ldx	[%sp+2519],%o2

! Registers live out of .L77002089: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000992

			.L77002087:
/* 0x1adc	 972 */		mov	4,%o1
/* 0x1ae0	     */		st	%o1,[%sp+2303]

! Registers live out of .L77002087: 
! g2 g3 o0 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002087 .L900000996 .L900000997 .L900001065

			.L77002097:
/* 0x1ae4	 991 */		ldx	[%sp+2519],%o2

! Registers live out of .L77002097: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002081 .L77002085 .L77002089 .L77002097 .L900001133

			.L900001132:
/* 0x1ae8	 991 */		ldx	[%sp+2751],%o1
/* 0x1aec	 993 */		sethi	%gdop_hix22(__iob),%i4
/* 0x1af0	 991 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1af4	     */		mov	%l6,%o0
/* 0x1af8	 992 */		sethi	%gdop_hix22(.L323),%o4
/* 0x1afc	     */		ldx	[%sp+2703],%o0
/* 0x1b00	     */		sra	%i1,0,%o3
/* 0x1b04	     */		sra	%i3,0,%o2
/* 0x1b08	     */		xor	%o4,%gdop_lox10(.L323),%g1
/* 0x1b0c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1b10	     */		ldx	[%l7+%g1],%o1,%gdop(.L323)
/* 0x1b14	 993 */		sethi	%gdop_hix22(.L324),%i2
/* 0x1b18	     */		xor	%i4,%gdop_lox10(__iob),%i5
/* 0x1b1c	     */		ldx	[%sp+2703],%o2
/* 0x1b20	     */		xor	%i2,%gdop_lox10(.L324),%l2
/* 0x1b24	     */		ldx	[%l7+%i5],%l3,%gdop(__iob)
/* 0x1b28	     */		ldx	[%l7+%l2],%o1,%gdop(.L324)
/* 0x1b2c	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1b30	     */		add	%l3,256,%o0
/* 0x1b34	 994 */		ldx	[%sp+2703],%i0
/* 0x1b38	     */		ldub	[%i0],%o1

! Registers live out of .L900001132: 
! g2 g3 o0 o1 sp l5 l6 l7 i0 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000298 .L900001132

			.L900001131:
/* 0x1b3c	 994 */		brz,pn	%o1,.L900000299
/* 0x1b40	     */		add	%i0,1,%i0

! Registers live out of .L900001131: 
! g2 g3 o0 o1 sp l5 l6 l7 i0 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001131

			.L900000298:
/* 0x1b44	 994 */		ldub	[%i0],%i5
/* 0x1b48	     */		add	%i0,1,%i0
/* 0x1b4c	     */		brnz,a,pt	%i5,.L900001131
/* 0x1b50	     */		ldub	[%i0],%o1

! Registers live out of .L900000298: 
! g2 g3 o0 o1 sp l5 l6 l7 i0 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000298 .L900001131

			.L900000299:
/* 0x1b54	 994 */		ldx	[%sp+2703],%o5
/* 0x1b58	     */		sub	%i0,1,%o4
/* 0x1b5c	     */		ldx	[%sp+2751],%o2
/* 0x1b60	     */		mov	10,%o3
/* 0x1b64	     */		ldx	[%sp+2775],%o1
/* 0x1b68	   0 */		sethi	%gdop_hix22(.L636),%l4
/* 0x1b6c	   0 */		xor	%l4,%gdop_lox10(.L636),%l2
/* 0x1b70	 994 */		sub	%o4,%o5,%o7
/* 0x1b74	     */		mov	40,%o4
/* 0x1b78	     */		sra	%o7,0,%g1
/* 0x1b7c	     */		stx	%g1,[%sp+2223]
/* 0x1b80	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1b84	     */		mov	%l6,%o0
/* 0x1b88	1005 */		ld	[%sp+2303],%o4
/* 0x1b8c	     */		ldd	[%sp+2879],%f44
/* 0x1b90	   0 */		ldx	[%l7+%l2],%g1,%gdop(.L636)
/* 0x1b94	1005 */		cmp	%o4,1
/* 0x1b98	     */		bne,pn	%icc,.L77002375
/* 0x1b9c	   0 */		stx	%g1,[%sp+2815]

! Registers live out of .L900000299: 
! g1 g2 g3 o0 o2 o4 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000299

			.L77002099:
/* 0x1ba0	1001 */		add	%i3,-1,%o3
/* 0x1ba4	1009 */		cmp	%o3,10
/* 0x1ba8	     */		bl,pn	%icc,.L77003016
/* 0x1bac	1001 */		st	%o3,[%sp+2315]

! Registers live out of .L77002099: 
! g2 g3 o0 o2 o3 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002099

			.L77002101:
/* 0x1bb0	1002 */		add	%i1,-2,%o0
/* 0x1bb4	     */		cmp	%o0,10
/* 0x1bb8	     */		bl,pn	%icc,.L77002181
/* 0x1bbc	     */		st	%o0,[%sp+2319]

! Registers live out of .L77002101: 
! g2 g3 o0 o2 o3 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002101

			.L77002103:
/* 0x1bc0	1002 */		cmp	%o3,1034
/* 0x1bc4	     */		bge,pn	%icc,.L77002181
/* 0x1bc8	     */		cmp	%o0,1034

! Registers live out of .L77002103: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002103

			.L77002105:
/* 0x1bcc	1002 */		bge,pn	%icc,.L77002181
/* 0x1bd0	1017 */		add	%i3,-11,%i2

! Registers live out of .L77002105: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002105

			.L77002107:
/* 0x1bd4	1017 */		mov	1034,%i0
/* 0x1bd8	   0 */		add	%sp,2487,%i1
/* 0x1bdc	1017 */		sub	%i0,%o0,%o7
/* 0x1be0	     */		sra	%i2,0,%o0
/* 0x1be4	     */		sra	%o7,0,%o1
/* 0x1be8	     */		mov	%i1,%o4
/* 0x1bec	     */		mov	1024,%o3
/* 0x1bf0	     */		call	fp_region	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x1bf4	     */		mov	1024,%o2
/* 0x1bf8	1018 */		ldd	[%i1],%f32
/* 0x1bfc	1019 */		ldd	[%sp+2495],%f34
/* 0x1c00	1021 */		ldx	[%sp+2735],%o1
/* 0x1c04	     */		mov	%l6,%o0
/* 0x1c08	1030 */		sethi	%gdop_hix22(.L324),%l4
/* 0x1c0c	1018 */		std	%f32,[%sp+2959]
/* 0x1c10	1019 */		std	%f34,[%sp+2967]
/* 0x1c14	1021 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1c18	     */		ldx	[%sp+2535],%o2
/* 0x1c1c	1028 */		ld	[%sp+2319],%g1
/* 0x1c20	1027 */		sra	%i2,31,%o3
/* 0x1c24	1029 */		sethi	%gdop_hix22(.L332),%o0
/* 0x1c28	     */		xor	%o0,%gdop_lox10(.L332),%o4
/* 0x1c2c	     */		ldx	[%sp+2703],%o0
/* 0x1c30	1027 */		and	%o3,63,%i4
/* 0x1c34	1029 */		ldx	[%l7+%o4],%o1,%gdop(.L332)
/* 0x1c38	1027 */		add	%i2,%i4,%i5
/* 0x1c3c	1028 */		add	%g1,-1034,%i0
/* 0x1c40	1027 */		sra	%i5,6,%i2
/* 0x1c44	1028 */		sra	%i0,31,%l2
/* 0x1c48	1029 */		mov	%i2,%o2
/* 0x1c4c	1028 */		and	%l2,63,%l3
/* 0x1c50	     */		add	%i0,%l3,%o5
/* 0x1c54	     */		sra	%o5,6,%i3
/* 0x1c58	     */		sub	%g0,%i3,%i1
/* 0x1c5c	1029 */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1c60	     */		sra	%i1,0,%o3
/* 0x1c64	1030 */		sethi	%gdop_hix22(__iob),%o1
/* 0x1c68	     */		xor	%o1,%gdop_lox10(__iob),%o2
/* 0x1c6c	     */		xor	%l4,%gdop_lox10(.L324),%g4
/* 0x1c70	     */		ldx	[%l7+%o2],%g5,%gdop(__iob)
/* 0x1c74	     */		ldx	[%sp+2703],%o2
/* 0x1c78	     */		ldx	[%l7+%g4],%o1,%gdop(.L324)
/* 0x1c7c	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1c80	     */		add	%g5,256,%o0
/* 0x1c84	1031 */		ldx	[%sp+2703],%o7
/* 0x1c88	     */		ldub	[%o7],%l4

! Registers live out of .L77002107: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002107 .L900000294

			.L900001130:
/* 0x1c8c	1031 */		brz,pn	%l4,.L900000295
/* 0x1c90	     */		add	%o7,1,%o7

! Registers live out of .L900001130: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001130

			.L900000294:
/* 0x1c94	1031 */		ldub	[%o7],%i0
/* 0x1c98	     */		add	%o7,1,%o7
/* 0x1c9c	     */		brnz,a,pt	%i0,.L900001130
/* 0x1ca0	     */		ldub	[%o7],%l4

! Registers live out of .L900000294: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000294 .L900001130

			.L900000295:
/* 0x1ca4	1031 */		ldx	[%sp+2703],%o5
/* 0x1ca8	     */		sub	%o7,1,%i3
/* 0x1cac	     */		ldx	[%sp+2735],%o2
/* 0x1cb0	     */		mov	270,%o4
/* 0x1cb4	     */		ldx	[%sp+2743],%o1
/* 0x1cb8	     */		mov	10,%o3
/* 0x1cbc	     */		sub	%i3,%o5,%g5
/* 0x1cc0	     */		mov	%o5,%i0
/* 0x1cc4	     */		sra	%g5,0,%g4
/* 0x1cc8	     */		stx	%g4,[%sp+2223]
/* 0x1ccc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1cd0	     */		mov	%l6,%o0
/* 0x1cd4	1033 */		ldx	[%sp+2647],%o2
/* 0x1cd8	     */		ldx	[%sp+2735],%o1
/* 0x1cdc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1ce0	     */		mov	%l6,%o0
/* 0x1ce4	1034 */		sethi	%gdop_hix22(.L333),%o5
/* 0x1ce8	     */		ldx	[%sp+2959],%o2
/* 0x1cec	     */		ldx	[%sp+2967],%o3
/* 0x1cf0	     */		mov	%i0,%o0
/* 0x1cf4	     */		xor	%o5,%gdop_lox10(.L333),%i4
/* 0x1cf8	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1cfc	     */		ldx	[%l7+%i4],%o1,%gdop(.L333)
/* 0x1d00	1035 */		mov	%i0,%o7
/* 0x1d04	     */		ldub	[%i0],%o1

! Registers live out of .L900000295: 
! g2 g3 o1 sp o7 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000290 .L900000295

			.L900001129:
/* 0x1d08	1035 */		brz,pn	%o1,.L900000291
/* 0x1d0c	     */		add	%o7,1,%o7

! Registers live out of .L900001129: 
! g2 g3 sp o7 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001129

			.L900000290:
/* 0x1d10	1035 */		ldub	[%o7],%o1
/* 0x1d14	     */		add	%o7,1,%o7
/* 0x1d18	     */		brnz,a,pt	%o1,.L900001129
/* 0x1d1c	     */		ldub	[%o7],%o1

! Registers live out of .L900000290: 
! g2 g3 o1 sp o7 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000290 .L900001129

			.L900000291:
/* 0x1d20	1035 */		ldx	[%sp+2703],%o5
/* 0x1d24	     */		sub	%o7,1,%o0
/* 0x1d28	     */		ldx	[%sp+2743],%o1
/* 0x1d2c	     */		mov	290,%o4
/* 0x1d30	   0 */		sethi	%gdop_hix22(.L334),%l3
/* 0x1d34	1035 */		sub	%o0,%o5,%o3
/* 0x1d38	     */		mov	%o5,%i4
/* 0x1d3c	     */		sra	%o3,0,%o2
/* 0x1d40	     */		stx	%o2,[%sp+2223]
/* 0x1d44	     */		ldx	[%sp+2735],%o2
/* 0x1d48	     */		mov	10,%o3
/* 0x1d4c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1d50	     */		mov	%l6,%o0
/* 0x1d54	1036 */		ldx	[%sp+2959],%o1
/* 0x1d58	     */		ldx	[%sp+2967],%o2
/* 0x1d5c	   0 */		xor	%l3,%gdop_lox10(.L334),%o4
/* 0x1d60	   0 */		ldx	[%l7+%o4],%l4,%gdop(.L334)
/* 0x1d64	1036 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x1d68	     */		mov	%l4,%o0
/* 0x1d6c	1046 */		ldd	[%sp+2783],%f6
/* 0x1d70	     */		ldd	[%sp+2791],%f8
/* 0x1d74	     */		add	%sp,2487,%o5
/* 0x1d78	     */		ldd	[%sp+2967],%f2
/* 0x1d7c	     */		ldd	[%sp+2959],%f0
/* 0x1d80	     */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x1d84	     */		ldd	[%sp+2711],%f4
/* 0x1d88	1048 */		ldd	[%sp+2487],%f34
/* 0x1d8c	1051 */		add	%l4,40,%o0
/* 0x1d90	1049 */		ldd	[%sp+2495],%f32
/* 0x1d94	1051 */		ldx	[%sp+2487],%o1
/* 0x1d98	     */		std	%f32,[%fp+2015]
/* 0x1d9c	     */		std	%f34,[%fp+2023]
/* 0x1da0	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x1da4	     */		ldx	[%sp+2495],%o2
/* 0x1da8	1053 */		mov	%l6,%o0
/* 0x1dac	     */		ldx	[%sp+2519],%o2
/* 0x1db0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1db4	     */		ldx	[%sp+2751],%o1
/* 0x1db8	1054 */		mov	%i4,%o0
/* 0x1dbc	     */		ldx	[%fp+2023],%o2
/* 0x1dc0	     */		add	%l4,80,%o1
/* 0x1dc4	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1dc8	     */		ldx	[%fp+2015],%o3
/* 0x1dcc	1055 */		ldub	[%i4],%i0
/* 0x1dd0	     */		mov	%i4,%o5

! Registers live out of .L900000291: 
! g2 g3 o0 o5 sp l5 l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000286 .L900000291

			.L900001128:
/* 0x1dd4	1055 */		brz,pn	%i0,.L900000287
/* 0x1dd8	     */		add	%o5,1,%o5

! Registers live out of .L900001128: 
! g2 g3 o0 o5 sp l5 l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001128

			.L900000286:
/* 0x1ddc	1055 */		ldub	[%o5],%i5
/* 0x1de0	     */		add	%o5,1,%o5
/* 0x1de4	     */		brnz,a,pt	%i5,.L900001128
/* 0x1de8	     */		ldub	[%o5],%i0

! Registers live out of .L900000286: 
! g2 g3 o0 o5 sp l5 l6 l7 i0 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000286 .L900001128

			.L900000287:
/* 0x1dec	1055 */		sub	%o5,1,%g1
/* 0x1df0	     */		ldx	[%sp+2703],%o5
/* 0x1df4	     */		ldx	[%sp+2751],%o2
/* 0x1df8	     */		mov	80,%o4
/* 0x1dfc	     */		ldx	[%sp+2775],%o1
/* 0x1e00	     */		mov	10,%o3
/* 0x1e04	     */		sub	%g1,%o5,%l2
/* 0x1e08	     */		mov	%o5,%i5
/* 0x1e0c	     */		sra	%l2,0,%i3
/* 0x1e10	     */		stx	%i3,[%sp+2223]
/* 0x1e14	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1e18	     */		mov	%l6,%o0
/* 0x1e1c	1057 */		ldx	[%sp+2535],%o2
/* 0x1e20	     */		ldx	[%sp+2751],%o1
/* 0x1e24	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1e28	     */		mov	%l6,%o0
/* 0x1e2c	1058 */		sethi	%gdop_hix22(.L337),%g5
/* 0x1e30	     */		ld	[%sp+2279],%o2
/* 0x1e34	     */		ldsw	[%sp+2283],%o3
/* 0x1e38	     */		mov	%i5,%o0
/* 0x1e3c	     */		xor	%g5,%gdop_lox10(.L337),%g4
/* 0x1e40	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1e44	     */		ldx	[%l7+%g4],%o1,%gdop(.L337)
/* 0x1e48	1059 */		ldub	[%i5],%g4
/* 0x1e4c	     */		mov	%i5,%o4

! Registers live out of .L900000287: 
! g2 g3 g4 o4 sp l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000282 .L900000287

			.L900001127:
/* 0x1e50	1059 */		brz,pn	%g4,.L900000283
/* 0x1e54	     */		add	%o4,1,%o4

! Registers live out of .L900001127: 
! g2 g3 g4 o4 sp l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001127

			.L900000282:
/* 0x1e58	1059 */		ldub	[%o4],%o2
/* 0x1e5c	     */		add	%o4,1,%o4
/* 0x1e60	     */		brnz,a,pt	%o2,.L900001127
/* 0x1e64	     */		ldub	[%o4],%g4

! Registers live out of .L900000282: 
! g2 g3 g4 o4 sp l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000282 .L900001127

			.L900000283:
/* 0x1e68	1059 */		sub	%o4,1,%i4
/* 0x1e6c	     */		ldx	[%sp+2703],%o5
/* 0x1e70	     */		mov	100,%o4
/* 0x1e74	     */		ldx	[%sp+2751],%o2
/* 0x1e78	     */		mov	10,%o3
/* 0x1e7c	     */		ldx	[%sp+2775],%o1
/* 0x1e80	     */		sub	%i4,%o5,%i0
/* 0x1e84	     */		mov	%o5,%l2
/* 0x1e88	     */		sra	%i0,0,%o0
/* 0x1e8c	1062 */		mov	%l2,%i3
/* 0x1e90	1059 */		stx	%o0,[%sp+2223]
/* 0x1e94	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1e98	     */		mov	%l6,%o0
/* 0x1e9c	1061 */		sethi	%gdop_hix22(.L338),%o3
/* 0x1ea0	     */		ldx	[%sp+2711],%o2
/* 0x1ea4	     */		xor	%o3,%gdop_lox10(.L338),%l3
/* 0x1ea8	     */		mov	%l2,%o0
/* 0x1eac	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1eb0	     */		ldx	[%l7+%l3],%o1,%gdop(.L338)
/* 0x1eb4	1062 */		ldub	[%l2],%o4

! Registers live out of .L900000283: 
! g2 g3 o0 o4 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000278 .L900000283

			.L900001126:
/* 0x1eb8	1062 */		brz,pn	%o4,.L900000279
/* 0x1ebc	     */		add	%i3,1,%i3

! Registers live out of .L900001126: 
! g2 g3 o0 o4 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001126

			.L900000278:
/* 0x1ec0	1062 */		ldub	[%i3],%g5
/* 0x1ec4	     */		add	%i3,1,%i3
/* 0x1ec8	     */		brnz,a,pt	%g5,.L900001126
/* 0x1ecc	     */		ldub	[%i3],%o4

! Registers live out of .L900000278: 
! g2 g3 o0 o4 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000278 .L900001126

			.L900000279:
/* 0x1ed0	1062 */		ldx	[%sp+2703],%o5
/* 0x1ed4	     */		sub	%i3,1,%l4
/* 0x1ed8	     */		mov	120,%o4
/* 0x1edc	     */		ldx	[%sp+2751],%o2
/* 0x1ee0	     */		mov	10,%o3
/* 0x1ee4	     */		sub	%l4,%o5,%o1
/* 0x1ee8	     */		mov	%o5,%l3
/* 0x1eec	     */		sra	%o1,0,%o7
/* 0x1ef0	     */		ldx	[%sp+2775],%o1
/* 0x1ef4	     */		stx	%o7,[%sp+2223]
/* 0x1ef8	1065 */		mov	%l3,%l4
/* 0x1efc	1062 */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1f00	     */		mov	%l6,%o0
/* 0x1f04	1064 */		ldx	[%sp+2783],%o2
/* 0x1f08	     */		ldx	[%sp+2791],%o3
/* 0x1f0c	     */		sethi	%gdop_hix22(.L339),%g1
/* 0x1f10	     */		mov	%l3,%o0
/* 0x1f14	     */		xor	%g1,%gdop_lox10(.L339),%l2
/* 0x1f18	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1f1c	     */		ldx	[%l7+%l2],%o1,%gdop(.L339)
/* 0x1f20	1065 */		ldub	[%l3],%g5

! Registers live out of .L900000279: 
! g2 g3 g5 o0 sp l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000274 .L900000279

			.L900001125:
/* 0x1f24	1065 */		brz,pn	%g5,.L900000275
/* 0x1f28	     */		add	%l4,1,%l4

! Registers live out of .L900001125: 
! g2 g3 g5 o0 sp l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001125

			.L900000274:
/* 0x1f2c	1065 */		ldub	[%l4],%o2
/* 0x1f30	     */		add	%l4,1,%l4
/* 0x1f34	     */		brnz,a,pt	%o2,.L900001125
/* 0x1f38	     */		ldub	[%l4],%g5

! Registers live out of .L900000274: 
! g2 g3 g5 o0 sp l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000274 .L900001125

			.L900000275:
/* 0x1f3c	1065 */		ldx	[%sp+2703],%o5
/* 0x1f40	     */		sub	%l4,1,%g4
/* 0x1f44	     */		ldx	[%sp+2751],%o2
/* 0x1f48	     */		mov	140,%o4
/* 0x1f4c	     */		ldx	[%sp+2775],%o1
/* 0x1f50	     */		mov	10,%o3
/* 0x1f54	     */		sub	%g4,%o5,%i5
/* 0x1f58	     */		mov	%o5,%l4
/* 0x1f5c	     */		sra	%i5,0,%i4
/* 0x1f60	     */		stx	%i4,[%sp+2223]
/* 0x1f64	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1f68	     */		mov	%l6,%o0
/* 0x1f6c	1069 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o5
/* 0x1f70	     */		ldd	[%sp+2799],%f34
/* 0x1f74	     */		xor	%o5,%gdop_lox10(.L___const_seg_900000101),%i0
/* 0x1f78	1070 */		sethi	%gdop_hix22(.L262),%o0
/* 0x1f7c	1069 */		ldx	[%l7+%i0],%l3,%gdop(.L___const_seg_900000101)
/* 0x1f80	1070 */		xor	%o0,%gdop_lox10(.L262),%o3
/* 0x1f84	   0 */		add	%sp,2855,%l2
/* 0x1f88	1070 */		ldx	[%l7+%o3],%o0,%gdop(.L262)
/* 0x1f8c	1069 */		ld	[%l3+48],%f0
/* 0x1f90	     */		fitod	%f0,%f32
/* 0x1f94	     */		fdivd	%f34,%f32,%f32
/* 0x1f98	     */		std	%f32,[%sp+2855]
/* 0x1f9c	1070 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x1fa0	     */		ldx	[%sp+2855],%o1
/* 0x1fa4	1071 */		sethi	%gdop_hix22(.L340),%o4
/* 0x1fa8	     */		ldx	[%l2],%o2
/* 0x1fac	     */		mov	%l4,%o0
/* 0x1fb0	1072 */		mov	%l4,%l2
/* 0x1fb4	1071 */		xor	%o4,%gdop_lox10(.L340),%o1
/* 0x1fb8	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1fbc	     */		ldx	[%l7+%o1],%o1,%gdop(.L340)
/* 0x1fc0	1072 */		ldub	[%l4],%o7

! Registers live out of .L900000275: 
! g2 g3 o0 sp o7 l2 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000270 .L900000275

			.L900001124:
/* 0x1fc4	1072 */		brz,pn	%o7,.L900000271
/* 0x1fc8	     */		add	%l2,1,%l2

! Registers live out of .L900001124: 
! g2 g3 o0 sp o7 l2 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001124

			.L900000270:
/* 0x1fcc	1072 */		ldub	[%l2],%i0
/* 0x1fd0	     */		add	%l2,1,%l2
/* 0x1fd4	     */		brnz,a,pt	%i0,.L900001124
/* 0x1fd8	     */		ldub	[%l2],%o7

! Registers live out of .L900000270: 
! g2 g3 o0 sp o7 l2 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000270 .L900001124

			.L900000271:
/* 0x1fdc	1072 */		ldx	[%sp+2703],%o5
/* 0x1fe0	     */		sub	%l2,1,%o7
/* 0x1fe4	     */		ldx	[%sp+2751],%o2
/* 0x1fe8	1074 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i3
/* 0x1fec	1072 */		ldx	[%sp+2775],%o1
/* 0x1ff0	     */		mov	180,%o4
/* 0x1ff4	     */		mov	10,%o3
/* 0x1ff8	1075 */		sethi	%gdop_hix22(.L263),%i5
/* 0x1ffc	1072 */		sub	%o7,%o5,%g1
/* 0x2000	     */		mov	%o5,%i0
/* 0x2004	     */		sra	%g1,0,%g5
/* 0x2008	     */		stx	%g5,[%sp+2223]
/* 0x200c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2010	     */		mov	%l6,%o0
/* 0x2014	1074 */		xor	%i3,%gdop_lox10(.L___const_seg_900000101),%g4
/* 0x2018	     */		ldd	[%sp+2807],%f34
/* 0x201c	     */		ldx	[%l7+%g4],%o3,%gdop(.L___const_seg_900000101)
/* 0x2020	1075 */		xor	%i5,%gdop_lox10(.L263),%o5
/* 0x2024	   0 */		add	%sp,2863,%i4
/* 0x2028	1075 */		ldx	[%l7+%o5],%o0,%gdop(.L263)
/* 0x202c	1077 */		mov	%i0,%i3
/* 0x2030	1074 */		ld	[%o3+48],%f0
/* 0x2034	     */		fitod	%f0,%f32
/* 0x2038	     */		fdivd	%f34,%f32,%f32
/* 0x203c	     */		std	%f32,[%sp+2863]
/* 0x2040	1075 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x2044	     */		ldx	[%sp+2863],%o1
/* 0x2048	1076 */		sethi	%gdop_hix22(.L341),%o0
/* 0x204c	     */		ldx	[%i4],%o2
/* 0x2050	     */		xor	%o0,%gdop_lox10(.L341),%l3
/* 0x2054	     */		mov	%i0,%o0
/* 0x2058	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x205c	     */		ldx	[%l7+%l3],%o1,%gdop(.L341)
/* 0x2060	1077 */		ldub	[%i0],%o5

! Registers live out of .L900000271: 
! g2 g3 o0 o5 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000266 .L900000271

			.L900001123:
/* 0x2064	1077 */		brz,pn	%o5,.L900000267
/* 0x2068	     */		add	%i3,1,%i3

! Registers live out of .L900001123: 
! g2 g3 o0 o5 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001123

			.L900000266:
/* 0x206c	1077 */		ldub	[%i3],%g4
/* 0x2070	     */		add	%i3,1,%i3
/* 0x2074	     */		brnz,a,pt	%g4,.L900001123
/* 0x2078	     */		ldub	[%i3],%o5

! Registers live out of .L900000266: 
! g2 g3 o0 o5 sp l5 l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000266 .L900001123

			.L900000267:
/* 0x207c	1077 */		ldx	[%sp+2703],%o5
/* 0x2080	     */		sub	%i3,1,%o4
/* 0x2084	     */		mov	10,%o3
/* 0x2088	     */		sub	%o4,%o5,%o1
/* 0x208c	     */		mov	200,%o4
/* 0x2090	     */		sra	%o1,0,%o2
/* 0x2094	     */		stx	%o2,[%sp+2223]
/* 0x2098	     */		ldx	[%sp+2751],%o2
/* 0x209c	     */		ldx	[%sp+2775],%o1
/* 0x20a0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x20a4	     */		mov	%l6,%o0
/* 0x20a8	1079 */		ldx	[%sp+2567],%o2
/* 0x20ac	     */		ldx	[%sp+2751],%o1
/* 0x20b0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x20b4	     */		mov	%l6,%o0
/* 0x20b8	1082 */		add	%sp,2503,%o1
/* 0x20bc	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x20c0	     */		mov	3,%o0
/* 0x20c4	1107 */		ldd	[%sp+2879],%f44
/* 0x20c8	     */		sra	%i2,0,%g5
/* 0x20cc	     */		sra	%i1,0,%o7
/* 0x20d0	     */		stx	%g5,[%sp+2943]
/* 0x20d4	     */		stx	%o7,[%sp+2951]
/* 0x20d8	     */		sllx	%g5,4,%l4
/* 0x20dc	     */		add	%o7,%l4,%g1
/* 0x20e0	     */		add	%fp,-1057,%l4
/* 0x20e4	     */		sllx	%g1,2,%g4
/* 0x20e8	     */		ld	[%g4+%l4],%g5
/* 0x20ec	     */		cmp	%g5,0
/* 0x20f0	     */		bne,pn	%icc,.L77002699
/* 0x20f4	1108 */		ld	[%sp+2283],%g5

! Registers live out of .L900000267: 
! g2 g3 g4 g5 o0 sp l4 l5 l6 l7 i1 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000267

			.L77002109:
/* 0x20f8	1107 */		add	%g4,%l4,%i3
/* 0x20fc	1108 */		cmp	%g5,0
/* 0x2100	     */		ble,pn	%icc,.L77002117
/* 0x2104	1107 */		stx	%i3,[%sp+3039]

! Registers live out of .L77002109: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002109

			.L77002907:
/* 0x2108	1108 */		sethi	%hi(0x400c00),%l3
/* 0x210c	1128 */		sethi	%gdop_hix22(mbrot_vbox_pthread),%o3
/* 0x2110	1108 */		add	%l3,719,%l3
/* 0x2114	     */		sethi	%hi(0x400c00),%l2
/* 0x2118	1128 */		xor	%o3,%gdop_lox10(mbrot_vbox_pthread),%o4
/* 0x211c	1108 */		add	%l3,%sp,%l3
/* 0x2120	     */		add	%l2,463,%l2
/* 0x2124	1109 */		ldx	[%l3],%o3
/* 0x2128	1108 */		mov	0,%l4
/* 0x212c	1128 */		ldx	[%l7+%o4],%i4,%gdop(mbrot_vbox_pthread)
/* 0x2130	1108 */		add	%l2,%sp,%l2
/* 0x2134	1109 */		prefetch	[%l3+256],0
/* 0x2138	1126 */		add	%sp,3135,%i5

! Registers live out of .L77002907: 
! g2 g3 o3 sp l2 l4 l5 l6 l7 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002907 .L900001122

			.L900001122:
/* 0x213c	1114 */		ldd	[%sp+2799],%f36
/* 0x2140	1115 */		ldd	[%sp+2807],%f34
/* 0x2144	1121 */		mov	64,%i3
/* 0x2148	1118 */		mov	1024,%i0
/* 0x214c	1110 */		ld	[%sp+2283],%o4
/* 0x2150	1128 */		std	%f44,[%sp+2879]
/* 0x2154	1125 */		add	%sp,3215,%g5
/* 0x2158	1128 */		mov	%l2,%o0
/* 0x215c	1126 */		ldx	[%i5],%g4
/* 0x2160	1109 */		st	%l4,[%o3+84]
/* 0x2164	1128 */		mov	0,%o1
/* 0x2168	     */		mov	%i4,%o2
/* 0x216c	1110 */		st	%o4,[%o3+88]
/* 0x2170	1111 */		ldd	[%sp+2783],%f32
/* 0x2174	1108 */		add	%l4,1,%l4
/* 0x2178	     */		add	%l2,4,%l2
/* 0x217c	1111 */		std	%f32,[%o3]
/* 0x2180	1112 */		ldd	[%sp+2791],%f32
/* 0x2184	     */		std	%f32,[%o3+8]
/* 0x2188	1113 */		ldd	[%sp+2711],%f32
/* 0x218c	1115 */		std	%f34,[%o3+32]
/* 0x2190	1114 */		std	%f36,[%o3+24]
/* 0x2194	1116 */		st	%i2,[%o3+56]
/* 0x2198	1117 */		st	%i1,[%o3+60]
/* 0x219c	1118 */		st	%i0,[%o3+64]
/* 0x21a0	1119 */		st	%i0,[%o3+68]
/* 0x21a4	1120 */		st	%i3,[%o3+72]
/* 0x21a8	1121 */		st	%i3,[%o3+76]
/* 0x21ac	1109 */		prefetch	[%l3+512],0
/* 0x21b0	1113 */		std	%f32,[%o3+16]
/* 0x21b4	1108 */		add	%l3,8,%l3
/* 0x21b8	1122 */		ld	[%sp+2279],%o5
/* 0x21bc	1126 */		stx	%g4,[%o3+48]
/* 0x21c0	1125 */		stx	%g5,[%o3+40]
/* 0x21c4	1128 */		call	pthread_create	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x21c8	1122 */		st	%o5,[%o3+80]
/* 0x21cc	1108 */		ld	[%sp+2287],%g5
/* 0x21d0	     */		ldd	[%sp+2879],%f44
/* 0x21d4	     */		cmp	%l4,%g5
/* 0x21d8	     */		ble,a,pt	%icc,.L900001122
/* 0x21dc	1109 */		ldx	[%l3],%o3

! Registers live out of .L900001122: 
! g2 g3 o0 o3 sp l2 l4 l5 l6 l7 i1 i2 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002109 .L900001122

			.L77002117:
/* 0x21e0	1156 */		ld	[%sp+2283],%i3
/* 0x21e4	     */		cmp	%i3,0
/* 0x21e8	     */		ble,pn	%icc,.L77002125
/* 0x21ec	1158 */		sethi	%gdop_hix22(.L353),%o1

! Registers live out of .L77002117: 
! g2 g3 o0 o1 sp l5 l6 l7 i1 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002117

			.L77002908:
/* 0x21f0	1157 */		std	%f44,[%sp+2879]
/* 0x21f4	1156 */		sethi	%hi(0x400c00),%i4
/* 0x21f8	1158 */		xor	%o1,%gdop_lox10(.L353),%o2
/* 0x21fc	1156 */		add	%i4,463,%i4
/* 0x2200	1158 */		ldx	[%l7+%o2],%l2,%gdop(.L353)
/* 0x2204	1156 */		mov	0,%i3
/* 0x2208	     */		add	%i4,%sp,%i4
/* 0x220c	1157 */		prefetch	[%i4+256],0

! Registers live out of .L77002908: 
! g2 g3 sp l2 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002908 .L900001121

			.L900001121:
/* 0x2210	1157 */		ld	[%i4],%o0
/* 0x2214	     */		mov	0,%o1
/* 0x2218	     */		call	pthread_join	!params=  %o0 %o1	!result= 
/* 0x221c	     */		prefetch	[%i4+512],0
/* 0x2220	1158 */		sra	%i3,0,%o1
/* 0x2224	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x2228	     */		mov	%l2,%o0
/* 0x222c	1156 */		ld	[%sp+2287],%g4
/* 0x2230	     */		add	%i3,1,%i3
/* 0x2234	     */		ldd	[%sp+2879],%f44
/* 0x2238	     */		add	%i4,4,%i4
/* 0x223c	     */		cmp	%i3,%g4
/* 0x2240	     */		ble,a,pt	%icc,.L900001121
/* 0x2244	1157 */		std	%f44,[%sp+2879]

! Registers live out of .L900001121: 
! g2 g3 o0 sp l2 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002117 .L900001121

			.L77002125:
/* 0x2248	1160 */		ldx	[%sp+3039],%o3
/* 0x224c	     */		mov	1,%o2
/* 0x2250	     */		st	%o2,[%o3]

! Registers live out of .L77002125: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002125 .L900000267

			.L77002699:
/* 0x2254	   0 */		add	%sp,2551,%i3
/* 0x2258	1162 */		std	%f44,[%sp+2879]
/* 0x225c	1166 */		sethi	%gdop_hix22(.L324),%l3
/* 0x2260	1162 */		mov	%i3,%o1
/* 0x2264	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x2268	     */		mov	3,%o0
/* 0x226c	1164 */		ldx	[%sp+2503],%o0
/* 0x2270	     */		ldx	[%sp+2511],%o1
/* 0x2274	     */		ldx	[%i3],%o2
/* 0x2278	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x227c	     */		ldx	[%sp+2559],%o3
/* 0x2280	1165 */		stx	%o0,[%sp+3103]
/* 0x2284	     */		sethi	%gdop_hix22(.L355),%o4
/* 0x2288	     */		ldd	[%sp+3103],%f0
/* 0x228c	     */		xor	%o4,%gdop_lox10(.L355),%o5
/* 0x2290	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o1
/* 0x2294	1164 */		mov	%o0,%o2
/* 0x2298	1165 */		ldx	[%sp+2703],%o0
/* 0x229c	   0 */		xor	%o1,%gdop_lox10(.L___const_seg_900000101),%o3
/* 0x22a0	1165 */		ldx	[%l7+%o5],%o1,%gdop(.L355)
/* 0x22a4	   0 */		ldx	[%l7+%o3],%o7,%gdop(.L___const_seg_900000101)
/* 0x22a8	1165 */		fmovs	%f1,%f3
/* 0x22ac	     */		fmovs	%f0,%f7
/* 0x22b0	     */		ldd	[%o7+24],%f4
/* 0x22b4	     */		ldd	[%o7+32],%f36
/* 0x22b8	     */		ldd	[%o7+64],%f40
/* 0x22bc	     */		fmovs	%f4,%f2
/* 0x22c0	     */		fmovs	%f4,%f6
/* 0x22c4	     */		fsubd	%f2,%f4,%f32
/* 0x22c8	     */		fsubd	%f6,%f4,%f34
/* 0x22cc	     */		fabsd	%f32,%f38
/* 0x22d0	     */		fabsd	%f34,%f32
/* 0x22d4	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x22d8	     */		fdivd	%f32,%f40,%f32
/* 0x22dc	     */		std	%f32,[%sp+3111]
/* 0x22e0	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x22e4	     */		ldx	[%sp+3111],%o3
/* 0x22e8	1166 */		sethi	%gdop_hix22(__iob),%o0
/* 0x22ec	     */		xor	%l3,%gdop_lox10(.L324),%g1
/* 0x22f0	     */		ldx	[%sp+2703],%o2
/* 0x22f4	     */		xor	%o0,%gdop_lox10(__iob),%l4
/* 0x22f8	     */		ldx	[%l7+%g1],%o1,%gdop(.L324)
/* 0x22fc	     */		ldx	[%l7+%l4],%i0,%gdop(__iob)
/* 0x2300	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x2304	     */		add	%i0,256,%o0
/* 0x2308	1167 */		ldx	[%sp+2615],%o2
/* 0x230c	     */		ldx	[%sp+2751],%o1
/* 0x2310	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2314	     */		mov	%l6,%o0
/* 0x2318	1168 */		ldx	[%sp+2703],%i5
/* 0x231c	     */		ldub	[%i5],%g1

! Registers live out of .L77002699: 
! g1 g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002699 .L900000190

			.L900001120:
/* 0x2320	1168 */		brz,pn	%g1,.L900000191
/* 0x2324	     */		add	%i5,1,%i5

! Registers live out of .L900001120: 
! g1 g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001120

			.L900000190:
/* 0x2328	1168 */		ldub	[%i5],%l4
/* 0x232c	     */		add	%i5,1,%i5
/* 0x2330	     */		brnz,a,pt	%l4,.L900001120
/* 0x2334	     */		ldub	[%i5],%g1

! Registers live out of .L900000190: 
! g1 g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000190 .L900001120

			.L900000191:
/* 0x2338	1170 */		sll	%i1,6,%i1
/* 0x233c	1168 */		ldx	[%sp+2703],%o5
/* 0x2340	     */		sub	%i5,1,%g5
/* 0x2344	     */		ldx	[%sp+2751],%o2
/* 0x2348	     */		mov	270,%o4
/* 0x234c	     */		mov	10,%o3
/* 0x2350	     */		sub	%g5,%o5,%o1
/* 0x2354	     */		sra	%o1,0,%g4
/* 0x2358	     */		ldx	[%sp+2775],%o1
/* 0x235c	     */		stx	%g4,[%sp+2223]
/* 0x2360	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2364	     */		mov	%l6,%o0
/* 0x2368	1170 */		ldx	[%sp+2951],%i3
/* 0x236c	     */		ldx	[%sp+2943],%i4
/* 0x2370	     */		sll	%i2,6,%o2
/* 0x2374	     */		st	%i1,[%sp+2347]
/* 0x2378	     */		add	%sp,3215,%l2
/* 0x237c	     */		st	%o2,[%sp+2343]
/* 0x2380	     */		mov	205,%g4
/* 0x2384	   0 */		ldd	[%sp+2879],%f44
/* 0x2388	1170 */		st	%g0,[%sp+2339]
/* 0x238c	     */		add	%o2,10,%i5
/* 0x2390	     */		st	%i5,[%sp+2351]
/* 0x2394	1173 */		ld	[%sp+2347],%o2
/* 0x2398	1170 */		sllx	%i3,14,%o3
/* 0x239c	     */		sllx	%i4,18,%o5
/* 0x23a0	     */		st	%g4,[%sp+2331]
/* 0x23a4	     */		mov	1034,%i3
/* 0x23a8	     */		add	%o5,%o3,%l3
/* 0x23ac	     */		sub	%i3,%i1,%i1
/* 0x23b0	     */		st	%i1,[%sp+2335]
/* 0x23b4	     */		add	%l3,%l2,%i5
/* 0x23b8	     */		stx	%i5,[%sp+2871]
/* 0x23bc	   0 */		add	%sp,2459,%i3

! Registers live out of .L900000191: 
! g2 g3 o2 sp l5 l6 l7 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002175 .L900000191

			.L900001110:
/* 0x23c0	1173 */		ld	[%sp+2339],%o5
/* 0x23c4	     */		ld	[%sp+2351],%o1
/* 0x23c8	     */		mov	16,%g4
/* 0x23cc	1180 */		ld	[%sp+2343],%i5
/* 0x23d0	1173 */		st	%g0,[%sp+2355]
/* 0x23d4	     */		ldx	[%sp+2871],%l4
/* 0x23d8	     */		st	%g4,[%sp+2363]
/* 0x23dc	     */		st	%o1,[%sp+2359]
/* 0x23e0	     */		add	%o5,%o2,%o0
/* 0x23e4	     */		st	%o0,[%sp+2367]

! Registers live out of .L900001110: 
! g2 g3 o0 sp l4 l5 l6 l7 i3 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002171 .L900001110

			.L900001111:
/* 0x23e8	1180 */		ld	[%sp+2355],%o5
/* 0x23ec	     */		ld	[%sp+2367],%g1
/* 0x23f0	   0 */		add	%sp,2487,%l3
/* 0x23f4	1180 */		mov	1024,%o3
/* 0x23f8	1178 */		ld	[%l4],%i0
/* 0x23fc	1180 */		mov	%l3,%o4
/* 0x2400	     */		mov	1024,%o2
/* 0x2404	     */		std	%f44,[%sp+2879]
/* 0x2408	     */		sra	%g1,0,%o1
/* 0x240c	     */		add	%o5,%i5,%l2
/* 0x2410	     */		call	fp_region	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x2414	     */		sra	%l2,0,%o0
/* 0x2418	1191 */		ldd	[%l3],%f0
/* 0x241c	     */		ldd	[%sp+2791],%f8
/* 0x2420	     */		ldd	[%sp+2783],%f6
/* 0x2424	     */		ldd	[%sp+2711],%f4
/* 0x2428	   0 */		mov	%l3,%o5
/* 0x242c	1191 */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x2430	     */		ldd	[%sp+2495],%f2
/* 0x2434	1197 */		ld	[%sp+2279],%o1
/* 0x2438	1192 */		ldd	[%l3],%f32
/* 0x243c	1193 */		ldd	[%sp+2495],%f34
/* 0x2440	1192 */		std	%f32,[%sp+2823]
/* 0x2444	1193 */		std	%f34,[%sp+2831]
/* 0x2448	1197 */		cmp	%i0,%o1
/* 0x244c	     */		bne,pn	%icc,.L77002139
/* 0x2450	1199 */		ldx	[%sp+2759],%o1

! Registers live out of .L900001111: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 i0 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001111

			.L77002137:
/* 0x2454	1199 */		mov	0,%o2
/* 0x2458	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x245c	     */		mov	%l6,%o0
/* 0x2460	     */		ba	.L900001119
/* 0x2464	1208 */		nop

! Registers live out of .L77002137: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001111

			.L77002139:
/* 0x2468	1201 */		sethi	%hi(0x401400),%i4
/* 0x246c	     */		and	%i0,255,%i1
/* 0x2470	     */		add	%i4,207,%i4
/* 0x2474	     */		sllx	%i1,3,%i2
/* 0x2478	     */		add	%i4,%sp,%i4
/* 0x247c	     */		ldx	[%i2+%i4],%o2
/* 0x2480	     */		stx	%o2,[%sp+3151]
/* 0x2484	1202 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2488	     */		mov	%l6,%o0

! Registers live out of .L77002139: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002137 .L77002139

			.L900001119:
/* 0x248c	1208 */		ld	[%sp+2335],%o5
/* 0x2490	     */		ld	[%sp+2359],%g1
/* 0x2494	1217 */		mov	0,%i1
/* 0x2498	1208 */		ldx	[%sp+2759],%o2
/* 0x249c	     */		ldx	[%sp+2767],%o1
/* 0x24a0	     */		sra	%o5,0,%o4
/* 0x24a4	     */		sra	%g1,0,%o3
/* 0x24a8	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x24ac	     */		mov	%l6,%o0
/* 0x24b0	1217 */		ldd	[%sp+2879],%f44
/* 0x24b4	     */		ld	[%sp+2363],%i2
/* 0x24b8	1218 */		cmp	%g0,1

! Registers live out of .L900001119: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i0 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001115 .L900001119

			.L900001112:
/* 0x24bc	1218 */		mov	0,%i4
/* 0x24c0	     */		be,pn	%icc,.L77002909
/* 0x24c4	     */		add	%i1,-1,%l2

! Registers live out of .L900001112: 
! g2 g3 o0 o2 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001112

			.L77002790:
/* 0x24c8	1218 */		ld	[%sp+2331],%l3
/* 0x24cc	   0 */		add	%sp,2455,%i5
/* 0x24d0	1222 */		add	%i4,-1,%o7

! Registers live out of .L77002790: 
! g2 g3 o2 sp o7 l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002790 .L900001117

			.L900001116:
/* 0x24d4	1222 */		st	%o7,[%i5]
/* 0x24d8	1221 */		st	%l2,[%sp+2371]
/* 0x24dc	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o3
/* 0x24e0	1224 */		cmp	%i4,1
/* 0x24e4	1222 */		ld	[%i5],%f8
/* 0x24e8	1221 */		ld	[%sp+2371],%f10
/* 0x24ec	   0 */		xor	%o3,%gdop_lox10(.L___const_seg_900000101),%o4
/* 0x24f0	   0 */		ldx	[%l7+%o4],%g1,%gdop(.L___const_seg_900000101)
/* 0x24f4	1222 */		ldd	[%sp+2863],%f32
/* 0x24f8	1221 */		ldd	[%sp+2855],%f36
/* 0x24fc	     */		ldd	[%sp+2823],%f48
/* 0x2500	1222 */		ldd	[%sp+2831],%f46
/* 0x2504	     */		fitod	%f8,%f34
/* 0x2508	1221 */		fitod	%f10,%f38
/* 0x250c	     */		ldd	[%g1+56],%f42
/* 0x2510	1222 */		fnegd	%f42,%f40
/* 0x2514	     */		fmuld	%f34,%f32,%f32
/* 0x2518	1221 */		fmuld	%f38,%f36,%f34
/* 0x251c	1222 */		fdivd	%f32,%f40,%f32
/* 0x2520	1221 */		fdivd	%f34,%f42,%f34
/* 0x2524	1222 */		faddd	%f46,%f32,%f2
/* 0x2528	1221 */		faddd	%f48,%f34,%f0
/* 0x252c	1224 */		be,pn	%icc,.L77002155
/* 0x2530	   0 */		add	%sp,2279,%i0

! Registers live out of .L900001116: 
! g2 g3 o2 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 f2 f3 f44 
		                       
! predecessor blocks: .L900001116

			.L77002153:
/* 0x2534	1225 */		std	%f44,[%sp+2879]
/* 0x2538	     */		call	mbrot	!params=  %o2 %f0 %f1 %f2 %f3	!result=  %o0
/* 0x253c	     */		ld	[%sp+2279],%o2
/* 0x2540	     */		ldd	[%sp+2879],%f44
/* 0x2544	     */		ba	.L900001118
/* 0x2548	1234 */		ld	[%i0],%o5

! Registers live out of .L77002153: 
! g2 g3 o0 o5 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001116

			.L77002155:
/* 0x254c	1230 */		ld	[%l4],%o0
/* 0x2550	1234 */		ld	[%i0],%o5

! Registers live out of .L77002155: 
! g2 g3 o0 o5 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002153 .L77002155

			.L900001118:
/* 0x2554	1234 */		cmp	%o0,%o5
/* 0x2558	     */		bne,pn	%icc,.L77002161
/* 0x255c	1235 */		std	%f44,[%sp+2879]

! Registers live out of .L900001118: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001118

			.L77002159:
/* 0x2560	1235 */		ldx	[%sp+2735],%o1
/* 0x2564	     */		mov	0,%o2
/* 0x2568	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x256c	     */		mov	%l6,%o0
/* 0x2570	     */		ba	.L900001117
/* 0x2574	1242 */		nop

! Registers live out of .L77002159: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001118

			.L77002161:
/* 0x2578	1238 */		sethi	%hi(0x401400),%g4
/* 0x257c	     */		and	%o0,255,%o2
/* 0x2580	1239 */		ldx	[%sp+2735],%o1
/* 0x2584	1238 */		add	%g4,207,%g4
/* 0x2588	     */		sllx	%o2,3,%g5
/* 0x258c	     */		add	%g4,%sp,%g4
/* 0x2590	     */		ldx	[%g5+%g4],%o2
/* 0x2594	     */		stx	%o2,[%sp+3151]
/* 0x2598	1239 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x259c	     */		mov	%l6,%o0

! Registers live out of .L77002161: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002159 .L77002161

			.L900001117:
/* 0x25a0	1242 */		sra	%l3,0,%o4
/* 0x25a4	     */		sra	%i2,0,%o3
/* 0x25a8	     */		ldx	[%sp+2735],%o2
/* 0x25ac	     */		ldx	[%sp+2743],%o1
/* 0x25b0	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x25b4	     */		mov	%l6,%o0
/* 0x25b8	1218 */		add	%i4,1,%i4
/* 0x25bc	     */		ldd	[%sp+2879],%f44
/* 0x25c0	     */		add	%l3,1,%l3
/* 0x25c4	     */		cmp	%i4,2
/* 0x25c8	     */		ble,pt	%icc,.L900001116
/* 0x25cc	1222 */		add	%i4,-1,%o7

! Registers live out of .L900001117: 
! g2 g3 o0 o2 sp o7 l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001117

			.L900001002:
/* 0x25d0	1242 */		ba	.L900001115
/* 0x25d4	1217 */		add	%i1,1,%i1

! Registers live out of .L900001002: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i0 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001112

			.L77002909:
/* 0x25d8	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%g1
/* 0x25dc	1239 */		ld	[%sp+2331],%i5
/* 0x25e0	1222 */		add	%i4,-1,%o4
/* 0x25e4	   0 */		xor	%g1,%gdop_lox10(.L___const_seg_900000101),%g4
/* 0x25e8	   0 */		ldx	[%l7+%g4],%g5,%gdop(.L___const_seg_900000101)
/* 0x25ec	   0 */		add	%g5,56,%l3

! Registers live out of .L77002909: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002909 .L900001114

			.L900001113:
/* 0x25f0	1222 */		st	%o4,[%i3]
/* 0x25f4	1221 */		st	%l2,[%sp+2375]
/* 0x25f8	1222 */		ld	[%i3],%f8
/* 0x25fc	1221 */		ld	[%sp+2375],%f10
/* 0x2600	     */		ldd	[%l3],%f42
/* 0x2604	1222 */		ldd	[%sp+2863],%f32
/* 0x2608	1221 */		ldd	[%sp+2855],%f36
/* 0x260c	     */		ldd	[%sp+2823],%f46
/* 0x2610	1222 */		ldd	[%sp+2831],%f48
/* 0x2614	1230 */		ld	[%l4],%g5
/* 0x2618	1234 */		ld	[%sp+2279],%g4
/* 0x261c	1222 */		fitod	%f8,%f34
/* 0x2620	1221 */		fitod	%f10,%f38
/* 0x2624	1222 */		fnegd	%f42,%f40
/* 0x2628	1234 */		cmp	%g5,%g4
/* 0x262c	1222 */		fmuld	%f34,%f32,%f32
/* 0x2630	1221 */		fmuld	%f38,%f36,%f34
/* 0x2634	1222 */		fdivd	%f32,%f40,%f36
/* 0x2638	1221 */		fdivd	%f34,%f42,%f32
/* 0x263c	     */		faddd	%f46,%f32,%f32
/* 0x2640	1222 */		faddd	%f48,%f36,%f32
/* 0x2644	1234 */		bne,pn	%icc,.L77002645
/* 0x2648	1235 */		std	%f44,[%sp+2879]

! Registers live out of .L900001113: 
! g2 g3 g5 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001113

			.L77002649:
/* 0x264c	1235 */		ldx	[%sp+2735],%o1
/* 0x2650	     */		mov	0,%o2
/* 0x2654	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2658	     */		mov	%l6,%o0
/* 0x265c	     */		ba	.L900001114
/* 0x2660	1242 */		nop

! Registers live out of .L77002649: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001113

			.L77002645:
/* 0x2664	1238 */		sethi	%hi(0x401400),%o2
/* 0x2668	     */		and	%g5,255,%o5
/* 0x266c	1239 */		ldx	[%sp+2735],%o1
/* 0x2670	1238 */		add	%o2,207,%o2
/* 0x2674	     */		sllx	%o5,3,%o3
/* 0x2678	     */		add	%o2,%sp,%o2
/* 0x267c	     */		ldx	[%o3+%o2],%o2
/* 0x2680	     */		stx	%o2,[%sp+3151]
/* 0x2684	1239 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2688	     */		mov	%l6,%o0

! Registers live out of .L77002645: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002645 .L77002649

			.L900001114:
/* 0x268c	1242 */		sra	%i5,0,%o4
/* 0x2690	     */		sra	%i2,0,%o3
/* 0x2694	     */		ldx	[%sp+2735],%o2
/* 0x2698	     */		ldx	[%sp+2743],%o1
/* 0x269c	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x26a0	     */		mov	%l6,%o0
/* 0x26a4	1218 */		add	%i4,1,%i4
/* 0x26a8	     */		ldd	[%sp+2879],%f44
/* 0x26ac	     */		add	%i5,1,%i5
/* 0x26b0	     */		cmp	%i4,2
/* 0x26b4	     */		ble,pt	%icc,.L900001113
/* 0x26b8	1222 */		add	%i4,-1,%o4

! Registers live out of .L900001114: 
! g2 g3 o0 o2 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001114

			.L77002167:
/* 0x26bc	1217 */		add	%i1,1,%i1

! Registers live out of .L77002167: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i0 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002167 .L900001002

			.L900001115:
/* 0x26c0	1217 */		add	%i2,1,%i2
/* 0x26c4	     */		cmp	%i1,2
/* 0x26c8	     */		ble,pt	%icc,.L900001112
/* 0x26cc	1218 */		cmp	%i1,1

! Registers live out of .L900001115: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i0 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001115

			.L77002171:
/* 0x26d0	1173 */		ld	[%sp+2355],%i1
/* 0x26d4	     */		ld	[%sp+2359],%l3
/* 0x26d8	     */		add	%l4,256,%l4
/* 0x26dc	     */		ld	[%sp+2363],%i2
/* 0x26e0	     */		add	%i1,1,%l2
/* 0x26e4	     */		st	%l2,[%sp+2355]
/* 0x26e8	     */		add	%l3,1,%o4
/* 0x26ec	     */		st	%o4,[%sp+2359]
/* 0x26f0	     */		add	%i2,3,%i5
/* 0x26f4	     */		st	%i5,[%sp+2363]
/* 0x26f8	     */		cmp	%l2,63
/* 0x26fc	     */		ble,a,pt	%icc,.L900001111
/* 0x2700	1180 */		ld	[%sp+2343],%i5

! Registers live out of .L77002171: 
! g2 g3 o0 sp l4 l5 l6 l7 i3 i5 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002171

			.L77002175:
/* 0x2704	1170 */		ld	[%sp+2339],%l4
/* 0x2708	     */		ld	[%sp+2331],%o2
/* 0x270c	     */		ld	[%sp+2335],%i4
/* 0x2710	     */		ldx	[%sp+2871],%o1
/* 0x2714	     */		add	%l4,1,%i2
/* 0x2718	     */		st	%i2,[%sp+2339]
/* 0x271c	     */		add	%o2,-3,%o3
/* 0x2720	     */		st	%o3,[%sp+2331]
/* 0x2724	     */		add	%i4,-1,%i0
/* 0x2728	     */		st	%i0,[%sp+2335]
/* 0x272c	     */		add	%o1,4,%o0
/* 0x2730	     */		stx	%o0,[%sp+2871]
/* 0x2734	     */		cmp	%i2,63
/* 0x2738	     */		ble,a,pt	%icc,.L900001110
/* 0x273c	1173 */		ld	[%sp+2347],%o2

! Registers live out of .L77002175: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002175

			.L77002179:
/* 0x2740	   0 */		add	%sp,2503,%i5
/* 0x2744	1257 */		std	%f44,[%sp+2879]
/* 0x2748	1261 */		sethi	%gdop_hix22(.L324),%i4
/* 0x274c	1257 */		mov	%i5,%o1
/* 0x2750	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x2754	     */		mov	3,%o0
/* 0x2758	1259 */		ldx	[%sp+2551],%o0
/* 0x275c	     */		ldx	[%sp+2559],%o1
/* 0x2760	     */		ldx	[%i5],%o2
/* 0x2764	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x2768	     */		ldx	[%sp+2511],%o3
/* 0x276c	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o7
/* 0x2770	1260 */		stx	%o0,[%sp+3087]
/* 0x2774	   0 */		xor	%o7,%gdop_lox10(.L___const_seg_900000101),%l2
/* 0x2778	1260 */		ldd	[%sp+3087],%f0
/* 0x277c	   0 */		ldx	[%l7+%l2],%i1,%gdop(.L___const_seg_900000101)
/* 0x2780	1259 */		mov	%o0,%o2
/* 0x2784	1260 */		ldx	[%sp+2703],%o0
/* 0x2788	     */		sethi	%gdop_hix22(.L386),%o3
/* 0x278c	     */		xor	%o3,%gdop_lox10(.L386),%i0
/* 0x2790	     */		ldd	[%i1+24],%f4
/* 0x2794	     */		fmovs	%f1,%f3
/* 0x2798	     */		fmovs	%f0,%f7
/* 0x279c	     */		ldd	[%i1+32],%f36
/* 0x27a0	     */		ldd	[%i1+64],%f40
/* 0x27a4	     */		ldx	[%l7+%i0],%o1,%gdop(.L386)
/* 0x27a8	     */		fmovs	%f4,%f2
/* 0x27ac	     */		fmovs	%f4,%f6
/* 0x27b0	     */		fsubd	%f2,%f4,%f32
/* 0x27b4	     */		fsubd	%f6,%f4,%f34
/* 0x27b8	     */		fabsd	%f32,%f38
/* 0x27bc	     */		fabsd	%f34,%f32
/* 0x27c0	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x27c4	     */		fdivd	%f32,%f40,%f32
/* 0x27c8	     */		std	%f32,[%sp+3095]
/* 0x27cc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x27d0	     */		ldx	[%sp+3095],%o3
/* 0x27d4	1261 */		sethi	%gdop_hix22(__iob),%o0
/* 0x27d8	     */		xor	%i4,%gdop_lox10(.L324),%g1
/* 0x27dc	     */		ldx	[%sp+2703],%o2
/* 0x27e0	     */		xor	%o0,%gdop_lox10(__iob),%o4
/* 0x27e4	     */		ldx	[%l7+%g1],%o1,%gdop(.L324)
/* 0x27e8	     */		ldx	[%l7+%o4],%l3,%gdop(__iob)
/* 0x27ec	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x27f0	     */		add	%l3,256,%o0
/* 0x27f4	1262 */		ldx	[%sp+2535],%o2
/* 0x27f8	     */		ldx	[%sp+2751],%o1
/* 0x27fc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2800	     */		mov	%l6,%o0
/* 0x2804	1263 */		ldx	[%sp+2703],%o1
/* 0x2808	     */		ldub	[%o1],%i3

! Registers live out of .L77002179: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002179 .L900000262

			.L900001109:
/* 0x280c	1263 */		brz,pn	%i3,.L900000263
/* 0x2810	     */		add	%o1,1,%o1

! Registers live out of .L900001109: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001109

			.L900000262:
/* 0x2814	1263 */		ldub	[%o1],%o5
/* 0x2818	     */		add	%o1,1,%o1
/* 0x281c	     */		brnz,a,pt	%o5,.L900001109
/* 0x2820	     */		ldub	[%o1],%i3

! Registers live out of .L900000262: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000262 .L900001109

			.L900000263:
/* 0x2824	1263 */		ldx	[%sp+2703],%o5
/* 0x2828	     */		sub	%o1,1,%i2
/* 0x282c	     */		mov	290,%o4
/* 0x2830	     */		ldx	[%sp+2751],%o2
/* 0x2834	     */		mov	10,%o3
/* 0x2838	     */		ldx	[%sp+2775],%o1
/* 0x283c	     */		sub	%i2,%o5,%i1
/* 0x2840	     */		sra	%i1,0,%i5
/* 0x2844	     */		stx	%i5,[%sp+2223]
/* 0x2848	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x284c	     */		mov	%l6,%o0
/* 0x2850	     */		ba	.L900001067

! 1566		      !                                    fprintf (stderr,"FAIL : file %s can not be cr
! 1566		      >eated.\n",timestamp_filename);
! 1567		      !                                    dumper_flag = -1;
! 1568		      !                                } else {
! 1569		      !                                    errno = 0;
! 1570		      !                                    fp = fopen(timestamp_filename, "wb");
! 1571		      !                                    if ( fp == NULL ) {
! 1572		      !                                        perror("FAIL ");
! 1573		      !                                        dumper_flag = -1;
! 1574		      !                                    } else {
! 1575		      !                                        /* finally we know we have a file */
! 1576		      !                                        fprintf (stderr,"INFO : file %s dump begi
! 1576		      >ns.\n",timestamp_filename);
! 1577		      !                                        size_t num_written;
! 1578		      !                                        uint64_t rotated64;
! 1579		      !                                        uint32_t rotated32;
! 1581		      !                                        /* guess the architecture endianess */
! 1582		      !                                        int end_check = 1;
! 1583		      !                                        /* strictly speaking this is not a wise w
! 1583		      >ay to do this */
! 1584		      !                                        uint8_t endian_flag = (*(uint8_t*)&end_ch
! 1584		      >eck == 1) ? 0 : 16;
! 1586		      !                                        /* if the machine is big endian we get en
! 1586		      >dian_flag = 0x10 */
! 1587		      !                                        /* we don't care anymore .... do we ??
! 1588		      !                                         *
! 1589		      !                                        size_t num_written = fwrite(&endian_flag,
! 1589		      > sizeof(uint8_t), 1, fp);
! 1590		      !                                        printf("DBUG : %2lu byte uint8_t endian_f
! 1590		      >lag   num_written = %lu\n",
! 1591		      !                                                sizeof(uint8_t), num_written);
! 1592		      !                                         */
! 1594		      !                                        /* for the header data do the rotates sep
! 1594		      >arately */
! 1595		      !                                        if ( endian_flag ) {
! 1596		      !                                            rotated32 = rot4(num_elements);
! 1597		      !                                            num_written = fwrite(&rotated32, size
! 1597		      >of(uint32_t), 1, fp);
! 1598		      !                                        } else {
! 1599		      !                                            num_written = fwrite(&num_elements, s
! 1599		      >izeof(uint32_t), 1, fp);
! 1600		      !                                        }
! 1601		      !                                        printf("     : %2lu byte uint32_t num_ele
! 1601		      >ments num_written = %lu\n",
! 1602		      !                                                    sizeof(uint32_t), num_written
! 1602		      >);
! 1603		      !                                        printf("     : num_elements = %8i\n",num_
! 1603		      >elements);
! 1604		      !                                    
! 1605		      !                                        if ( endian_flag ) {
! 1606		      !                                            rotated32 = rot4(mand_bail);
! 1607		      !                                            num_written = fwrite(&rotated32, size
! 1607		      >of(uint32_t), 1, fp);
! 1608		      !                                        } else {
! 1609		      !                                            num_written = fwrite(&mand_bail, size
! 1609		      >of(uint32_t), 1, fp);
! 1610		      !                                        }
! 1611		      !                                        printf("     : %2lu byte uint32_t mand_ba
! 1611		      >il    num_written = %lu\n",
! 1612		      !                                                sizeof(uint32_t), num_written);
! 1613		      !                                        printf("     : mand_bail = %8i\n",mand_ba
! 1613		      >il);
! 1614		      !                                    
! 1615		      !                                        /* need to swap around bytes of the 8-byt
! 1615		      >e floating point double */
! 1616		      !                                        if ( endian_flag ) {
! 1617		      !                                            rotated64 = rot8(*((uint64_t *)&magni
! 1617		      >fy));
! 1618		      !                                            num_written = fwrite(&rotated64, size
! 1618		      >of(uint64_t), 1, fp);
! 1619		      !                                        } else {
! 1620		      !                                            num_written = fwrite(&magnify, sizeof
! 1620		      >(double), 1, fp);
! 1621		      !                                        }
! 1622		      !                                        printf("     : %2lu byte double magnify  
! 1622		      >      num_written = %lu\n",
! 1623		      !                                                sizeof(double), num_written);
! 1624		      !                                        printf("     :        magnify = %-+32.26e
! 1624		      >\n", magnify);
! 1625		      !                                    
! 1626		      !                                        if ( endian_flag ) {
! 1627		      !                                            rotated64 = rot8(*((uint64_t *)&real_
! 1627		      >translate));
! 1628		      !                                            num_written = fwrite(&rotated64, size
! 1628		      >of(uint64_t), 1, fp);
! 1629		      !                                        } else {
! 1630		      !                                            num_written = fwrite(&real_translate,
! 1630		      > sizeof(double), 1, fp);
! 1631		      !                                        }
! 1632		      !                                        printf("DBUG : %2lu byte double real_tran
! 1632		      >slate num_written = %lu\n",
! 1633		      !                                                sizeof(double), num_written);
! 1634		      !                                        printf("     : real_translate = %-+32.26e
! 1634		      >\n",real_translate);
! 1635		      !                                    
! 1636		      !                                        if ( endian_flag ) {
! 1637		      !                                            rotated64 = rot8(*((uint64_t *)&imag_
! 1637		      >translate));
! 1638		      !                                            num_written = fwrite(&rotated64, size
! 1638		      >of(uint64_t), 1, fp);
! 1639		      !                                        } else {
! 1640		      !                                            num_written = fwrite(&imag_translate,
! 1640		      > sizeof(double), 1, fp);
! 1641		      !                                        }
! 1642		      !                                        printf("     : %2lu byte double imag_tran
! 1642		      >slate num_written = %lu\n",
! 1643		      !                                                sizeof(double), num_written);
! 1644		      !                                        printf("     : imag_translate = %-+32.26e
! 1644		      >\n",imag_translate);
! 1646		      !                                        /* dump a few select reference data point
! 1646		      >s */
! 1647		      !                                        if ( endian_flag ) {
! 1649		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1649		      >d_r[array_offset(0,0,0,0)])));
! 1650		      !                                            num_written = fwrite(&rotated64, size
! 1650		      >of(uint64_t), 1, fp);
! 1651		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1651		      >d_j[array_offset(0,0,0,0)])));
! 1652		      !                                            num_written = fwrite(&rotated64, size
! 1652		      >of(uint64_t), 1, fp);
! 1653		      !                                            /* the mandel_val is essentially an i
! 1653		      >nt */
! 1654		      !                                            rotated32 = rot4(mandel_val[0][0][0][
! 1654		      >0] );
! 1655		      !                                            num_written = fwrite(&rotated32, size
! 1655		      >of(uint32_t), 1, fp);
! 1657		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1657		      >d_r[array_offset(7,7,63,63)])));
! 1658		      !                                            num_written = fwrite(&rotated64, size
! 1658		      >of(uint64_t), 1, fp);
! 1659		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1659		      >d_j[array_offset(7,7,63,63)])));
! 1660		      !                                            num_written = fwrite(&rotated64, size
! 1660		      >of(uint64_t), 1, fp);
! 1661		      !                                            rotated32 = rot4(mandel_val[7][7][63]
! 1661		      >[63] );
! 1662		      !                                            num_written = fwrite(&rotated32, size
! 1662		      >of(uint32_t), 1, fp);
! 1664		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1664		      >d_r[array_offset(8,8,0,0)])));
! 1665		      !                                            num_written = fwrite(&rotated64, size
! 1665		      >of(uint64_t), 1, fp);
! 1666		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1666		      >d_j[array_offset(8,8,0,0)])));
! 1667		      !                                            num_written = fwrite(&rotated64, size
! 1667		      >of(uint64_t), 1, fp);
! 1668		      !                                            rotated32 = rot4(mandel_val[8][8][0][
! 1668		      >0] );
! 1669		      !                                            num_written = fwrite(&rotated32, size
! 1669		      >of(uint32_t), 1, fp);
! 1671		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1671		      >d_r[array_offset(8,8,1,0)])));
! 1672		      !                                            num_written = fwrite(&rotated64, size
! 1672		      >of(uint64_t), 1, fp);
! 1673		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1673		      >d_j[array_offset(8,8,1,0)])));
! 1674		      !                                            num_written = fwrite(&rotated64, size
! 1674		      >of(uint64_t), 1, fp);
! 1675		      !                                            rotated32 = rot4(mandel_val[8][8][1][
! 1675		      >0] );
! 1676		      !                                            num_written = fwrite(&rotated32, size
! 1676		      >of(uint32_t), 1, fp);
! 1678		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1678		      >d_r[array_offset(8,8,32,32)])));
! 1679		      !                                            num_written = fwrite(&rotated64, size
! 1679		      >of(uint64_t), 1, fp);
! 1680		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1680		      >d_j[array_offset(8,8,32,32)])));
! 1681		      !                                            num_written = fwrite(&rotated64, size
! 1681		      >of(uint64_t), 1, fp);
! 1682		      !                                            rotated32 = rot4(mandel_val[8][8][32]
! 1682		      >[32] );
! 1683		      !                                            num_written = fwrite(&rotated32, size
! 1683		      >of(uint32_t), 1, fp);
! 1685		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1685		      >d_r[array_offset(3,12,44,21)])));
! 1686		      !                                            num_written = fwrite(&rotated64, size
! 1686		      >of(uint64_t), 1, fp);
! 1687		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1687		      >d_j[array_offset(3,12,44,21)])));
! 1688		      !                                            num_written = fwrite(&rotated64, size
! 1688		      >of(uint64_t), 1, fp);
! 1689		      !                                            rotated32 = rot4(mandel_val[3][12][44
! 1689		      >][21] );
! 1690		      !                                            num_written = fwrite(&rotated32, size
! 1690		      >of(uint32_t), 1, fp);
! 1692		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1692		      >d_r[array_offset(15,15,63,63)])));
! 1693		      !                                            num_written = fwrite(&rotated64, size
! 1693		      >of(uint64_t), 1, fp);
! 1694		      !                                            rotated64 = rot8(*((uint64_t *)(&coor
! 1694		      >d_j[array_offset(15,15,63,63)])));
! 1695		      !                                            num_written = fwrite(&rotated64, size
! 1695		      >of(uint64_t), 1, fp);
! 1696		      !                                            rotated32 = rot4(mandel_val[15][15][6
! 1696		      >3][63] );
! 1697		      !                                            num_written = fwrite(&rotated32, size
! 1697		      >of(uint32_t), 1, fp);
! 1699		      !                                        } else {
! 1700		      !                                            /* dump the data from little endian m
! 1700		      >achines */
! 1701		      !                                            num_written = fwrite(&coord_r[array_o
! 1701		      >ffset(0,0,0,0)], sizeof(double), 1, fp);
! 1702		      !                                            num_written = fwrite(&coord_j[array_o
! 1702		      >ffset(0,0,0,0)], sizeof(double), 1, fp);
! 1703		      !                                            num_written = fwrite(&mandel_val[0][0
! 1703		      >][0][0], sizeof(uint32_t), 1, fp);
! 1705		      !                                            num_written = fwrite(&coord_r[array_o
! 1705		      >ffset(7,7,63,63)], sizeof(double), 1, fp);
! 1706		      !                                            num_written = fwrite(&coord_j[array_o
! 1706		      >ffset(7,7,63,63)], sizeof(double), 1, fp);
! 1707		      !                                            num_written = fwrite(&mandel_val[7][7
! 1707		      >][63][63], sizeof(uint32_t), 1, fp);
! 1709		      !                                            num_written = fwrite(&coord_r[array_o
! 1709		      >ffset(8,8,0,0)], sizeof(double), 1, fp);
! 1710		      !                                            num_written = fwrite(&coord_j[array_o
! 1710		      >ffset(8,8,0,0)], sizeof(double), 1, fp);
! 1711		      !                                            num_written = fwrite(&mandel_val[8][8
! 1711		      >][0][0], sizeof(uint32_t), 1, fp);
! 1713		      !                                            num_written = fwrite(&coord_r[array_o
! 1713		      >ffset(8,8,1,0)], sizeof(double), 1, fp);
! 1714		      !                                            num_written = fwrite(&coord_j[array_o
! 1714		      >ffset(8,8,1,0)], sizeof(double), 1, fp);
! 1715		      !                                            num_written = fwrite(&mandel_val[8][8
! 1715		      >][1][0], sizeof(uint32_t), 1, fp);
! 1717		      !                                            num_written = fwrite(&coord_r[array_o
! 1717		      >ffset(8,8,32,32)], sizeof(double), 1, fp);
! 1718		      !                                            num_written = fwrite(&coord_j[array_o
! 1718		      >ffset(8,8,32,32)], sizeof(double), 1, fp);
! 1719		      !                                            num_written = fwrite(&mandel_val[8][8
! 1719		      >][32][32], sizeof(uint32_t), 1, fp);
! 1721		      !                                            num_written = fwrite(&coord_r[array_o
! 1721		      >ffset(3,12,44,21)], sizeof(double), 1, fp);
! 1722		      !                                            num_written = fwrite(&coord_j[array_o
! 1722		      >ffset(3,12,44,21)], sizeof(double), 1, fp);
! 1723		      !                                            num_written = fwrite(&mandel_val[3][1
! 1723		      >2][44][21], sizeof(uint32_t), 1, fp);
! 1725		      !                                            num_written = fwrite(&coord_r[array_o
! 1725		      >ffset(15,15,63,63)], sizeof(double), 1, fp);
! 1726		      !                                            num_written = fwrite(&coord_j[array_o
! 1726		      >ffset(15,15,63,63)], sizeof(double), 1, fp);
! 1727		      !                                            num_written = fwrite(&mandel_val[15][
! 1727		      >15][63][63], sizeof(uint32_t), 1, fp);
! 1728		      !                                        }
! 1730		      !                                        fclose(fp);
! 1731		      !                                        fprintf (stderr,"INFO : file %s closed.\n
! 1731		      >",timestamp_filename);
! 1732		      !                                    }
! 1733		      !                                }
! 1734		      !                                free(timestamp_filename);
! 1735		      !                                /* if the dumper flag is -1 then we need to
! 1736		      !                                 * indicate that the dump is impossible */
! 1737		      !                                if ( dumper_flag < 0 ) {
! 1738		      !                                    sprintf(buf,"Bad TMPDIR");
! 1739		      !                                    XSetForeground(dsp, gc2, red.pixel);
! 1740		      !                                    XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 
! 1740		      >20);
! 1741		      !                                    XDrawImageString(dsp, win2, gc2, 220, 178, bu
! 1741		      >f, (int)strlen(buf));
! 1742		      !                                    sprintf(buf,"DUMPER");
! 1743		      !                                    XDrawImageString(dsp, win2, gc2, 332, 177, bu
! 1743		      >f, (int)strlen(buf));
! 1744		      !                                    XDrawLine(dsp, win2, gc2, 320, 162, 392, 182)
! 1744		      >;
! 1745		      !                                    XDrawLine(dsp, win2, gc2, 320, 182, 392, 162)
! 1745		      >;
! 1746		      !                                } else {
! 1747		      !                                    fprintf(stderr,"INFO : dumper_flag = 0\n");
! 1748		      !                                    dumper_flag = 0;
! 1749		      !                                }
! 1751		      !                            } else {
! 1752		      !                                /* indicate that the data is not ready */
! 1753		      !                                sprintf(buf,"No Data");
! 1754		      !                                XSetForeground(dsp, gc2, red.pixel);
! 1755		      !                                XDrawImageString(dsp, win2, gc2, 220, 178, buf, (
! 1755		      >int)strlen(buf));
! 1756		      !                            }
! 1757		      !                        }
! 1758		      !                    }
! 1759		      !                }
! 1760		      !            }
! 1762		      !        } else if ( button == Button2 ) {
! 1764		      !replot:
! 1765		      !            /* determine if we are inside the primary window plotting region */
! 1766		      !            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
! 1767		      !                 && ( mouse_x < ( eff_width + offset_x ) )
! 1768		      !                 && ( mouse_y < ( eff_height + offset_y ) ) ) {
! 1770		      !                /****************************************************
! 1771		      !                 * The next chunk is pretty but means little for the
! 1772		      !                 * actual computions needed later. All we do is look
! 1773		      !                 * at the mouse coordinates here/
! 1774		      !                 * **************************************************/
! 1776		      !                /* invert the y axis */
! 1777		      !                invert_mouse_y = eff_height - mouse_y + offset_y;
! 1778		      !                sample_r = ( mouse_x - offset_x );
! 1779		      !                sample_j = invert_mouse_y;
! 1780		      !                printf("DBUG : sample space [ %-6i, %-6i ]\n", sample_r, sample_j
! 1780		      >);
! 1782		      !                fp_region(sample_r, sample_j, eff_width, eff_height, &coord);
! 1783		      !                win_r = coord.r;
! 1784		      !                win_j = coord.j;
! 1786		      !                XSetForeground(dsp, gc2, green.pixel);
! 1787		      !                sprintf(buf,"fp64( %-10.8e , %-10.8e )", win_r, win_j );
! 1788		      !                XDrawImageString( dsp, win2, gc2, 10, 250, buf, (int)strlen(buf))
! 1788		      >;
! 1790		      !                /* vbox[] coordinates for the 16x16 grid */
! 1791		      !                vbox_r = ( mouse_x - offset_x ) / vbox_w;
! 1792		      !                vbox_j = ( eff_height - mouse_y + offset_y ) / vbox_h;
! 1793		      !                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_r, vbox_j );
! 1794		      !                printf("     : %s\n",buf);
! 1795		      !                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf))
! 1795		      >;
! 1797		      !                printf("     : win_r = %-+32.26e\n", win_r );
! 1798		      !                printf("     : win_j = %-+32.26e\n", win_j );
! 1800		      !                XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1801		      !                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )  ", win_r, win_j );
! 1802		      !                XDrawImageString( dsp, win2, gc2, 10, 290, buf, (int)strlen(buf))
! 1802		      >;
! 1804		      !                /* translation and offset into the centre of a sample region */
! 1805		      !                fp_translate(win_r, win_j, magnify, real_translate, imag_translat
! 1805		      >e, &coord);
! 1806		      !                x_prime = coord.r;
! 1807		      !                y_prime = coord.j;
! 1809		      !                printf("     : after translation\n");
! 1810		      !                printf("     : r_trn   = %-+32.26e\n", real_translate );
! 1811		      !                printf("     : j_trn   = %-+32.26e\n", imag_translate );
! 1812		      !                printf("     : x_prime = %-+32.26e\n", x_prime );
! 1813		      !                printf("     : y_prime = %-+32.26e\n", y_prime );
! 1814		      !                /****************************************************
! 1815		      !                 *    NONE OF THE ABOVE HAS much to do with the
! 1816		      !                 *    actual computations needed. All we did was
! 1817		      !                 *    determine the complex coordinates of the
! 1818		      !                 *    mouse in the sample space.
! 1819		      !                 ****************************************************/
! 1821		      !                XSetForeground(dsp, gc3, red.pixel);
! 1822		      !                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime 
! 1822		      >);
! 1823		      !                XDrawImageString( dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));
! 1825		      !                XSetForeground(dsp, gc3, green.pixel);
! 1826		      !                sprintf(buf,"bailout = %-8i          ", mand_bail);
! 1827		      !                printf("     : %s\n", buf);
! 1828		      !                XDrawImageString( dsp, win3, gc3, 10, 100, buf, (int)strlen(buf))
! 1828		      >;
! 1830		      !                sprintf(buf,"magnify = %-12.10e", magnify);
! 1831		      !                printf("     : magnify = %-18.12e\n", magnify);
! 1832		      !                XDrawImageString( dsp, win3, gc3, 10, 120, buf, (int)strlen(buf))
! 1832		      >;
! 1834		      !                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, i
! 1834		      >mag_translate);
! 1835		      !                XDrawImageString( dsp, win3, gc3, 10, 140, buf, (int)strlen(buf))
! 1835		      >;
! 1836		      !                XSetForeground(dsp, gc3, cyan.pixel);
! 1838		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );
! 1840		      !                if ( colour_method_flag == 1 ) {
! 1841		      !                    colour_method_flag = 0;
! 1842		      !                } else {
! 1843		      !                    colour_method_flag = 1;
! 1844		      !                    if ( invert_me_dammit == 0 ) {
! 1845		      !                        invert_me_dammit = 1;
! 1846		      !                    } else {
! 1847		      !                        invert_me_dammit = 0;
! 1848		      !                    }
! 1849		      !                }
! 1851		      !                /* here we loop over the vbox coords */
! 1852		      !                for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ ) {
! 1853		      !                    for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_r++ ) {
! 1854		      !                        /* printf("     : vbox [ %-3i, %-3i ]\n", vbox_r, vbox_j)
! 1854		      >; */
! 1855		      !                        /* loop over the pixels ( samples ) inside a vbox */
! 1856		      !                        /* TODO grind the gears */
! 1857		      !                        if ( vbox_flag[vbox_r][vbox_j] == 0 ) {
! 1858		      !                            clock_gettime(CLOCK_REALTIME, &vbox_t0 );
! 1859		      !                            for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix
! 1859		      >++ ) {
! 1860		      !                                vbox_ll_y = vbox_j * vbox_h + mand_y_pix;
! 1861		      !                                sample_j = vbox_ll_y;
! 1862		      !                                for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x
! 1862		      >_pix++ ) {
! 1863		      !                                    vbox_ll_x = vbox_r * vbox_w + mand_x_pix;
! 1865		      !                                    sample_r = vbox_ll_x;
! 1867		      !                                    fp_vbox(vbox_r, vbox_j, mand_x_pix, mand_y_pi
! 1867		      >x, eff_width, eff_height, &coord);
! 1868		      !                                    win_r = coord.r;
! 1869		      !                                    win_j = coord.j;
! 1871		      !                                    fp_translate(win_r, win_j, magnify, real_tran
! 1871		      >slate, imag_translate, &coord);
! 1872		      !                                    x_prime = coord.r;
! 1873		      !                                    y_prime = coord.j;
! 1875		      !                                    /* DEBUGGARY *
! 1876		      !                                    printf("     : sample[%-4i][%-4i] -> Wr = %-+
! 1876		      >32.26e\n", sample_r, sample_j, win_r);
! 1877		      !                                    printf("     :                    -> Wj = %-+
! 1877		      >32.26e\n", win_j);
! 1878		      !                                    printf("     : r[%-2i][%-2i][%-2i][%-2i] = %-
! 1878		      >+32.26e\n",vbox_r,vbox_j,mand_x_pix,mand_y_pix,x_prime);
! 1879		      !                                    printf("     : j[%-2i][%-2i][%-2i][%-2i] = %-
! 1879		      >+32.26e\n",vbox_r,vbox_j,mand_x_pix,mand_y_pix,y_prime);
! 1882		      !                                    if (( vbox_r == 3 ) && ( vbox_j == 12 ) && ( 
! 1882		      >mand_x_pix == 44) && ( mand_y_pix == 21) ) {
! 1883		      !                                        printf("wtf\n");
! 1884		      !                                        printf("WTF  :     normalized Wr = %-+32.
! 1884		      >26e\n", win_r);
! 1885		      !                                        printf("WTF  :                Wj = %-+32.
! 1885		      >26e\n", win_j);
! 1886		      !                                        printf("WTF  : r[ 3][12][44][21] = %-+32.
! 1886		      >26e\n", x_prime);
! 1887		      !                                        printf("WTF  : j[ 3][12][44][21] = %-+32.
! 1887		      >26e\n", y_prime);
! 1888		      !                                    }
! 1889		      !                                    */
! 1891		      !                                    if ( vbox_flag[vbox_r][vbox_j] == 1 ) {
! 1892		      !                                        mand_height = mandel_val[vbox_r][vbox_j][
! 1892		      >mand_x_pix][mand_y_pix];
! 1893		      !                                    } else {
! 1894		      !                                        coord_r[array_offset(vbox_r,vbox_j,mand_x
! 1894		      >_pix,mand_y_pix)] = x_prime; 
! 1895		      !                                        coord_j[array_offset(vbox_r,vbox_j,mand_x
! 1895		      >_pix,mand_y_pix)] = y_prime;
! 1896		      !                                        /* the actual mandelbrot computation for 
! 1896		      >(x_prime, y_prime) */
! 1897		      !                                        mand_height = mbrot(x_prime, y_prime, man
! 1897		      >d_bail);
! 1898		      !                                        /* TODO only you can prevent stack abuse 
! 1898		      >*/
! 1899		      !                                        mandel_val[vbox_r][vbox_j][mand_x_pix][ma
! 1899		      >nd_y_pix] = mand_height;
! 1900		      !                                    }
! 1902		      !                                    if ( colour_method_flag == 1 ) {
! 1904		      !                                        if ( invert_me_dammit == 0 ) {
! 1905		      !                                            t_param = pow( ( (double)mand_height 
! 1905		      >/ (double)mand_bail ), t_param_exponent);
! 1906		      !                                        } else {
! 1907		      !                                            t_param = pow( 1.0 - ( (double)mand_h
! 1907		      >eight / (double)mand_bail ), t_param_exponent);
! 1908		      !                                        }
! 1910		      !                                        gamma_factor = pow( t_param, gamma );
! 1912		      !                                        red_level  =  gamma_factor + ( hue * gamm
! 1912		      >a_factor * ( 1.0 - gamma_factor )
! 1913		      !                                                        * ( -0.14861 * cos( 2.0 *
! 1913		      > M_PI * ( shift/3.0 + rotation * t_param ) )
! 1914		      !                                                        + 1.78277 * sin( 2.0 * M_
! 1914		      >PI * ( shift/3.0 + rotation * t_param ))))/2.0;
! 1916		      !                                        green_level = gamma_factor + ( hue * gamm
! 1916		      >a_factor * ( 1.0 - gamma_factor )
! 1917		      !                                                        * ( -0.29227 * cos( 2.0 *
! 1917		      > M_PI * ( shift/3.0 + rotation * t_param ) )
! 1918		      !                                                        - 0.90649 * sin( 2.0 * M_
! 1918		      >PI * ( shift/3.0 + rotation * t_param ))))/2.0;
! 1920		      !                                        blue_level  = gamma_factor + ( hue * gamm
! 1920		      >a_factor * ( 1.0 - gamma_factor)
! 1921		      !                                                        * (1.97294 * cos( 2.0 * M
! 1921		      >_PI * (shift/3.0 + rotation * t_param ))))/2.0;
! 1923		      !                                        red_bits     = (uint8_t) ( 255.0 * ( red_
! 1923		      >level > 1.0 ? 1.0 :
! 1924		      !                                                                           ( red_
! 1924		      >level < 0.0 ? 0.0 : red_level ) ) );
! 1926		      !                                        green_bits   = (uint8_t) ( 255.0 * ( gree
! 1926		      >n_level > 1.0 ? 1.0 :
! 1927		      !                                                                           ( gree
! 1927		      >n_level < 0.0 ? 0.0 : green_level ) ) );
! 1929		      !                                        blue_bits    = (uint8_t) ( 255.0 * ( blue
! 1929		      >_level > 1.0 ? 1.0 :
! 1930		      !                                                                           ( blue
! 1930		      >_level < 0.0 ? 0.0 : blue_level ) ) );
! 1933		      !                                        mandlebrot.pixel = (unsigned long)( ( red
! 1933		      >_bits<<16 ) + ( green_bits<<8 ) + blue_bits );
! 1935		      !                                        XSetForeground(dsp, gc, mandlebrot.pixel)
! 1935		      >;
! 1937		      !                                    } else {
! 1939		      !                                        if ( mand_height == mand_bail ) {
! 1940		      !                                            XSetForeground(dsp, gc, (unsigned lon
! 1940		      >g)0 );
! 1941		      !                                        } else {
! 1942		      !                                            mandlebrot.pixel = lsd_trippy[ (uint8
! 1942		      >_t)(mand_height & 0xff) ];
! 1943		      !                                            XSetForeground(dsp, gc, mandlebrot.pi
! 1943		      >xel);
! 1944		      !                                        }
! 1945		      !                                    }
! 1947		      !                                    XDrawPoint(dsp, win, gc, vbox_ll_x + offset_x
! 1947		      >, ( eff_height - vbox_ll_y + offset_y ) );
! 1949		      !                                }
! 1950		      !                            }
! 1951		      !                            vbox_flag[vbox_r][vbox_j] = 1;
! 1952		      !                            clock_gettime(CLOCK_REALTIME, &vbox_t1 );
! 1953		      !                            t_delta = timediff( vbox_t0, vbox_t1);
! 1954		      !                            sprintf(buf,"[vbox] = %14" PRIu64 " nsec   %08.6e sec
! 1954		      >", t_delta, ((double)t_delta)/1.0e9);
! 1955		      !                            XSetForeground(dsp, gc3, yellow.pixel);
! 1956		      !                            XDrawImageString( dsp, win3, gc3, 10, 310, buf, (int)
! 1956		      >strlen(buf));
! 1957		      !                        }
! 1958		      !                    } /* vbox_r for */
! 1959		      !                } /* vbox_j for */
! 1961		      !                /* reset the mand_bail adjustment parameters */
! 1962		      !                bail_out_factor = 1.0;
! 1963		      !                bail_out_jank = 10;
! 1964		      !            } /* inside main plot area check */
! 1966		      !            XSetForeground(dsp, gc, yellow.pixel);
! 1967		      !            clock_gettime(CLOCK_REALTIME, &soln_t1 );
! 1968		      !            t_delta = timediff( soln_t0, soln_t1 );
! 1969		      !            sprintf(buf,"[mand] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((do
! 1969		      >uble)t_delta)/1.0e9);
! 1970		      !            fprintf(stderr,"%s\n\n",buf);
! 1971		      !            XSetForeground(dsp, gc2, red.pixel);
! 1972		      !            XDrawImageString( dsp, win2, gc2, 10, 310, buf, (int)strlen(buf));
! 1974		      !            printf("\nraw data values -------------------------------------------
! 1974		      >------------\n");
! 1976		      !            printf("     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1976		      >fset(0,0,0,0)));
! 1977		      !            printf("     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1977		      >fset(0,0,0,0)));
! 1978		      !            printf("     :       mand_height = %9i\n", mandel_val[0][0][0][0] );
! 1980		      !            printf("     : r[ 7][ 7][63][63] = %-+32.26e\n", *(coord_r + array_of
! 1980		      >fset(7,7,63,63)));
! 1981		      !            printf("     : j[ 7][ 7][63][63] = %-+32.26e\n", *(coord_j + array_of
! 1981		      >fset(7,7,63,63)));
! 1982		      !            printf("     :       mand_height = %9i\n", mandel_val[ 7][ 7][63][63]
! 1982		      > );
! 1984		      !            printf("     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1984		      >fset(8,8,0,0)));
! 1985		      !            printf("     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1985		      >fset(8,8,0,0)));
! 1986		      !            printf("     :       mand_height = %9i\n", mandel_val[8][8][0][0] );
! 1988		      !            printf("     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1988		      >fset(8,8,1,0)));
! 1989		      !            printf("     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1989		      >fset(8,8,1,0)));
! 1990		      !            printf("     :       mand_height = %9i\n", mandel_val[8][8][1][0] );
! 1992		      !            printf("     : r[ 8][ 8][32][32] = %-+32.26e\n", *(coord_r + array_of
! 1992		      >fset(8,8,32,32)));
! 1993		      !            printf("     : j[ 8][ 8][32][32] = %-+32.26e\n", *(coord_j + array_of
! 1993		      >fset(8,8,32,32)));
! 1994		      !            printf("     :       mand_height = %9i\n", mandel_val[8][8][32][32] )
! 1994		      >;
! 1996		      !            printf("     : r[ 3][12][44][21] = %-+32.26e\n", *(coord_r + array_of
! 1996		      >fset(3,12,44,21)));
! 1997		      !            printf("     : j[ 3][12][44][21] = %-+32.26e\n", *(coord_j + array_of
! 1997		      >fset(3,12,44,21)));
! 1998		      !            printf("     :       mand_height = %9i\n", mandel_val[3][12][44][21])
! 1998		      >;
! 2000		      !            printf("     : r[15][15][63][63] = %-+32.26e\n", *(coord_r + array_of
! 2000		      >fset(15,15,63,63)));
! 2001		      !            printf("     : j[15][15][63][63] = %-+32.26e\n", *(coord_j + array_of
! 2001		      >fset(15,15,63,63)));
! 2002		      !            printf("     :       mand_height = %9i\n", mandel_val[15][15][63][63]
! 2002		      >);
! 2004		      !            printf("--------------------------- full plot done ------------------
! 2004		      >-----------\n");
! 2005		      !            
! 2006		      !        } else if ( button == Button3 ) {
! 2008		      !            printf("right click\n");
! 2009		      !            clock_gettime(CLOCK_REALTIME, &t1 );
! 2010		      !            t_delta = timediff( t0, t1 );
! 2012		      !            sprintf(buf,"[%04i] tdelta = %14" PRIu64 " nsec", right_count, t_delt
! 2012		      >a);
! 2014		      !            XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));
! 2016		      !            t0.tv_sec = t1.tv_sec;
! 2017		      !            t0.tv_nsec = t1.tv_nsec;
! 2018		      !            /* If a 200ms right double click anywhere then quit */
! 2019		      !            if ( t_delta < 200000000 ) {
! 2020		      !                printf("\n\n");
! 2021		      !                /* If we allocate memory for any purpose whatsoever
! 2022		      !                 * then we had better free() it. */
! 2023		      !                break;
! 2024		      !            }
! 2026		      !        } else if ( button == Button4 ) {
! 2028		      !            /* TODO note that a mouse wheel event being used here to
! 2029		      !             * track observation plane position will result in all
! 2030		      !             * data being redrawn. */
! 2031		      !            printf("roll up\n");
! 2033		      !        } else if ( button == Button5 ) {
! 2035		      !            printf("roll down\n");
! 2037		      !        } else {
! 2039		      !            printf("\n ??? unknown button ???\n");
! 2041		      !        }
! 2043		      !        printf("click at %d %d \n", mouse_x, mouse_y);

/* 0x2854	2043 */		nop

! Registers live out of .L900000263: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002099

			.L77003016:
/* 0x2858	1002 */		add	%i1,-2,%l2
/* 0x285c	     */		st	%l2,[%sp+2319]

! Registers live out of .L77003016: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002101 .L77002103 .L77002105 .L77003016

			.L77002181:
/* 0x2860	1271 */		cmp	%i3,1268
/* 0x2864	     */		ble,pn	%icc,.L77002525
/* 0x2868	     */		cmp	%i1,733

! Registers live out of .L77002181: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002181

			.L77002183:
/* 0x286c	1271 */		ble,pn	%icc,.L77002525
/* 0x2870	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%g4

! Registers live out of .L77002183: 
! g2 g3 g4 o0 o2 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002183

			.L77002185:
/* 0x2874	   0 */		xor	%g4,%gdop_lox10(.L___const_seg_900000101),%g5
/* 0x2878	1271 */		cmp	%i3,1440
/* 0x287c	   0 */		ldx	[%l7+%g5],%o5,%gdop(.L___const_seg_900000101)
/* 0x2880	1271 */		bl,pn	%icc,.L77002187
/* 0x2884	   0 */		add	%o5,72,%i2

! Registers live out of .L77002185: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002185

			.L77002854:
/* 0x2888	 914 */		cmp	%i1,783
/* 0x288c	     */		ble,pn	%icc,.L77002525
/* 0x2890	1423 */		cmp	%i1,915

! Registers live out of .L77002854: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002854

			.L77002225:
/* 0x2894	1423 */		ble,pn	%icc,.L77002261
/* 0x2898	     */		cmp	%i3,1442

! Registers live out of .L77002225: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002225

			.L77002227:
/* 0x289c	1423 */		bl,a,pt	%icc,.L900001108
/* 0x28a0	     */		cmp	%i1,932

! Registers live out of .L77002227: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002227

			.L900001166:
/* 0x28a4	1423 */		ba	.L900001067
/* 0x28a8	2043 */		std	%f44,[%sp+2879]

! Registers live out of .L900001166: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002185

			.L77002187:
/* 0x28ac	1271 */		cmp	%i1,742
/* 0x28b0	     */		bge,pn	%icc,.L77002201
/* 0x28b4	1273 */		mov	1,%o4

! Registers live out of .L77002187: 
! g2 g3 o0 o2 o4 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002187

			.L77002700:
/* 0x28b8	1273 */		ldx	[%sp+2735],%o1
/* 0x28bc	     */		mov	0,%o5
/* 0x28c0	     */		mov	0,%o3
/* 0x28c4	     */		mov	8,%o2
/* 0x28c8	1275 */		mov	16,%i4
/* 0x28cc	1273 */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x28d0	     */		mov	%l6,%o0
/* 0x28d4	1274 */		ldx	[%l6+232],%g5
/* 0x28d8	1300 */		mov	223,%l2
/* 0x28dc	1274 */		ldx	[%sp+2727],%g4
/* 0x28e0	     */		mov	%l6,%o0
/* 0x28e4	1300 */		mov	0,%i2
/* 0x28e8	1274 */		ldx	[%sp+2735],%o1
/* 0x28ec	     */		add	%g5,%g4,%o2
/* 0x28f0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x28f4	     */		ldx	[%o2+96],%o2
/* 0x28f8	1275 */		mov	388,%o5
/* 0x28fc	     */		mov	16,%o4
/* 0x2900	     */		ldx	[%sp+2743],%o1
/* 0x2904	     */		mov	218,%o3
/* 0x2908	     */		mov	%l6,%o0
/* 0x290c	     */		stx	%i4,[%sp+2223]
/* 0x2910	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2914	     */		ldx	[%sp+2735],%o2
/* 0x2918	1277 */		mov	0,%o5
/* 0x291c	     */		ldx	[%sp+2735],%o1
/* 0x2920	     */		mov	1,%o4
/* 0x2924	     */		mov	0,%o3
/* 0x2928	     */		mov	1,%o2
/* 0x292c	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x2930	     */		mov	%l6,%o0
/* 0x2934	1284 */		ldx	[%sp+2535],%o2
/* 0x2938	     */		ldx	[%sp+2735],%o1
/* 0x293c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2940	     */		mov	%l6,%o0
/* 0x2944	1285 */		ldx	[%sp+2735],%o2
/* 0x2948	     */		mov	388,%o5
/* 0x294c	     */		ldx	[%sp+2743],%o1
/* 0x2950	     */		mov	16,%o4
/* 0x2954	     */		stx	%i4,[%sp+2223]
/* 0x2958	     */		mov	218,%o3
/* 0x295c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2960	     */		mov	%l6,%o0
/* 0x2964	1299 */		ldx	[%sp+2567],%o2
/* 0x2968	     */		ldx	[%sp+2735],%o1
/* 0x296c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2970	     */		mov	%l6,%o0
/* 0x2974	1302 */		sra	%l2,0,%o3
/* 0x2978	1300 */		ldd	[%sp+2879],%f44

! Registers live out of .L77002700: 
! g2 g3 o3 o5 sp l2 l5 l6 l7 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002700 .L900001107

			.L900001107:
/* 0x297c	1302 */		mov	20,%o0
/* 0x2980	     */		ldx	[%sp+2735],%o2
/* 0x2984	     */		mov	13,%o4
/* 0x2988	     */		stx	%o0,[%sp+2223]
/* 0x298c	     */		mov	%l6,%o0
/* 0x2990	1300 */		add	%i2,1,%i2
/* 0x2994	1302 */		ldx	[%sp+2743],%o1
/* 0x2998	     */		std	%f44,[%sp+2879]
/* 0x299c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x29a0	     */		mov	%o3,%o5
/* 0x29a4	1300 */		add	%l2,8,%l2
/* 0x29a8	     */		ldd	[%sp+2879],%f44
/* 0x29ac	     */		cmp	%i2,20
/* 0x29b0	     */		ble,pt	%icc,.L900001107
/* 0x29b4	1302 */		sra	%l2,0,%o3

! Registers live out of .L900001107: 
! g2 g3 o0 o3 o5 sp l2 l5 l6 l7 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001107

			.L77002197:
/* 0x29b8	1305 */		ldx	[%sp+2519],%o2
/* 0x29bc	     */		ldx	[%sp+2735],%o1
/* 0x29c0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x29c4	     */		mov	%l6,%o0
/* 0x29c8	1308 */		ldub	[%sp+2271],%i2
/* 0x29cc	     */		mov	20,%l4
/* 0x29d0	     */		mov	13,%o4
/* 0x29d4	     */		ldx	[%sp+2743],%o1
/* 0x29d8	     */		ldx	[%sp+2735],%o2
/* 0x29dc	     */		mov	%l6,%o0
/* 0x29e0	     */		stx	%l4,[%sp+2223]
/* 0x29e4	     */		sll	%i2,3,%g4
/* 0x29e8	     */		add	%g4,223,%i0
/* 0x29ec	     */		sra	%i0,0,%o5
/* 0x29f0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x29f4	     */		mov	%o5,%o3
/* 0x29f8	1313 */		add	%i3,-1270,%o7
/* 0x29fc	1317 */		ldx	[%sp+2735],%o2
/* 0x2a00	     */		ldx	[%sp+2743],%o1
/* 0x2a04	1313 */		sra	%o7,31,%g5
/* 0x2a08	1317 */		mov	13,%o4
/* 0x2a0c	     */		stx	%l4,[%sp+2223]
/* 0x2a10	     */		mov	%l6,%o0
/* 0x2a14	1313 */		and	%g5,7,%o5
/* 0x2a18	1337 */		sethi	%gdop_hix22(.L398),%i3
/* 0x2a1c	1313 */		add	%o7,%o5,%i5
/* 0x2a20	1337 */		xor	%i3,%gdop_lox10(.L398),%i2
/* 0x2a24	1313 */		sra	%i5,3,%o3
/* 0x2a28	1317 */		and	%i5,2040,%i4
/* 0x2a2c	     */		add	%i4,222,%l2
/* 0x2a30	     */		sra	%l2,0,%o5
/* 0x2a34	1313 */		and	%o3,255,%i1
/* 0x2a38	1317 */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a3c	     */		mov	%o5,%o3
/* 0x2a40	1321 */		add	%i4,223,%o0
/* 0x2a44	     */		ldx	[%sp+2735],%o2
/* 0x2a48	     */		ldx	[%sp+2743],%o1
/* 0x2a4c	     */		sra	%o0,0,%o5
/* 0x2a50	     */		mov	13,%o4
/* 0x2a54	     */		stx	%l4,[%sp+2223]
/* 0x2a58	     */		mov	%l6,%o0
/* 0x2a5c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a60	     */		mov	%o5,%o3
/* 0x2a64	1325 */		add	%i4,224,%o4
/* 0x2a68	     */		ldx	[%sp+2735],%o2
/* 0x2a6c	     */		ldx	[%sp+2743],%o1
/* 0x2a70	     */		sra	%o4,0,%o5
/* 0x2a74	     */		mov	13,%o4
/* 0x2a78	     */		stx	%l4,[%sp+2223]
/* 0x2a7c	     */		mov	%l6,%o0
/* 0x2a80	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a84	     */		mov	%o5,%o3
/* 0x2a88	1327 */		ldx	[%sp+2615],%o2
/* 0x2a8c	     */		ldx	[%sp+2735],%o1
/* 0x2a90	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2a94	     */		mov	%l6,%o0
/* 0x2a98	1330 */		ldx	[%sp+2735],%o2
/* 0x2a9c	     */		ldx	[%sp+2743],%o1
/* 0x2aa0	     */		sra	%i0,0,%o5
/* 0x2aa4	     */		sra	%i0,0,%o3
/* 0x2aa8	     */		stx	%l4,[%sp+2223]
/* 0x2aac	     */		mov	13,%o4
/* 0x2ab0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2ab4	     */		mov	%l6,%o0
/* 0x2ab8	1332 */		add	%i1,-10,%l4
/* 0x2abc	     */		st	%l4,[%sp+2419]
/* 0x2ac0	     */		ld	[%sp+2419],%f8
/* 0x2ac4	     */		sethi	%gdop_hix22(.L___const_seg_900000101),%g1
/* 0x2ac8	     */		xor	%g1,%gdop_lox10(.L___const_seg_900000101),%l3
/* 0x2acc	     */		ldx	[%l7+%l3],%o1,%gdop(.L___const_seg_900000101)
/* 0x2ad0	     */		fitod	%f8,%f2
/* 0x2ad4	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x2ad8	     */		ldd	[%o1+40],%f0
/* 0x2adc	1334 */		ldx	[%sp+2647],%o2
/* 0x2ae0	     */		ldx	[%sp+2735],%o1
/* 0x2ae4	1332 */		std	%f0,[%sp+2719]
/* 0x2ae8	1334 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2aec	     */		mov	%l6,%o0
/* 0x2af0	1337 */		ldx	[%sp+2703],%o0
/* 0x2af4	     */		ldx	[%sp+2719],%o3
/* 0x2af8	     */		sra	%l4,0,%o2
/* 0x2afc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2b00	     */		ldx	[%l7+%i2],%o1,%gdop(.L398)
/* 0x2b04	1339 */		ldx	[%sp+2703],%o2
/* 0x2b08	     */		ldub	[%o2],%i0

! Registers live out of .L77002197: 
! g2 g3 o2 sp l4 l5 l6 l7 i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002197 .L900000258

			.L900001106:
/* 0x2b0c	1339 */		brz,pn	%i0,.L900000259
/* 0x2b10	     */		add	%o2,1,%o2

! Registers live out of .L900001106: 
! g2 g3 o2 sp l4 l5 l6 l7 i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001106

			.L900000258:
/* 0x2b14	1339 */		ldub	[%o2],%l3
/* 0x2b18	     */		add	%o2,1,%o2
/* 0x2b1c	     */		brnz,a,pt	%l3,.L900001106
/* 0x2b20	     */		ldub	[%o2],%i0

! Registers live out of .L900000258: 
! g2 g3 o2 sp l4 l5 l6 l7 i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000258 .L900001106

			.L900000259:
/* 0x2b24	1339 */		ldx	[%sp+2703],%o5
/* 0x2b28	     */		sub	%o2,1,%o3
/* 0x2b2c	     */		mov	40,%o4
/* 0x2b30	     */		ldx	[%sp+2735],%o2
/* 0x2b34	     */		ldx	[%sp+2743],%o1
/* 0x2b38	     */		sub	%o3,%o5,%i4
/* 0x2b3c	     */		mov	215,%o3
/* 0x2b40	     */		sra	%i4,0,%o0
/* 0x2b44	     */		stx	%o0,[%sp+2223]
/* 0x2b48	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2b4c	     */		mov	%l6,%o0
/* 0x2b50	1341 */		stb	%i1,[%sp+2271]
/* 0x2b54	1343 */		call	XFlush	!params=  %o0	!result= 
/* 0x2b58	     */		mov	%l6,%o0
/* 0x2b5c	     */		ba	.L900001067
/* 0x2b60	2043 */		nop

! Registers live out of .L900000259: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002187

			.L77002201:
/* 0x2b64	1343 */		cmp	%i1,783
/* 0x2b68	     */		ble,pn	%icc,.L77002525
/* 0x2b6c	     */		cmp	%i1,792

! Registers live out of .L77002201: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002201

			.L77002205:
/* 0x2b70	1343 */		bge,pn	%icc,.L77002223
/* 0x2b74	1349 */		mov	1,%o4

! Registers live out of .L77002205: 
! g2 g3 o0 o2 o4 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002205

			.L77002702:
/* 0x2b78	1349 */		ldx	[%sp+2735],%o1
/* 0x2b7c	     */		mov	0,%o5
/* 0x2b80	     */		mov	0,%o3
/* 0x2b84	     */		mov	8,%o2
/* 0x2b88	1351 */		mov	66,%i0
/* 0x2b8c	1349 */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x2b90	     */		mov	%l6,%o0
/* 0x2b94	1360 */		mov	223,%i5
/* 0x2b98	1350 */		ldx	[%l6+232],%l4
/* 0x2b9c	     */		ldx	[%sp+2727],%l3
/* 0x2ba0	     */		mov	%l6,%o0
/* 0x2ba4	1360 */		mov	0,%i1
/* 0x2ba8	1350 */		ldx	[%sp+2735],%o1
/* 0x2bac	1362 */		mov	70,%l2
/* 0x2bb0	1350 */		add	%l4,%l3,%g1
/* 0x2bb4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2bb8	     */		ldx	[%g1+96],%o2
/* 0x2bbc	1351 */		mov	388,%o5
/* 0x2bc0	     */		mov	66,%o4
/* 0x2bc4	     */		ldx	[%sp+2743],%o1
/* 0x2bc8	     */		mov	218,%o3
/* 0x2bcc	     */		mov	%l6,%o0
/* 0x2bd0	     */		stx	%i0,[%sp+2223]
/* 0x2bd4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2bd8	     */		ldx	[%sp+2735],%o2
/* 0x2bdc	1353 */		mov	0,%o5
/* 0x2be0	     */		mov	1,%o4
/* 0x2be4	     */		ldx	[%sp+2735],%o1
/* 0x2be8	     */		mov	0,%o3
/* 0x2bec	     */		mov	1,%o2
/* 0x2bf0	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x2bf4	     */		mov	%l6,%o0
/* 0x2bf8	1356 */		ldx	[%sp+2583],%o2
/* 0x2bfc	     */		ldx	[%sp+2735],%o1
/* 0x2c00	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2c04	     */		mov	%l6,%o0
/* 0x2c08	1357 */		mov	388,%o5
/* 0x2c0c	     */		ldx	[%sp+2735],%o2
/* 0x2c10	     */		mov	66,%o4
/* 0x2c14	     */		mov	218,%o3
/* 0x2c18	     */		ldx	[%sp+2743],%o1
/* 0x2c1c	     */		stx	%i0,[%sp+2223]
/* 0x2c20	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2c24	     */		mov	%l6,%o0
/* 0x2c28	1359 */		ldx	[%sp+2567],%o2
/* 0x2c2c	     */		ldx	[%sp+2735],%o1
/* 0x2c30	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2c34	     */		mov	%l6,%o0
/* 0x2c38	1362 */		sra	%i5,0,%o3

! Registers live out of .L77002702: 
! g2 g3 o3 o5 sp l2 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002702 .L900001105

			.L900001105:
/* 0x2c3c	1362 */		mov	63,%o4
/* 0x2c40	     */		mov	%l6,%o0
/* 0x2c44	     */		ldx	[%sp+2735],%o2
/* 0x2c48	     */		ldx	[%sp+2743],%o1
/* 0x2c4c	1360 */		add	%i1,1,%i1
/* 0x2c50	1362 */		stx	%l2,[%sp+2223]
/* 0x2c54	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2c58	     */		mov	%o3,%o5
/* 0x2c5c	1360 */		add	%i5,8,%i5
/* 0x2c60	     */		cmp	%i1,20
/* 0x2c64	     */		ble,pt	%icc,.L900001105
/* 0x2c68	1362 */		sra	%i5,0,%o3

! Registers live out of .L900001105: 
! g2 g3 o0 o3 o5 sp l2 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001105

			.L77002215:
/* 0x2c6c	1365 */		ldx	[%sp+2519],%o2
/* 0x2c70	     */		ldx	[%sp+2735],%o1
/* 0x2c74	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2c78	     */		mov	%l6,%o0
/* 0x2c7c	1368 */		ldub	[%sp+2272],%l4
/* 0x2c80	     */		ldx	[%sp+2743],%o1
/* 0x2c84	     */		ldx	[%sp+2735],%o2
/* 0x2c88	     */		mov	63,%o4
/* 0x2c8c	     */		mov	%l6,%o0
/* 0x2c90	     */		stx	%l2,[%sp+2223]
/* 0x2c94	     */		sll	%l4,3,%i5
/* 0x2c98	     */		add	%i5,223,%i1
/* 0x2c9c	     */		sra	%i1,0,%o5
/* 0x2ca0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2ca4	     */		mov	%o5,%o3
/* 0x2ca8	1372 */		add	%i3,-1270,%g1
/* 0x2cac	1376 */		ldx	[%sp+2735],%o2
/* 0x2cb0	     */		ldx	[%sp+2743],%o1
/* 0x2cb4	1372 */		sra	%g1,31,%o0
/* 0x2cb8	1376 */		mov	63,%o4
/* 0x2cbc	     */		stx	%l2,[%sp+2223]
/* 0x2cc0	1372 */		and	%o0,7,%o3
/* 0x2cc4	1376 */		mov	%l6,%o0
/* 0x2cc8	1372 */		add	%g1,%o3,%i0
/* 0x2ccc	1376 */		and	%i0,2040,%i3
/* 0x2cd0	1372 */		sra	%i0,3,%l3
/* 0x2cd4	1376 */		add	%i3,222,%i4
/* 0x2cd8	     */		sra	%i4,0,%o5
/* 0x2cdc	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2ce0	     */		mov	%o5,%o3
/* 0x2ce4	1380 */		add	%i3,223,%o1
/* 0x2ce8	     */		ldx	[%sp+2735],%o2
/* 0x2cec	     */		stx	%l2,[%sp+2223]
/* 0x2cf0	     */		sra	%o1,0,%o5
/* 0x2cf4	     */		ldx	[%sp+2743],%o1
/* 0x2cf8	     */		mov	63,%o4
/* 0x2cfc	     */		mov	%l6,%o0
/* 0x2d00	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2d04	     */		mov	%o5,%o3
/* 0x2d08	1384 */		ldx	[%sp+2743],%o1
/* 0x2d0c	     */		mov	63,%o4
/* 0x2d10	     */		stx	%l2,[%sp+2223]
/* 0x2d14	     */		add	%i3,224,%o2
/* 0x2d18	     */		mov	%l6,%o0
/* 0x2d1c	     */		sra	%o2,0,%o5
/* 0x2d20	     */		ldx	[%sp+2735],%o2
/* 0x2d24	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2d28	     */		mov	%o5,%o3
/* 0x2d2c	1386 */		ldx	[%sp+2615],%o2
/* 0x2d30	     */		ldx	[%sp+2735],%o1
/* 0x2d34	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2d38	     */		mov	%l6,%o0
/* 0x2d3c	1372 */		and	%l3,255,%l3
/* 0x2d40	1389 */		ldx	[%sp+2735],%o2
/* 0x2d44	     */		ldx	[%sp+2743],%o1
/* 0x2d48	     */		sra	%i1,0,%o5
/* 0x2d4c	     */		mov	63,%o4
/* 0x2d50	     */		stx	%l2,[%sp+2223]
/* 0x2d54	     */		mov	%l6,%o0
/* 0x2d58	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2d5c	     */		sra	%i1,0,%o3
/* 0x2d60	1391 */		add	%l3,-10,%l4
/* 0x2d64	     */		st	%l4,[%sp+2423]
/* 0x2d68	     */		ldd	[%i2-32],%f0
/* 0x2d6c	     */		ld	[%sp+2423],%f8
/* 0x2d70	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x2d74	     */		fitod	%f8,%f2
/* 0x2d78	1394 */		ldd	[%i2-48],%f4
/* 0x2d7c	     */		ldd	[%i2],%f34
/* 0x2d80	     */		ld	[%sp+2279],%f3
/* 0x2d84	     */		fmovs	%f4,%f2
/* 0x2d88	     */		fsubd	%f2,%f4,%f32
/* 0x2d8c	     */		fabsd	%f32,%f32
/* 0x2d90	     */		fmuld	%f32,%f0,%f32
/* 0x2d94	     */		fcmped	%fcc2,%f32,%f34
/* 0x2d98	     */		fbuge,pn	%fcc2,.L77002219
/* 0x2d9c	1397 */		ldx	[%sp+2735],%o1

! Registers live out of .L77002215: 
! g2 g3 o0 o1 o2 sp l4 l5 l6 l7 i1 i2 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002215

			.L77002217:
/* 0x2da0	1396 */		ldd	[%i2-56],%f44
/* 0x2da4	1397 */		mov	%l6,%o0
/* 0x2da8	     */		std	%f44,[%sp+2879]
/* 0x2dac	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2db0	     */		ldx	[%sp+2519],%o2
/* 0x2db4	1398 */		sethi	%gdop_hix22(.L412),%g5
/* 0x2db8	     */		ldx	[%sp+2703],%o0
/* 0x2dbc	     */		xor	%g5,%gdop_lox10(.L412),%o5
/* 0x2dc0	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2dc4	     */		ldx	[%l7+%o5],%o1,%gdop(.L412)
/* 0x2dc8	1400 */		ldx	[%sp+2703],%o7
/* 0x2dcc	     */		ldub	[%o7],%o0

! Registers live out of .L77002217: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002217 .L900000254

			.L900001104:
/* 0x2dd0	1400 */		brz,pn	%o0,.L900000255
/* 0x2dd4	     */		add	%o7,1,%o7

! Registers live out of .L900001104: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001104

			.L900000254:
/* 0x2dd8	1400 */		ldub	[%o7],%o4
/* 0x2ddc	     */		add	%o7,1,%o7
/* 0x2de0	     */		brnz,a,pt	%o4,.L900001104
/* 0x2de4	     */		ldub	[%o7],%o0

! Registers live out of .L900000254: 
! g2 g3 o0 sp o7 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000254 .L900001104

			.L900000255:
/* 0x2de8	1400 */		ldx	[%sp+2703],%o5
/* 0x2dec	     */		sub	%o7,1,%i0
/* 0x2df0	     */		mov	90,%o4
/* 0x2df4	     */		ldx	[%sp+2735],%o2
/* 0x2df8	     */		mov	215,%o3
/* 0x2dfc	     */		sub	%i0,%o5,%l2
/* 0x2e00	     */		sra	%l2,0,%o1
/* 0x2e04	     */		stx	%o1,[%sp+2223]
/* 0x2e08	     */		ldx	[%sp+2743],%o1
/* 0x2e0c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2e10	     */		mov	%l6,%o0
/* 0x2e14	1404 */		mov	10,%o4
/* 0x2e18	     */		stb	%o4,[%sp+2272]
/* 0x2e1c	     */		ba	.L900001067
/* 0x2e20	2043 */		nop

! Registers live out of .L900000255: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002215

			.L77002219:
/* 0x2e24	1408 */		ldx	[%sp+2535],%o2
/* 0x2e28	     */		ldx	[%sp+2735],%o1
/* 0x2e2c	1411 */		sethi	%gdop_hix22(.L398),%i4
/* 0x2e30	1408 */		std	%f0,[%sp+2879]
/* 0x2e34	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2e38	     */		mov	%l6,%o0
/* 0x2e3c	1411 */		ldx	[%sp+2703],%o0
/* 0x2e40	     */		ldx	[%sp+2879],%o3
/* 0x2e44	     */		xor	%i4,%gdop_lox10(.L398),%o4
/* 0x2e48	     */		sra	%l4,0,%o2
/* 0x2e4c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2e50	     */		ldx	[%l7+%o4],%o1,%gdop(.L398)
/* 0x2e54	1414 */		ldx	[%sp+2703],%g4
/* 0x2e58	     */		ldub	[%g4],%l4

! Registers live out of .L77002219: 
! g2 g3 g4 o0 sp l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002219 .L900000250

			.L900001103:
/* 0x2e5c	1414 */		brz,pn	%l4,.L900000251
/* 0x2e60	     */		add	%g4,1,%g4

! Registers live out of .L900001103: 
! g2 g3 g4 o0 sp l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001103

			.L900000250:
/* 0x2e64	1414 */		ldub	[%g4],%g1
/* 0x2e68	     */		add	%g4,1,%g4
/* 0x2e6c	     */		brnz,a,pt	%g1,.L900001103
/* 0x2e70	     */		ldub	[%g4],%l4

! Registers live out of .L900000250: 
! g2 g3 g4 o0 sp l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000250 .L900001103

			.L900000251:
/* 0x2e74	1414 */		ldx	[%sp+2703],%o5
/* 0x2e78	     */		sub	%g4,1,%o2
/* 0x2e7c	     */		mov	90,%o4
/* 0x2e80	     */		ldx	[%sp+2743],%o1
/* 0x2e84	     */		mov	215,%o3
/* 0x2e88	     */		sub	%o2,%o5,%l4
/* 0x2e8c	     */		ldx	[%sp+2735],%o2
/* 0x2e90	     */		sra	%l4,0,%o7
/* 0x2e94	     */		stx	%o7,[%sp+2223]
/* 0x2e98	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2e9c	     */		mov	%l6,%o0
/* 0x2ea0	1416 */		stb	%l3,[%sp+2272]
/* 0x2ea4	     */		ba	.L900001067
/* 0x2ea8	2043 */		nop

! Registers live out of .L900000251: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002205

			.L77002223:
/* 0x2eac	1423 */		cmp	%i3,1372
/* 0x2eb0	     */		ble,pn	%icc,.L77002525
/* 0x2eb4	 914 */		cmp	%i1,915

! Registers live out of .L77002223: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002223

			.L77002862:
/* 0x2eb8	 914 */		ble,pn	%icc,.L900001102
/* 0x2ebc	1440 */		cmp	%i1,885

! Registers live out of .L77002862: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002862

			.L77002229:
/* 0x2ec0	1423 */		cmp	%i1,932

! Registers live out of .L77002229: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002227 .L77002229

			.L900001108:
/* 0x2ec4	1423 */		bge,pn	%icc,.L77002525
/* 0x2ec8	     */		ldd	[%sp+2823],%f34

! Registers live out of .L900001108: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i2 fp gsr 
! f34 f44 
		                       
! predecessor blocks: .L900001108

			.L77002231:
/* 0x2ecc	1423 */		ldd	[%o5+8],%f32
/* 0x2ed0	     */		ldd	[%o5+80],%f36
/* 0x2ed4	     */		faddd	%f34,%f32,%f32
/* 0x2ed8	     */		fcmped	%fcc3,%f32,%f36
/* 0x2edc	     */		fbule,pn	%fcc3,.L77002525
/* 0x2ee0	     */		ldd	[%sp+2831],%f34

! Registers live out of .L77002231: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i2 fp gsr 
! f34 f36 f44 
		                       
! predecessor blocks: .L77002231

			.L77002233:
/* 0x2ee4	1423 */		ldd	[%o5+8],%f32
/* 0x2ee8	     */		faddd	%f34,%f32,%f32
/* 0x2eec	     */		fcmped	%fcc0,%f32,%f36
/* 0x2ef0	     */		fbule,pn	%fcc0,.L77002525
/* 0x2ef4	1433 */		ld	[%sp+2311],%i1

! Registers live out of .L77002233: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002233

			.L77002235:
/* 0x2ef8	1433 */		cmp	%i1,0
/* 0x2efc	     */		bne,pn	%icc,.L77002705
/* 0x2f00	1436 */		ldx	[%sp+2735],%o1

! Registers live out of .L77002235: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002235

			.L77002237:
/* 0x2f04	1436 */		ldx	[%sp+2583],%o2
/* 0x2f08	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2f0c	     */		mov	%l6,%o0
/* 0x2f10	1437 */		mov	20,%g4
/* 0x2f14	     */		ldx	[%sp+2743],%o1
/* 0x2f18	     */		mov	72,%o5
/* 0x2f1c	     */		mov	192,%o4
/* 0x2f20	     */		stx	%g4,[%sp+2223]
/* 0x2f24	     */		mov	320,%o3
/* 0x2f28	     */		mov	%l6,%o0
/* 0x2f2c	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2f30	     */		ldx	[%sp+2735],%o2
/* 0x2f34	1438 */		ldx	[%sp+2703],%o0
/* 0x2f38	     */		sethi	%gdop_hix22(.L424),%i0
/* 0x2f3c	     */		xor	%i0,%gdop_lox10(.L424),%i3
/* 0x2f40	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2f44	     */		ldx	[%l7+%i3],%o1,%gdop(.L424)
/* 0x2f48	1439 */		ldx	[%sp+2703],%l2
/* 0x2f4c	     */		ldub	[%l2],%o0

! Registers live out of .L77002237: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002237 .L900000246

			.L900001101:
/* 0x2f50	1439 */		brz,pn	%o0,.L900000247
/* 0x2f54	     */		add	%l2,1,%l2

! Registers live out of .L900001101: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001101

			.L900000246:
/* 0x2f58	1439 */		ldub	[%l2],%i2
/* 0x2f5c	     */		add	%l2,1,%l2
/* 0x2f60	     */		brnz,a,pt	%i2,.L900001101
/* 0x2f64	     */		ldub	[%l2],%o0

! Registers live out of .L900000246: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000246 .L900001101

			.L900000247:
/* 0x2f68	1439 */		ldx	[%sp+2703],%o5
/* 0x2f6c	     */		sub	%l2,1,%g5
/* 0x2f70	     */		mov	207,%o4
/* 0x2f74	     */		ldx	[%sp+2735],%o2
/* 0x2f78	     */		mov	324,%o3
/* 0x2f7c	     */		ldx	[%sp+2743],%o1
/* 0x2f80	     */		sub	%g5,%o5,%g4
/* 0x2f84	     */		sra	%g4,0,%i3
/* 0x2f88	     */		stx	%i3,[%sp+2223]
/* 0x2f8c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2f90	     */		mov	%l6,%o0
/* 0x2f94	1440 */		mov	1,%o5
/* 0x2f98	     */		st	%o5,[%sp+2311]
/* 0x2f9c	     */		ba	.L900001067
/* 0x2fa0	2043 */		nop

! Registers live out of .L900000247: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002235

			.L77002705:
/* 0x2fa4	1452 */		ldx	[%sp+2567],%o2
/* 0x2fa8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2fac	     */		mov	%l6,%o0
/* 0x2fb0	1453 */		mov	20,%l4
/* 0x2fb4	     */		ldx	[%sp+2743],%o1
/* 0x2fb8	     */		mov	72,%o5
/* 0x2fbc	     */		mov	192,%o4
/* 0x2fc0	     */		stx	%l4,[%sp+2223]
/* 0x2fc4	     */		mov	320,%o3
/* 0x2fc8	     */		mov	%l6,%o0
/* 0x2fcc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2fd0	     */		ldx	[%sp+2735],%o2
/* 0x2fd4	1454 */		ldx	[%sp+2703],%o0
/* 0x2fd8	     */		sethi	%gdop_hix22(.L426),%i5
/* 0x2fdc	     */		xor	%i5,%gdop_lox10(.L426),%i3
/* 0x2fe0	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2fe4	     */		ldx	[%l7+%i3],%o1,%gdop(.L426)
/* 0x2fe8	1455 */		ldx	[%sp+2703],%l2
/* 0x2fec	     */		ldub	[%l2],%o3

! Registers live out of .L77002705: 
! g2 g3 o3 sp l2 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002705 .L900000186

			.L900001100:
/* 0x2ff0	1455 */		brz,pn	%o3,.L900000187
/* 0x2ff4	     */		add	%l2,1,%l2

! Registers live out of .L900001100: 
! g2 g3 o3 sp l2 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001100

			.L900000186:
/* 0x2ff8	1455 */		ldub	[%l2],%g1
/* 0x2ffc	     */		add	%l2,1,%l2
/* 0x3000	     */		brnz,a,pt	%g1,.L900001100
/* 0x3004	     */		ldub	[%l2],%o3

! Registers live out of .L900000186: 
! g2 g3 o3 sp l2 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000186 .L900001100

			.L900000187:
/* 0x3008	1455 */		ldx	[%sp+2703],%o5
/* 0x300c	     */		sub	%l2,1,%o7
/* 0x3010	     */		ldx	[%sp+2735],%o2
/* 0x3014	     */		mov	207,%o4
/* 0x3018	     */		ldx	[%sp+2743],%o1
/* 0x301c	     */		mov	324,%o3
/* 0x3020	1461 */		mov	512,%i0
/* 0x3024	1455 */		sub	%o7,%o5,%i4
/* 0x3028	     */		sra	%i4,0,%o0
/* 0x302c	     */		stx	%o0,[%sp+2223]
/* 0x3030	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3034	     */		mov	%l6,%o0
/* 0x3038	1464 */		ldd	[%i2-48],%f4
/* 0x303c	     */		ld	[%sp+2279],%f3
/* 0x3040	1462 */		mov	518,%o4
/* 0x3044	1464 */		ldd	[%sp+2879],%f44
/* 0x3048	     */		ldd	[%i2+120],%f34
/* 0x304c	1462 */		st	%o4,[%sp+2319]
/* 0x3050	1461 */		st	%i0,[%sp+2315]
/* 0x3054	1464 */		fmovs	%f4,%f2
/* 0x3058	     */		fsubd	%f2,%f4,%f32
/* 0x305c	     */		fabsd	%f32,%f32
/* 0x3060	     */		fmuld	%f32,%f44,%f32
/* 0x3064	     */		fcmpd	%f32,%f34
/* 0x3068	     */		fbuge,a,pn	%fcc0,.L900001099
/* 0x306c	     */		fsubd	%f32,%f34,%f32

! Registers live out of .L900000187: 
! g2 g3 sp l5 l6 l7 i2 fp gsr y
! f32 
		                       
! predecessor blocks: .L900000187

			.L900000988:
/* 0x3070	1464 */		fdtoi	%f32,%f0
/* 0x3074	     */		st	%f0,[%sp+2431]
/* 0x3078	     */		ld	[%sp+2431],%o5
/* 0x307c	     */		ba	.L900001098
/* 0x3080	1465 */		srl	%o5,0,%o2

! Registers live out of .L900000988: 
! g2 g3 o2 o5 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000187

			.L900001099:
/* 0x3084	1464 */		fdtoi	%f32,%f0
/* 0x3088	     */		st	%f0,[%sp+2439]
/* 0x308c	     */		ld	[%sp+2439],%i3
/* 0x3090	     */		sethi	%hi(0x80000000),%i0
/* 0x3094	     */		or	%i3,%i0,%o5
/* 0x3098	1465 */		srl	%o5,0,%o2

! Registers live out of .L900001099: 
! g2 g3 o2 o5 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000988 .L900001099

			.L900001098:
/* 0x309c	1465 */		sethi	%gdop_hix22(.L427),%g5
/* 0x30a0	     */		sethi	%gdop_hix22(__iob),%i3
/* 0x30a4	1464 */		st	%o5,[%sp+2279]
/* 0x30a8	1465 */		xor	%g5,%gdop_lox10(.L427),%g4
/* 0x30ac	     */		xor	%i3,%gdop_lox10(__iob),%o5
/* 0x30b0	     */		ldx	[%l7+%o5],%o0,%gdop(__iob)
/* 0x30b4	     */		ldx	[%l7+%g4],%o1,%gdop(.L427)
/* 0x30b8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x30bc	     */		add	%o0,256,%o0
/* 0x30c0	1467 */		ldd	[%sp+2711],%f34
/* 0x30c4	     */		ldd	[%sp+2719],%f32
/* 0x30c8	1468 */		sethi	%gdop_hix22(__iob),%i4
/* 0x30cc	     */		sethi	%gdop_hix22(.L428),%o3
/* 0x30d0	     */		xor	%i4,%gdop_lox10(__iob),%o2
/* 0x30d4	     */		xor	%o3,%gdop_lox10(.L428),%o1
/* 0x30d8	     */		ldx	[%l7+%o2],%o4,%gdop(__iob)
/* 0x30dc	   0 */		add	%sp,2711,%l3
/* 0x30e0	1468 */		ldx	[%l7+%o1],%o1,%gdop(.L428)
/* 0x30e4	1482 */		sethi	%gdop_hix22(.L429),%i5
/* 0x30e8	     */		xor	%i5,%gdop_lox10(.L429),%l2
/* 0x30ec	1467 */		fmuld	%f34,%f32,%f32
/* 0x30f0	     */		std	%f32,[%sp+2711]
/* 0x30f4	1468 */		ldx	[%sp+2711],%o2
/* 0x30f8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x30fc	     */		add	%o4,256,%o0
/* 0x3100	1469 */		ldd	[%i2-72],%f34
/* 0x3104	1475 */		mov	2,%o7
/* 0x3108	     */		st	%o7,[%sp+2303]
/* 0x310c	1469 */		ldd	[%l3],%f32
/* 0x3110	1472 */		mov	1,%i2
/* 0x3114	1478 */		add	%fp,-1057,%o0
/* 0x3118	1472 */		st	%i2,[%sp+2299]
/* 0x311c	1478 */		mov	0,%o1
/* 0x3120	     */		mov	1024,%o2
/* 0x3124	1469 */		fdivd	%f34,%f32,%f32
/* 0x3128	1470 */		std	%f32,[%sp+2807]
/* 0x312c	1478 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x3130	1469 */		std	%f32,[%sp+2799]
/* 0x3134	1482 */		sethi	%gdop_hix22(__iob),%g1
/* 0x3138	1480 */		ldd	[%sp+2823],%f34
/* 0x313c	1482 */		ldx	[%sp+2823],%o2
/* 0x3140	     */		xor	%g1,%gdop_lox10(__iob),%l4
/* 0x3144	     */		ldx	[%sp+2831],%o3
/* 0x3148	     */		ldx	[%l7+%l2],%o1,%gdop(.L429)
/* 0x314c	     */		ldx	[%l7+%l4],%i1,%gdop(__iob)
/* 0x3150	1480 */		std	%f34,[%sp+2783]
/* 0x3154	1481 */		ldd	[%sp+2831],%f32
/* 0x3158	     */		std	%f32,[%sp+2791]
/* 0x315c	1482 */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x3160	     */		add	%i1,256,%o0
/* 0x3164	1485 */		add	%fp,-1057,%i1
/* 0x3168	     */		mov	0,%g1

! Registers live out of .L900001098: 
! g1 g2 g3 o0 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001011 .L900001098

			.L900001011:
/* 0x316c	1487 */		st	%g0,[%i1]
/* 0x3170	     */		cmp	%g1,252
/* 0x3174	     */		add	%g1,2,%g1
/* 0x3178	     */		st	%g0,[%i1+4]
/* 0x317c	     */		ble,pt	%xcc,.L900001011
/* 0x3180	     */		add	%i1,8,%i1

! Registers live out of .L900001011: 
! g1 g2 g3 o0 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001011

			.L900001013:
/* 0x3184	1473 */		st	%g0,[%sp+2307]
/* 0x3188	1456 */		st	%g0,[%sp+2311]
/* 0x318c	1473 */		ba	.L77002387
/* 0x3190	   0 */		sethi	%gdop_hix22(.L527),%l3

! Registers live out of .L900001013: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002225

			.L77002261:
/* 0x3194	1440 */		cmp	%i1,885

! Registers live out of .L77002261: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002261 .L77002862

			.L900001102:
/* 0x3198	1440 */		ble,pn	%icc,.L77002525
/* 0x319c	     */		cmp	%i3,1442

! Registers live out of .L900001102: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900001102

			.L77002263:
/* 0x31a0	1440 */		bge,pn	%icc,.L77002525
/* 0x31a4	     */		cmp	%i1,903

! Registers live out of .L77002263: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002263

			.L77002265:
/* 0x31a8	1440 */		bge,pn	%icc,.L77002525
/* 0x31ac	     */		ldd	[%sp+2823],%f34

! Registers live out of .L77002265: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 fp gsr 
! f34 f44 
		                       
! predecessor blocks: .L77002265

			.L77002267:
/* 0x31b0	1440 */		ldd	[%o5+8],%f32
/* 0x31b4	     */		ldd	[%o5+80],%f36
/* 0x31b8	     */		faddd	%f34,%f32,%f32
/* 0x31bc	     */		fcmped	%fcc1,%f32,%f36
/* 0x31c0	     */		fbule,pn	%fcc1,.L77002525
/* 0x31c4	     */		ldd	[%sp+2831],%f34

! Registers live out of .L77002267: 
! g2 g3 o0 o2 o5 sp l4 l5 l6 l7 fp gsr 
! f34 f36 f44 
		                       
! predecessor blocks: .L77002267

			.L77002269:
/* 0x31c8	1440 */		ldd	[%o5+8],%f32
/* 0x31cc	     */		faddd	%f34,%f32,%f32
/* 0x31d0	     */		fcmped	%fcc2,%f32,%f36
/* 0x31d4	     */		fbule,pn	%fcc2,.L77002525
/* 0x31d8	1508 */		ld	[%sp+2295],%o2

! Registers live out of .L77002269: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002269

			.L77002271:
/* 0x31dc	1508 */		cmp	%o2,-1
/* 0x31e0	     */		ble,pn	%icc,.L77002525
/* 0x31e4	   0 */		sethi	%gdop_hix22(.L454),%o3

! Registers live out of .L77002271: 
! g2 g3 o0 o2 o3 sp l4 l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002271

			.L77002273:
/* 0x31e8	   0 */		xor	%o3,%gdop_lox10(.L454),%g1
/* 0x31ec	1510 */		orcc	%g0,%o2,%g0
/* 0x31f0	   0 */		ldx	[%l7+%g1],%g5,%gdop(.L454)
/* 0x31f4	   0 */		stx	%g5,[%sp+2887]
/* 0x31f8	1510 */		bne,pn	%icc,.L77002707
/* 0x31fc	1513 */		ldx	[%sp+2735],%o1

! Registers live out of .L77002273: 
! g2 g3 o0 o1 sp l4 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002273

			.L77002275:
/* 0x3200	1513 */		ldx	[%sp+2647],%o2
/* 0x3204	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3208	     */		mov	%l6,%o0
/* 0x320c	1514 */		mov	20,%g1
/* 0x3210	     */		ldx	[%sp+2743],%o1
/* 0x3214	     */		mov	72,%o5
/* 0x3218	     */		stx	%g1,[%sp+2223]
/* 0x321c	     */		mov	162,%o4
/* 0x3220	     */		mov	320,%o3
/* 0x3224	     */		mov	%l6,%o0
/* 0x3228	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x322c	     */		ldx	[%sp+2735],%o2
/* 0x3230	1515 */		ldx	[%sp+2703],%o0
/* 0x3234	     */		ldx	[%sp+2887],%o5
/* 0x3238	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x323c	     */		add	%o5,-12,%o1
/* 0x3240	1516 */		ldx	[%sp+2703],%i5
/* 0x3244	     */		ldub	[%i5],%i2

! Registers live out of .L77002275: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002275 .L900000242

			.L900001097:
/* 0x3248	1516 */		brz,pn	%i2,.L900000243
/* 0x324c	     */		add	%i5,1,%i5

! Registers live out of .L900001097: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001097

			.L900000242:
/* 0x3250	1516 */		ldub	[%i5],%l3
/* 0x3254	     */		add	%i5,1,%i5
/* 0x3258	     */		brnz,a,pt	%l3,.L900001097
/* 0x325c	     */		ldub	[%i5],%i2

! Registers live out of .L900000242: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000242 .L900001097

			.L900000243:
/* 0x3260	1516 */		ldx	[%sp+2703],%o5
/* 0x3264	     */		sub	%i5,1,%i1
/* 0x3268	     */		mov	177,%o4
/* 0x326c	     */		ldx	[%sp+2735],%o2
/* 0x3270	     */		mov	324,%o3
/* 0x3274	     */		ldx	[%sp+2743],%o1
/* 0x3278	     */		sub	%i1,%o5,%i5
/* 0x327c	     */		sra	%i5,0,%i4
/* 0x3280	     */		stx	%i4,[%sp+2223]
/* 0x3284	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3288	     */		mov	%l6,%o0
/* 0x328c	1518 */		sethi	%gdop_hix22(__iob),%o5
/* 0x3290	     */		ldx	[%sp+2887],%o1
/* 0x3294	     */		xor	%o5,%gdop_lox10(__iob),%o3
/* 0x3298	1517 */		mov	1,%g1
/* 0x329c	     */		st	%g1,[%sp+2295]
/* 0x32a0	1518 */		ldx	[%l7+%o3],%o0,%gdop(__iob)
/* 0x32a4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x32a8	     */		add	%o0,256,%o0
/* 0x32ac	     */		ba	.L900001067
/* 0x32b0	2043 */		nop

! Registers live out of .L900000243: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002273

			.L77002707:
/* 0x32b4	1527 */		ldx	[%sp+2615],%o2
/* 0x32b8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x32bc	     */		mov	%l6,%o0
/* 0x32c0	1528 */		mov	20,%l2
/* 0x32c4	     */		ldx	[%sp+2743],%o1
/* 0x32c8	     */		mov	72,%o5
/* 0x32cc	     */		mov	162,%o4
/* 0x32d0	     */		stx	%l2,[%sp+2223]
/* 0x32d4	     */		mov	320,%o3
/* 0x32d8	     */		mov	%l6,%o0
/* 0x32dc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x32e0	     */		ldx	[%sp+2735],%o2
/* 0x32e4	1529 */		ldx	[%sp+2887],%l3
/* 0x32e8	     */		ldx	[%sp+2703],%o0
/* 0x32ec	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x32f0	     */		add	%l3,-786,%o1
/* 0x32f4	1530 */		ldx	[%sp+2703],%i2
/* 0x32f8	     */		ldub	[%i2],%l3

! Registers live out of .L77002707: 
! g2 g3 o0 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002707 .L900000169

			.L900001096:
/* 0x32fc	1530 */		brz,pn	%l3,.L900000170
/* 0x3300	     */		add	%i2,1,%i2

! Registers live out of .L900001096: 
! g2 g3 o0 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001096

			.L900000169:
/* 0x3304	1530 */		ldub	[%i2],%i0
/* 0x3308	     */		add	%i2,1,%i2
/* 0x330c	     */		brnz,a,pt	%i0,.L900001096
/* 0x3310	     */		ldub	[%i2],%l3

! Registers live out of .L900000169: 
! g2 g3 o0 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000169 .L900001096

			.L900000170:
/* 0x3314	1530 */		ldx	[%sp+2703],%o5
/* 0x3318	     */		ldx	[%sp+2735],%o2
/* 0x331c	     */		sub	%i2,1,%i2
/* 0x3320	     */		mov	177,%o4
/* 0x3324	     */		mov	332,%o3
/* 0x3328	     */		sub	%i2,%o5,%g5
/* 0x332c	     */		sra	%g5,0,%o1
/* 0x3330	     */		stx	%o1,[%sp+2223]
/* 0x3334	     */		ldx	[%sp+2743],%o1
/* 0x3338	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x333c	     */		mov	%l6,%o0
/* 0x3340	1537 */		ld	[%fp-1057],%i1
/* 0x3344	     */		ld	[%fp-1053],%i4
/* 0x3348	     */		ld	[%fp-1049],%i3
/* 0x334c	     */		ld	[%fp-1045],%i2
/* 0x3350	     */		add	%fp,-993,%o7
/* 0x3354	     */		mov	16,%o5
/* 0x3358	     */		ld	[%fp-1041],%o4
/* 0x335c	     */		ld	[%fp-1037],%o3
/* 0x3360	     */		ld	[%fp-1033],%o2
/* 0x3364	     */		ld	[%fp-1029],%o1
/* 0x3368	     */		ld	[%fp-1025],%g5
/* 0x336c	     */		ld	[%fp-1021],%g1
/* 0x3370	     */		and	%i1,1,%o0
/* 0x3374	     */		ld	[%fp-1017],%g4
/* 0x3378	     */		ld	[%fp-1013],%l3
/* 0x337c	     */		ld	[%fp-1009],%l4
/* 0x3380	     */		ld	[%fp-1005],%i5
/* 0x3384	     */		ld	[%fp-1001],%l2
/* 0x3388	     */		ld	[%fp-997],%i1

! Registers live out of .L900000170: 
! g1 g2 g3 g4 g5 o0 o1 o2 o3 o4 o5 sp o7 l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000170 .L900001014

			.L900001014:
/* 0x338c	1537 */		and	%o0,%i4,%o0
/* 0x3390	     */		add	%o5,16,%o5
/* 0x3394	     */		ld	[%o7],%i0
/* 0x3398	     */		and	%o0,%i3,%o0
/* 0x339c	     */		ld	[%o7+4],%i4
/* 0x33a0	     */		add	%o7,64,%o7
/* 0x33a4	     */		and	%o0,%i2,%o0
/* 0x33a8	     */		ld	[%o7-56],%i3
/* 0x33ac	     */		and	%o0,%o4,%o0
/* 0x33b0	     */		ld	[%o7-52],%i2
/* 0x33b4	     */		and	%o0,%o3,%o0
/* 0x33b8	     */		ld	[%o7-48],%o4
/* 0x33bc	     */		and	%o0,%o2,%o0
/* 0x33c0	     */		ld	[%o7-44],%o3
/* 0x33c4	     */		and	%o0,%o1,%o0
/* 0x33c8	     */		ld	[%o7-40],%o2
/* 0x33cc	     */		and	%o0,%g5,%o0
/* 0x33d0	     */		ld	[%o7-36],%o1
/* 0x33d4	     */		and	%o0,%g1,%o0
/* 0x33d8	     */		ld	[%o7-32],%g5
/* 0x33dc	     */		and	%o0,%g4,%o0
/* 0x33e0	     */		ld	[%o7-28],%g1
/* 0x33e4	     */		and	%o0,%l3,%o0
/* 0x33e8	     */		ld	[%o7-24],%g4
/* 0x33ec	     */		and	%o0,%l4,%o0
/* 0x33f0	     */		ld	[%o7-20],%l3
/* 0x33f4	     */		and	%o0,%i5,%o0
/* 0x33f8	     */		ld	[%o7-16],%l4
/* 0x33fc	     */		and	%o0,%l2,%o0
/* 0x3400	     */		ld	[%o7-12],%i5
/* 0x3404	     */		and	%o0,%i1,%o0
/* 0x3408	     */		cmp	%o5,240
/* 0x340c	     */		ld	[%o7-8],%l2
/* 0x3410	     */		and	%o0,%i0,%o0
/* 0x3414	     */		ble,pt	%xcc,.L900001014
/* 0x3418	     */		ld	[%o7-4],%i1

! Registers live out of .L900001014: 
! g1 g2 g3 g4 g5 o0 o1 o2 o3 o4 o5 sp o7 l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001014

			.L900001016:
/* 0x341c	1537 */		and	%o0,%i4,%o0
/* 0x3420	     */		and	%o0,%i3,%i4
/* 0x3424	     */		and	%i4,%i2,%i2
/* 0x3428	     */		and	%i2,%o4,%i0
/* 0x342c	     */		and	%i0,%o3,%o3
/* 0x3430	     */		and	%o3,%o2,%o2
/* 0x3434	     */		and	%o2,%o1,%o1
/* 0x3438	     */		and	%o1,%g5,%o4
/* 0x343c	     */		and	%o4,%g1,%o7
/* 0x3440	     */		and	%o7,%g4,%g1
/* 0x3444	     */		and	%g1,%l3,%l3
/* 0x3448	     */		and	%l3,%l4,%l4
/* 0x344c	     */		and	%l4,%i5,%i5
/* 0x3450	     */		and	%i5,%l2,%l2
/* 0x3454	     */		and	%l2,%i1,%i1
/* 0x3458	1541 */		cmp	%i1,0
/* 0x345c	     */		be,pn	%icc,.L77002357
/* 0x3460	1544 */		ldx	[%sp+2887],%o7

! Registers live out of .L900001016: 
! g2 g3 o0 o1 sp o7 l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001016

			.L77002295:
/* 0x3464	1544 */		add	%o7,24,%o1
/* 0x3468	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x346c	     */		ldx	[%sp+2703],%o0
/* 0x3470	1545 */		ldx	[%sp+2535],%o2
/* 0x3474	     */		ldx	[%sp+2735],%o1
/* 0x3478	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x347c	     */		mov	%l6,%o0
/* 0x3480	1546 */		ldx	[%sp+2703],%l3
/* 0x3484	     */		ldub	[%l3],%o2

! Registers live out of .L77002295: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77002295 .L900000238

			.L900001095:
/* 0x3488	1546 */		brz,pn	%o2,.L900000239
/* 0x348c	     */		add	%l3,1,%l3

! Registers live out of .L900001095: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900001095

			.L900000238:
/* 0x3490	1546 */		ldub	[%l3],%o4
/* 0x3494	     */		add	%l3,1,%l3
/* 0x3498	     */		brnz,a,pt	%o4,.L900001095
/* 0x349c	     */		ldub	[%l3],%o2

! Registers live out of .L900000238: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 fp gsr 
! 
		                       
! predecessor blocks: .L900000238 .L900001095

			.L900000239:
/* 0x34a0	1546 */		ldx	[%sp+2703],%o5
/* 0x34a4	     */		sub	%l3,1,%i0
/* 0x34a8	     */		ldx	[%sp+2735],%o2
/* 0x34ac	     */		mov	178,%o4
/* 0x34b0	     */		mov	220,%o3
/* 0x34b4	     */		sub	%i0,%o5,%l2
/* 0x34b8	     */		sra	%l2,0,%o1
/* 0x34bc	     */		stx	%o1,[%sp+2223]
/* 0x34c0	     */		ldx	[%sp+2743],%o1
/* 0x34c4	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x34c8	     */		mov	%l6,%o0
/* 0x34cc	1553 */		call	time	!params=  %o0	!result= 
/* 0x34d0	     */		add	%sp,3143,%o0
/* 0x34d4	1554 */		call	gmtime	!params=  %o0	!result=  %o0
/* 0x34d8	     */		add	%sp,3143,%o0
/* 0x34dc	1556 */		ldx	[%sp+2887],%i5
/* 0x34e0	1554 */		mov	%o0,%o3
/* 0x34e4	1556 */		mov	32,%o1
/* 0x34e8	     */		add	%i5,40,%o2
/* 0x34ec	     */		call	strftime	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x34f0	     */		add	%sp,3183,%o0
/* 0x34f4	1557 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x34f8	     */		mov	256,%o0
/* 0x34fc	     */		brz,a,pt	%o0,.L900001094
/* 0x3500	     */		ldd	[%sp+2879],%f44

! Registers live out of .L900000239: 
! g2 g3 o0 o1 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000239

			.L900000117:
/* 0x3504	 289 */		mov	256,%o2
/* 0x3508	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x350c	     */		mov	0,%o1
/* 0x3510	     */		mov	%o0,%i5
/* 0x3514	     */		ba	.L900001093
/* 0x3518	1560 */		nop

! Registers live out of .L900000117: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000239

			.L900001094:
/* 0x351c	1557 */		mov	%o0,%i5
/* 0x3520	1560 */		std	%f44,[%sp+2879]

! Registers live out of .L900001094: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000117 .L900001094

			.L900001093:
/* 0x3524	1560 */		ldx	[%sp+2247],%o1
/* 0x3528	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x352c	     */		mov	%i5,%o0
/* 0x3530	1561 */		ldx	[%sp+2887],%o7
/* 0x3534	     */		add	%o7,53,%o1
/* 0x3538	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x353c	     */		mov	%i5,%o0
/* 0x3540	1562 */		add	%sp,3183,%o1
/* 0x3544	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x3548	     */		mov	%i5,%o0
/* 0x354c	1564 */		sethi	%hi(0x400c00),%o1
/* 0x3550	     */		add	%o1,143,%o1
/* 0x3554	     */		add	%o1,%sp,%o1
/* 0x3558	     */		call	stat	!params=  %o0 %o1	!result=  %o0
/* 0x355c	     */		mov	%i5,%o0
/* 0x3560	   0 */		sethi	%gdop_hix22(__iob),%o7
/* 0x3564	1564 */		orcc	%g0,%o0,%g0
/* 0x3568	   0 */		xor	%o7,%gdop_lox10(__iob),%o0
/* 0x356c	   0 */		ldx	[%l7+%o0],%i4,%gdop(__iob)
/* 0x3570	1565 */		bne,pn	%icc,.L77002299
/* 0x3574	   0 */		add	%i4,256,%l3

! Registers live out of .L900001093: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001093

			.L77002297:
/* 0x3578	1566 */		ldx	[%sp+2887],%o4
/* 0x357c	     */		mov	%i5,%o2
/* 0x3580	     */		add	%o4,56,%o1
/* 0x3584	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x3588	     */		mov	%l3,%o0
/* 0x358c	1567 */		ba	.L900001060
/* 0x3590	1734 */		nop

! Registers live out of .L77002297: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001093

			.L77002299:
/* 0x3594	1569 */		call	___errno	!params= 	!result=  %o0
/* 0x3598	     */		nop
/* 0x359c	     */		st	%g0,[%o0]
/* 0x35a0	1570 */		ldx	[%sp+2887],%i2
/* 0x35a4	     */		add	%i2,92,%o1
/* 0x35a8	     */		call	fopen	!params=  %o0 %o1	!result=  %o0
/* 0x35ac	     */		mov	%i5,%o0
/* 0x35b0	1571 */		brz,pn	%o0,.L77002301
/* 0x35b4	1576 */		sethi	%gdop_hix22(__iob),%i1

! Registers live out of .L77002299: 
! g2 g3 o0 sp l5 l6 l7 i1 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002299

			.L77002303:
/* 0x35b8	1576 */		sethi	%gdop_hix22(.L479),%o4
/* 0x35bc	     */		xor	%o4,%gdop_lox10(.L479),%g4
/* 0x35c0	     */		xor	%i1,%gdop_lox10(__iob),%i4
/* 0x35c4	     */		ldx	[%l7+%g4],%o1,%gdop(.L479)
/* 0x35c8	     */		ldx	[%l7+%i4],%g5,%gdop(__iob)
/* 0x35cc	1570 */		mov	%o0,%i2
/* 0x35d0	1576 */		mov	%i5,%o2
/* 0x35d4	1582 */		mov	1,%l2
/* 0x35d8	1576 */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x35dc	     */		add	%g5,256,%o0
/* 0x35e0	1582 */		st	%l2,[%sp+2443]
/* 0x35e4	1584 */		ldub	[%sp+2443],%l4
/* 0x35e8	   0 */		sethi	%gdop_hix22(.L511),%o5
/* 0x35ec	1584 */		mov	16,%o0
/* 0x35f0	   0 */		xor	%o5,%gdop_lox10(.L511),%o7
/* 0x35f4	   0 */		ldx	[%l7+%o7],%i1,%gdop(.L511)
/* 0x35f8	1584 */		cmp	%l4,1
/* 0x35fc	     */		move	%icc,0,%o0
/* 0x3600	1595 */		orcc	%g0,%o0,%g0
/* 0x3604	     */		be,pn	%icc,.L900001092
/* 0x3608	1599 */		add	%sp,2275,%o0

! Registers live out of .L77002303: 
! g2 g3 o0 o1 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002303

			.L77002311:
/* 0x360c	1596 */		call	rot4	!params=  %o0	!result=  %o0
/* 0x3610	     */		ld	[%sp+2275],%o0
/* 0x3614	   0 */		add	%sp,2447,%i4
/* 0x3618	1597 */		mov	%i2,%o3
/* 0x361c	     */		mov	1,%o2
/* 0x3620	     */		mov	4,%o1
/* 0x3624	1596 */		st	%o0,[%sp+2447]
/* 0x3628	1597 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x362c	   0 */		add	%sp,2447,%o0
/* 0x3630	   0 */		sethi	%gdop_hix22(.L486),%o1
/* 0x3634	   0 */		xor	%o1,%gdop_lox10(.L486),%o3
/* 0x3638	1597 */		mov	%o0,%o2
/* 0x363c	   0 */		ldx	[%l7+%o3],%l4,%gdop(.L486)
/* 0x3640	1602 */		mov	4,%o1
/* 0x3644	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3648	     */		mov	%l4,%o0
/* 0x364c	1603 */		ld	[%sp+2275],%o1
/* 0x3650	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3654	     */		add	%l4,64,%o0
/* 0x3658	1606 */		call	rot4	!params=  %o0	!result=  %o0
/* 0x365c	     */		ld	[%sp+2279],%o0
/* 0x3660	1607 */		mov	%i2,%o3
/* 0x3664	     */		mov	1,%o2
/* 0x3668	     */		mov	4,%o1
/* 0x366c	1606 */		mov	%o0,%i3
/* 0x3670	   0 */		mov	%i4,%o0
/* 0x3674	1607 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3678	1606 */		st	%i3,[%i4]
/* 0x367c	1607 */		mov	%o0,%o2
/* 0x3680	1612 */		mov	4,%o1
/* 0x3684	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3688	     */		add	%l4,96,%o0
/* 0x368c	1613 */		add	%l4,160,%o0
/* 0x3690	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3694	     */		ld	[%sp+2279],%o1
/* 0x3698	1617 */		call	rot8	!params=  %o0	!result=  %o0
/* 0x369c	     */		ldx	[%sp+2711],%o0
/* 0x36a0	   0 */		add	%sp,3119,%l2
/* 0x36a4	1618 */		mov	%i2,%o3
/* 0x36a8	     */		mov	1,%o2
/* 0x36ac	1617 */		stx	%o0,[%sp+3119]
/* 0x36b0	1618 */		mov	8,%o1
/* 0x36b4	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x36b8	   0 */		add	%sp,3119,%o0
/* 0x36bc	1623 */		mov	8,%o1
/* 0x36c0	1618 */		mov	%o0,%o2
/* 0x36c4	1623 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x36c8	     */		add	%l4,184,%o0
/* 0x36cc	1624 */		ldx	[%sp+2711],%o1
/* 0x36d0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x36d4	     */		add	%l4,248,%o0
/* 0x36d8	1627 */		call	rot8	!params=  %o0	!result=  %o0
/* 0x36dc	     */		ldx	[%sp+2783],%o0
/* 0x36e0	1628 */		mov	%i2,%o3
/* 0x36e4	     */		mov	1,%o2
/* 0x36e8	1627 */		stx	%o0,[%l2]
/* 0x36ec	1628 */		mov	8,%o1
/* 0x36f0	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x36f4	   0 */		mov	%l2,%o0
/* 0x36f8	1633 */		mov	8,%o1
/* 0x36fc	1628 */		mov	%o0,%o2
/* 0x3700	1633 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3704	     */		add	%l4,288,%o0
/* 0x3708	1634 */		ldx	[%sp+2783],%o1
/* 0x370c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3710	     */		add	%l4,352,%o0
/* 0x3714	1637 */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3718	     */		ldx	[%sp+2791],%o0
/* 0x371c	1638 */		mov	%i2,%o3
/* 0x3720	     */		mov	1,%o2
/* 0x3724	1637 */		stx	%o0,[%l2]
/* 0x3728	1638 */		mov	8,%o1
/* 0x372c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3730	   0 */		mov	%l2,%o0
/* 0x3734	1643 */		mov	8,%o1
/* 0x3738	1638 */		mov	%o0,%o2
/* 0x373c	1643 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3740	     */		add	%l4,392,%o0
/* 0x3744	1644 */		ldx	[%sp+2791],%o1
/* 0x3748	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x374c	     */		add	%l4,456,%o0
/* 0x3750	1649 */		mov	0,%o3
/* 0x3754	     */		mov	0,%o2
/* 0x3758	     */		mov	0,%o0
/* 0x375c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3760	     */		mov	0,%o1
/* 0x3764	     */		ldx	[%sp+2463],%i0
/* 0x3768	     */		sllx	%o0,3,%o2
/* 0x376c	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3770	     */		ldx	[%o2+%i0],%o0
/* 0x3774	1650 */		mov	%i2,%o3
/* 0x3778	     */		mov	1,%o2
/* 0x377c	1649 */		stx	%o0,[%l2]
/* 0x3780	1650 */		mov	8,%o1
/* 0x3784	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3788	   0 */		mov	%l2,%o0
/* 0x378c	1651 */		mov	0,%o3
/* 0x3790	     */		mov	0,%o2
/* 0x3794	     */		mov	0,%o1
/* 0x3798	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x379c	     */		mov	0,%o0
/* 0x37a0	     */		ldx	[%sp+2695],%i3
/* 0x37a4	     */		sllx	%o0,3,%g1
/* 0x37a8	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x37ac	     */		ldx	[%g1+%i3],%o0
/* 0x37b0	1652 */		mov	%i2,%o3
/* 0x37b4	     */		mov	1,%o2
/* 0x37b8	1651 */		stx	%o0,[%l2]
/* 0x37bc	1652 */		mov	8,%o1
/* 0x37c0	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x37c4	   0 */		mov	%l2,%o0
/* 0x37c8	1654 */		call	rot4	!params=  %o0	!result=  %o0
/* 0x37cc	     */		ld	[%sp+3215],%o0
/* 0x37d0	1655 */		mov	%i2,%o3
/* 0x37d4	     */		mov	1,%o2
/* 0x37d8	     */		mov	4,%o1
/* 0x37dc	1654 */		mov	%o0,%o4
/* 0x37e0	   0 */		mov	%i4,%o0
/* 0x37e4	1655 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x37e8	1654 */		st	%o4,[%i4]
/* 0x37ec	1657 */		mov	63,%o3
/* 0x37f0	     */		mov	63,%o2
/* 0x37f4	     */		mov	7,%o1
/* 0x37f8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x37fc	     */		mov	7,%o0
/* 0x3800	     */		sllx	%o0,3,%g4
/* 0x3804	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3808	     */		ldx	[%g4+%i0],%o0
/* 0x380c	1658 */		mov	%i2,%o3
/* 0x3810	     */		mov	1,%o2
/* 0x3814	1657 */		stx	%o0,[%l2]
/* 0x3818	1658 */		mov	8,%o1
/* 0x381c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3820	   0 */		mov	%l2,%o0
/* 0x3824	1659 */		mov	63,%o3
/* 0x3828	     */		mov	63,%o2
/* 0x382c	     */		mov	7,%o1
/* 0x3830	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3834	     */		mov	7,%o0
/* 0x3838	     */		sllx	%o0,3,%g5
/* 0x383c	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3840	     */		ldx	[%g5+%i3],%o0
/* 0x3844	1660 */		mov	%i2,%o3
/* 0x3848	     */		mov	1,%o2
/* 0x384c	1659 */		stx	%o0,[%l2]
/* 0x3850	1660 */		mov	8,%o1
/* 0x3854	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3858	   0 */		mov	%l2,%o0
/* 0x385c	1661 */		sethi	%hi(0x1e0c00),%o5
/* 0x3860	     */		add	%o5,139,%o5
/* 0x3864	     */		add	%o5,%sp,%o5
/* 0x3868	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x386c	     */		ld	[%o5],%o0
/* 0x3870	1662 */		mov	%i2,%o3
/* 0x3874	     */		mov	1,%o2
/* 0x3878	1661 */		st	%o0,[%i4]
/* 0x387c	1662 */		mov	4,%o1
/* 0x3880	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3884	   0 */		mov	%i4,%o0
/* 0x3888	1664 */		mov	0,%o3
/* 0x388c	     */		mov	0,%o2
/* 0x3890	     */		mov	8,%o1
/* 0x3894	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3898	     */		mov	8,%o0
/* 0x389c	     */		sllx	%o0,3,%o0
/* 0x38a0	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x38a4	     */		ldx	[%o0+%i0],%o0
/* 0x38a8	1665 */		mov	%i2,%o3
/* 0x38ac	     */		mov	1,%o2
/* 0x38b0	1664 */		stx	%o0,[%l2]
/* 0x38b4	1665 */		mov	8,%o1
/* 0x38b8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x38bc	   0 */		mov	%l2,%o0
/* 0x38c0	1666 */		mov	0,%o3
/* 0x38c4	     */		mov	0,%o2
/* 0x38c8	     */		mov	8,%o1
/* 0x38cc	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x38d0	     */		mov	8,%o0
/* 0x38d4	     */		sllx	%o0,3,%o1
/* 0x38d8	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x38dc	     */		ldx	[%o1+%i3],%o0
/* 0x38e0	1667 */		mov	%i2,%o3
/* 0x38e4	     */		mov	1,%o2
/* 0x38e8	1666 */		stx	%o0,[%l2]
/* 0x38ec	1667 */		mov	8,%o1
/* 0x38f0	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x38f4	   0 */		mov	%l2,%o0
/* 0x38f8	1668 */		sethi	%hi(0x220c00),%o3
/* 0x38fc	     */		add	%o3,143,%o3
/* 0x3900	     */		add	%o3,%sp,%o3
/* 0x3904	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x3908	     */		ld	[%o3],%o0
/* 0x390c	1669 */		mov	%i2,%o3
/* 0x3910	     */		mov	1,%o2
/* 0x3914	     */		mov	4,%o1
/* 0x3918	1668 */		mov	%o0,%l4
/* 0x391c	   0 */		mov	%i4,%o0
/* 0x3920	1669 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3924	1668 */		st	%l4,[%i4]
/* 0x3928	1671 */		mov	0,%o3
/* 0x392c	     */		mov	1,%o2
/* 0x3930	     */		mov	8,%o1
/* 0x3934	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3938	     */		mov	8,%o0
/* 0x393c	     */		sllx	%o0,3,%o2
/* 0x3940	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3944	     */		ldx	[%o2+%i0],%o0
/* 0x3948	1672 */		mov	%i2,%o3
/* 0x394c	     */		mov	1,%o2
/* 0x3950	1671 */		stx	%o0,[%l2]
/* 0x3954	1672 */		mov	8,%o1
/* 0x3958	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x395c	   0 */		mov	%l2,%o0
/* 0x3960	1673 */		mov	0,%o3
/* 0x3964	     */		mov	1,%o2
/* 0x3968	     */		mov	8,%o1
/* 0x396c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3970	     */		mov	8,%o0
/* 0x3974	     */		sllx	%o0,3,%g1
/* 0x3978	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x397c	     */		ldx	[%g1+%i3],%o0
/* 0x3980	1674 */		mov	%i2,%o3
/* 0x3984	     */		mov	1,%o2
/* 0x3988	1673 */		stx	%o0,[%l2]
/* 0x398c	1674 */		mov	8,%o1
/* 0x3990	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3994	   0 */		mov	%l2,%o0
/* 0x3998	1675 */		sethi	%hi(0x220c00),%o4
/* 0x399c	     */		add	%o4,399,%o4
/* 0x39a0	     */		add	%o4,%sp,%o4
/* 0x39a4	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x39a8	     */		ld	[%o4],%o0
/* 0x39ac	1676 */		mov	%i2,%o3
/* 0x39b0	     */		mov	1,%o2
/* 0x39b4	     */		mov	4,%o1
/* 0x39b8	1675 */		mov	%o0,%g4
/* 0x39bc	   0 */		mov	%i4,%o0
/* 0x39c0	1676 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x39c4	1675 */		st	%g4,[%i4]
/* 0x39c8	1678 */		mov	32,%o3
/* 0x39cc	     */		mov	32,%o2
/* 0x39d0	     */		mov	8,%o1
/* 0x39d4	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x39d8	     */		mov	8,%o0
/* 0x39dc	     */		sllx	%o0,3,%g5
/* 0x39e0	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x39e4	     */		ldx	[%g5+%i0],%o0
/* 0x39e8	1679 */		mov	%i2,%o3
/* 0x39ec	     */		mov	1,%o2
/* 0x39f0	1678 */		stx	%o0,[%l2]
/* 0x39f4	1679 */		mov	8,%o1
/* 0x39f8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x39fc	   0 */		mov	%l2,%o0
/* 0x3a00	1680 */		mov	32,%o3
/* 0x3a04	     */		mov	32,%o2
/* 0x3a08	     */		mov	8,%o1
/* 0x3a0c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3a10	     */		mov	8,%o0
/* 0x3a14	     */		sllx	%o0,3,%o5
/* 0x3a18	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3a1c	     */		ldx	[%o5+%i3],%o0
/* 0x3a20	1681 */		mov	%i2,%o3
/* 0x3a24	     */		mov	1,%o2
/* 0x3a28	1680 */		stx	%o0,[%l2]
/* 0x3a2c	1681 */		mov	8,%o1
/* 0x3a30	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3a34	   0 */		mov	%l2,%o0
/* 0x3a38	1682 */		sethi	%hi(0x222c00),%o7
/* 0x3a3c	     */		add	%o7,271,%o7
/* 0x3a40	     */		add	%o7,%sp,%o7
/* 0x3a44	     */		ld	[%o7],%o0
/* 0x3a48	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x3a4c	     */		nop
/* 0x3a50	1683 */		mov	%i2,%o3
/* 0x3a54	     */		mov	1,%o2
/* 0x3a58	     */		mov	4,%o1
/* 0x3a5c	1682 */		mov	%o0,%l4
/* 0x3a60	   0 */		mov	%i4,%o0
/* 0x3a64	1683 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3a68	1682 */		st	%l4,[%i4]
/* 0x3a6c	1685 */		mov	21,%o3
/* 0x3a70	     */		mov	44,%o2
/* 0x3a74	     */		mov	12,%o1
/* 0x3a78	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3a7c	     */		mov	3,%o0
/* 0x3a80	     */		sllx	%o0,3,%o0
/* 0x3a84	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3a88	     */		ldx	[%o0+%i0],%o0
/* 0x3a8c	1686 */		mov	%i2,%o3
/* 0x3a90	     */		mov	1,%o2
/* 0x3a94	1685 */		stx	%o0,[%l2]
/* 0x3a98	1686 */		mov	8,%o1
/* 0x3a9c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3aa0	   0 */		mov	%l2,%o0
/* 0x3aa4	1687 */		mov	21,%o3
/* 0x3aa8	     */		mov	44,%o2
/* 0x3aac	     */		mov	12,%o1
/* 0x3ab0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ab4	     */		mov	3,%o0
/* 0x3ab8	     */		sllx	%o0,3,%o1
/* 0x3abc	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3ac0	     */		ldx	[%o1+%i3],%o0
/* 0x3ac4	1688 */		mov	%i2,%o3
/* 0x3ac8	     */		mov	1,%o2
/* 0x3acc	1687 */		stx	%o0,[%l2]
/* 0x3ad0	1688 */		mov	8,%o1
/* 0x3ad4	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ad8	   0 */		mov	%l2,%o0
/* 0x3adc	1689 */		sethi	%hi(0xf3800),%o3
/* 0x3ae0	     */		add	%o3,227,%o3
/* 0x3ae4	     */		add	%o3,%sp,%o3
/* 0x3ae8	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x3aec	     */		ld	[%o3],%o0
/* 0x3af0	1690 */		mov	%i2,%o3
/* 0x3af4	     */		mov	1,%o2
/* 0x3af8	     */		mov	4,%o1
/* 0x3afc	1689 */		mov	%o0,%g1
/* 0x3b00	   0 */		mov	%i4,%o0
/* 0x3b04	1690 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3b08	1689 */		st	%g1,[%i4]
/* 0x3b0c	1692 */		mov	63,%o3
/* 0x3b10	     */		mov	63,%o2
/* 0x3b14	     */		mov	15,%o1
/* 0x3b18	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3b1c	     */		mov	15,%o0
/* 0x3b20	     */		sllx	%o0,3,%o2
/* 0x3b24	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3b28	     */		ldx	[%o2+%i0],%o0
/* 0x3b2c	1693 */		mov	%i2,%o3
/* 0x3b30	     */		mov	1,%o2
/* 0x3b34	1692 */		stx	%o0,[%l2]
/* 0x3b38	1693 */		mov	8,%o1
/* 0x3b3c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3b40	   0 */		mov	%l2,%o0
/* 0x3b44	1694 */		mov	63,%o3
/* 0x3b48	     */		mov	63,%o2
/* 0x3b4c	     */		mov	15,%o1
/* 0x3b50	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3b54	     */		mov	15,%o0
/* 0x3b58	     */		sllx	%o0,3,%i0
/* 0x3b5c	     */		call	rot8	!params=  %o0	!result=  %o0
/* 0x3b60	     */		ldx	[%i0+%i3],%o0
/* 0x3b64	1696 */		sethi	%hi(0x400c00),%i3
/* 0x3b68	1695 */		mov	%i2,%o3
/* 0x3b6c	1694 */		stx	%o0,[%l2]
/* 0x3b70	1695 */		mov	1,%o2
/* 0x3b74	     */		mov	8,%o1
/* 0x3b78	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3b7c	   0 */		mov	%l2,%o0
/* 0x3b80	1696 */		add	%i3,139,%i3
/* 0x3b84	     */		add	%i3,%sp,%i3
/* 0x3b88	     */		call	rot4	!params=  %o0	!result=  %o0
/* 0x3b8c	     */		ld	[%i3],%o0
/* 0x3b90	1697 */		mov	%i2,%o3
/* 0x3b94	     */		mov	1,%o2
/* 0x3b98	     */		mov	4,%o1
/* 0x3b9c	1696 */		mov	%o0,%l2
/* 0x3ba0	   0 */		mov	%i4,%o0
/* 0x3ba4	1697 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ba8	1696 */		st	%l2,[%i4]
/* 0x3bac	1697 */		ba	.L900001091
/* 0x3bb0	1730 */		nop

! Registers live out of .L77002311: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002303

			.L900001092:
/* 0x3bb4	1599 */		mov	%i2,%o3
/* 0x3bb8	     */		mov	1,%o2
/* 0x3bbc	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3bc0	     */		mov	4,%o1
/* 0x3bc4	     */		mov	%o0,%o2
/* 0x3bc8	1602 */		mov	4,%o1
/* 0x3bcc	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3bd0	     */		add	%i1,-496,%o0
/* 0x3bd4	1603 */		add	%i1,-432,%o0
/* 0x3bd8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3bdc	     */		ld	[%sp+2275],%o1
/* 0x3be0	1609 */		mov	%i2,%o3
/* 0x3be4	     */		add	%sp,2279,%o0
/* 0x3be8	     */		mov	1,%o2
/* 0x3bec	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3bf0	     */		mov	4,%o1
/* 0x3bf4	     */		mov	%o0,%o2
/* 0x3bf8	1612 */		mov	4,%o1
/* 0x3bfc	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c00	     */		add	%i1,-400,%o0
/* 0x3c04	1613 */		ld	[%sp+2279],%o1
/* 0x3c08	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c0c	     */		add	%i1,-336,%o0
/* 0x3c10	1620 */		mov	%i2,%o3
/* 0x3c14	     */		add	%sp,2711,%o0
/* 0x3c18	     */		mov	1,%o2
/* 0x3c1c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3c20	     */		mov	8,%o1
/* 0x3c24	     */		mov	%o0,%o2
/* 0x3c28	1623 */		mov	8,%o1
/* 0x3c2c	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c30	     */		add	%i1,-312,%o0
/* 0x3c34	1624 */		ldx	[%sp+2711],%o1
/* 0x3c38	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c3c	     */		add	%i1,-248,%o0
/* 0x3c40	1630 */		mov	%i2,%o3
/* 0x3c44	     */		add	%sp,2783,%o0
/* 0x3c48	     */		mov	1,%o2
/* 0x3c4c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3c50	     */		mov	8,%o1
/* 0x3c54	     */		mov	%o0,%o2
/* 0x3c58	1633 */		mov	8,%o1
/* 0x3c5c	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c60	     */		add	%i1,-208,%o0
/* 0x3c64	1634 */		ldx	[%sp+2783],%o1
/* 0x3c68	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c6c	     */		add	%i1,-144,%o0
/* 0x3c70	1640 */		mov	%i2,%o3
/* 0x3c74	     */		add	%sp,2791,%o0
/* 0x3c78	     */		mov	1,%o2
/* 0x3c7c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3c80	     */		mov	8,%o1
/* 0x3c84	     */		mov	%o0,%o2
/* 0x3c88	1643 */		mov	8,%o1
/* 0x3c8c	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c90	     */		add	%i1,-104,%o0
/* 0x3c94	1644 */		ldx	[%sp+2791],%o1
/* 0x3c98	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c9c	     */		add	%i1,-40,%o0
/* 0x3ca0	1701 */		mov	0,%o3
/* 0x3ca4	     */		mov	0,%o2
/* 0x3ca8	     */		mov	0,%o0
/* 0x3cac	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3cb0	     */		mov	0,%o1
/* 0x3cb4	     */		sllx	%o0,3,%o0
/* 0x3cb8	     */		ldx	[%sp+2463],%i0
/* 0x3cbc	     */		mov	%i2,%o3
/* 0x3cc0	     */		mov	1,%o2
/* 0x3cc4	     */		mov	8,%o1
/* 0x3cc8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ccc	     */		add	%o0,%i0,%o0
/* 0x3cd0	1702 */		mov	0,%o3
/* 0x3cd4	     */		mov	0,%o2
/* 0x3cd8	     */		mov	0,%o1
/* 0x3cdc	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ce0	     */		mov	0,%o0
/* 0x3ce4	     */		mov	%i2,%o3
/* 0x3ce8	     */		ldx	[%sp+2695],%i4
/* 0x3cec	     */		sllx	%o0,3,%o7
/* 0x3cf0	     */		mov	1,%o2
/* 0x3cf4	     */		add	%o7,%i4,%o0
/* 0x3cf8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3cfc	     */		mov	8,%o1
/* 0x3d00	1703 */		add	%sp,3215,%o0
/* 0x3d04	     */		mov	%i2,%o3
/* 0x3d08	     */		mov	1,%o2
/* 0x3d0c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d10	     */		mov	4,%o1
/* 0x3d14	1705 */		mov	63,%o3
/* 0x3d18	     */		mov	63,%o2
/* 0x3d1c	     */		mov	7,%o1
/* 0x3d20	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d24	     */		mov	7,%o0
/* 0x3d28	     */		sllx	%o0,3,%l4
/* 0x3d2c	     */		mov	%i2,%o3
/* 0x3d30	     */		mov	1,%o2
/* 0x3d34	     */		mov	8,%o1
/* 0x3d38	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d3c	     */		add	%l4,%i0,%o0
/* 0x3d40	1706 */		mov	63,%o3
/* 0x3d44	     */		mov	63,%o2
/* 0x3d48	     */		mov	7,%o1
/* 0x3d4c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d50	     */		mov	7,%o0
/* 0x3d54	     */		mov	%i2,%o3
/* 0x3d58	     */		sllx	%o0,3,%i3
/* 0x3d5c	     */		mov	1,%o2
/* 0x3d60	     */		mov	8,%o1
/* 0x3d64	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d68	     */		add	%i3,%i4,%o0
/* 0x3d6c	1707 */		sethi	%hi(0x1e0c00),%o0
/* 0x3d70	     */		mov	%i2,%o3
/* 0x3d74	     */		add	%o0,139,%o0
/* 0x3d78	     */		mov	1,%o2
/* 0x3d7c	     */		add	%o0,%sp,%o0
/* 0x3d80	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d84	     */		mov	4,%o1
/* 0x3d88	1709 */		mov	0,%o3
/* 0x3d8c	     */		mov	0,%o2
/* 0x3d90	     */		mov	8,%o1
/* 0x3d94	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3d98	     */		mov	8,%o0
/* 0x3d9c	     */		sllx	%o0,3,%l2
/* 0x3da0	     */		mov	%i2,%o3
/* 0x3da4	     */		mov	1,%o2
/* 0x3da8	     */		mov	8,%o1
/* 0x3dac	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3db0	     */		add	%l2,%i0,%o0
/* 0x3db4	1710 */		mov	0,%o3
/* 0x3db8	     */		mov	0,%o2
/* 0x3dbc	     */		mov	8,%o1
/* 0x3dc0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3dc4	     */		mov	8,%o0
/* 0x3dc8	     */		mov	%i2,%o3
/* 0x3dcc	     */		sllx	%o0,3,%g1
/* 0x3dd0	     */		mov	1,%o2
/* 0x3dd4	     */		mov	8,%o1
/* 0x3dd8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ddc	     */		add	%g1,%i4,%o0
/* 0x3de0	1711 */		sethi	%hi(0x220c00),%o0
/* 0x3de4	     */		mov	%i2,%o3
/* 0x3de8	     */		add	%o0,143,%o0
/* 0x3dec	     */		mov	1,%o2
/* 0x3df0	     */		add	%o0,%sp,%o0
/* 0x3df4	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3df8	     */		mov	4,%o1
/* 0x3dfc	1713 */		mov	0,%o3
/* 0x3e00	     */		mov	1,%o2
/* 0x3e04	     */		mov	8,%o1
/* 0x3e08	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e0c	     */		mov	8,%o0
/* 0x3e10	     */		sllx	%o0,3,%o4
/* 0x3e14	     */		mov	%i2,%o3
/* 0x3e18	     */		mov	1,%o2
/* 0x3e1c	     */		mov	8,%o1
/* 0x3e20	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e24	     */		add	%o4,%i0,%o0
/* 0x3e28	1714 */		mov	0,%o3
/* 0x3e2c	     */		mov	1,%o2
/* 0x3e30	     */		mov	8,%o1
/* 0x3e34	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e38	     */		mov	8,%o0
/* 0x3e3c	     */		mov	%i2,%o3
/* 0x3e40	     */		sllx	%o0,3,%g4
/* 0x3e44	     */		mov	1,%o2
/* 0x3e48	     */		mov	8,%o1
/* 0x3e4c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e50	     */		add	%g4,%i4,%o0
/* 0x3e54	1715 */		sethi	%hi(0x220c00),%o0
/* 0x3e58	     */		mov	%i2,%o3
/* 0x3e5c	     */		add	%o0,399,%o0
/* 0x3e60	     */		mov	1,%o2
/* 0x3e64	     */		add	%o0,%sp,%o0
/* 0x3e68	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e6c	     */		mov	4,%o1
/* 0x3e70	1717 */		mov	32,%o3
/* 0x3e74	     */		mov	32,%o2
/* 0x3e78	     */		mov	8,%o1
/* 0x3e7c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e80	     */		mov	8,%o0
/* 0x3e84	     */		sllx	%o0,3,%g5
/* 0x3e88	     */		mov	%i2,%o3
/* 0x3e8c	     */		mov	1,%o2
/* 0x3e90	     */		mov	8,%o1
/* 0x3e94	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e98	     */		add	%g5,%i0,%o0
/* 0x3e9c	1718 */		mov	32,%o3
/* 0x3ea0	     */		mov	32,%o2
/* 0x3ea4	     */		mov	8,%o1
/* 0x3ea8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3eac	     */		mov	8,%o0
/* 0x3eb0	     */		mov	%i2,%o3
/* 0x3eb4	     */		sllx	%o0,3,%o5
/* 0x3eb8	     */		mov	1,%o2
/* 0x3ebc	     */		mov	8,%o1
/* 0x3ec0	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ec4	     */		add	%o5,%i4,%o0
/* 0x3ec8	1719 */		sethi	%hi(0x222c00),%o0
/* 0x3ecc	     */		mov	%i2,%o3
/* 0x3ed0	     */		add	%o0,271,%o0
/* 0x3ed4	     */		mov	1,%o2
/* 0x3ed8	     */		add	%o0,%sp,%o0
/* 0x3edc	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ee0	     */		mov	4,%o1
/* 0x3ee4	1721 */		mov	21,%o3
/* 0x3ee8	     */		mov	44,%o2
/* 0x3eec	     */		mov	12,%o1
/* 0x3ef0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ef4	     */		mov	3,%o0
/* 0x3ef8	     */		sllx	%o0,3,%o0
/* 0x3efc	     */		mov	%i2,%o3
/* 0x3f00	     */		mov	1,%o2
/* 0x3f04	     */		mov	8,%o1
/* 0x3f08	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f0c	     */		add	%o0,%i0,%o0
/* 0x3f10	1722 */		mov	21,%o3
/* 0x3f14	     */		mov	44,%o2
/* 0x3f18	     */		mov	12,%o1
/* 0x3f1c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f20	     */		mov	3,%o0
/* 0x3f24	     */		mov	%i2,%o3
/* 0x3f28	     */		sllx	%o0,3,%o7
/* 0x3f2c	     */		mov	1,%o2
/* 0x3f30	     */		add	%o7,%i4,%o0
/* 0x3f34	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f38	     */		mov	8,%o1
/* 0x3f3c	1723 */		sethi	%hi(0xf3800),%o0
/* 0x3f40	     */		mov	%i2,%o3
/* 0x3f44	     */		add	%o0,227,%o0
/* 0x3f48	     */		mov	1,%o2
/* 0x3f4c	     */		add	%o0,%sp,%o0
/* 0x3f50	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f54	     */		mov	4,%o1
/* 0x3f58	1725 */		mov	63,%o3
/* 0x3f5c	     */		mov	63,%o2
/* 0x3f60	     */		mov	15,%o1
/* 0x3f64	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f68	     */		mov	15,%o0
/* 0x3f6c	     */		sllx	%o0,3,%l4
/* 0x3f70	     */		mov	%i2,%o3
/* 0x3f74	     */		mov	1,%o2
/* 0x3f78	     */		mov	8,%o1
/* 0x3f7c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f80	     */		add	%l4,%i0,%o0
/* 0x3f84	1726 */		mov	63,%o3
/* 0x3f88	     */		mov	63,%o2
/* 0x3f8c	     */		mov	15,%o1
/* 0x3f90	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f94	     */		mov	15,%o0
/* 0x3f98	     */		mov	%i2,%o3
/* 0x3f9c	     */		sllx	%o0,3,%i0
/* 0x3fa0	     */		mov	1,%o2
/* 0x3fa4	     */		mov	8,%o1
/* 0x3fa8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3fac	     */		add	%i0,%i4,%o0
/* 0x3fb0	1727 */		sethi	%hi(0x400c00),%o0
/* 0x3fb4	     */		mov	%i2,%o3
/* 0x3fb8	     */		add	%o0,139,%o0
/* 0x3fbc	     */		mov	1,%o2
/* 0x3fc0	     */		add	%o0,%sp,%o0
/* 0x3fc4	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3fc8	     */		mov	4,%o1

! Registers live out of .L900001092: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002311 .L900001092

			.L900001091:
/* 0x3fcc	1730 */		call	fclose	!params=  %o0	!result= 
/* 0x3fd0	     */		mov	%i2,%o0
/* 0x3fd4	1731 */		sethi	%gdop_hix22(__iob),%g5
/* 0x3fd8	     */		xor	%g5,%gdop_lox10(__iob),%o5
/* 0x3fdc	     */		mov	%i1,%o1
/* 0x3fe0	     */		ldx	[%l7+%o5],%o3,%gdop(__iob)
/* 0x3fe4	     */		mov	%i5,%o2
/* 0x3fe8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x3fec	     */		add	%o3,256,%o0

! Registers live out of .L900001091: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002297 .L77002301 .L900001091

			.L900001060:
/* 0x3ff0	1734 */		call	free	!params=  %o0	!result= 
/* 0x3ff4	     */		mov	%i5,%o0
/* 0x3ff8	1747 */		ldx	[%sp+2887],%l4
/* 0x3ffc	     */		add	%l4,664,%o1
/* 0x4000	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4004	     */		mov	%l3,%o0
/* 0x4008	1748 */		st	%g0,[%sp+2295]
/* 0x400c	     */		ba	.L900001067
/* 0x4010	2043 */		nop

! Registers live out of .L900001060: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900001016

			.L77002357:
/* 0x4014	1753 */		ldx	[%sp+2887],%l3
/* 0x4018	     */		ldx	[%sp+2703],%o0
/* 0x401c	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x4020	     */		add	%l3,688,%o1
/* 0x4024	1754 */		ldx	[%sp+2519],%o2
/* 0x4028	     */		ldx	[%sp+2735],%o1
/* 0x402c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4030	     */		mov	%l6,%o0
/* 0x4034	1755 */		ldx	[%sp+2703],%g4
/* 0x4038	     */		ldub	[%g4],%i5

! Registers live out of .L77002357: 
! g2 g3 g4 o0 sp l5 l6 l7 i1 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002357 .L900000234

			.L900001090:
/* 0x403c	1755 */		brz,pn	%i5,.L900000235
/* 0x4040	     */		add	%g4,1,%g4

! Registers live out of .L900001090: 
! g2 g3 g4 o0 sp l5 l6 l7 i1 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001090

			.L900000234:
/* 0x4044	1755 */		ldub	[%g4],%g1
/* 0x4048	     */		add	%g4,1,%g4
/* 0x404c	     */		brnz,a,pt	%g1,.L900001090
/* 0x4050	     */		ldub	[%g4],%i5

! Registers live out of .L900000234: 
! g2 g3 g4 o0 sp l5 l6 l7 i1 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000234 .L900001090

			.L900000235:
/* 0x4054	1755 */		ldx	[%sp+2703],%o5
/* 0x4058	     */		sub	%g4,1,%o2
/* 0x405c	     */		mov	178,%o4
/* 0x4060	     */		ldx	[%sp+2743],%o1
/* 0x4064	     */		mov	220,%o3
/* 0x4068	     */		sub	%o2,%o5,%l4
/* 0x406c	     */		ldx	[%sp+2735],%o2
/* 0x4070	     */		sra	%l4,0,%o7
/* 0x4074	     */		stx	%o7,[%sp+2223]
/* 0x4078	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x407c	     */		mov	%l6,%o0
/* 0x4080	     */		ba	.L900001067
/* 0x4084	2043 */		nop

! Registers live out of .L900000235: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000299

			.L77002375:
/* 0x4088	1762 */		cmp	%o4,2
/* 0x408c	     */		bne,pt	%icc,.L900001089
/* 0x4090	2006 */		cmp	%o4,3

! Registers live out of .L77002375: 
! g1 g2 g3 o0 o4 sp l5 l6 l7 i1 i3 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002375

			.L77002379:
/* 0x4094	1001 */		add	%i3,-1,%i4
/* 0x4098	1002 */		add	%i1,-2,%g1
/* 0x409c	     */		st	%g1,[%sp+2319]
/* 0x40a0	1768 */		cmp	%i4,10
/* 0x40a4	     */		bl,pn	%icc,.L77002497
/* 0x40a8	1001 */		st	%i4,[%sp+2315]

! Registers live out of .L77002379: 
! g1 g2 g3 o0 sp l5 l6 l7 i4 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002379

			.L77002381:
/* 0x40ac	1768 */		cmp	%g1,10
/* 0x40b0	     */		bl,pn	%icc,.L77002497
/* 0x40b4	     */		cmp	%i4,1034

! Registers live out of .L77002381: 
! g1 g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002381

			.L77002383:
/* 0x40b8	1768 */		bge,pn	%icc,.L77002497
/* 0x40bc	     */		cmp	%g1,1034

! Registers live out of .L77002383: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002383

			.L77002385:
/* 0x40c0	1768 */		bge,pn	%icc,.L77002497
/* 0x40c4	   0 */		sethi	%gdop_hix22(.L527),%l3

! Registers live out of .L77002385: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002385 .L900001013

			.L77002387:
/* 0x40c8	1780 */		ld	[%sp+2319],%i0
/* 0x40cc	     */		ld	[%sp+2315],%i1
/* 0x40d0	   0 */		xor	%l3,%gdop_lox10(.L527),%i3
/* 0x40d4	   0 */		ldx	[%l7+%i3],%i5,%gdop(.L527)
/* 0x40d8	1780 */		mov	1034,%i3
/* 0x40dc	     */		sub	%i3,%i0,%i2
/* 0x40e0	     */		add	%i1,-10,%i3
/* 0x40e4	     */		sra	%i2,0,%o2
/* 0x40e8	     */		sra	%i3,0,%o1
/* 0x40ec	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x40f0	     */		mov	%i5,%o0
/* 0x40f4	1782 */		sra	%i2,0,%o1
/* 0x40f8	     */		sra	%i3,0,%o0
/* 0x40fc	     */		add	%sp,2487,%o4
/* 0x4100	     */		mov	1024,%o3
/* 0x4104	     */		call	fp_region	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x4108	     */		mov	1024,%o2
/* 0x410c	1783 */		ldd	[%sp+2487],%f34
/* 0x4110	1784 */		ldd	[%sp+2495],%f32
/* 0x4114	1786 */		ldx	[%sp+2735],%o1
/* 0x4118	     */		mov	%l6,%o0
/* 0x411c	1784 */		std	%f32,[%sp+2935]
/* 0x4120	1783 */		std	%f34,[%sp+2927]
/* 0x4124	1786 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4128	     */		ldx	[%sp+2535],%o2
/* 0x412c	1787 */		ldx	[%sp+2703],%o0
/* 0x4130	     */		ldx	[%sp+2927],%o2
/* 0x4134	     */		add	%i5,40,%o1
/* 0x4138	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x413c	     */		ldx	[%sp+2935],%o3
/* 0x4140	1788 */		ldx	[%sp+2703],%l2
/* 0x4144	     */		ldub	[%l2],%i4

! Registers live out of .L77002387: 
! g2 g3 o0 sp l2 l5 l6 l7 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002387 .L900000230

			.L900001088:
/* 0x4148	1788 */		brz,pn	%i4,.L900000231
/* 0x414c	     */		add	%l2,1,%l2

! Registers live out of .L900001088: 
! g2 g3 o0 sp l2 l5 l6 l7 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900001088

			.L900000230:
/* 0x4150	1788 */		ldub	[%l2],%l3
/* 0x4154	     */		add	%l2,1,%l2
/* 0x4158	     */		brnz,a,pt	%l3,.L900001088
/* 0x415c	     */		ldub	[%l2],%i4

! Registers live out of .L900000230: 
! g2 g3 o0 sp l2 l5 l6 l7 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000230 .L900001088

			.L900000231:
/* 0x4160	1788 */		ldx	[%sp+2703],%o5
/* 0x4164	1793 */		sra	%i3,31,%i1
/* 0x4168	1788 */		sub	%l2,1,%g5
/* 0x416c	     */		ldx	[%sp+2735],%o2
/* 0x4170	     */		mov	250,%o4
/* 0x4174	     */		ldx	[%sp+2743],%o1
/* 0x4178	     */		mov	10,%o3
/* 0x417c	1793 */		sethi	%gdop_hix22(.L332),%i5
/* 0x4180	1788 */		sub	%g5,%o5,%g4
/* 0x4184	     */		mov	%o5,%l3
/* 0x4188	     */		sra	%g4,0,%i2
/* 0x418c	     */		stx	%i2,[%sp+2223]
/* 0x4190	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4194	     */		mov	%l6,%o0
/* 0x4198	1793 */		ld	[%sp+2319],%i4
/* 0x419c	     */		and	%i1,63,%o5
/* 0x41a0	     */		xor	%i5,%gdop_lox10(.L332),%o3
/* 0x41a4	     */		add	%i3,%o5,%i0
/* 0x41a8	     */		sra	%i0,6,%o2
/* 0x41ac	     */		mov	%l3,%o0
/* 0x41b0	     */		ldx	[%l7+%o3],%o1,%gdop(.L332)
/* 0x41b4	     */		add	%i4,-1034,%l4
/* 0x41b8	     */		sra	%l4,31,%l2
/* 0x41bc	     */		and	%l2,63,%o4
/* 0x41c0	     */		add	%l4,%o4,%o7
/* 0x41c4	     */		sra	%o7,6,%g1
/* 0x41c8	     */		sub	%g0,%g1,%g5
/* 0x41cc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x41d0	     */		sra	%g5,0,%o3
/* 0x41d4	1794 */		sethi	%gdop_hix22(.L529),%o0
/* 0x41d8	     */		xor	%o0,%gdop_lox10(.L529),%o2
/* 0x41dc	     */		mov	%l3,%o1
/* 0x41e0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x41e4	     */		ldx	[%l7+%o2],%o0,%gdop(.L529)
/* 0x41e8	1795 */		ldub	[%l3],%l2
/* 0x41ec	     */		mov	%l3,%o3

! Registers live out of .L900000231: 
! g2 g3 o0 o3 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000226 .L900000231

			.L900001087:
/* 0x41f0	1795 */		brz,pn	%l2,.L900000227
/* 0x41f4	     */		add	%o3,1,%o3

! Registers live out of .L900001087: 
! g2 g3 o0 o3 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900001087

			.L900000226:
/* 0x41f8	1795 */		ldub	[%o3],%o5
/* 0x41fc	     */		add	%o3,1,%o3
/* 0x4200	     */		brnz,a,pt	%o5,.L900001087
/* 0x4204	     */		ldub	[%o3],%l2

! Registers live out of .L900000226: 
! g2 g3 o0 o3 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000226 .L900001087

			.L900000227:
/* 0x4208	1795 */		ldx	[%sp+2703],%o5
/* 0x420c	     */		sub	%o3,1,%o1
/* 0x4210	   0 */		sethi	%gdop_hix22(.L530),%i1
/* 0x4214	1795 */		ldx	[%sp+2735],%o2
/* 0x4218	     */		mov	270,%o4
/* 0x421c	     */		mov	10,%o3
/* 0x4220	   0 */		xor	%i1,%gdop_lox10(.L530),%i5
/* 0x4224	1795 */		sub	%o1,%o5,%g4
/* 0x4228	     */		ldx	[%sp+2743],%o1
/* 0x422c	     */		mov	%o5,%l4
/* 0x4230	     */		sra	%g4,0,%i2
/* 0x4234	     */		stx	%i2,[%sp+2223]
/* 0x4238	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x423c	     */		mov	%l6,%o0
/* 0x4240	   0 */		ldx	[%l7+%i5],%i3,%gdop(.L530)
/* 0x4244	1797 */		ldx	[%sp+2927],%o1
/* 0x4248	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x424c	     */		mov	%i3,%o0
/* 0x4250	1798 */		ldx	[%sp+2935],%o1
/* 0x4254	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4258	     */		add	%i3,32,%o0
/* 0x425c	1800 */		ldx	[%sp+2647],%o2
/* 0x4260	     */		mov	%l6,%o0
/* 0x4264	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4268	     */		ldx	[%sp+2735],%o1
/* 0x426c	1801 */		ldx	[%sp+2927],%o2
/* 0x4270	     */		mov	%l4,%o0
/* 0x4274	     */		add	%i3,64,%o1
/* 0x4278	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x427c	     */		ldx	[%sp+2935],%o3
/* 0x4280	1802 */		ldub	[%l4],%l2
/* 0x4284	     */		mov	%l4,%g1

! Registers live out of .L900000227: 
! g1 g2 g3 o0 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000222 .L900000227

			.L900001086:
/* 0x4288	1802 */		brz,pn	%l2,.L900000223
/* 0x428c	     */		add	%g1,1,%g1

! Registers live out of .L900001086: 
! g1 g2 g3 o0 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900001086

			.L900000222:
/* 0x4290	1802 */		ldub	[%g1],%i0
/* 0x4294	     */		add	%g1,1,%g1
/* 0x4298	     */		brnz,a,pt	%i0,.L900001086
/* 0x429c	     */		ldub	[%g1],%l2

! Registers live out of .L900000222: 
! g1 g2 g3 o0 sp l2 l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900000222 .L900001086

			.L900000223:
/* 0x42a0	1802 */		ldx	[%sp+2703],%o5
/* 0x42a4	     */		sub	%g1,1,%i4
/* 0x42a8	     */		ldx	[%sp+2735],%o2
/* 0x42ac	     */		mov	290,%o4
/* 0x42b0	     */		ldx	[%sp+2743],%o1
/* 0x42b4	     */		mov	10,%o3
/* 0x42b8	     */		sub	%i4,%o5,%l2
/* 0x42bc	     */		mov	%o5,%i0
/* 0x42c0	     */		sra	%l2,0,%l4
/* 0x42c4	     */		stx	%l4,[%sp+2223]
/* 0x42c8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x42cc	     */		mov	%l6,%o0
/* 0x42d0	1805 */		ldd	[%sp+2783],%f6
/* 0x42d4	     */		ldd	[%sp+2791],%f8
/* 0x42d8	     */		add	%sp,2487,%o5
/* 0x42dc	     */		ldd	[%sp+2935],%f2
/* 0x42e0	     */		ldd	[%sp+2927],%f0
/* 0x42e4	     */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x42e8	     */		ldd	[%sp+2711],%f4
/* 0x42ec	   0 */		sethi	%gdop_hix22(.L533),%o4
/* 0x42f0	1806 */		ldd	[%sp+2487],%f34
/* 0x42f4	   0 */		add	%sp,2823,%i1
/* 0x42f8	   0 */		xor	%o4,%gdop_lox10(.L533),%o7
/* 0x42fc	1807 */		ldd	[%sp+2495],%f32
/* 0x4300	   0 */		add	%sp,2831,%l3
/* 0x4304	1806 */		std	%f34,[%sp+2823]
/* 0x4308	   0 */		ldx	[%l7+%o7],%i2,%gdop(.L533)
/* 0x430c	1807 */		std	%f32,[%sp+2831]
/* 0x4310	1809 */		call	printf	!params=  %o0	!result= 
/* 0x4314	     */		mov	%i2,%o0
/* 0x4318	1810 */		ldx	[%sp+2783],%o1
/* 0x431c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4320	     */		add	%i2,32,%o0
/* 0x4324	1811 */		ldx	[%sp+2791],%o1
/* 0x4328	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x432c	     */		add	%i2,64,%o0
/* 0x4330	1812 */		ldx	[%i1],%o1
/* 0x4334	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4338	     */		add	%i2,96,%o0
/* 0x433c	1813 */		ldx	[%l3],%o1
/* 0x4340	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4344	     */		add	%i2,128,%o0
/* 0x4348	1821 */		ldx	[%sp+2519],%o2
/* 0x434c	     */		mov	%l6,%o0
/* 0x4350	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4354	     */		ldx	[%sp+2751],%o1
/* 0x4358	1822 */		ldx	[%l3],%o3
/* 0x435c	     */		mov	%i0,%o0
/* 0x4360	     */		add	%i2,-1384,%o1
/* 0x4364	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4368	     */		ldx	[%i1],%o2
/* 0x436c	1823 */		ldub	[%i0],%i4
/* 0x4370	     */		mov	%i0,%o3

! Registers live out of .L900000223: 
! g2 g3 o3 sp l5 l6 l7 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000218 .L900000223

			.L900001085:
/* 0x4374	1823 */		brz,pn	%i4,.L900000219
/* 0x4378	     */		add	%o3,1,%o3

! Registers live out of .L900001085: 
! g2 g3 o3 sp l5 l6 l7 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900001085

			.L900000218:
/* 0x437c	1823 */		ldub	[%o3],%i3
/* 0x4380	     */		add	%o3,1,%o3
/* 0x4384	     */		brnz,a,pt	%i3,.L900001085
/* 0x4388	     */		ldub	[%o3],%i4

! Registers live out of .L900000218: 
! g2 g3 o3 sp l5 l6 l7 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000218 .L900001085

			.L900000219:
/* 0x438c	1823 */		ldx	[%sp+2703],%o5
/* 0x4390	     */		sub	%o3,1,%g5
/* 0x4394	     */		mov	80,%o4
/* 0x4398	     */		ldx	[%sp+2775],%o1
/* 0x439c	     */		mov	10,%o3
/* 0x43a0	1827 */		sethi	%gdop_hix22(.L529),%i5
/* 0x43a4	1823 */		sub	%g5,%o5,%o0
/* 0x43a8	     */		mov	%o5,%i3
/* 0x43ac	     */		sra	%o0,0,%o2
/* 0x43b0	1828 */		mov	%i3,%i0
/* 0x43b4	1823 */		stx	%o2,[%sp+2223]
/* 0x43b8	     */		ldx	[%sp+2751],%o2
/* 0x43bc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x43c0	     */		mov	%l6,%o0
/* 0x43c4	1825 */		ldx	[%sp+2535],%o2
/* 0x43c8	     */		ldx	[%sp+2751],%o1
/* 0x43cc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x43d0	     */		mov	%l6,%o0
/* 0x43d4	1826 */		ld	[%sp+2279],%o2
/* 0x43d8	     */		mov	%i3,%o0
/* 0x43dc	     */		sethi	%gdop_hix22(.L538),%o1
/* 0x43e0	     */		xor	%o1,%gdop_lox10(.L538),%g4
/* 0x43e4	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x43e8	     */		ldx	[%l7+%g4],%o1,%gdop(.L538)
/* 0x43ec	1827 */		xor	%i5,%gdop_lox10(.L529),%o5
/* 0x43f0	     */		ldx	[%l7+%o5],%o0,%gdop(.L529)
/* 0x43f4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x43f8	     */		mov	%i3,%o1
/* 0x43fc	1828 */		ldub	[%i3],%i2

! Registers live out of .L900000219: 
! g2 g3 o0 sp l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000214 .L900000219

			.L900001084:
/* 0x4400	1828 */		brz,pn	%i2,.L900000215
/* 0x4404	     */		add	%i0,1,%i0

! Registers live out of .L900001084: 
! g2 g3 o0 sp l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900001084

			.L900000214:
/* 0x4408	1828 */		ldub	[%i0],%i4
/* 0x440c	     */		add	%i0,1,%i0
/* 0x4410	     */		brnz,a,pt	%i4,.L900001084
/* 0x4414	     */		ldub	[%i0],%i2

! Registers live out of .L900000214: 
! g2 g3 o0 sp l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000214 .L900001084

			.L900000215:
/* 0x4418	1828 */		sub	%i0,1,%l2
/* 0x441c	     */		ldx	[%sp+2703],%o5
/* 0x4420	     */		mov	100,%o4
/* 0x4424	     */		ldx	[%sp+2751],%o2
/* 0x4428	     */		mov	10,%o3
/* 0x442c	1831 */		sethi	%gdop_hix22(.L539),%i2
/* 0x4430	1828 */		ldx	[%sp+2775],%o1
/* 0x4434	1831 */		xor	%i2,%gdop_lox10(.L539),%i1
/* 0x4438	1828 */		sub	%l2,%o5,%l4
/* 0x443c	     */		mov	%o5,%i4
/* 0x4440	     */		sra	%l4,0,%o7
/* 0x4444	     */		stx	%o7,[%sp+2223]
/* 0x4448	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x444c	     */		mov	%l6,%o0
/* 0x4450	1830 */		sethi	%gdop_hix22(.L338),%o4
/* 0x4454	     */		ldx	[%sp+2711],%o2
/* 0x4458	     */		xor	%o4,%gdop_lox10(.L338),%l3
/* 0x445c	     */		mov	%i4,%o0
/* 0x4460	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x4464	     */		ldx	[%l7+%l3],%o1,%gdop(.L338)
/* 0x4468	1832 */		mov	%i4,%i5
/* 0x446c	1831 */		ldx	[%sp+2711],%o1
/* 0x4470	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4474	     */		ldx	[%l7+%i1],%o0,%gdop(.L539)
/* 0x4478	1832 */		ldub	[%i4],%o3

! Registers live out of .L900000215: 
! g2 g3 o3 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000210 .L900000215

			.L900001083:
/* 0x447c	1832 */		brz,pn	%o3,.L900000211
/* 0x4480	     */		add	%i5,1,%i5

! Registers live out of .L900001083: 
! g2 g3 o3 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001083

			.L900000210:
/* 0x4484	1832 */		ldub	[%i5],%o2
/* 0x4488	     */		add	%i5,1,%i5
/* 0x448c	     */		brnz,a,pt	%o2,.L900001083
/* 0x4490	     */		ldub	[%i5],%o3

! Registers live out of .L900000210: 
! g2 g3 o3 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000210 .L900001083

			.L900000211:
/* 0x4494	1832 */		ldx	[%sp+2703],%o5
/* 0x4498	     */		sub	%i5,1,%g1
/* 0x449c	     */		mov	120,%o4
/* 0x44a0	     */		ldx	[%sp+2751],%o2
/* 0x44a4	     */		mov	10,%o3
/* 0x44a8	     */		ldx	[%sp+2775],%o1
/* 0x44ac	     */		sub	%g1,%o5,%g5
/* 0x44b0	     */		mov	%o5,%i5
/* 0x44b4	     */		sra	%g5,0,%o0
/* 0x44b8	     */		stx	%o0,[%sp+2223]
/* 0x44bc	1835 */		mov	%i5,%i0
/* 0x44c0	1832 */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x44c4	     */		mov	%l6,%o0
/* 0x44c8	1834 */		ldx	[%sp+2783],%o2
/* 0x44cc	     */		sethi	%gdop_hix22(.L339),%o1
/* 0x44d0	     */		ldx	[%sp+2791],%o3
/* 0x44d4	     */		xor	%o1,%gdop_lox10(.L339),%g4
/* 0x44d8	     */		mov	%i5,%o0
/* 0x44dc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x44e0	     */		ldx	[%l7+%g4],%o1,%gdop(.L339)
/* 0x44e4	1835 */		ldub	[%i5],%i5

! Registers live out of .L900000211: 
! g2 g3 o0 sp l5 l6 l7 i0 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000206 .L900000211

			.L900001082:
/* 0x44e8	1835 */		brz,pn	%i5,.L900000207
/* 0x44ec	     */		add	%i0,1,%i0

! Registers live out of .L900001082: 
! g2 g3 o0 sp l5 l6 l7 i0 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001082

			.L900000206:
/* 0x44f0	1835 */		ldub	[%i0],%i4
/* 0x44f4	     */		add	%i0,1,%i0
/* 0x44f8	     */		brnz,a,pt	%i4,.L900001082
/* 0x44fc	     */		ldub	[%i0],%i5

! Registers live out of .L900000206: 
! g2 g3 o0 sp l5 l6 l7 i0 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000206 .L900001082

			.L900000207:
/* 0x4500	1835 */		ldx	[%sp+2703],%o5
/* 0x4504	     */		sub	%i0,1,%i3
/* 0x4508	     */		mov	140,%o4
/* 0x450c	     */		ldx	[%sp+2751],%o2
/* 0x4510	1841 */		mov	1,%i2
/* 0x4514	1835 */		ldx	[%sp+2775],%o1
/* 0x4518	     */		sub	%i3,%o5,%o3
/* 0x451c	1852 */		mov	0,%i3
/* 0x4520	1835 */		sra	%o3,0,%l2
/* 0x4524	     */		mov	10,%o3
/* 0x4528	     */		stx	%l2,[%sp+2223]
/* 0x452c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4530	     */		mov	%l6,%o0
/* 0x4534	1836 */		ldx	[%sp+2567],%o2
/* 0x4538	     */		ldx	[%sp+2751],%o1
/* 0x453c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4540	     */		mov	%l6,%o0
/* 0x4544	1838 */		add	%sp,2503,%o1
/* 0x4548	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x454c	     */		mov	3,%o0
/* 0x4550	1845 */		ld	[%sp+2307],%o1
/* 0x4554	1852 */		add	%fp,-1057,%o7
/* 0x4558	1840 */		ld	[%sp+2299],%g4
/* 0x455c	1852 */		add	%sp,3215,%l3
/* 0x4560	     */		stx	%o7,[%sp+2255]
/* 0x4564	     */		mov	1034,%o3
/* 0x4568	1853 */		mov	%o7,%i5
/* 0x456c	1852 */		stx	%l3,[%sp+2263]
/* 0x4570	     */		st	%o3,[%sp+2323]
/* 0x4574	1845 */		sub	%g0,%o1,%l4
/* 0x4578	     */		mov	%o1,%o2
/* 0x457c	     */		srlx	%l4,63,%o4
/* 0x4580	1840 */		cmp	%g4,1
/* 0x4584	1841 */		move	%icc,0,%i2
/* 0x4588	1845 */		xor	%o4,1,%i1
/* 0x458c	1841 */		st	%i2,[%sp+2299]
/* 0x4590	1845 */		movne	%icc,%i1,%o2
/* 0x4594	     */		st	%o2,[%sp+2307]

! Registers live out of .L900000207: 
! g2 g3 o0 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002491 .L900000207

			.L900001069:
/* 0x4598	1853 */		ldx	[%sp+2263],%i1
/* 0x459c	1857 */		ld	[%i5],%l4
/* 0x45a0	1853 */		mov	10,%o2
/* 0x45a4	     */		mov	0,%l3
/* 0x45a8	     */		st	%o2,[%sp+2327]
/* 0x45ac	     */		stx	%i1,[%sp+2839]

! Registers live out of .L900001069: 
! g2 g3 o0 sp l4 l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002487 .L900001069

			.L900001070:
/* 0x45b0	1857 */		cmp	%l4,0
/* 0x45b4	     */		bne,pn	%icc,.L77002487
/* 0x45b8	1858 */		add	%sp,2663,%o1

! Registers live out of .L900001070: 
! g2 g3 o0 o1 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001070

			.L77002693:
/* 0x45bc	1858 */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x45c0	     */		mov	3,%o0
/* 0x45c4	1859 */		ldx	[%sp+2839],%o1
/* 0x45c8	     */		ld	[%sp+2323],%l4
/* 0x45cc	   0 */		add	%sp,2487,%i1
/* 0x45d0	1859 */		mov	0,%i2
/* 0x45d4	     */		stx	%o1,[%sp+2847]
/* 0x45d8	1862 */		mov	%o1,%i0

! Registers live out of .L77002693: 
! g2 g3 o4 sp l4 l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002481 .L77002693

			.L900001072:
/* 0x45dc	1862 */		ld	[%sp+2327],%i4
/* 0x45e0	1892 */		prefetch	[%i0+256],2
/* 0x45e4	1867 */		sra	%i2,0,%o3
/* 0x45e8	1862 */		mov	0,%l2
/* 0x45ec	1892 */		prefetch	[%i0+512],2
/* 0x45f0	     */		prefetch	[%i0+768],2
/* 0x45f4	     */		prefetch	[%i0+1024],2
/* 0x45f8	     */		prefetch	[%i0+1280],2
/* 0x45fc	     */		prefetch	[%i0+1536],2
/* 0x4600	     */		prefetch	[%i0+1792],2
/* 0x4604	     */		prefetch	[%i0+2048],2
/* 0x4608	     */		prefetch	[%i0+2304],2
/* 0x460c	     */		prefetch	[%i0+2560],2
/* 0x4610	     */		prefetch	[%i0+2816],2
/* 0x4614	     */		prefetch	[%i0+3072],2

! Registers live out of .L900001072: 
! g2 g3 o3 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001072 .L900001074

			.L900001073:
/* 0x4618	1867 */		sra	%l2,0,%o2
/* 0x461c	     */		sra	%i3,0,%o1
/* 0x4620	     */		stx	%i1,[%sp+2223]
/* 0x4624	     */		sra	%l3,0,%o0
/* 0x4628	     */		mov	1024,%o5
/* 0x462c	     */		call	fp_vbox	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4630	     */		mov	1024,%o4
/* 0x4634	1871 */		ldd	[%i1],%f0
/* 0x4638	     */		ldd	[%sp+2791],%f8
/* 0x463c	     */		ldd	[%sp+2783],%f6
/* 0x4640	     */		ldd	[%sp+2711],%f4
/* 0x4644	   0 */		mov	%i1,%o5
/* 0x4648	1871 */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x464c	     */		ldd	[%sp+2495],%f2
/* 0x4650	1891 */		ld	[%i5],%o7
/* 0x4654	1872 */		ldd	[%i1],%f32
/* 0x4658	1873 */		ldd	[%sp+2495],%f34
/* 0x465c	1872 */		std	%f32,[%sp+2823]
/* 0x4660	1891 */		cmp	%o7,1
/* 0x4664	     */		bne,pn	%icc,.L77002421
/* 0x4668	1873 */		std	%f34,[%sp+2831]

! Registers live out of .L900001073: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L900001073

			.L77002419:
/* 0x466c	1871 */		ld	[%sp+2279],%o2
/* 0x4670	1892 */		ld	[%i0],%o0
/* 0x4674	     */		prefetch	[%i0+3328],2
/* 0x4678	     */		ba	.L900001081
/* 0x467c	1902 */		ld	[%sp+2299],%o5

! Registers live out of .L77002419: 
! g2 g3 o0 o2 o5 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L900001073

			.L77002421:
/* 0x4680	1894 */		sra	%i2,0,%o3
/* 0x4684	     */		sra	%l2,0,%o2
/* 0x4688	     */		sra	%i3,0,%o1
/* 0x468c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4690	     */		sra	%l3,0,%o0
/* 0x4694	     */		ldx	[%sp+2463],%g5
/* 0x4698	     */		ldd	[%sp+2823],%f32
/* 0x469c	1895 */		sra	%i2,0,%o3
/* 0x46a0	     */		sra	%l2,0,%o2
/* 0x46a4	     */		sra	%i3,0,%o1
/* 0x46a8	1894 */		sllx	%o0,3,%o5
/* 0x46ac	1895 */		sra	%l3,0,%o0
/* 0x46b0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x46b4	1894 */		std	%f32,[%o5+%g5]
/* 0x46b8	1895 */		ldd	[%sp+2831],%f2
/* 0x46bc	1897 */		ldd	[%sp+2823],%f0
/* 0x46c0	     */		ld	[%sp+2279],%o2
/* 0x46c4	1895 */		sllx	%o0,3,%o3
/* 0x46c8	     */		ldx	[%sp+2695],%o0
/* 0x46cc	1897 */		call	mbrot	!params=  %o2 %f0 %f1 %f2 %f3	!result=  %o0
/* 0x46d0	1895 */		std	%f2,[%o3+%o0]
/* 0x46d4	1902 */		ld	[%sp+2299],%o5
/* 0x46d8	1897 */		ld	[%sp+2279],%o2
/* 0x46dc	1899 */		prefetch	[%i0+3328],2
/* 0x46e0	     */		st	%o0,[%i0]

! Registers live out of .L77002421: 
! g2 g3 o0 o2 o5 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77002419 .L77002421

			.L900001081:
/* 0x46e4	1902 */		cmp	%o5,1
/* 0x46e8	     */		bne,pn	%icc,.L77002469
/* 0x46ec	1904 */		ld	[%sp+2307],%o7

! Registers live out of .L900001081: 
! g2 g3 o0 o2 sp o7 l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L900001081

			.L77002425:
/* 0x46f0	1904 */		cmp	%o7,0
/* 0x46f4	     */		bne,pn	%icc,.L77002429
/* 0x46f8	1905 */		ldd	[%l5+8],%f4

! Registers live out of .L77002425: 
! g2 g3 o0 o2 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 f4 f5 
		                       
! predecessor blocks: .L77002425

			.L77002427:
/* 0x46fc	1905 */		st	%o0,[%sp+2403]
/* 0x4700	     */		st	%o2,[%sp+2407]
/* 0x4704	     */		ld	[%sp+2403],%f7
/* 0x4708	     */		ld	[%sp+2407],%f1
/* 0x470c	     */		fmovs	%f4,%f0
/* 0x4710	     */		fmovs	%f4,%f6
/* 0x4714	     */		fsubd	%f0,%f4,%f32
/* 0x4718	     */		fsubd	%f6,%f4,%f34
/* 0x471c	     */		fabsd	%f32,%f32
/* 0x4720	     */		fabsd	%f34,%f34
/* 0x4724	     */		fdivd	%f34,%f32,%f0
/* 0x4728	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x472c	     */		ldd	[%l5+72],%f2
/* 0x4730	     */		fmovd	%f0,%f46
/* 0x4734	     */		ba	.L900001080
/* 0x4738	1910 */		fmovd	%f0,%f0

! Registers live out of .L77002427: 
! g2 g3 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 f46 
		                       
! predecessor blocks: .L77002425

			.L77002429:
/* 0x473c	1907 */		st	%o0,[%sp+2411]
/* 0x4740	     */		st	%o2,[%sp+2415]
/* 0x4744	     */		fmovs	%f4,%f0
/* 0x4748	     */		fmovs	%f4,%f6
/* 0x474c	     */		ld	[%sp+2411],%f7
/* 0x4750	     */		ld	[%sp+2415],%f1
/* 0x4754	     */		ldd	[%l5],%f36
/* 0x4758	     */		fsubd	%f0,%f4,%f32
/* 0x475c	     */		fsubd	%f6,%f4,%f34
/* 0x4760	     */		fabsd	%f34,%f34
/* 0x4764	     */		fabsd	%f32,%f32
/* 0x4768	     */		fdivd	%f34,%f32,%f32
/* 0x476c	     */		fsubd	%f36,%f32,%f0
/* 0x4770	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x4774	     */		ldd	[%l5+72],%f2
/* 0x4778	     */		fmovd	%f0,%f46

! Registers live out of .L77002429: 
! g2 g3 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 f46 
		                       
! predecessor blocks: .L77002427 .L77002429

			.L900001080:
/* 0x477c	1910 */		ldd	[%l5+80],%f2
/* 0x4780	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x4784	     */		std	%f46,[%fp+2031]
/* 0x4788	1914 */		add	%sp,2471,%o1
/* 0x478c	     */		ldd	[%l5],%f34
/* 0x4790	     */		ldd	[%l5+40],%f32
/* 0x4794	     */		add	%sp,2479,%o2
/* 0x4798	     */		ldd	[%l5+72],%f36
/* 0x479c	     */		ldd	[%l5+88],%f38
/* 0x47a0	     */		ldd	[%l5+96],%f42
/* 0x47a4	     */		ldd	[%l5+24],%f40
/* 0x47a8	     */		ldd	[%fp+2031],%f46
/* 0x47ac	     */		std	%f0,[%fp+2015]
/* 0x47b0	     */		fdivd	%f34,%f32,%f44
/* 0x47b4	     */		fsubd	%f34,%f0,%f32
/* 0x47b8	     */		fmuld	%f0,%f36,%f34
/* 0x47bc	     */		fmuld	%f40,%f38,%f36
/* 0x47c0	     */		fmuld	%f34,%f32,%f48
/* 0x47c4	     */		fmaddd	%f46,%f42,%f44,%f32
/* 0x47c8	     */		fmuld	%f36,%f32,%f0
/* 0x47cc	     */		call	__sincos	!params=  %o1 %o2 %f0 %f1	!result= 
/* 0x47d0	     */		std	%f48,[%fp+2023]
/* 0x47d4	     */		ldd	[%l5+104],%f32
/* 0x47d8	     */		ldd	[%l5+112],%f34
/* 0x47dc	     */		ldd	[%sp+2471],%f38
/* 0x47e0	1918 */		ldd	[%l5+136],%f36
/* 0x47e4	     */		ldd	[%l5+128],%f40
/* 0x47e8	1914 */		ldd	[%sp+2479],%f46
/* 0x47ec	1921 */		ldd	[%l5+144],%f42
/* 0x47f0	1914 */		ldd	[%fp+2023],%f48
/* 0x47f4	     */		ldd	[%fp+2015],%f0
/* 0x47f8	     */		fnegd	%f32,%f44
/* 0x47fc	     */		ldd	[%l5+120],%f50
/* 0x4800	1924 */		ldd	[%l5],%f52
/* 0x4804	1914 */		fmuld	%f38,%f34,%f32
/* 0x4808	1918 */		fmuld	%f38,%f36,%f34
/* 0x480c	     */		fnegd	%f40,%f36
/* 0x4810	1921 */		fmuld	%f46,%f42,%f38
/* 0x4814	1914 */		fmaddd	%f44,%f46,%f32,%f32
/* 0x4818	1918 */		fmsubd	%f36,%f46,%f34,%f34
/* 0x481c	1921 */		fmuld	%f48,%f38,%f36
/* 0x4820	1914 */		fmuld	%f48,%f32,%f38
/* 0x4824	1918 */		fmuld	%f48,%f34,%f34
/* 0x4828	1921 */		fmaddd	%f36,%f50,%f0,%f32
/* 0x482c	1914 */		fmaddd	%f38,%f50,%f0,%f36
/* 0x4830	1924 */		fcmped	%fcc3,%f36,%f52
/* 0x4834	     */		fbule,pn	%fcc3,.L77002435
/* 0x4838	1918 */		fmaddd	%f34,%f50,%f0,%f34

! Registers live out of .L900001080: 
! g2 g3 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900001080

			.L77002433:
/* 0x483c	1924 */		fmovd	%f52,%f36
/* 0x4840	     */		ba	.L900001079
/* 0x4844	     */		ldd	[%l5+152],%f38

! Registers live out of .L77002433: 
! g2 g3 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f38 f52 
		                       
! predecessor blocks: .L900001080

			.L77002435:
/* 0x4848	1924 */		fzero	%f38
/* 0x484c	     */		fcmped	%fcc0,%f36,%f38
/* 0x4850	     */		fmovdl	%fcc0,%f38,%f36
/* 0x4854	     */		ldd	[%l5+152],%f38

! Registers live out of .L77002435: 
! g2 g3 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f38 f52 
		                       
! predecessor blocks: .L77002433 .L77002435

			.L900001079:
/* 0x4858	1924 */		fmuld	%f36,%f38,%f36
/* 0x485c	1927 */		fcmped	%fcc1,%f34,%f52
/* 0x4860	1924 */		fdtoi	%f36,%f8
/* 0x4864	     */		st	%f8,[%sp+2383]
/* 0x4868	     */		ldub	[%sp+2386],%o0
/* 0x486c	1927 */		fbule,a,pn	%fcc1,.L900001078
/* 0x4870	     */		fzero	%f36

! Registers live out of .L900001079: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900001079

			.L77002445:
/* 0x4874	1927 */		fmovd	%f52,%f34
/* 0x4878	     */		ba	.L900001077
/* 0x487c	     */		ldd	[%l5+152],%f36

! Registers live out of .L77002445: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900001079

			.L900001078:
/* 0x4880	1927 */		fcmped	%fcc2,%f34,%f36
/* 0x4884	     */		fmovdl	%fcc2,%f36,%f34
/* 0x4888	     */		ldd	[%l5+152],%f36

! Registers live out of .L900001078: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L77002445 .L900001078

			.L900001077:
/* 0x488c	1927 */		fmuld	%f34,%f36,%f34
/* 0x4890	1930 */		fcmped	%fcc3,%f32,%f52
/* 0x4894	1927 */		fdtoi	%f34,%f8
/* 0x4898	     */		st	%f8,[%sp+2391]
/* 0x489c	     */		ldub	[%sp+2394],%o1
/* 0x48a0	1930 */		fbule,a,pn	%fcc3,.L900001076
/* 0x48a4	     */		fzero	%f34

! Registers live out of .L900001077: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 f52 
		                       
! predecessor blocks: .L900001077

			.L77002457:
/* 0x48a8	1930 */		fmovd	%f52,%f32
/* 0x48ac	     */		ba	.L900001075
/* 0x48b0	1933 */		ldd	[%l5+152],%f34

! Registers live out of .L77002457: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L900001077

			.L900001076:
/* 0x48b4	1930 */		fcmped	%fcc0,%f32,%f34
/* 0x48b8	     */		fmovdl	%fcc0,%f34,%f32
/* 0x48bc	1933 */		ldd	[%l5+152],%f34

! Registers live out of .L900001076: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L77002457 .L900001076

			.L900001075:
/* 0x48c0	1933 */		fmuld	%f32,%f34,%f32
/* 0x48c4	     */		sll	%o0,16,%o7
/* 0x48c8	     */		sll	%o1,8,%o4
/* 0x48cc	1935 */		ldx	[%sp+2759],%o1
/* 0x48d0	     */		mov	%l6,%o0
/* 0x48d4	1933 */		fdtoi	%f32,%f8
/* 0x48d8	     */		st	%f8,[%sp+2399]
/* 0x48dc	     */		ldub	[%sp+2402],%g1
/* 0x48e0	     */		add	%g1,%o7,%g4
/* 0x48e4	     */		add	%g4,%o4,%g5
/* 0x48e8	     */		sra	%g5,0,%o2
/* 0x48ec	1935 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x48f0	1933 */		stx	%o2,[%sp+3151]
/* 0x48f4	1935 */		ba	.L900001074
/* 0x48f8	1947 */		sra	%l4,0,%o4

! Registers live out of .L900001075: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001081

			.L77002469:
/* 0x48fc	1939 */		cmp	%o0,%o2
/* 0x4900	     */		bne,pn	%icc,.L77002473
/* 0x4904	1940 */		ldx	[%sp+2759],%o1

! Registers live out of .L77002469: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002469

			.L77002471:
/* 0x4908	1940 */		mov	0,%o2
/* 0x490c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4910	     */		mov	%l6,%o0
/* 0x4914	     */		ba	.L900001074
/* 0x4918	1947 */		sra	%l4,0,%o4

! Registers live out of .L77002471: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002469

			.L77002473:
/* 0x491c	1942 */		sethi	%hi(0x401400),%o2
/* 0x4920	     */		and	%o0,255,%o5
/* 0x4924	     */		add	%o2,207,%o2
/* 0x4928	     */		sllx	%o5,3,%o3
/* 0x492c	     */		add	%o2,%sp,%o2
/* 0x4930	     */		ldx	[%o3+%o2],%o2
/* 0x4934	     */		stx	%o2,[%sp+3151]
/* 0x4938	1943 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x493c	     */		mov	%l6,%o0
/* 0x4940	1947 */		sra	%l4,0,%o4

! Registers live out of .L77002473: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002471 .L77002473 .L900001075

			.L900001074:
/* 0x4944	1947 */		sra	%i4,0,%o3
/* 0x4948	1862 */		add	%l2,1,%l2
/* 0x494c	1947 */		ldx	[%sp+2759],%o2
/* 0x4950	     */		ldx	[%sp+2767],%o1
/* 0x4954	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x4958	     */		mov	%l6,%o0
/* 0x495c	1862 */		add	%i0,256,%i0
/* 0x4960	     */		add	%i4,1,%i4
/* 0x4964	     */		cmp	%l2,63
/* 0x4968	     */		ble,pt	%icc,.L900001073
/* 0x496c	1867 */		sra	%i2,0,%o3

! Registers live out of .L900001074: 
! g2 g3 o0 o3 o4 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001074

			.L77002481:
/* 0x4970	1859 */		ldx	[%sp+2847],%o3
/* 0x4974	     */		add	%i2,1,%i2
/* 0x4978	     */		add	%l4,-1,%l4
/* 0x497c	     */		cmp	%i2,63
/* 0x4980	     */		add	%o3,4,%i0
/* 0x4984	     */		stx	%i0,[%sp+2847]
/* 0x4988	     */		ble,a,pt	%icc,.L900001072
/* 0x498c	1862 */		ldx	[%sp+2847],%i0

! Registers live out of .L77002481: 
! g2 g3 o0 o4 sp l4 l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002481

			.L77002485:
/* 0x4990	   0 */		add	%sp,2679,%l2
/* 0x4994	1951 */		mov	1,%i2
/* 0x4998	     */		st	%i2,[%i5]
/* 0x499c	1952 */		mov	%l2,%o1
/* 0x49a0	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x49a4	     */		mov	3,%o0
/* 0x49a8	1953 */		ldx	[%sp+2663],%o0
/* 0x49ac	     */		ldx	[%sp+2671],%o1
/* 0x49b0	     */		ldx	[%l2],%o2
/* 0x49b4	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x49b8	     */		ldx	[%sp+2687],%o3
/* 0x49bc	1954 */		stx	%o0,[%sp+3007]
/* 0x49c0	     */		sethi	%gdop_hix22(.L596),%o4
/* 0x49c4	     */		ldd	[%l5+8],%f4
/* 0x49c8	     */		ldd	[%sp+3007],%f0
/* 0x49cc	     */		xor	%o4,%gdop_lox10(.L596),%g4
/* 0x49d0	     */		ldd	[%l5+16],%f36
/* 0x49d4	     */		ldd	[%l5+48],%f40
/* 0x49d8	1953 */		mov	%o0,%o2
/* 0x49dc	1954 */		ldx	[%l7+%g4],%o1,%gdop(.L596)
/* 0x49e0	     */		ldx	[%sp+2703],%o0
/* 0x49e4	     */		fmovs	%f4,%f2
/* 0x49e8	     */		fmovs	%f1,%f3
/* 0x49ec	     */		fmovs	%f4,%f6
/* 0x49f0	     */		fmovs	%f0,%f7
/* 0x49f4	     */		fsubd	%f2,%f4,%f32
/* 0x49f8	     */		fsubd	%f6,%f4,%f34
/* 0x49fc	     */		fabsd	%f32,%f38
/* 0x4a00	     */		fabsd	%f34,%f32
/* 0x4a04	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x4a08	     */		fdivd	%f32,%f40,%f32
/* 0x4a0c	     */		std	%f32,[%sp+3015]
/* 0x4a10	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4a14	     */		ldx	[%sp+3015],%o3
/* 0x4a18	1955 */		ldx	[%sp+2583],%o2
/* 0x4a1c	     */		ldx	[%sp+2751],%o1
/* 0x4a20	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4a24	     */		mov	%l6,%o0
/* 0x4a28	1956 */		ldx	[%sp+2703],%g5
/* 0x4a2c	     */		ldub	[%g5],%o2

! Registers live out of .L77002485: 
! g2 g3 g5 o2 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002485 .L900000202

			.L900001071:
/* 0x4a30	1956 */		brz,pn	%o2,.L900000203
/* 0x4a34	     */		add	%g5,1,%g5

! Registers live out of .L900001071: 
! g2 g3 g5 o2 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900001071

			.L900000202:
/* 0x4a38	1956 */		ldub	[%g5],%o1
/* 0x4a3c	     */		add	%g5,1,%g5
/* 0x4a40	     */		brnz,a,pt	%o1,.L900001071
/* 0x4a44	     */		ldub	[%g5],%o2

! Registers live out of .L900000202: 
! g2 g3 g5 o2 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000202 .L900001071

			.L900000203:
/* 0x4a48	1956 */		ldx	[%sp+2703],%o5
/* 0x4a4c	     */		sub	%g5,1,%g1
/* 0x4a50	     */		mov	310,%o4
/* 0x4a54	     */		ldx	[%sp+2751],%o2
/* 0x4a58	     */		mov	10,%o3
/* 0x4a5c	     */		ldx	[%sp+2775],%o1
/* 0x4a60	     */		sub	%g1,%o5,%g5
/* 0x4a64	     */		sra	%g5,0,%o0
/* 0x4a68	     */		stx	%o0,[%sp+2223]
/* 0x4a6c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4a70	     */		mov	%l6,%o0

! Registers live out of .L900000203: 
! g2 g3 o0 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000203 .L900001070

			.L77002487:
/* 0x4a74	1853 */		ldx	[%sp+2839],%l4
/* 0x4a78	     */		ld	[%sp+2327],%o1
/* 0x4a7c	     */		sethi	%hi(0x40000),%l2
/* 0x4a80	     */		add	%l3,1,%l3
/* 0x4a84	     */		add	%i5,64,%i5
/* 0x4a88	     */		cmp	%l3,15
/* 0x4a8c	     */		add	%l4,%l2,%g5
/* 0x4a90	     */		add	%o1,64,%o2
/* 0x4a94	     */		st	%o2,[%sp+2327]
/* 0x4a98	     */		stx	%g5,[%sp+2839]
/* 0x4a9c	     */		ble,a,pt	%icc,.L900001070
/* 0x4aa0	1857 */		ld	[%i5],%l4

! Registers live out of .L77002487: 
! g2 g3 o0 sp l4 l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002487

			.L77002491:
/* 0x4aa4	1852 */		ldx	[%sp+2255],%i2
/* 0x4aa8	     */		sethi	%hi(0x4000),%o5
/* 0x4aac	     */		ldx	[%sp+2263],%i1
/* 0x4ab0	     */		ld	[%sp+2323],%o7
/* 0x4ab4	     */		add	%i3,1,%i3
/* 0x4ab8	     */		cmp	%i3,15
/* 0x4abc	     */		add	%i2,4,%i5
/* 0x4ac0	     */		stx	%i5,[%sp+2255]
/* 0x4ac4	     */		add	%o7,-64,%o0
/* 0x4ac8	     */		add	%i1,%o5,%i4
/* 0x4acc	     */		stx	%i4,[%sp+2263]
/* 0x4ad0	     */		st	%o0,[%sp+2323]
/* 0x4ad4	     */		ble,a,pt	%icc,.L900001069
/* 0x4ad8	1853 */		ldx	[%sp+2255],%i5

! Registers live out of .L77002491: 
! g2 g3 o0 sp l5 l6 l7 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002491

			.L77002495:
/* 0x4adc	1962 */		ldd	[%l5],%f44
/* 0x4ae0	1963 */		mov	10,%o4
/* 0x4ae4	     */		stb	%o4,[%sp+2272]

! Registers live out of .L77002495: 
! g2 g3 o0 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002379 .L77002381 .L77002383 .L77002385 .L77002495

			.L77002497:
/* 0x4ae8	1966 */		ldx	[%sp+2583],%o2
/* 0x4aec	     */		ldx	[%sp+2759],%o1
/* 0x4af0	     */		std	%f44,[%sp+2879]
/* 0x4af4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4af8	     */		mov	%l6,%o0
/* 0x4afc	1967 */		add	%sp,2551,%o1
/* 0x4b00	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x4b04	     */		mov	3,%o0
/* 0x4b08	1968 */		ldx	[%sp+2503],%o0
/* 0x4b0c	     */		ldx	[%sp+2511],%o1
/* 0x4b10	     */		ldx	[%sp+2551],%o2
/* 0x4b14	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4b18	     */		ldx	[%sp+2559],%o3
/* 0x4b1c	1969 */		stx	%o0,[%sp+3063]
/* 0x4b20	     */		ldd	[%l5+8],%f4
/* 0x4b24	     */		ldd	[%sp+3063],%f0
/* 0x4b28	     */		ldd	[%l5+16],%f36
/* 0x4b2c	     */		ldd	[%l5+48],%f40
/* 0x4b30	     */		ldx	[%sp+2815],%i4
/* 0x4b34	1968 */		mov	%o0,%o2
/* 0x4b38	1969 */		ldx	[%sp+2703],%o0
/* 0x4b3c	     */		fmovs	%f4,%f2
/* 0x4b40	     */		fmovs	%f1,%f3
/* 0x4b44	     */		fmovs	%f4,%f6
/* 0x4b48	     */		fmovs	%f0,%f7
/* 0x4b4c	     */		add	%i4,-896,%o1
/* 0x4b50	     */		fsubd	%f2,%f4,%f32
/* 0x4b54	     */		fsubd	%f6,%f4,%f34
/* 0x4b58	     */		fabsd	%f32,%f38
/* 0x4b5c	     */		fabsd	%f34,%f32
/* 0x4b60	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x4b64	     */		fdivd	%f32,%f40,%f32
/* 0x4b68	     */		std	%f32,[%sp+3071]
/* 0x4b6c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4b70	     */		ldx	[%sp+3071],%o3
/* 0x4b74	1970 */		sethi	%gdop_hix22(__iob),%o7
/* 0x4b78	     */		ldx	[%sp+2703],%o2
/* 0x4b7c	     */		add	%i4,-862,%o1
/* 0x4b80	     */		xor	%o7,%gdop_lox10(__iob),%o0
/* 0x4b84	     */		ldx	[%l7+%o0],%g1,%gdop(__iob)
/* 0x4b88	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x4b8c	     */		add	%g1,256,%o0
/* 0x4b90	1971 */		ldx	[%sp+2519],%o2
/* 0x4b94	     */		ldx	[%sp+2735],%o1
/* 0x4b98	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4b9c	     */		mov	%l6,%o0
/* 0x4ba0	1972 */		ldx	[%sp+2703],%i0
/* 0x4ba4	     */		ldub	[%i0],%l3

! Registers live out of .L77002497: 
! g2 g3 o0 sp l5 l6 l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77002497 .L900000198

			.L900001068:
/* 0x4ba8	1972 */		brz,pn	%l3,.L900000199
/* 0x4bac	     */		add	%i0,1,%i0

! Registers live out of .L900001068: 
! g2 g3 o0 sp l5 l6 l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L900001068

			.L900000198:
/* 0x4bb0	1972 */		ldub	[%i0],%l4
/* 0x4bb4	     */		add	%i0,1,%i0
/* 0x4bb8	     */		brnz,a,pt	%l4,.L900001068
/* 0x4bbc	     */		ldub	[%i0],%l3

! Registers live out of .L900000198: 
! g2 g3 o0 sp l5 l6 l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L900000198 .L900001068

			.L900000199:
/* 0x4bc0	1972 */		ldx	[%sp+2703],%o5
/* 0x4bc4	     */		sub	%i0,1,%g4
/* 0x4bc8	     */		mov	310,%o4
/* 0x4bcc	     */		ldx	[%sp+2743],%o1
/* 0x4bd0	     */		mov	10,%o3
/* 0x4bd4	1986 */		sethi	%hi(0x220c00),%i4
/* 0x4bd8	     */		add	%i4,143,%i4
/* 0x4bdc	1972 */		sub	%g4,%o5,%o2
/* 0x4be0	     */		sra	%o2,0,%i5
/* 0x4be4	     */		ldx	[%sp+2735],%o2
/* 0x4be8	     */		stx	%i5,[%sp+2223]
/* 0x4bec	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4bf0	     */		mov	%l6,%o0
/* 0x4bf4	1974 */		ldx	[%sp+2815],%l4
/* 0x4bf8	     */		call	printf	!params=  %o0	!result= 
/* 0x4bfc	     */		add	%l4,-856,%o0
/* 0x4c00	1976 */		mov	0,%o3
/* 0x4c04	     */		mov	0,%o2
/* 0x4c08	     */		mov	0,%o1
/* 0x4c0c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4c10	     */		mov	0,%o0
/* 0x4c14	     */		ldx	[%sp+2463],%l2
/* 0x4c18	     */		sllx	%o0,3,%i3
/* 0x4c1c	     */		add	%l4,-776,%o0
/* 0x4c20	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4c24	     */		ldx	[%i3+%l2],%o1
/* 0x4c28	1977 */		mov	0,%o3
/* 0x4c2c	     */		mov	0,%o2
/* 0x4c30	     */		mov	0,%o0
/* 0x4c34	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4c38	     */		mov	0,%o1
/* 0x4c3c	     */		sllx	%o0,3,%o3
/* 0x4c40	     */		ldx	[%sp+2695],%l3
/* 0x4c44	     */		add	%l4,-736,%o0
/* 0x4c48	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4c4c	     */		ldx	[%o3+%l3],%o1
/* 0x4c50	1978 */		add	%l4,-696,%o0
/* 0x4c54	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4c58	     */		ld	[%sp+3215],%o1
/* 0x4c5c	1980 */		mov	63,%o3
/* 0x4c60	     */		mov	63,%o2
/* 0x4c64	     */		mov	7,%o0
/* 0x4c68	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4c6c	     */		mov	7,%o1
/* 0x4c70	     */		sllx	%o0,3,%o5
/* 0x4c74	     */		add	%l4,-664,%o0
/* 0x4c78	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4c7c	     */		ldx	[%o5+%l2],%o1
/* 0x4c80	1981 */		mov	63,%o3
/* 0x4c84	     */		mov	63,%o2
/* 0x4c88	     */		mov	7,%o0
/* 0x4c8c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4c90	     */		mov	7,%o1
/* 0x4c94	     */		sllx	%o0,3,%o7
/* 0x4c98	     */		ldx	[%o7+%l3],%o1
/* 0x4c9c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4ca0	     */		add	%l4,-624,%o0
/* 0x4ca4	1982 */		sethi	%hi(0x1e0c00),%o4
/* 0x4ca8	     */		add	%o4,139,%o4
/* 0x4cac	     */		add	%l4,-696,%o0
/* 0x4cb0	     */		add	%o4,%sp,%o4
/* 0x4cb4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4cb8	     */		ld	[%o4],%o1
/* 0x4cbc	1984 */		mov	0,%o3
/* 0x4cc0	     */		mov	0,%o2
/* 0x4cc4	     */		mov	8,%o0
/* 0x4cc8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4ccc	     */		mov	8,%o1
/* 0x4cd0	     */		sllx	%o0,3,%i2
/* 0x4cd4	     */		add	%l4,-584,%o0
/* 0x4cd8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4cdc	     */		ldx	[%i2+%l2],%o1
/* 0x4ce0	1985 */		mov	0,%o3
/* 0x4ce4	     */		mov	0,%o2
/* 0x4ce8	     */		mov	8,%o0
/* 0x4cec	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4cf0	     */		mov	8,%o1
/* 0x4cf4	     */		sllx	%o0,3,%i1
/* 0x4cf8	     */		add	%l4,-544,%o0
/* 0x4cfc	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d00	     */		ldx	[%i1+%l3],%o1
/* 0x4d04	1986 */		add	%i4,%sp,%i4
/* 0x4d08	     */		add	%l4,-696,%o0
/* 0x4d0c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d10	     */		ld	[%i4],%o1
/* 0x4d14	1988 */		mov	0,%o3
/* 0x4d18	     */		mov	1,%o2
/* 0x4d1c	     */		mov	8,%o0
/* 0x4d20	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4d24	     */		mov	8,%o1
/* 0x4d28	     */		sllx	%o0,3,%i0
/* 0x4d2c	     */		add	%l4,-504,%o0
/* 0x4d30	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d34	     */		ldx	[%i0+%l2],%o1
/* 0x4d38	1989 */		mov	0,%o3
/* 0x4d3c	     */		mov	1,%o2
/* 0x4d40	     */		mov	8,%o0
/* 0x4d44	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4d48	     */		mov	8,%o1
/* 0x4d4c	     */		sllx	%o0,3,%g1
/* 0x4d50	     */		add	%l4,-464,%o0
/* 0x4d54	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d58	     */		ldx	[%g1+%l3],%o1
/* 0x4d5c	1990 */		sethi	%hi(0x220c00),%g5
/* 0x4d60	     */		add	%g5,399,%g5
/* 0x4d64	     */		add	%l4,-696,%o0
/* 0x4d68	     */		add	%g5,%sp,%g5
/* 0x4d6c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d70	     */		ld	[%g5],%o1
/* 0x4d74	1992 */		mov	32,%o3
/* 0x4d78	     */		mov	32,%o2
/* 0x4d7c	     */		mov	8,%o0
/* 0x4d80	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4d84	     */		mov	8,%o1
/* 0x4d88	     */		sllx	%o0,3,%o1
/* 0x4d8c	     */		add	%l4,-424,%o0
/* 0x4d90	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4d94	     */		ldx	[%o1+%l2],%o1
/* 0x4d98	1993 */		mov	32,%o3
/* 0x4d9c	     */		mov	32,%o2
/* 0x4da0	     */		mov	8,%o0
/* 0x4da4	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4da8	     */		mov	8,%o1
/* 0x4dac	     */		sllx	%o0,3,%g4
/* 0x4db0	     */		add	%l4,-384,%o0
/* 0x4db4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4db8	     */		ldx	[%g4+%l3],%o1
/* 0x4dbc	1994 */		sethi	%hi(0x222c00),%o2
/* 0x4dc0	     */		add	%o2,271,%o2
/* 0x4dc4	     */		add	%l4,-696,%o0
/* 0x4dc8	     */		add	%o2,%sp,%o2
/* 0x4dcc	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4dd0	     */		ld	[%o2],%o1
/* 0x4dd4	1996 */		mov	21,%o3
/* 0x4dd8	     */		mov	44,%o2
/* 0x4ddc	     */		mov	3,%o0
/* 0x4de0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4de4	     */		mov	12,%o1
/* 0x4de8	     */		sllx	%o0,3,%i5
/* 0x4dec	     */		add	%l4,-344,%o0
/* 0x4df0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4df4	     */		ldx	[%i5+%l2],%o1
/* 0x4df8	1997 */		mov	21,%o3
/* 0x4dfc	     */		mov	44,%o2
/* 0x4e00	     */		mov	3,%o0
/* 0x4e04	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4e08	     */		mov	12,%o1
/* 0x4e0c	     */		sllx	%o0,3,%i3
/* 0x4e10	     */		add	%l4,-304,%o0
/* 0x4e14	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4e18	     */		ldx	[%i3+%l3],%o1
/* 0x4e1c	1998 */		sethi	%hi(0xf3800),%o3
/* 0x4e20	     */		add	%o3,227,%o3
/* 0x4e24	     */		add	%l4,-696,%o0
/* 0x4e28	     */		add	%o3,%sp,%o3
/* 0x4e2c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4e30	     */		ld	[%o3],%o1
/* 0x4e34	2000 */		mov	63,%o3
/* 0x4e38	     */		mov	63,%o2
/* 0x4e3c	     */		mov	15,%o0
/* 0x4e40	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4e44	     */		mov	15,%o1
/* 0x4e48	     */		sllx	%o0,3,%o5
/* 0x4e4c	     */		add	%l4,-264,%o0
/* 0x4e50	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4e54	     */		ldx	[%o5+%l2],%o1
/* 0x4e58	2001 */		mov	63,%o3
/* 0x4e5c	     */		mov	63,%o2
/* 0x4e60	     */		mov	15,%o0
/* 0x4e64	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4e68	     */		mov	15,%o1
/* 0x4e6c	     */		sllx	%o0,3,%l2
/* 0x4e70	     */		add	%l4,-224,%o0
/* 0x4e74	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4e78	     */		ldx	[%l2+%l3],%o1
/* 0x4e7c	2002 */		sethi	%hi(0x400c00),%l3
/* 0x4e80	     */		add	%l3,139,%l3
/* 0x4e84	     */		add	%l4,-696,%o0
/* 0x4e88	     */		add	%l3,%sp,%l3
/* 0x4e8c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4e90	     */		ld	[%l3],%o1
/* 0x4e94	2004 */		call	printf	!params=  %o0	!result= 
/* 0x4e98	     */		add	%l4,-184,%o0
/* 0x4e9c	     */		ba	.L900001067
/* 0x4ea0	2043 */		nop

! Registers live out of .L900000199: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002375

			.L900001089:
/* 0x4ea4	2006 */		be,pn	%icc,.L77002501
/* 0x4ea8	1001 */		add	%i3,-1,%o1

! Registers live out of .L900001089: 
! g1 g2 g3 o0 o1 o4 sp l5 l6 l7 i1 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900001089

			.L77002507:
/* 0x4eac	1002 */		add	%i1,-2,%i3
/* 0x4eb0	     */		st	%i3,[%sp+2319]
/* 0x4eb4	2026 */		cmp	%o4,4
/* 0x4eb8	     */		bne,pn	%icc,.L77002511
/* 0x4ebc	1001 */		st	%o1,[%sp+2315]

! Registers live out of .L77002507: 
! g1 g2 g3 o0 o4 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002507

			.L77002509:
/* 0x4ec0	2031 */		call	printf	!params=  %o0	!result= 
/* 0x4ec4	     */		add	%g1,-56,%o0
/* 0x4ec8	     */		ba	.L900001067
/* 0x4ecc	2043 */		nop

! Registers live out of .L77002509: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002507

			.L77002511:
/* 0x4ed0	2033 */		cmp	%o4,5
/* 0x4ed4	     */		bne,pn	%icc,.L77002515
/* 0x4ed8	     */		nop

! Registers live out of .L77002511: 
! g1 g2 g3 o0 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002511

			.L77002513:
/* 0x4edc	2035 */		call	printf	!params=  %o0	!result= 
/* 0x4ee0	     */		add	%g1,-44,%o0
/* 0x4ee4	     */		ba	.L900001067
/* 0x4ee8	2043 */		nop

! Registers live out of .L77002513: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002511

			.L77002515:
/* 0x4eec	2039 */		call	printf	!params=  %o0	!result= 
/* 0x4ef0	     */		add	%g1,-32,%o0
/* 0x4ef4	     */		ba	.L900001067
/* 0x4ef8	2043 */		nop

! Registers live out of .L77002515: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L900001089

			.L77002501:
/* 0x4efc	2008 */		mov	%g1,%i0
/* 0x4f00	     */		call	printf	!params=  %o0	!result= 
/* 0x4f04	     */		add	%g1,-104,%o0
/* 0x4f08	2009 */		add	%sp,2599,%o1
/* 0x4f0c	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x4f10	     */		mov	3,%o0
/* 0x4f14	2010 */		ldx	[%sp+2599],%o2
/* 0x4f18	     */		ldx	[%sp+2631],%o0
/* 0x4f1c	     */		ldx	[%sp+2639],%o1
/* 0x4f20	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4f24	     */		ldx	[%sp+2607],%o3
/* 0x4f28	2012 */		ldsw	[%sp+2291],%o2
/* 0x4f2c	2010 */		mov	%o0,%i4
/* 0x4f30	2012 */		ldx	[%sp+2703],%o0
/* 0x4f34	     */		add	%i0,-88,%o1
/* 0x4f38	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4f3c	     */		mov	%i4,%o3
/* 0x4f40	2014 */		ldx	[%sp+2703],%l4
/* 0x4f44	     */		ldub	[%l4],%o4

! Registers live out of .L77002501: 
! g2 g3 o4 sp l4 l5 l6 l7 i1 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002501 .L900000194

			.L900001066:
/* 0x4f48	2014 */		brz,pn	%o4,.L900000195
/* 0x4f4c	     */		add	%l4,1,%l4

! Registers live out of .L900001066: 
! g2 g3 o4 sp l4 l5 l6 l7 i1 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900001066

			.L900000194:
/* 0x4f50	2014 */		ldub	[%l4],%g1
/* 0x4f54	     */		add	%l4,1,%l4
/* 0x4f58	     */		brnz,a,pt	%g1,.L900001066
/* 0x4f5c	     */		ldub	[%l4],%o4

! Registers live out of .L900000194: 
! g2 g3 o4 sp l4 l5 l6 l7 i1 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000194 .L900001066

			.L900000195:
/* 0x4f60	2014 */		ldx	[%sp+2703],%o5
/* 0x4f64	     */		sub	%l4,1,%o7
/* 0x4f68	     */		ldx	[%sp+2751],%o2
/* 0x4f6c	     */		mov	20,%o4
/* 0x4f70	     */		ldx	[%sp+2775],%o1
/* 0x4f74	     */		mov	10,%o3
/* 0x4f78	     */		sub	%o7,%o5,%o0
/* 0x4f7c	     */		sra	%o0,0,%i2
/* 0x4f80	     */		stx	%i2,[%sp+2223]
/* 0x4f84	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4f88	     */		mov	%l6,%o0
/* 0x4f8c	2019 */		sethi	%hi(0xbebc000),%o5
/* 0x4f90	2016 */		ldx	[%sp+2599],%o4
/* 0x4f94	2017 */		ldx	[%sp+2607],%i0
/* 0x4f98	2019 */		add	%o5,512,%g1
/* 0x4f9c	2016 */		stx	%o4,[%sp+2631]
/* 0x4fa0	2019 */		cmp	%i4,%g1
/* 0x4fa4	     */		bcs,pn	%xcc,.L77002690
/* 0x4fa8	2017 */		stx	%i0,[%sp+2639]

! Registers live out of .L900000195: 
! g2 g3 o2 sp l5 l6 l7 i0 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000195

			.L77003030:
/* 0x4fac	1002 */		add	%i1,-2,%i5
/* 0x4fb0	2019 */		ldd	[%sp+2879],%f44
/* 0x4fb4	1002 */		st	%i5,[%sp+2319]
/* 0x4fb8	1001 */		add	%i3,-1,%i3
/* 0x4fbc	     */		st	%i3,[%sp+2315]

! Registers live out of .L77003030: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! f44 
		                       
! predecessor blocks: .L77002181 .L77002183 .L77002201 .L77002223 .L77002231 .L77002233 .L77002263 .L77002265 .L77002267 .L77002269
! predecessor blocks: .L77002271 .L77002854 .L77003030 .L900001102 .L900001108

			.L77002525:
/* 0x4fc0	2043 */		std	%f44,[%sp+2879]

! Registers live out of .L77002525: 
! g2 g3 o2 sp l5 l6 l7 fp gsr 
! 
		                       
! predecessor blocks: .L77002509 .L77002513 .L77002515 .L77002525 .L900000199 .L900000235 .L900000243 .L900000247 .L900000251 .L900000255
! predecessor blocks: .L900000259 .L900000263 .L900001060 .L900001166

			.L900001067:
/* 0x4fc4	2043 */		ldsw	[%sp+2315],%o1
/* 0x4fc8	     */		ldx	[%sp+2815],%o0
/* 0x4fcc	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x4fd0	     */		ldsw	[%sp+2319],%o2
/* 0x4fd4	     */		ldd	[%sp+2879],%f44
/* 0x4fd8	     */		ba	.L900001065
/* 0x4fdc	   0 */		add	%fp,-2017,%i1

! Registers live out of .L900001067: 
! g2 g3 o0 sp l5 l6 l7 i1 fp gsr 
! f44 
		                       
! predecessor blocks: .L900000195

			.L77002690:
/* 0x4fe0	   0 */		sethi	%gdop_hix22(.L625),%l5
/* 0x4fe4	   0 */		xor	%l5,%gdop_lox10(.L625),%i1
/* 0x4fe8	   0 */		ldx	[%l7+%i1],%o0,%gdop(.L625)
/* 0x4fec	2020 */		call	printf	!params=  %o0	!result= 
/* 0x4ff0	   0 */		sub	%o0,1795,%i2

! 2045		      !    }
! 2047		      !    XCloseDisplay(dsp);

/* 0x4ff4	2047 */		call	XCloseDisplay	!params=  %o0	!result= 
/* 0x4ff8	     */		mov	%l6,%o0

! 2049		      !    printf("\n");

/* 0x4ffc	2049 */		call	printf	!params=  %o0	!result= 
/* 0x5000	     */		add	%i2,-2900,%o0

! 2051		      !    /* it may seem insane to set the pointer to NULL after the
! 2052		      !     * free() but why not have belt and suspenders safety? */
! 2053		      !    free(buf);

/* 0x5004	2053 */		call	free	!params=  %o0	!result= 
/* 0x5008	     */		ldx	[%sp+2703],%o0

! 2054		      !    buf = NULL;
! 2055		      !    for ( pt = 0; pt < pthread_limit; pt++ ){

/* 0x500c	2055 */		ld	[%sp+2283],%o2
/* 0x5010	     */		cmp	%o2,0
/* 0x5014	     */		ble,pn	%icc,.L77002535
/* 0x5018	     */		sethi	%hi(0x400c00),%l7

! Registers live out of .L77002690: 
! g2 g3 o0 sp l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77002690

			.L77002921:
/* 0x501c	2055 */		add	%l7,719,%l7
/* 0x5020	     */		mov	0,%l6
/* 0x5024	     */		add	%l7,%sp,%l7

! 2056		      !        free( parm[pt] );

/* 0x5028	2056 */		prefetch	[%l7+256],2
/* 0x502c	     */		prefetch	[%l7+512],2
/* 0x5030	     */		prefetch	[%l7+768],2
/* 0x5034	     */		prefetch	[%l7+1024],2
/* 0x5038	     */		prefetch	[%l7+1280],2

! Registers live out of .L77002921: 
! g2 g3 o0 sp l6 l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77002921 .L900001064

			.L900001064:
/* 0x503c	2056 */		call	free	!params=  %o0	!result= 
/* 0x5040	     */		ldx	[%l7],%o0
/* 0x5044	2055 */		ld	[%sp+2287],%l5
/* 0x5048	     */		add	%l6,1,%l6

! 2057		      !        parm[pt] = NULL;

/* 0x504c	2057 */		stx	%g0,[%l7]
/* 0x5050	2055 */		add	%l7,8,%l7
/* 0x5054	     */		cmp	%l6,%l5
/* 0x5058	     */		ble,pt	%icc,.L900001064
/* 0x505c	2056 */		prefetch	[%l7+1280],2

! Registers live out of .L900001064: 
! g2 g3 o0 sp l6 l7 i0 fp gsr 
! 
		
! 2058		      !    }
! 2060		      !    free(coord_r);

                       
! predecessor blocks: .L77002690 .L900001064

			.L77002535:
/* 0x5060	2060 */		call	free	!params=  %o0	!result= 
/* 0x5064	     */		ldx	[%sp+2463],%o0

! 2061		      !    coord_r = NULL;
! 2063		      !    free(coord_j);

/* 0x5068	2063 */		call	free	!params=  %o0	!result= 
/* 0x506c	     */		ldx	[%sp+2695],%o0
/* 0x5070	 392 */		return	%i7+8	! Result =  %i0
/* 0x5074	     */		mov	0,%o0
                       
! predecessor blocks: .L77001959 .L77001961

			.L77001965:
/* 0x5078	 562 */		sethi	%gdop_hix22(__iob),%l3
/* 0x507c	     */		add	%i1,2270,%o1
/* 0x5080	     */		xor	%l3,%gdop_lox10(__iob),%i1
/* 0x5084	     */		ldx	[%l7+%i1],%l7,%gdop(__iob)
/* 0x5088	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x508c	     */		add	%l7,256,%o0
/* 0x5090	 392 */		return	%i7+8	! Result =  %i0
/* 0x5094	     */		mov	1,%o0
                       
! predecessor blocks: .L77002740

			.L77001713:
/* 0x5098	 201 */		call	___errno	!params= 	!result=  %o0
/* 0x509c	     */		nop
/* 0x50a0	     */		ld	[%o0],%o3
/* 0x50a4	     */		cmp	%o3,12
/* 0x50a8	     */		bne,pn	%icc,.L77001717
/* 0x50ac	 203 */		sethi	%gdop_hix22(__iob),%l4

! Registers live out of .L77001713: 
! g2 g3 o0 sp l4 l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001713

			.L77001715:
/* 0x50b0	 203 */		xor	%l4,%gdop_lox10(__iob),%o7
/* 0x50b4	     */		sethi	%gdop_hix22(.L21),%o2
/* 0x50b8	     */		ldx	[%l7+%o7],%l2,%gdop(__iob)
/* 0x50bc	     */		sethi	%gdop_hix22(.L20),%i0
/* 0x50c0	     */		xor	%o2,%gdop_lox10(.L21),%i4
/* 0x50c4	     */		xor	%i0,%gdop_lox10(.L20),%o0
/* 0x50c8	     */		ldx	[%l7+%i4],%o2,%gdop(.L21)
/* 0x50cc	     */		mov	203,%o3
/* 0x50d0	     */		ldx	[%l7+%o0],%o1,%gdop(.L20)
/* 0x50d4	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x50d8	     */		add	%l2,256,%o0
/* 0x50dc	     */		ba	.L900001063
/* 0x50e0	 208 */		sethi	%gdop_hix22(.L24),%i3

! Registers live out of .L77001715: 
! g2 g3 o0 sp l7 i0 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77001713

			.L77001717:
/* 0x50e4	 206 */		sethi	%gdop_hix22(.L23),%g4
/* 0x50e8	     */		sethi	%gdop_hix22(__iob),%i5
/* 0x50ec	     */		sethi	%gdop_hix22(.L21),%l3
/* 0x50f0	     */		xor	%i5,%gdop_lox10(__iob),%g1
/* 0x50f4	     */		xor	%l3,%gdop_lox10(.L21),%o5
/* 0x50f8	     */		xor	%g4,%gdop_lox10(.L23),%i2
/* 0x50fc	     */		ldx	[%l7+%g1],%g5,%gdop(__iob)
/* 0x5100	     */		ldx	[%l7+%o5],%o2,%gdop(.L21)
/* 0x5104	     */		ldx	[%l7+%i2],%o1,%gdop(.L23)
/* 0x5108	     */		mov	206,%o3
/* 0x510c	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x5110	     */		add	%g5,256,%o0
/* 0x5114	 208 */		sethi	%gdop_hix22(.L24),%i3

! Registers live out of .L77001717: 
! g2 g3 o0 sp l7 i0 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77001715 .L77001717

			.L900001063:
/* 0x5118	 208 */		xor	%i3,%gdop_lox10(.L24),%i1
/* 0x511c	     */		call	perror	!params=  %o0	!result= 
/* 0x5120	     */		ldx	[%l7+%i1],%o0,%gdop(.L24)
/* 0x5124	 392 */		return	%i7+8	! Result =  %i0
/* 0x5128	     */		mov	1,%o0
                       
! predecessor blocks: .L77002747

			.L77001723:
/* 0x512c	 220 */		call	___errno	!params= 	!result=  %o0
/* 0x5130	     */		nop
/* 0x5134	     */		ld	[%o0],%o3
/* 0x5138	     */		cmp	%o3,12
/* 0x513c	     */		bne,pn	%icc,.L77001727
/* 0x5140	 222 */		sethi	%gdop_hix22(__iob),%g5

! Registers live out of .L77001723: 
! g2 g3 g5 o0 sp l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001723

			.L77001725:
/* 0x5144	 222 */		xor	%g5,%gdop_lox10(__iob),%o2
/* 0x5148	     */		sethi	%gdop_hix22(.L21),%l4
/* 0x514c	     */		ldx	[%l7+%o2],%l2,%gdop(__iob)
/* 0x5150	     */		sethi	%gdop_hix22(.L20),%i4
/* 0x5154	     */		xor	%l4,%gdop_lox10(.L21),%o7
/* 0x5158	     */		xor	%i4,%gdop_lox10(.L20),%i0
/* 0x515c	     */		ldx	[%l7+%o7],%o2,%gdop(.L21)
/* 0x5160	     */		mov	222,%o3
/* 0x5164	     */		ldx	[%l7+%i0],%o1,%gdop(.L20)
/* 0x5168	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x516c	     */		add	%l2,256,%o0
/* 0x5170	     */		ba	.L900001062
/* 0x5174	 227 */		sethi	%gdop_hix22(.L24),%o1

! Registers live out of .L77001725: 
! g2 g3 o0 o1 sp l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001723

			.L77001727:
/* 0x5178	 225 */		sethi	%gdop_hix22(__iob),%i5
/* 0x517c	     */		sethi	%gdop_hix22(.L21),%o4
/* 0x5180	     */		xor	%i5,%gdop_lox10(__iob),%l3
/* 0x5184	     */		sethi	%gdop_hix22(.L23),%o5
/* 0x5188	     */		ldx	[%l7+%l3],%i2,%gdop(__iob)
/* 0x518c	     */		xor	%o4,%gdop_lox10(.L21),%g1
/* 0x5190	     */		xor	%o5,%gdop_lox10(.L23),%g4
/* 0x5194	     */		ldx	[%l7+%g1],%o2,%gdop(.L21)
/* 0x5198	     */		ldx	[%l7+%g4],%o1,%gdop(.L23)
/* 0x519c	     */		mov	225,%o3
/* 0x51a0	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x51a4	     */		add	%i2,256,%o0
/* 0x51a8	 227 */		sethi	%gdop_hix22(.L24),%o1

! Registers live out of .L77001727: 
! g2 g3 o0 o1 sp l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001725 .L77001727

			.L900001062:
/* 0x51ac	 227 */		xor	%o1,%gdop_lox10(.L24),%i1
/* 0x51b0	     */		call	perror	!params=  %o0	!result= 
/* 0x51b4	     */		ldx	[%l7+%i1],%o0,%gdop(.L24)
/* 0x51b8	 392 */		return	%i7+8	! Result =  %i0
/* 0x51bc	     */		mov	1,%o0
                       
! predecessor blocks: .L77001775

			.L77001777:
/* 0x51c0	 356 */		sethi	%gdop_hix22(.L83),%g1
/* 0x51c4	     */		xor	%g1,%gdop_lox10(.L83),%i3
/* 0x51c8	     */		call	perror	!params=  %o0	!result= 
/* 0x51cc	     */		ldx	[%l7+%i3],%o0,%gdop(.L83)
/* 0x51d0	     */		ba	.L900001061
/* 0x51d4	 361 */		nop

! Registers live out of .L77001777: 
! g2 g3 sp l5 l7 i0 i1 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001781 .L900001061

			.L77001785:
/* 0x51d8	 364 */		sethi	%gdop_hix22(__iob),%i4
/* 0x51dc	     */		sethi	%gdop_hix22(.L88),%i1
/* 0x51e0	     */		xor	%i4,%gdop_lox10(__iob),%i5
/* 0x51e4	     */		xor	%i1,%gdop_lox10(.L88),%l2
/* 0x51e8	     */		ldx	[%l7+%i5],%o0,%gdop(__iob)
/* 0x51ec	     */		ldx	[%l7+%l2],%o1,%gdop(.L88)
/* 0x51f0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x51f4	     */		add	%o0,256,%o0
/* 0x51f8	 365 */		sethi	%gdop_hix22(.L69),%o7
/* 0x51fc	     */		xor	%o7,%gdop_lox10(.L69),%o3
/* 0x5200	     */		call	perror	!params=  %o0	!result= 
/* 0x5204	     */		ldx	[%l7+%o3],%o0,%gdop(.L69)
/* 0x5208	 392 */		return	%i7+8	! Result =  %i0
/* 0x520c	     */		mov	1,%o0
                       
! predecessor blocks: .L77002299

			.L77002301:
/* 0x5210	1572 */		sethi	%gdop_hix22(.L24),%i2
/* 0x5214	     */		xor	%i2,%gdop_lox10(.L24),%o1
/* 0x5218	     */		call	perror	!params=  %o0	!result= 
/* 0x521c	     */		ldx	[%l7+%o1],%o0,%gdop(.L24)
/* 0x5220	1573 */		ba	.L900001060
/* 0x5224	1734 */		nop

! Registers live out of .L77002301: 
! g2 g3 o0 sp l5 l6 l7 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002772

			.L77002065:
/* 0x5228	 931 */		call	___errno	!params= 	!result=  %o0
/* 0x522c	     */		nop
/* 0x5230	     */		ld	[%o0],%l6
/* 0x5234	     */		cmp	%l6,12
/* 0x5238	     */		bne,pn	%icc,.L77002069
/* 0x523c	 932 */		sethi	%gdop_hix22(__iob),%l3

! Registers live out of .L77002065: 
! g2 g3 o0 sp l7 i0 fp gsr 
! 
		                       
! predecessor blocks: .L77002065

			.L77002067:
/* 0x5240	 932 */		sethi	%gdop_hix22(.L305),%o5
/* 0x5244	     */		xor	%l3,%gdop_lox10(__iob),%i0
/* 0x5248	     */		xor	%o5,%gdop_lox10(.L305),%o1
/* 0x524c	     */		ldx	[%l7+%i0],%o2,%gdop(__iob)
/* 0x5250	 933 */		sethi	%gdop_hix22(__iob),%l4
/* 0x5254	 932 */		ldx	[%l7+%o1],%o1,%gdop(.L305)
/* 0x5258	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x525c	     */		add	%o2,256,%o0
/* 0x5260	 933 */		xor	%l4,%gdop_lox10(__iob),%g5
/* 0x5264	     */		ldx	[%l7+%g5],%i1,%gdop(__iob)
/* 0x5268	     */		sethi	%gdop_hix22(.L306),%g4
/* 0x526c	 934 */		sethi	%gdop_hix22(.L69),%i3
/* 0x5270	 933 */		xor	%g4,%gdop_lox10(.L306),%o7
/* 0x5274	     */		ldx	[%l7+%o7],%o1,%gdop(.L306)
/* 0x5278	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x527c	     */		add	%i1,256,%o0
/* 0x5280	 934 */		xor	%i3,%gdop_lox10(.L69),%o0
/* 0x5284	     */		call	perror	!params=  %o0	!result= 
/* 0x5288	     */		ldx	[%l7+%o0],%o0,%gdop(.L69)
/* 0x528c	 392 */		return	%i7+8	! Result =  %i0
/* 0x5290	     */		mov	1,%o0
                       
! predecessor blocks: .L77002065

			.L77002069:
/* 0x5294	 937 */		sethi	%gdop_hix22(__iob),%l6
/* 0x5298	     */		sethi	%gdop_hix22(.L23),%g1
/* 0x529c	     */		xor	%l6,%gdop_lox10(__iob),%o3
/* 0x52a0	     */		sethi	%gdop_hix22(.L21),%l5
/* 0x52a4	     */		ldx	[%l7+%o3],%i5,%gdop(__iob)
/* 0x52a8	     */		xor	%l5,%gdop_lox10(.L21),%o4
/* 0x52ac	     */		xor	%g1,%gdop_lox10(.L23),%i4
/* 0x52b0	     */		ldx	[%l7+%o4],%o2,%gdop(.L21)
/* 0x52b4	     */		ldx	[%l7+%i4],%o1,%gdop(.L23)
/* 0x52b8	     */		mov	937,%o3
/* 0x52bc	 938 */		sethi	%gdop_hix22(.L24),%i2
/* 0x52c0	 937 */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x52c4	     */		add	%i5,256,%o0
/* 0x52c8	 938 */		xor	%i2,%gdop_lox10(.L24),%l2
/* 0x52cc	     */		call	perror	!params=  %o0	!result= 
/* 0x52d0	     */		ldx	[%l7+%l2],%o0,%gdop(.L24)
/* 0x52d4	 392 */		return	%i7+8	! Result =  %i0
/* 0x52d8	     */		mov	1,%o0
                       
! predecessor blocks: .L77001911 .L900001150

			.L77001915:
/* 0x52dc	 455 */		sethi	%gdop_hix22(__iob),%i4
/* 0x52e0	     */		sethi	%gdop_hix22(.L174),%i1
/* 0x52e4	     */		xor	%i4,%gdop_lox10(__iob),%o1
/* 0x52e8	     */		xor	%i1,%gdop_lox10(.L174),%l3
/* 0x52ec	     */		ldx	[%l7+%o1],%i0,%gdop(__iob)
/* 0x52f0	     */		ldx	[%l7+%l3],%o1,%gdop(.L174)
/* 0x52f4	 456 */		sethi	%gdop_hix22(.L69),%i3
/* 0x52f8	 455 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x52fc	     */		add	%i0,256,%o0
/* 0x5300	 456 */		xor	%i3,%gdop_lox10(.L69),%g4
/* 0x5304	     */		call	perror	!params=  %o0	!result= 
/* 0x5308	     */		ldx	[%l7+%g4],%o0,%gdop(.L69)
/* 0x530c	 392 */		return	%i7+8	! Result =  %i0
/* 0x5310	     */		mov	1,%o0
                       
! predecessor blocks: .L77001885 .L77001887

			.L77001891:
/* 0x5314	 434 */		sethi	%gdop_hix22(__iob),%l5
/* 0x5318	     */		sethi	%gdop_hix22(.L159),%i2
/* 0x531c	     */		xor	%l5,%gdop_lox10(__iob),%o0
/* 0x5320	     */		xor	%i2,%gdop_lox10(.L159),%l4
/* 0x5324	     */		ldx	[%l7+%o0],%o2,%gdop(__iob)
/* 0x5328	     */		ldx	[%l7+%l4],%o1,%gdop(.L159)
/* 0x532c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x5330	     */		add	%o2,256,%o0
/* 0x5334	 435 */		sethi	%gdop_hix22(.L69),%o7
/* 0x5338	     */		xor	%o7,%gdop_lox10(.L69),%o3
/* 0x533c	     */		call	perror	!params=  %o0	!result= 
/* 0x5340	     */		ldx	[%l7+%o3],%o0,%gdop(.L69)
/* 0x5344	 392 */		return	%i7+8	! Result =  %i0
/* 0x5348	     */		mov	1,%o0
                       
! predecessor blocks: .L77001833 .L77001835

			.L77001839:
/* 0x534c	 398 */		sethi	%gdop_hix22(__iob),%l2
/* 0x5350	     */		sethi	%gdop_hix22(.L126),%l4
/* 0x5354	     */		xor	%l2,%gdop_lox10(__iob),%o1
/* 0x5358	     */		xor	%l4,%gdop_lox10(.L126),%o2
/* 0x535c	     */		ldx	[%l7+%o1],%o0,%gdop(__iob)
/* 0x5360	     */		ldx	[%l7+%o2],%o1,%gdop(.L126)
/* 0x5364	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x5368	     */		add	%o0,256,%o0
/* 0x536c	 399 */		sethi	%gdop_hix22(.L69),%o7
/* 0x5370	     */		xor	%o7,%gdop_lox10(.L69),%o3
/* 0x5374	     */		call	perror	!params=  %o0	!result= 
/* 0x5378	     */		ldx	[%l7+%o3],%o0,%gdop(.L69)
/* 0x537c	 392 */		return	%i7+8	! Result =  %i0
/* 0x5380	     */		mov	1,%o0
                       
! predecessor blocks: .L77001755 .L77001757

			.L77001761:
/* 0x5384	 341 */		sethi	%gdop_hix22(__iob),%i4
/* 0x5388	     */		sethi	%gdop_hix22(.L68),%i1
/* 0x538c	     */		xor	%i4,%gdop_lox10(__iob),%i5
/* 0x5390	     */		xor	%i1,%gdop_lox10(.L68),%l6
/* 0x5394	     */		ldx	[%l7+%i5],%o4,%gdop(__iob)
/* 0x5398	     */		ldx	[%l7+%l6],%o1,%gdop(.L68)
/* 0x539c	 342 */		sethi	%gdop_hix22(.L69),%l5
/* 0x53a0	 341 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x53a4	     */		add	%o4,256,%o0
/* 0x53a8	 342 */		xor	%l5,%gdop_lox10(.L69),%l3
/* 0x53ac	     */		call	perror	!params=  %o0	!result= 
/* 0x53b0	     */		ldx	[%l7+%l3],%o0,%gdop(.L69)
/* 0x53b4	 392 */		return	%i7+8	! Result =  %i0
/* 0x53b8	     */		mov	1,%o0
/* 0x53bc	   0 */		.type	main,#function
/* 0x53bc	   0 */		.size	main,(.-main)
/* 0x53bc	   0 */		.global	__fsr_init_value
/* 0x53bc	     */		 __fsr_init_value=1
                       

			.L900001173:

	.section	".text",#alloc,#execinstr,#progbits
                       

			.L900001207:

	.section	".annotate",#exclude,#progbits
/* 000000	   0 */		.asciz	"anotate"
/* 0x0008	   0 */		.word	6,0
/* 0x0010	   0 */		.xword	392
/* 0x0018	   0 */		.word	0,16
/* 0x0020	   0 */		.xword	(.L900001207-0x54bc)
/* 0x0028	   0 */		.xword	21692
/* 0x0030	   0 */		.word	2,32
/* 0x0038	   0 */		.xword	.L900001172
/* 0x0040	   0 */		.xword	(.L900001173-.L900001172)
/* 0x0048	   0 */		.xword	.L___const_seg_900000101
/* 0x0050	   0 */		.word	-2145808256,0
/* 0x0058	   0 */		.word	5,24
/* 0x0060	   0 */		.xword	(.L900001058+0x8)
/* 0x0068	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0070	   0 */		.xword	.L900001058
/* 0x0078	   0 */		.word	6,24
/* 0x0080	   0 */		.xword	(.L900001058+0x10)
/* 0x0088	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0090	   0 */		.xword	.L900001058
/* 0x0098	   0 */		.word	7,24
/* 0x00a0	   0 */		.xword	.L___const_seg_900000101
/* 0x00a8	   0 */		.xword	200
/* 0x00b0	   0 */		.xword	8
/* 0x00b8	   0 */		.word	26,224
/* 0x00c0	   0 */		.xword	(.L77001747+0x74)
/* 0x00c8	   0 */		.xword	(.L77001747+0x78)
/* 0x00d0	   0 */		.xword	(.L77001747+0x7c)
/* 0x00d8	   0 */		.xword	(.L77001747+0x84)
/* 0x00e0	   0 */		.xword	(.L77002059+0x100)
/* 0x00e8	   0 */		.xword	(.L77002059+0x104)
/* 0x00f0	   0 */		.xword	(.L77002059+0x108)
/* 0x00f8	   0 */		.xword	(.L77002059+0x110)
/* 0x0100	   0 */		.xword	(.L77002699+0x18)
/* 0x0108	   0 */		.xword	(.L77002699+0x1c)
/* 0x0110	   0 */		.xword	(.L77002699+0x20)
/* 0x0118	   0 */		.xword	(.L77002699+0x28)
/* 0x0120	   0 */		.xword	(.L77002179+0x18)
/* 0x0128	   0 */		.xword	(.L77002179+0x1c)
/* 0x0130	   0 */		.xword	(.L77002179+0x20)
/* 0x0138	   0 */		.xword	(.L77002179+0x28)
/* 0x0140	   0 */		.xword	(.L77002485+0x18)
/* 0x0148	   0 */		.xword	(.L77002485+0x1c)
/* 0x0150	   0 */		.xword	(.L77002485+0x20)
/* 0x0158	   0 */		.xword	(.L77002485+0x28)
/* 0x0160	   0 */		.xword	(.L77002497+0x20)
/* 0x0168	   0 */		.xword	(.L77002497+0x24)
/* 0x0170	   0 */		.xword	(.L77002497+0x28)
/* 0x0178	   0 */		.xword	(.L77002497+0x30)
/* 0x0180	   0 */		.xword	(.L77002501+0x18)
/* 0x0188	   0 */		.xword	(.L77002501+0x1c)
/* 0x0190	   0 */		.xword	(.L77002501+0x20)
/* 0x0198	   0 */		.xword	(.L77002501+0x28)

! Begin Disassembling Debug Info

! Begin sdCreateSection
	.section ".debug_info"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x01,0x5f,0x00,0x02
!	<reloc> off=14 kind=2 l1=.debug_abbrev loff=0
	.uaxword %section_symbol(".debug_abbrev")
	.byte 0x08,0x01
	.ascii "xmand.c\0"
	.byte 0x0c
	.ascii "DBG_GEN 5.7.6\0"
	.ascii "/export/home/dclarke/pgm/bw/xmand/\0"
	.ascii "/opt/developerstudio12.6/bin/c99 -Xc -xmemalign=8s -m64 -xcode=pic32 -xregs=no%appl -xlibmieee -mc -xs -xO3 -fast -fma=fused -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE='600' -S  xmand.c\0"
	.ascii "Xa;O;P;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>;\0"
!	<reloc> off=354 kind=2 l1=.debug_line loff=0
	.uaxword %section_symbol(".debug_line")
	.byte 0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_line"
	.byte 0xff,0xff,0xff,0xff,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x25,0x00,0x02,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x1b,0x04,0x00
	.byte 0xff,0x04,0x0a,0x00,0x01,0x01,0x01,0x01
	.byte 0x00,0x00,0x00,0x01,0x00,0x78,0x6d,0x61
	.byte 0x6e,0x64,0x2e,0x63,0x00,0x00,0x00,0x00
	.byte 0x00
! End sdCreateSection

! Begin sdCreateSection
	.section ".debug_abbrev"
	.byte 0x01,0x11,0x00,0x03,0x08,0x13,0x0b,0x25
	.byte 0x08,0x1b,0x08,0x85,0x44,0x08,0x87,0x44
	.byte 0x08,0x10,0x07,0x00,0x00,0x00
! End sdCreateSection
	.xstabs ".stab.index","V=10.0;DBG_GEN=5.7.6;Xa;O;P;R=5.15<<Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30>>",60,0,0,0
	.xstabs ".stab.index","/export/home/dclarke/pgm/bw/xmand; /opt/developerstudio12.6/bin/c99 -Xc -xmemalign=8s -m64 -xcode=pic32 -xregs=no%appl -xlibmieee -mc -xs -xO3 -fast -fma=fused -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE='600' -S  xmand.c",52,0,0,0
	.xstabs ".stab.index","main",42,0,0,72

! End Disassembling Debug Info

! Begin Disassembling Ident
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
	.ident	"acomp: Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"iropt: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
! End Disassembling Ident
