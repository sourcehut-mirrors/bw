
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

.L23:
	.ascii	"FAIL : calloc returns ENOMEM at %s:%d\n\000"
	.size	.L23,39
	.type	.L23,#object
	.align	4
!
! CONSTANT POOL
!

.L24:
	.ascii	"xmand.c\000"
	.size	.L24,8
	.type	.L24,#object
	.align	8
!
! CONSTANT POOL
!

.L26:
	.ascii	"FAIL : calloc fails at %s:%d\n\000"
	.size	.L26,30
	.type	.L26,#object
	.align	2
!
! CONSTANT POOL
!

.L27:
	.ascii	"FAIL \000"
	.size	.L27,6
	.type	.L27,#object
	.align	1
!
! CONSTANT POOL
!

.L48:
	.ascii	"C\000"
	.size	.L48,2
	.type	.L48,#object
	.align	1
!
! CONSTANT POOL
!

.L49:
	.ascii	"TZ\000"
	.size	.L49,3
	.type	.L49,#object
	.align	2
!
! CONSTANT POOL
!

.L50:
	.ascii	"GMT0\000"
	.size	.L50,5
	.type	.L50,#object
	.align	8
!
! CONSTANT POOL
!

.L53:
	.ascii	"FAIL : can not set timezone TZ = GMT0\n\000"
	.size	.L53,39
	.type	.L53,#object
	.align	8
!
! CONSTANT POOL
!

.L56:
	.ascii	"ERROR : could not attain CLOCK_REALTIME\n\000"
	.size	.L56,41
	.type	.L56,#object
	.align	8
!
! CONSTANT POOL
!

.L57:
	.ascii	"\n\n--------- _XOPEN_SOURCE 600 -------\n\000"
	.size	.L57,39
	.type	.L57,#object
	.align	8
!
! CONSTANT POOL
!

.L58:
	.ascii	"_POSIX_CHILD_MAX   = %i\n\000"
	.size	.L58,25
	.type	.L58,#object
	.align	8
!
! CONSTANT POOL
!

.L59:
	.ascii	"_POSIX_NGROUPS_MAX = %i\n\000"
	.size	.L59,25
	.type	.L59,#object
	.align	8
!
! CONSTANT POOL
!

.L60:
	.ascii	"_POSIX_OPEN_MAX    = %i\n\000"
	.size	.L60,25
	.type	.L60,#object
	.align	8
!
! CONSTANT POOL
!

.L61:
	.ascii	"_POSIX_PATH_MAX    = %i\n\000"
	.size	.L61,25
	.type	.L61,#object
	.align	8
!
! CONSTANT POOL
!

.L62:
	.ascii	"_POSIX_TZNAME_MAX  = %i\n\000"
	.size	.L62,25
	.type	.L62,#object
	.align	8
!
! CONSTANT POOL
!

.L63:
	.ascii	"---------------------------------------\n\000"
	.size	.L63,41
	.type	.L63,#object
	.align	8
!
! CONSTANT POOL
!

.L64:
	.ascii	"INFO : baseline tdelta = %14lu nsec\n\000"
	.size	.L64,37
	.type	.L64,#object
	.align	8
!
! CONSTANT POOL
!

.L68:
	.ascii	"FAIL : insufficient arguments provided\n\000"
	.size	.L68,40
	.type	.L68,#object
	.align	8
!
! CONSTANT POOL
!

.L69:
	.ascii	"     : usage %s bail_out_integer \\\n\000"
	.size	.L69,36
	.type	.L69,#object
	.align	8
!
! CONSTANT POOL
!

.L70:
	.ascii	"     :          magnify_integer \\\n\000"
	.size	.L70,35
	.type	.L70,#object
	.align	8
!
! CONSTANT POOL
!

.L71:
	.ascii	"     :          double_real \\\n\000"
	.size	.L71,31
	.type	.L71,#object
	.align	8
!
! CONSTANT POOL
!

.L72:
	.ascii	"     :          double_imaginary\\\n\000"
	.size	.L72,35
	.type	.L72,#object
	.align	8
!
! CONSTANT POOL
!

.L73:
	.ascii	"     :          pthread_count\n\000"
	.size	.L73,31
	.type	.L73,#object
	.align	8
!
! CONSTANT POOL
!

.L74:
	.ascii	"     : quitting.\n\000"
	.size	.L74,18
	.type	.L74,#object
	.align	8
!
! CONSTANT POOL
!

.L81:
	.ascii	"FAIL : bail_out_integer not understood\n\000"
	.size	.L81,40
	.type	.L81,#object
	.align	2
!
! CONSTANT POOL
!

.L82:
	.ascii	"     \000"
	.size	.L82,6
	.type	.L82,#object
	.align	8
!
! CONSTANT POOL
!

.L87:
	.ascii	"WARN : mandlebrot bail out is unreasonable\n\000"
	.size	.L87,44
	.type	.L87,#object
	.align	8
!
! CONSTANT POOL
!

.L88:
	.ascii	"     : we shall assume 4096 and proceed.\n\000"
	.size	.L88,42
	.type	.L88,#object
	.align	2
!
! CONSTANT POOL
!

.L91:
	.ascii	"%lld\000"
	.size	.L91,5
	.type	.L91,#object
	.align	8
!
! CONSTANT POOL
!

.L93:
	.ascii	"INFO : magnify not understood as long long int\n\000"
	.size	.L93,48
	.type	.L93,#object
	.align	2
!
! CONSTANT POOL
!

.L96:
	.ascii	"dBUG \000"
	.size	.L96,6
	.type	.L96,#object
	.align	8
!
! CONSTANT POOL
!

.L101:
	.ascii	"FAIL : magnify_integer not understood\n\000"
	.size	.L101,39
	.type	.L101,#object
	.align	8
!
! CONSTANT POOL
!

.L106:
	.ascii	"WARN : magnify_integer is unreasonable\n\000"
	.size	.L106,40
	.type	.L106,#object
	.align	8
!
! CONSTANT POOL
!

.L107:
	.ascii	"     : we shall assume 1 and proceed.\n\000"
	.size	.L107,39
	.type	.L107,#object
	.align	8
!
! CONSTANT POOL
!

.L110:
	.ascii	"INFO : magnify accepted as long long int\n\000"
	.size	.L110,42
	.type	.L110,#object
	.align	8
!
! CONSTANT POOL
!

.L113:
	.ascii	"INFO : FP Exception raised is\000"
	.size	.L113,30
	.type	.L113,#object
	.align	8
!
! CONSTANT POOL
!

.L116:
	.ascii	" FE_INEXACT\000"
	.size	.L116,12
	.type	.L116,#object
	.align	8
!
! CONSTANT POOL
!

.L119:
	.ascii	" FE_DIVBYZERO\000"
	.size	.L119,14
	.type	.L119,#object
	.align	8
!
! CONSTANT POOL
!

.L122:
	.ascii	" FE_UNDERFLOW\000"
	.size	.L122,14
	.type	.L122,#object
	.align	8
!
! CONSTANT POOL
!

.L125:
	.ascii	" FE_OVERFLOW\000"
	.size	.L125,13
	.type	.L125,#object
	.align	8
!
! CONSTANT POOL
!

.L128:
	.ascii	" FE_INVALID\000"
	.size	.L128,12
	.type	.L128,#object
	.align	1
!
! CONSTANT POOL
!

.L131:
	.ascii	"\n\000"
	.size	.L131,2
	.type	.L131,#object
	.align	8
!
! CONSTANT POOL
!

.L134:
	.ascii	"real : Perfectly safe to ignore FE_INEXACT\n\000"
	.size	.L134,44
	.type	.L134,#object
	.align	8
!
! CONSTANT POOL
!

.L139:
	.ascii	"FAIL : double real coordinate not understood\n\000"
	.size	.L139,46
	.type	.L139,#object
	.align	8
!
! CONSTANT POOL
!

.L143:
	.ascii	"FAIL : double real coordinate is not normal\n\000"
	.size	.L143,45
	.type	.L143,#object
	.align	8
!
! CONSTANT POOL
!

.L144:
	.ascii	"     : looks like %-+18.12e\n\000"
	.size	.L144,29
	.type	.L144,#object
	.align	8
!
! CONSTANT POOL
!

.L149:
	.ascii	"WARN : double real coordinate is out of range\n\000"
	.size	.L149,47
	.type	.L149,#object
	.align	8
!
! CONSTANT POOL
!

.L150:
	.ascii	"     : value seen = %-+18.12e\n\000"
	.size	.L150,31
	.type	.L150,#object
	.align	8
!
! CONSTANT POOL
!

.L151:
	.ascii	"     : we shall assume zero.\n\000"
	.size	.L151,30
	.type	.L151,#object
	.align	8
!
! CONSTANT POOL
!

.L167:
	.ascii	"imag : Perfectly safe to ignore FE_INEXACT\n\000"
	.size	.L167,44
	.type	.L167,#object
	.align	8
!
! CONSTANT POOL
!

.L172:
	.ascii	"FAIL : double imaginary coordinate not understood\n\000"
	.size	.L172,51
	.type	.L172,#object
	.align	8
!
! CONSTANT POOL
!

.L176:
	.ascii	"FAIL : double imaginary coordinate is not normal\n\000"
	.size	.L176,50
	.type	.L176,#object
	.align	8
!
! CONSTANT POOL
!

.L181:
	.ascii	"WARN : double imaginary coordinate is out of range\n\000"
	.size	.L181,52
	.type	.L181,#object
	.align	8
!
! CONSTANT POOL
!

.L187:
	.ascii	"FAIL : pthread_limit not understood\n\000"
	.size	.L187,37
	.type	.L187,#object
	.align	8
!
! CONSTANT POOL
!

.L192:
	.ascii	"WARN : pthread_limit is unreasonable\n\000"
	.size	.L192,38
	.type	.L192,#object
	.align	8
!
! CONSTANT POOL
!

.L205:
	.ascii	"WARN : pthread_limit is not a perfect\n\000"
	.size	.L205,39
	.type	.L205,#object
	.align	8
!
! CONSTANT POOL
!

.L206:
	.ascii	"     : power of two. We shall assume\n\000"
	.size	.L206,38
	.type	.L206,#object
	.align	8
!
! CONSTANT POOL
!

.L207:
	.ascii	"     : %i POSIX thread(s).\n\000"
	.size	.L207,28
	.type	.L207,#object
	.align	8
!
! CONSTANT POOL
!

.L211:
	.ascii	"WARN : No arguments received thus we have\n\000"
	.size	.L211,43
	.type	.L211,#object
	.align	8
!
! CONSTANT POOL
!

.L212:
	.ascii	"     : some hard coded values ... enjoy.\n\000"
	.size	.L212,42
	.type	.L212,#object
	.align	8
!
! CONSTANT POOL
!

.L213:
	.ascii	"\n    mand_bail = %i\n\000"
	.size	.L213,21
	.type	.L213,#object
	.align	8
!
! CONSTANT POOL
!

.L214:
	.ascii	"pthread_limit = %i\n\000"
	.size	.L214,20
	.type	.L214,#object
	.align	8
!
! CONSTANT POOL
!

.L215:
	.ascii	"    translate = ( %-+32.26e , %-+32.26e )\n\000"
	.size	.L215,43
	.type	.L215,#object
	.align	8
!
! CONSTANT POOL
!

.L216:
	.ascii	"      magnify = %-+32.26e\n\n\000"
	.size	.L216,28
	.type	.L216,#object
	.align	4
!
! CONSTANT POOL
!

.L217:
	.ascii	"\n X11 : \000"
	.size	.L217,9
	.type	.L217,#object
	.align	8
!
! CONSTANT POOL
!

.L218:
	.ascii	"default width=%4i height=%4i\n\000"
	.size	.L218,30
	.type	.L218,#object
	.align	8
!
! CONSTANT POOL
!

.L221:
	.ascii	"%s: no X server?? \'%s\'\n\000"
	.size	.L221,24
	.type	.L221,#object
	.align	8
!
! CONSTANT POOL
!

.L222:
	.ascii	"     : connection number %i\n\000"
	.size	.L222,29
	.type	.L222,#object
	.align	8
!
! CONSTANT POOL
!

.L223:
	.ascii	"     : screen number %i\n\000"
	.size	.L223,25
	.type	.L223,#object
	.align	8
!
! CONSTANT POOL
!

.L224:
	.ascii	"     : default depth is %i\n\000"
	.size	.L224,28
	.type	.L224,#object
	.align	8
!
! CONSTANT POOL
!

.L225:
	.ascii	"lucidasanstypewriter-10\000"
	.size	.L225,24
	.type	.L225,#object
	.align	8
!
! CONSTANT POOL
!

.L226:
	.ascii	"     : display seems to be %i wide and %i high.\n\000"
	.size	.L226,49
	.type	.L226,#object
	.align	8
!
! CONSTANT POOL
!

.L231:
	.ascii	"ERROR: screen is too small\n\n\000"
	.size	.L231,29
	.type	.L231,#object
	.align	8
!
! CONSTANT POOL
!

.L232:
	.ascii	"     : offset x=%i y=%i\n\000"
	.size	.L232,25
	.type	.L232,#object
	.align	4
!
! CONSTANT POOL
!

.L234:
	.ascii	"red\000"
	.size	.L234,4
	.type	.L234,#object
	.align	8
!
! CONSTANT POOL
!

.L236:
	.ascii	"XAllocNamedColor - no red color?\n\000"
	.size	.L236,34
	.type	.L236,#object
	.align	2
!
! CONSTANT POOL
!

.L238:
	.ascii	"green\000"
	.size	.L238,6
	.type	.L238,#object
	.align	8
!
! CONSTANT POOL
!

.L240:
	.ascii	"XAllocNamedColor - red works but green no??\n\000"
	.size	.L240,45
	.type	.L240,#object
	.align	2
!
! CONSTANT POOL
!

.L242:
	.ascii	"blue\000"
	.size	.L242,5
	.type	.L242,#object
	.align	8
!
! CONSTANT POOL
!

.L244:
	.ascii	"XAllocNamedColor - red and green okay but blue??\n\000"
	.size	.L244,50
	.type	.L244,#object
	.align	2
!
! CONSTANT POOL
!

.L246:
	.ascii	"yellow\000"
	.size	.L246,7
	.type	.L246,#object
	.align	8
!
! CONSTANT POOL
!

.L248:
	.ascii	"XAllocNamedColor - yellow bork bork bork!\n\000"
	.size	.L248,43
	.type	.L248,#object
	.align	2
!
! CONSTANT POOL
!

.L250:
	.ascii	"cyan\000"
	.size	.L250,5
	.type	.L250,#object
	.align	8
!
! CONSTANT POOL
!

.L252:
	.ascii	"XAllocNamedColor - cyan bork bork bork!\n\000"
	.size	.L252,41
	.type	.L252,#object
	.align	4
!
! CONSTANT POOL
!

.L254:
	.ascii	"magenta\000"
	.size	.L254,8
	.type	.L254,#object
	.align	8
!
! CONSTANT POOL
!

.L256:
	.ascii	"XAllocNamedColor - magenta bork bork!\n\000"
	.size	.L256,39
	.type	.L256,#object
	.align	8
!
! CONSTANT POOL
!

.L258:
	.ascii	"cornflowerblue\000"
	.size	.L258,15
	.type	.L258,#object
	.align	8
!
! CONSTANT POOL
!

.L260:
	.ascii	"XAllocNamedColor - cornflowerblue fails.\n\000"
	.size	.L260,42
	.type	.L260,#object
	.align	8
!
! CONSTANT POOL
!

.L263:
	.ascii	"XAllocColor - royal_blue fails.\n\000"
	.size	.L263,33
	.type	.L263,#object
	.align	8
!
! CONSTANT POOL
!

.L266:
	.ascii	"XAllocColor - oldlace fails.\n\000"
	.size	.L266,30
	.type	.L266,#object
	.align	8
!
! CONSTANT POOL
!

.L269:
	.ascii	"XAllocColor - very_dark_grey fails.\n\000"
	.size	.L269,37
	.type	.L269,#object
	.align	8
!
! CONSTANT POOL
!

.L272:
	.ascii	"XAllocColor - gee .. mandlebrot fail.\n\000"
	.size	.L272,39
	.type	.L272,#object
	.align	8
!
! CONSTANT POOL
!

.L273:
	.ascii	"     : eff_width = %5i    eff_height = %5i\n\n\000"
	.size	.L273,45
	.type	.L273,#object
	.align	8
!
! CONSTANT POOL
!

.L274:
	.ascii	"--------------------------------------------\n\000"
	.size	.L274,46
	.type	.L274,#object
	.align	8
!
! CONSTANT POOL
!

.L275:
	.ascii	"pixel_real_w = %-+32.26e\n\000"
	.size	.L275,26
	.type	.L275,#object
	.align	8
!
! CONSTANT POOL
!

.L276:
	.ascii	"pixel_imag_h = %-+32.26e\n\000"
	.size	.L276,26
	.type	.L276,#object
	.align	2
!
! CONSTANT POOL
!

.L277:
	.ascii	"REPLOT\000"
	.size	.L277,7
	.type	.L277,#object
	.align	2
!
! CONSTANT POOL
!

.L278:
	.ascii	"TMPDIR\000"
	.size	.L278,7
	.type	.L278,#object
	.align	4
!
! CONSTANT POOL
!

.L286:
	.ascii	"No TMPDIR\000"
	.size	.L286,10
	.type	.L286,#object
	.align	2
!
! CONSTANT POOL
!

.L287:
	.ascii	"DUMPER\000"
	.size	.L287,7
	.type	.L287,#object
	.align	8
!
! CONSTANT POOL
!

.L309:
	.ascii	"[0000] tdelta = %14lu nsec\000"
	.size	.L309,27
	.type	.L309,#object
	.align	8
!
! CONSTANT POOL
!

.L318:
	.ascii	"FAIL : calloc ENOMEM at %s:%d\n\000"
	.size	.L318,31
	.type	.L318,#object
	.align	8
!
! CONSTANT POOL
!

.L343:
	.ascii	"raw  [ %-4i , %-4i ]\000"
	.size	.L343,21
	.type	.L343,#object
	.align	4
!
! CONSTANT POOL
!

.L344:
	.ascii	"%s\n\000"
	.size	.L344,4
	.type	.L344,#object
	.align	8
!
! CONSTANT POOL
!

.L352:
	.ascii	"vbox  [ %03i , %03i ]\000"
	.size	.L352,22
	.type	.L352,#object
	.align	8
!
! CONSTANT POOL
!

.L353:
	.ascii	"fp64( %-+10.8e , %-+10.8e )\000"
	.size	.L353,28
	.type	.L353,#object
	.align	8
!
! CONSTANT POOL
!

.L354:
	.ascii	"fp64( %-+32.26e,\n      %-+32.26e )\n\000"
	.size	.L354,36
	.type	.L354,#object
	.align	8
!
! CONSTANT POOL
!

.L355:
	.ascii	"c = ( %-+32.26e,\n      %-+32.26e )\n\000"
	.size	.L355,36
	.type	.L355,#object
	.align	8
!
! CONSTANT POOL
!

.L356:
	.ascii	" select = %-+16.12e, %-+16.12e  \000"
	.size	.L356,33
	.type	.L356,#object
	.align	8
!
! CONSTANT POOL
!

.L357:
	.ascii	"bailout = %-8i with a pthread_limit = %-3i\000"
	.size	.L357,43
	.type	.L357,#object
	.align	8
!
! CONSTANT POOL
!

.L358:
	.ascii	"magnify = %-12.10e\000"
	.size	.L358,19
	.type	.L358,#object
	.align	8
!
! CONSTANT POOL
!

.L359:
	.ascii	" centre = %-+16.12e, %-+16.12e  \000"
	.size	.L359,33
	.type	.L359,#object
	.align	8
!
! CONSTANT POOL
!

.L360:
	.ascii	"pixel_real_w = %-+16.12e\000"
	.size	.L360,25
	.type	.L360,#object
	.align	8
!
! CONSTANT POOL
!

.L361:
	.ascii	"pixel_imag_h = %-+16.12e\000"
	.size	.L361,25
	.type	.L361,#object
	.align	8
!
! CONSTANT POOL
!

.L373:
	.ascii	"PTHRD: join %i done\n\000"
	.size	.L373,21
	.type	.L373,#object
	.align	8
!
! CONSTANT POOL
!

.L375:
	.ascii	"[join] = %14lu nsec   %08.6e sec\000"
	.size	.L375,33
	.type	.L375,#object
	.align	8
!
! CONSTANT POOL
!

.L402:
	.ascii	"[plot] = %14lu nsec   %08.6e sec\000"
	.size	.L402,33
	.type	.L402,#object
	.align	8
!
! CONSTANT POOL
!

.L414:
	.ascii	"f(%-+2i) = %-9.5e  \000"
	.size	.L414,20
	.type	.L414,#object
	.align	8
!
! CONSTANT POOL
!

.L428:
	.ascii	"  factor set to 1  \000"
	.size	.L428,20
	.type	.L428,#object
	.align	4
!
! CONSTANT POOL
!

.L440:
	.ascii	">REPLOT<\000"
	.size	.L440,9
	.type	.L440,#object
	.align	4
!
! CONSTANT POOL
!

.L442:
	.ascii	" REPLOT \000"
	.size	.L442,9
	.type	.L442,#object
	.align	8
!
! CONSTANT POOL
!

.L443:
	.ascii	"INFO : mand_bail changed to %u\n\000"
	.size	.L443,32
	.type	.L443,#object
	.align	8
!
! CONSTANT POOL
!

.L444:
	.ascii	"INFO : magnify changed to %-+16.10e\n\000"
	.size	.L444,37
	.type	.L444,#object
	.align	8
!
! CONSTANT POOL
!

.L445:
	.ascii	"INFO : c = %-+16.12e, %-+16.12e  \000"
	.size	.L445,34
	.type	.L445,#object
	.align	4
!
! CONSTANT POOL
!

.L469:
	.ascii	">DUMPER<\000"
	.size	.L469,9
	.type	.L469,#object
	.align	4
!
! CONSTANT POOL
!

.L470:
	.ascii	"Confirm ? \000"
	.size	.L470,11
	.type	.L470,#object
	.align	8
!
! CONSTANT POOL
!

.L471:
	.ascii	"INFO : dumper_flag = 1\n\000"
	.size	.L471,24
	.type	.L471,#object
	.align	4
!
! CONSTANT POOL
!

.L485:
	.ascii	"Data Ready\000"
	.size	.L485,11
	.type	.L485,#object
	.align	8
!
! CONSTANT POOL
!

.L486:
	.ascii	"%Y%m%d%H%M%S\000"
	.size	.L486,13
	.type	.L486,#object
	.align	1
!
! CONSTANT POOL
!

.L487:
	.ascii	"/\000"
	.size	.L487,2
	.type	.L487,#object
	.align	8
!
! CONSTANT POOL
!

.L490:
	.ascii	"FAIL : file %s can not be created.\n\000"
	.size	.L490,36
	.type	.L490,#object
	.align	1
!
! CONSTANT POOL
!

.L492:
	.ascii	"wb\000"
	.size	.L492,3
	.type	.L492,#object
	.align	8
!
! CONSTANT POOL
!

.L495:
	.ascii	"FAIL fopen of filename\000"
	.size	.L495,23
	.type	.L495,#object
	.align	8
!
! CONSTANT POOL
!

.L497:
	.ascii	"INFO : file %s dump begins.\n\000"
	.size	.L497,29
	.type	.L497,#object
	.align	8
!
! CONSTANT POOL
!

.L501:
	.ascii	"     : %2lu byte uint32_t num_elements num_written = %lu\n\000"
	.size	.L501,58
	.type	.L501,#object
	.align	8
!
! CONSTANT POOL
!

.L502:
	.ascii	"     : num_elements = %8i\n\000"
	.size	.L502,27
	.type	.L502,#object
	.align	8
!
! CONSTANT POOL
!

.L506:
	.ascii	"     : %2lu byte uint32_t mand_bail    num_written = %lu\n\000"
	.size	.L506,58
	.type	.L506,#object
	.align	8
!
! CONSTANT POOL
!

.L507:
	.ascii	"     : mand_bail = %8i\n\000"
	.size	.L507,24
	.type	.L507,#object
	.align	8
!
! CONSTANT POOL
!

.L511:
	.ascii	"     : %2lu byte double magnify        num_written = %lu\n\000"
	.size	.L511,58
	.type	.L511,#object
	.align	8
!
! CONSTANT POOL
!

.L512:
	.ascii	"     :        magnify = %-+32.26e\n\000"
	.size	.L512,35
	.type	.L512,#object
	.align	8
!
! CONSTANT POOL
!

.L516:
	.ascii	"DBUG : %2lu byte double real_translate num_written = %lu\n\000"
	.size	.L516,58
	.type	.L516,#object
	.align	8
!
! CONSTANT POOL
!

.L517:
	.ascii	"     : real_translate = %-+32.26e\n\000"
	.size	.L517,35
	.type	.L517,#object
	.align	8
!
! CONSTANT POOL
!

.L521:
	.ascii	"     : %2lu byte double imag_translate num_written = %lu\n\000"
	.size	.L521,58
	.type	.L521,#object
	.align	8
!
! CONSTANT POOL
!

.L522:
	.ascii	"     : imag_translate = %-+32.26e\n\000"
	.size	.L522,35
	.type	.L522,#object
	.align	8
!
! CONSTANT POOL
!

.L526:
	.ascii	"     : %2lu byte uint32_t VBOX_REAL_COUNT num_written = %lu\n\000"
	.size	.L526,61
	.type	.L526,#object
	.align	8
!
! CONSTANT POOL
!

.L527:
	.ascii	"     : VBOX_REAL_COUNT = %8i\n\000"
	.size	.L527,30
	.type	.L527,#object
	.align	8
!
! CONSTANT POOL
!

.L531:
	.ascii	"     : VBOX_IMAG_COUNT = %8i\n\000"
	.size	.L531,30
	.type	.L531,#object
	.align	8
!
! CONSTANT POOL
!

.L535:
	.ascii	"     : %2lu byte uint32_t VBOX_SAMPLE_REAL num_written = %lu\n\000"
	.size	.L535,62
	.type	.L535,#object
	.align	8
!
! CONSTANT POOL
!

.L536:
	.ascii	"     : VBOX_SAMPLE_REAL = %8i\n\000"
	.size	.L536,31
	.type	.L536,#object
	.align	8
!
! CONSTANT POOL
!

.L540:
	.ascii	"     : %2lu byte uint32_t VBOX_SAMPLE_IMAG num_written = %lu\n\000"
	.size	.L540,62
	.type	.L540,#object
	.align	8
!
! CONSTANT POOL
!

.L541:
	.ascii	"     : VBOX_SAMPLE_IMAG = %8i\n\000"
	.size	.L541,31
	.type	.L541,#object
	.align	8
!
! CONSTANT POOL
!

.L565:
	.ascii	"INFO : file %s closed.\n\000"
	.size	.L565,24
	.type	.L565,#object
	.align	4
!
! CONSTANT POOL
!

.L566:
	.ascii	"File Done \000"
	.size	.L566,11
	.type	.L566,#object
	.align	4
!
! CONSTANT POOL
!

.L569:
	.ascii	"Bad TMPDIR\000"
	.size	.L569,11
	.type	.L569,#object
	.align	8
!
! CONSTANT POOL
!

.L571:
	.ascii	"INFO : dumper_flag = 0\n\000"
	.size	.L571,24
	.type	.L571,#object
	.align	4
!
! CONSTANT POOL
!

.L573:
	.ascii	"Not Ready\000"
	.size	.L573,10
	.type	.L573,#object
	.align	8
!
! CONSTANT POOL
!

.L582:
	.ascii	"DBUG : sample space [ %-6i, %-6i ]\n\000"
	.size	.L582,36
	.type	.L582,#object
	.align	8
!
! CONSTANT POOL
!

.L583:
	.ascii	"fp64( %-10.8e , %-10.8e )\000"
	.size	.L583,26
	.type	.L583,#object
	.align	4
!
! CONSTANT POOL
!

.L584:
	.ascii	"     : %s\n\000"
	.size	.L584,11
	.type	.L584,#object
	.align	8
!
! CONSTANT POOL
!

.L585:
	.ascii	"     : win_r = %-+32.26e\n\000"
	.size	.L585,26
	.type	.L585,#object
	.align	8
!
! CONSTANT POOL
!

.L586:
	.ascii	"     : win_j = %-+32.26e\n\000"
	.size	.L586,26
	.type	.L586,#object
	.align	8
!
! CONSTANT POOL
!

.L587:
	.ascii	"fp64( %-+10.8e , %-+10.8e )  \000"
	.size	.L587,30
	.type	.L587,#object
	.align	8
!
! CONSTANT POOL
!

.L588:
	.ascii	"     : after translation\n\000"
	.size	.L588,26
	.type	.L588,#object
	.align	8
!
! CONSTANT POOL
!

.L589:
	.ascii	"     : r_trn   = %-+32.26e\n\000"
	.size	.L589,28
	.type	.L589,#object
	.align	8
!
! CONSTANT POOL
!

.L590:
	.ascii	"     : j_trn   = %-+32.26e\n\000"
	.size	.L590,28
	.type	.L590,#object
	.align	8
!
! CONSTANT POOL
!

.L591:
	.ascii	"     : x_prime = %-+32.26e\n\000"
	.size	.L591,28
	.type	.L591,#object
	.align	8
!
! CONSTANT POOL
!

.L592:
	.ascii	"     : y_prime = %-+32.26e\n\000"
	.size	.L592,28
	.type	.L592,#object
	.align	8
!
! CONSTANT POOL
!

.L593:
	.ascii	"bailout = %-8i          \000"
	.size	.L593,25
	.type	.L593,#object
	.align	8
!
! CONSTANT POOL
!

.L594:
	.ascii	"     : magnify = %-18.12e\n\000"
	.size	.L594,27
	.type	.L594,#object
	.align	8
!
! CONSTANT POOL
!

.L651:
	.ascii	"[vbox] = %14lu nsec   %08.6e sec\000"
	.size	.L651,33
	.type	.L651,#object
	.align	8
!
! CONSTANT POOL
!

.L654:
	.ascii	"[mand] = %14lu nsec   %08.6e sec\000"
	.size	.L654,33
	.type	.L654,#object
	.align	2
!
! CONSTANT POOL
!

.L655:
	.ascii	"%s\n\n\000"
	.size	.L655,5
	.type	.L655,#object
	.align	8
!
! CONSTANT POOL
!

.L656:
	.ascii	"\nraw data values -------------------------------------------------------\n\000"
	.size	.L656,74
	.type	.L656,#object
	.align	8
!
! CONSTANT POOL
!

.L657:
	.ascii	"     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n\000"
	.size	.L657,38
	.type	.L657,#object
	.align	8
!
! CONSTANT POOL
!

.L658:
	.ascii	"     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n\000"
	.size	.L658,38
	.type	.L658,#object
	.align	8
!
! CONSTANT POOL
!

.L659:
	.ascii	"     :       mand_height = %9i\n\000"
	.size	.L659,32
	.type	.L659,#object
	.align	8
!
! CONSTANT POOL
!

.L660:
	.ascii	"     : r[ 7][ 7][63][63] = %-+32.26e\n\000"
	.size	.L660,38
	.type	.L660,#object
	.align	8
!
! CONSTANT POOL
!

.L661:
	.ascii	"     : j[ 7][ 7][63][63] = %-+32.26e\n\000"
	.size	.L661,38
	.type	.L661,#object
	.align	8
!
! CONSTANT POOL
!

.L662:
	.ascii	"     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n\000"
	.size	.L662,38
	.type	.L662,#object
	.align	8
!
! CONSTANT POOL
!

.L663:
	.ascii	"     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n\000"
	.size	.L663,38
	.type	.L663,#object
	.align	8
!
! CONSTANT POOL
!

.L664:
	.ascii	"     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n\000"
	.size	.L664,38
	.type	.L664,#object
	.align	8
!
! CONSTANT POOL
!

.L665:
	.ascii	"     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n\000"
	.size	.L665,38
	.type	.L665,#object
	.align	8
!
! CONSTANT POOL
!

.L666:
	.ascii	"     : r[ 8][ 8][32][32] = %-+32.26e\n\000"
	.size	.L666,38
	.type	.L666,#object
	.align	8
!
! CONSTANT POOL
!

.L667:
	.ascii	"     : j[ 8][ 8][32][32] = %-+32.26e\n\000"
	.size	.L667,38
	.type	.L667,#object
	.align	8
!
! CONSTANT POOL
!

.L668:
	.ascii	"     : r[ 3][12][44][21] = %-+32.26e\n\000"
	.size	.L668,38
	.type	.L668,#object
	.align	8
!
! CONSTANT POOL
!

.L669:
	.ascii	"     : j[ 3][12][44][21] = %-+32.26e\n\000"
	.size	.L669,38
	.type	.L669,#object
	.align	8
!
! CONSTANT POOL
!

.L670:
	.ascii	"     : r[15][15][63][63] = %-+32.26e\n\000"
	.size	.L670,38
	.type	.L670,#object
	.align	8
!
! CONSTANT POOL
!

.L671:
	.ascii	"     : j[15][15][63][63] = %-+32.26e\n\000"
	.size	.L671,38
	.type	.L671,#object
	.align	8
!
! CONSTANT POOL
!

.L672:
	.ascii	"--------------------------- full plot done -----------------------------\n\000"
	.size	.L672,74
	.type	.L672,#object
	.align	8
!
! CONSTANT POOL
!

.L676:
	.ascii	"right click\n\000"
	.size	.L676,13
	.type	.L676,#object
	.align	8
!
! CONSTANT POOL
!

.L677:
	.ascii	"[%04i] tdelta = %14lu nsec\000"
	.size	.L677,27
	.type	.L677,#object
	.align	1
!
! CONSTANT POOL
!

.L680:
	.ascii	"\n\n\000"
	.size	.L680,3
	.type	.L680,#object
	.align	4
!
! CONSTANT POOL
!

.L684:
	.ascii	"roll up\n\000"
	.size	.L684,9
	.type	.L684,#object
	.align	4
!
! CONSTANT POOL
!

.L688:
	.ascii	"roll down\n\000"
	.size	.L688,11
	.type	.L688,#object
	.align	8
!
! CONSTANT POOL
!

.L690:
	.ascii	"\n ??? unknown button ???\n\000"
	.size	.L690,26
	.type	.L690,#object
	.align	8
!
! CONSTANT POOL
!

.L691:
	.ascii	"click at %d %d \n\000"
	.size	.L691,17
	.type	.L691,#object

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
/* 0x00b0	     */		.word	1105199104,0
/* 0x00b8	   0 */		.type	.L___const_seg_900000101,#object
/* 0x00b8	   0 */		.size	.L___const_seg_900000101,(.-.L___const_seg_900000101)
/* 0x00b8	   0 */		.align	8
/* 0x00b8	     */		.word	65536,65536,65536,65536,65536,65536,65536,65536
/* 0x00d8	     */		.word	65536,65536,65536,65536,65536,65536,65536,65536,65536,65536
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
!   51		      ! * see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=37845
!   52		      ! * Also https://reviews.llvm.org/D72675 */
!   53		      !#include <fenv.h>
!   54		      !#ifndef __FAST_MATH__
!   55		      !#pragma STDC FENV_ACCESS ON
!   56		      !#endif
!   57		      !#pragma STDC FP_CONTRACT ON
!   59		      !#define __STDC_FORMAT_MACROS
!   60		      !#include <inttypes.h>
!   62		      !#include <locale.h>
!   63		      !#include <unistd.h>
!   64		      !#include <math.h>
!   65		      !#include <errno.h>
!   67		      !#include <pthread.h>
!   69		      !#include <fcntl.h>
!   70		      !#include <sys/stat.h>
!   72		      !#include "mandelbrot.h"
!   74		      !int main(int argc, char*argv[])
!   75		      !{

!
! SUBROUTINE main
!
! OFFSET    SOURCE LINE	LABEL	INSTRUCTION

                       	.global main
                       

			main:

! Registers live out of main: 
! g2 g3 o0 o1 o2 sp l4 l6 i0 i1 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: main

			.L900000795:
/* 000000	  75 */		sethi	%hi(0x1400),%g1
/* 0x0004	     */		xor	%g1,-96,%g1
/* 0x0008	     */		save	%sp,%g1,%sp
                       

			.L900000686:
/* 0x000c	  75 */		call	(.+0x8)	! getpc
/* 0x0010	     */		mov	%o7,%o7
/* 0x0014	     */		sethi	%pc22(_GLOBAL_OFFSET_TABLE_-(.L900000686-.)),%l6
/* 0x0018	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i2
/* 0x001c	  75 */		add	%l6,%pc10(_GLOBAL_OFFSET_TABLE_-(.L900000686-.)),%l6
/* 0x0020	   0 */		xor	%i2,%gdop_lox10(.L___const_seg_900000101),%i3
/* 0x0024	  75 */		add	%l6,%o7,%i2
/* 0x0028	     */		stx	%i2,[%sp+2399]

!   76		      !    pthread_t tid[MAX_THREADS]; /* array of thread IDs */
!   77		      !    /* our display and window and graphics context */
!   78		      !    Display *dsp;
!   79		      !    Window win, win2, win3;
!   80		      !    GC gc, gc2, gc3;
!   81		      !    Colormap screen_colormap;
!   82		      !    XEvent event;
!   83		      !    Font type_font;
!   85		      !    /* a very few colours */
!   86		      !    XColor red, green, blue, yellow, cyan, magenta;
!   87		      !    XColor cornflowerblue, royal_blue, very_dark_grey;
!   88		      !    XColor oldlace, mandlebrot;
!   90		      !    /* pre-loaded 8-bit color map */
!   91		      !    unsigned long lsd_trippy[256];
!   93		      !    /* We have a whole new method of dealing with color for
!   94		      !     * the mandlebrot and thus we need some intermediate vars */
!   95		      !    double t_param, t_param_exponent, gamma, hue, rotation;
!   96		      !    double shift, gamma_factor;
!   97		      !    uint8_t red_bits, green_bits, blue_bits;
!   98		      !    double red_level, green_level, blue_level;
!  100		      !    /* we can swap back and forth on the colour method with
!  101		      !     * a trivial flag */
!  102		      !    int colour_method_flag = 0;
!  103		      !    int invert_me_dammit = 0;
!  105		      !    /* we need a double click on replot to trigger */
!  106		      !    int replot_flag = 0;
!  108		      !    /* we need a double click on the file dumper also */
!  109		      !    int dumper_flag = 0;
!  111		      !    /* please see https://arxiv.org/abs/1108.5083
!  112		      !     * A colour scheme for the display of astronomical intensity images
!  113		      !     * D. A. Green 25 Aug 2011 (v1), revised 30 Aug 2011
!  114		      !     *
!  115		      !     * I describe a colour scheme that is appropriate for the screen
!  116		      !     * display of intensity images. This -- unlike many currently
!  117		      !     * available schemes -- is designed to be monotonically increasing
!  118		      !     * in terms of its perceived brightness.
!  119		      !     */
!  121		      !    /* setup mouse x and y */
!  122		      !    int mouse_x = -1, mouse_y = -1;
!  123		      !    int invert_mouse_y;
!  124		      !    int mouse_x_raw, mouse_y_raw;
!  126		      !    /* these next five are just mouse button counters where the
!  127		      !     * roll_up and roll_dn are mouse wheel events */
!  128		      !    int button = 0;
!  129		      !    int left_count, mid_count, right_count, roll_up, roll_dn;
!  131		      !    /* various timers and time stuff */
!  132		      !    uint64_t t_delta;
!  133		      !    struct timespec t0, t1, now_time;
!  134		      !    struct timespec vbox_t0, vbox_t1;
!  135		      !    struct timespec soln_t0, soln_t1;
!  137		      !    /* lets assume the user will specify some number of
!  138		      !     * threads to dispatch at once. For now we will hard
!  139		      !     * code a silly limit */
!  140		      !    int pthread_limit = 1;
!  142		      !    /* some primordial vars */
!  143		      !    int disp_width, disp_height;
!  144		      !    unsigned int width, height;
!  145		      !    int conn_num, screen_num, depth;
!  146		      !    int j, k, p, q, pt, offset_x, offset_y;
!  147		      !    int lx, ly, ux, uy;
!  148		      !    int gc2_x, gc2_y;
!  149		      !    int eff_width, eff_height, vbox_w, vbox_h;
!  150		      !    double obs_real, obs_imag;
!  151		      !    double sub_pixel_real, sub_pixel_imag;
!  152		      !    double pixel_real_width, pixel_imag_height;
!  153		      !    double magnify, real_translate, imag_translate;
!  155		      !    /* what is the default width and height on the complex plane ? */
!  156		      !    double default_real = DEFAULT_REAL_WIDTH;
!  157		      !    double default_imag = DEFAULT_IMAG_HEIGHT;
!  159		      !    /* ensure these are initialized */
!  160		      !    double x_prime = -8.0;
!  161		      !    double y_prime = -8.0;
!  163		      !    /* eventually we will need to refer to a digital coordinate
!  164		      !     * that overlaps the complex coordinate space */
!  165		      !    int sample_r, sample_j;
!  167		      !    /* use the vbox lower left coords as reference */
!  168		      !    int vbox_ll_x, vbox_ll_y;
!  170		      !    /* we need to track when a vbox has been computed
!  171		      !     * as well as displayed via libX11. For now we just
!  172		      !     * don't want to recompute the same region over and
!  173		      !     * over and over. */
!  174		      !    int vbox_flag[VBOX_REAL_COUNT][VBOX_IMAG_COUNT];
!  176		      !    /* ensure we start with clear vbox flags */
!  177		      !    memset(&vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_IMAG_COUNT)*sizeof(int
!  177		      >));

/* 0x002c	 177 */		add	%fp,-1049,%o0
/* 0x0030	   0 */		ldx	[%i2+%i3],%i3,%gdop(.L___const_seg_900000101)
/* 0x0034	 177 */		mov	1024,%o2
/* 0x0038	     */		mov	0,%o1
/* 0x003c	   0 */		sethi	%hi(0x400000),%i2

!  179		      !    /* Also we finally have use for the little box grid that we
!  180		      !     * lay out and thus we will need the box coordinates */
!  181		      !    int vbox_r, vbox_j;
!  183		      !    /* eventually we need to dump out a file */
!  184		      !    FILE *fp;
!  185		      !    size_t filename_len;
!  186		      !    char *err_status;
!  187		      !    int data_ready;
!  188		      !    size_t num_written;
!  189		      !    struct stat status_buffer;
!  190		      !    time_t time_now;
!  191		      !    char timestamp[32];
!  192		      !    struct tm *ptm;
!  193		      !    char *timestamp_filename;
!  195		      !    /* we  may need to swap around bytes from a big endian machine */
!  196		      !    uint64_t rotated64;
!  197		      !    uint32_t rotated32;
!  198		      !    uint32_t temp32bit;
!  200		      !    /* guess the architecture endianess */
!  201		      !    int end_check = 1;
!  202		      !    /* strictly speaking this is not a wise way to do this */
!  203		      !    uint8_t endian_flag = (*(uint8_t*)&end_check == 1) ? 0 : 16;
!  205		      !    /*
!  206		      !     * uint32_t mandel_val[VBOX_REAL_COUNT][VBOX_IMAG_COUNT][VBOX_SAMPLE_REAL][VB
!  206		      >OX_SAMPLE_IMAG];
!  207		      !     */
!  208		      !    uint32_t num_elements =  VBOX_SAMPLE_REAL * VBOX_SAMPLE_IMAG
!  209		      !                           * VBOX_REAL_COUNT  * VBOX_IMAG_COUNT;

/* 0x0040	 209 */		sethi	%hi(0x100000),%l6
/* 0x0044	  75 */		mov	%i0,%i5
/* 0x0048	 160 */		ldd	[%i3+8],%f34
/* 0x004c	 156 */		ldd	[%i3],%f32
/* 0x0050	 157 */		std	%f32,[%sp+2919]
/* 0x0054	 156 */		std	%f32,[%sp+2911]
/* 0x0058	 160 */		fnegd	%f34,%f32
/* 0x005c	 161 */		std	%f32,[%sp+2767]
/* 0x0060	 177 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0064	 160 */		std	%f32,[%sp+2759]

!  211		      !    uint32_t *mandel_val = calloc((size_t)num_elements, sizeof(uint32_t));

/* 0x0068	 211 */		mov	%i2,%o0
/* 0x006c	     */		call	malloc	!params=  %o0	!result=  %o0
/* 0x0070	 209 */		st	%l6,[%sp+2267]
/* 0x0074	 211 */		brz,pn	%o0,.L77003036
/* 0x0078	 261 */		mov	%i2,%o2

!  213		      !    if ( mandel_val == NULL ) {
!  214		      !        /* really? possible ENOMEM? */
!  215		      !        if ( errno == ENOMEM ) {
!  216		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, _
!  216		      >_LINE__ );
!  217		      !        } else {
!  218		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ )
!  218		      >;
!  219		      !        }
!  220		      !        perror("FAIL ");
!  221		      !        /* NOTE : it is very nasty to bail out this way
!  222		      !         *        but why bother to continue ?
!  223		      !         */
!  224		      !        return EXIT_FAILURE;
!  225		      !    }
!  227		      !    /* memset(&mandel_val, 0x00,(size_t)num_elements * sizeof(uint32_t)); */
!  229		      !    double *coord_r = calloc((size_t)num_elements, sizeof(double));
!  231		      !    if ( coord_r == NULL ) {
!  232		      !        if ( errno == ENOMEM ) {
!  233		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, _
!  233		      >_LINE__ );
!  234		      !        } else {
!  235		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ )
!  235		      >;
!  236		      !        }
!  237		      !        perror("FAIL ");
!  238		      !        free(mandel_val);
!  239		      !        mandel_val = NULL;
!  240		      !        return EXIT_FAILURE;
!  241		      !    }
!  244		      !    double *coord_j = calloc((size_t)num_elements, sizeof(double));
!  246		      !    if ( coord_j == NULL ) {
!  247		      !        if ( errno == ENOMEM ) {
!  248		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, _
!  248		      >_LINE__ );
!  249		      !        } else {
!  250		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ )
!  250		      >;
!  251		      !        }
!  252		      !        perror("FAIL ");
!  253		      !        free(mandel_val);
!  254		      !        mandel_val = NULL;
!  255		      !        free(coord_r);
!  256		      !        coord_r = NULL;
!  257		      !        return EXIT_FAILURE;
!  258		      !    }
!  260		      !    /* pre-fill the lsd trippy color map */
!  261		      !    for ( k=0; k<256; k++ ) {

                       
! predecessor blocks: .L900000686

			.L77003034:
/* 0x007c	 261 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0080	     */		mov	0,%o1

! Registers live out of .L77003034: 
! g2 g3 o0 sp l4 l6 i0 i1 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003034 .L900000686

			.L77003036:
/* 0x0084	 213 */		brz,pn	%o0,.L77001893
/* 0x0088	   0 */		sethi	%hi(0x800000),%l7

! Registers live out of .L77003036: 
! g2 g3 o0 sp l4 l6 l7 i0 i1 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003036

			.L77003040:
/* 0x008c	 261 */		stx	%o0,[%sp+2407]
/* 0x0090	 213 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x0094	     */		mov	%l7,%o0
/* 0x0098	     */		brz,pn	%o0,.L77003042
/* 0x009c	     */		mov	%l7,%o2

! Registers live out of .L77003040: 
! g2 g3 o0 o1 o2 sp l4 l6 l7 i0 i1 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003040

			.L77003041:
/* 0x00a0	 213 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x00a4	     */		mov	0,%o1

! Registers live out of .L77003041: 
! g2 g3 o0 sp l4 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003040

			.L77003042:
/* 0x00a8	 213 */		mov	%o0,%i2

! Registers live out of .L77003042: 
! g2 g3 o0 sp l4 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003041 .L77003042

			.L77003043:
/* 0x00ac	 231 */		brz,pn	%i2,.L77001903
/* 0x00b0	     */		nop

! Registers live out of .L77003043: 
! g2 g3 o0 sp l4 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003043

			.L77003047:
/* 0x00b4	 231 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x00b8	     */		mov	%l7,%o0
/* 0x00bc	     */		brz,pn	%o0,.L77003050
/* 0x00c0	     */		mov	%l7,%o2

! Registers live out of .L77003047: 
! g2 g3 o0 o1 o2 sp l4 l6 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003047

			.L77003048:
/* 0x00c4	 231 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x00c8	     */		mov	0,%o1

! Registers live out of .L77003048: 
! g2 g3 o0 sp l4 l6 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003047 .L77003048

			.L77003050:
/* 0x00cc	 246 */		brz,pn	%o0,.L77001913
/* 0x00d0	 261 */		sethi	%hi(0x1400),%i0

! Registers live out of .L77003050: 
! g2 g3 o0 sp l4 l6 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003050

			.L77001921:
/* 0x00d4	 231 */		stx	%o0,[%sp+2639]
/* 0x00d8	 261 */		mov	0,%i4
/* 0x00dc	     */		add	%i0,71,%i0

!  262		      !        lsd_trippy[k] = mandle_col((uint8_t)k);

/* 0x00e0	 262 */		mov	0,%o0
/* 0x00e4	 261 */		add	%i0,%sp,%i0
/* 0x00e8	 262 */		prefetch	[%i0+256],3
/* 0x00ec	     */		prefetch	[%i0+512],3
/* 0x00f0	     */		prefetch	[%i0+768],3
/* 0x00f4	     */		prefetch	[%i0+1024],3

! Registers live out of .L77001921: 
! g2 g3 o0 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001921 .L900000788

			.L900000788:
/* 0x00f8	 262 */		call	mandle_col	!params=  %o0	!result=  %o0
/* 0x00fc	 261 */		add	%i4,1,%i4
/* 0x0100	 262 */		stx	%o0,[%i0]
/* 0x0104	     */		prefetch	[%i0+1280],3
/* 0x0108	 261 */		add	%i0,8,%i0
/* 0x010c	     */		cmp	%i4,255
/* 0x0110	     */		ble,pt	%icc,.L900000788
/* 0x0114	 262 */		and	%i4,255,%o0

! Registers live out of .L900000788: 
! g2 g3 o0 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		
!  263		      !    }
!  265		      !    /* count some mouse events */
!  266		      !    left_count = 0;
!  267		      !    mid_count = 0;
!  268		      !    right_count = 0;
!  269		      !    roll_up = 0;
!  270		      !    roll_dn = 0;
!  272		      !    int candidate_int = 0;
!  273		      !    long long unsigned int candidate_magnify = 0;
!  275		      !    /* the janky slider for magnify shall be a trivial
!  276		      !     * position that gets mapped to a binary logarithmic
!  277		      !     * scale from 2^(-10) to 2^(10) and thus we need
!  278		      !     * no more than 21 possible values. The initial
!  279		      !     * value shall be 2^0 == 1 as a factor and that
!  280		      !     * must map to positive 10 on the scale. */
!  281		      !    uint8_t magnify_jank_in, magnify_jank = 10;
!  282		      !    double magnify_factor = 1.0;

                       
! predecessor blocks: .L900000788

			.L77001929:
/* 0x0118	 282 */		ldd	[%i3+16],%f0
/* 0x011c	     */		std	%f0,[%sp+2663]

!  284		      !    /* the janky slider for bail_out will be nearly
!  285		      !     * identical to the magnify except that we will
!  286		      !     * trap for stupid bail_out values */
!  287		      !    uint8_t bail_out_jank_in, bail_out_jank = 10;
!  288		      !    double bail_out_factor = 1.0;
!  290		      !    double candidate_double = 0.0;
!  291		      !    int fpe_raised = 0;
!  292		      !    uint32_t mand_height, mand_bail;
!  293		      !    uint32_t sub_pixel_mand_height;
!  295		      !    int mand_x_pix, mand_y_pix;
!  297		      !    /* These are the initial values within the viewport.
!  298		      !     * They have the domain  -1.0 < win_r < +1.0 and
!  299		      !     * also the same for win_j. */
!  300		      !    double win_r, win_j;
!  301		      !    /* general purpose fp64 coordinates to toss around */
!  302		      !    fp64 coord;
!  304		      !    /* small general purpose char buffer */
!  305		      !    char *buf = calloc((size_t)128,sizeof(unsigned char));

/* 0x0120	 305 */		mov	128,%o0
/* 0x0124	 273 */		stx	%g0,[%sp+2951]
/* 0x0128	 305 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x012c	     */		std	%f0,[%sp+2775]
/* 0x0130	     */		brz,a,pt	%o0,.L77003057
/* 0x0134	     */		ldd	[%sp+2775],%f0

! Registers live out of .L77001929: 
! g2 g3 o0 o1 sp l6 i0 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001929

			.L900000130:
/* 0x0138	 246 */		mov	128,%o2
/* 0x013c	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0140	     */		mov	0,%o1
/* 0x0144	     */		ldd	[%sp+2775],%f0

! Registers live out of .L900000130: 
! g2 g3 o0 sp l6 i0 i1 i2 i3 i5 fp gsr 
! f0 f1 
		
!  307		      !    if ( buf == NULL ) {

                       
! predecessor blocks: .L77001929 .L900000130

			.L77003057:
/* 0x0148	 307 */		brz,pn	%o0,.L77001931
/* 0x014c	   0 */		sethi	%gdop_hix22(.L48),%o1

! Registers live out of .L77003057: 
! g2 g3 o0 o1 sp l6 i0 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003057

			.L77001939:
/* 0x0150	 246 */		stx	%o0,[%sp+2647]

!  308		      !        if ( errno == ENOMEM ) {
!  309		      !            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, _
!  309		      >_LINE__ );
!  310		      !        } else {
!  311		      !            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ )
!  311		      >;
!  312		      !        }
!  313		      !        perror("FAIL ");
!  314		      !        free(mandel_val);
!  315		      !        mandel_val = NULL;
!  316		      !        free(coord_r);
!  317		      !        coord_r = NULL;
!  318		      !        free(coord_j);
!  319		      !        coord_j = NULL;
!  320		      !        return EXIT_FAILURE;
!  321		      !    }
!  323		      !    char *disp_name = NULL;
!  325		      !    /* I am not checking the status of the setlocale call here
!  326		      !     * because it had better be impossible to fail for a "C"
!  327		      !     * or POSIX locale :
!  328		      !     *
!  329		      !     * RETURN VALUES
!  330		      !     *     Upon successful completion, setlocale() returns the string
!  331		      !     *     associated with the specified category for the requested
!  332		      !     *     locale.  The setlocale() function returns NULL and fails
!  333		      !     *     to change the locale if the given combination of category
!  334		      !     *     and locale makes no sense.
!  335		      !     */
!  336		      !    setlocale(LC_ALL, "C");

/* 0x0154	 336 */		mov	6,%o0
/* 0x0158	   0 */		xor	%o1,%gdop_lox10(.L48),%o5
/* 0x015c	   0 */		ldx	[%sp+2399],%o1
/* 0x0160	 336 */		std	%f0,[%sp+2775]
/* 0x0164	   0 */		ldx	[%o1+%o5],%i4,%gdop(.L48)
/* 0x0168	 336 */		call	setlocale	!params=  %o0 %o1	!result= 
/* 0x016c	     */		mov	%i4,%o1

!  338		      !    int status = setenv("TZ", "GMT0", 1);

/* 0x0170	 338 */		mov	1,%o2
/* 0x0174	     */		add	%i4,6,%o1
/* 0x0178	     */		call	setenv	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x017c	     */		add	%i4,2,%o0
/* 0x0180	     */		orcc	%g0,%o0,%g0

!  339		      !    if ( status < 0 ) {

/* 0x0184	 339 */		bge,pn	%icc,.L77001943
/* 0x0188	 340 */		sethi	%gdop_hix22(__iob),%g5

! Registers live out of .L77001939: 
! g2 g3 g5 o0 sp l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		
!  340		      !        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");

                       
! predecessor blocks: .L77001939

			.L77001941:
/* 0x018c	 340 */		ldx	[%sp+2399],%o7
/* 0x0190	     */		xor	%g5,%gdop_lox10(__iob),%i5
/* 0x0194	     */		add	%i4,12,%o1
/* 0x0198	     */		ldx	[%o7+%i5],%o3,%gdop(__iob)
/* 0x019c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x01a0	     */		add	%o3,256,%o0
/* 0x01a4	 442 */		return	%i7+8	! Result =  %i0
/* 0x01a8	     */		mov	1,%o0

!  341		      !        return EXIT_FAILURE;
!  342		      !    }
!  344		      !    /* Get the REALTIME_CLOCK time in a timespec struct */
!  345		      !    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {

                       
! predecessor blocks: .L77001939

			.L77001943:
/* 0x01ac	 345 */		add	%sp,2927,%o1
/* 0x01b0	     */		call	clock_gettime	!params=  %o0 %o1	!result=  %o0
/* 0x01b4	     */		mov	3,%o0
/* 0x01b8	     */		cmp	%o0,-1
/* 0x01bc	     */		bne,pn	%icc,.L77001947
/* 0x01c0	 347 */		add	%i4,52,%o1

! Registers live out of .L77001943: 
! g2 g3 o0 o1 sp l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		
!  346		      !        /* We could not get the clock. Bail out. */
!  347		      !        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");

                       
! predecessor blocks: .L77001943

			.L77001945:
/* 0x01c4	 347 */		ldx	[%sp+2399],%i3
/* 0x01c8	     */		sethi	%gdop_hix22(__iob),%i1
/* 0x01cc	     */		xor	%i1,%gdop_lox10(__iob),%l4
/* 0x01d0	     */		ldx	[%i3+%l4],%l3,%gdop(__iob)
/* 0x01d4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x01d8	     */		add	%l3,256,%o0
/* 0x01dc	 442 */		return	%i7+8	! Result =  %i0
/* 0x01e0	     */		mov	1,%o0

!  348		      !        return EXIT_FAILURE;
!  349		      !    } else {
!  350		      !        /* call srand48() with the sub-second time data */
!  351		      !        srand48( (long) now_time.tv_nsec );

                       
! predecessor blocks: .L77001943

			.L77001947:
/* 0x01e4	 351 */		call	srand48	!params=  %o0	!result= 
/* 0x01e8	     */		ldx	[%sp+2935],%o0

!  352		      !    }
!  353		      !    sysinfo(VERBOSE);

/* 0x01ec	 353 */		call	sysinfo	!params=  %o0	!result= 
/* 0x01f0	     */		mov	1,%o0

!  355		      !    printf("\n\n--------- _XOPEN_SOURCE 600 -------\n");

/* 0x01f4	 355 */		call	printf	!params=  %o0	!result= 
/* 0x01f8	     */		add	%i4,100,%o0

!  356		      !    printf("_POSIX_CHILD_MAX   = %i\n", _POSIX_CHILD_MAX);

/* 0x01fc	 356 */		mov	25,%o1
/* 0x0200	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0204	     */		add	%i4,140,%o0

!  357		      !    printf("_POSIX_NGROUPS_MAX = %i\n", _POSIX_NGROUPS_MAX);

/* 0x0208	 357 */		mov	8,%o1
/* 0x020c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0210	     */		add	%i4,172,%o0

!  358		      !    printf("_POSIX_OPEN_MAX    = %i\n", _POSIX_OPEN_MAX);

/* 0x0214	 358 */		mov	20,%o1
/* 0x0218	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x021c	     */		add	%i4,204,%o0

!  359		      !    printf("_POSIX_PATH_MAX    = %i\n", _POSIX_PATH_MAX);

/* 0x0220	 359 */		mov	256,%o1
/* 0x0224	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0228	     */		add	%i4,236,%o0

!  360		      !    printf("_POSIX_TZNAME_MAX  = %i\n", _POSIX_TZNAME_MAX);

/* 0x022c	 360 */		mov	6,%o1
/* 0x0230	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0234	     */		add	%i4,268,%o0

!  361		      !    printf("---------------------------------------\n");

/* 0x0238	 361 */		call	printf	!params=  %o0	!result= 
/* 0x023c	     */		add	%i4,300,%o0

!  363		      !#ifdef FLT_EVAL_METHOD
!  364		      !    printf("FLT_EVAL_METHOD    = %i\n", FLT_EVAL_METHOD);
!  365		      !#endif
!  367		      !    /* these two calls are silly and not of much value other than
!  368		      !     * to determine the speed of the clock_gettime() call. Which
!  369		      !     * we don't care much about as it had better be a microsecond. */
!  370		      !    clock_gettime(CLOCK_REALTIME, &soln_t0 );

/* 0x0240	 370 */		add	%sp,2463,%o1
/* 0x0244	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x0248	     */		mov	3,%o0

!  371		      !    clock_gettime(CLOCK_REALTIME, &soln_t1 );

/* 0x024c	 371 */		add	%sp,2495,%o1
/* 0x0250	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x0254	     */		mov	3,%o0

!  372		      !    t_delta = timediff( soln_t0, soln_t1 );

/* 0x0258	 372 */		ldx	[%sp+2463],%o0
/* 0x025c	     */		ldx	[%sp+2471],%o1
/* 0x0260	     */		ldx	[%sp+2495],%o2
/* 0x0264	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x0268	     */		ldx	[%sp+2503],%o3
/* 0x026c	     */		mov	%o0,%o1

!  373		      !    /* this t_delta is a baseline offset value that we seem to ignore
!  374		      !     * anyways. */
!  375		      !    printf("INFO : baseline tdelta = %14" PRIu64 " nsec\n", t_delta);

/* 0x0270	 375 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0274	     */		add	%i4,348,%o0

!  377		      !    errno = 0;

/* 0x0278	 377 */		call	___errno	!params= 	!result=  %o0
/* 0x027c	     */		nop

!  378		      !    if ( ( argc < 6 ) && ( argc > 1 ) ) {

/* 0x0280	 378 */		add	%i5,-2,%o7
/* 0x0284	     */		cmp	%o7,4
/* 0x0288	     */		bcc,pn	%icc,.L77001953
/* 0x028c	 377 */		st	%g0,[%o0]

! Registers live out of .L77001947: 
! g2 g3 o0 sp l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001947

			.L77001951:
/* 0x0290	   0 */		ldx	[%sp+2399],%o2
/* 0x0294	   0 */		sethi	%gdop_hix22(__iob),%i2

!  379		      !        fprintf(stderr,"FAIL : insufficient arguments provided\n");

/* 0x0298	 379 */		add	%i4,388,%o1
/* 0x029c	   0 */		xor	%i2,%gdop_lox10(__iob),%g1
/* 0x02a0	   0 */		ldx	[%o2+%g1],%o2,%gdop(__iob)
/* 0x02a4	   0 */		add	%o2,256,%l2
/* 0x02a8	 379 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02ac	     */		mov	%l2,%o0

!  380		      !        fprintf(stderr,"     : usage %s bail_out_integer \\\n",argv[0]);

/* 0x02b0	 380 */		add	%i4,428,%o1
/* 0x02b4	     */		ldx	[%i1],%o2
/* 0x02b8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x02bc	     */		mov	%l2,%o0

!  381		      !        fprintf(stderr,"     :          magnify_integer \\\n");

/* 0x02c0	 381 */		add	%i4,468,%o1
/* 0x02c4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02c8	     */		mov	%l2,%o0

!  382		      !        fprintf(stderr,"     :          double_real \\\n");

/* 0x02cc	 382 */		add	%i4,508,%o1
/* 0x02d0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02d4	     */		mov	%l2,%o0

!  383		      !        fprintf(stderr,"     :          double_imaginary\\\n");

/* 0x02d8	 383 */		add	%i4,540,%o1
/* 0x02dc	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02e0	     */		mov	%l2,%o0

!  384		      !        fprintf(stderr,"     :          pthread_count\n");

/* 0x02e4	 384 */		add	%i4,580,%o1
/* 0x02e8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02ec	     */		mov	%l2,%o0

!  385		      !        fprintf(stderr,"     : quitting.\n");

/* 0x02f0	 385 */		add	%i4,612,%o1
/* 0x02f4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x02f8	     */		mov	%l2,%o0
/* 0x02fc	 442 */		return	%i7+8	! Result =  %i0
/* 0x0300	     */		mov	1,%o0
                       
! predecessor blocks: .L77001947

			.L77001953:
/* 0x0304	   0 */		ldx	[%sp+2399],%o3
/* 0x0308	   0 */		sethi	%gdop_hix22(__iob),%i0

!  386		      !        return EXIT_FAILURE;
!  387		      !    } else if ( argc >= 6 ) {

/* 0x030c	 387 */		cmp	%i5,6
/* 0x0310	   0 */		xor	%i0,%gdop_lox10(__iob),%l5
/* 0x0314	   0 */		ldx	[%o3+%l5],%l7,%gdop(__iob)
/* 0x0318	 387 */		bge,pn	%icc,.L77001955
/* 0x031c	   0 */		add	%l7,256,%l4

! Registers live out of .L77001953: 
! g2 g3 o0 sp l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001953

			.L77002153:
/* 0x0320	 140 */		mov	1,%o7
/* 0x0324	     */		st	%o7,[%sp+2275]

!  388		      !        errno = 0;
!  389		      !        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
!  390		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  391		      !            fprintf(stderr,"FAIL : bail_out_integer not understood\n");
!  392		      !            perror("     ");
!  393		      !            return EXIT_FAILURE;
!  394		      !        }
!  395		      !        if ( ( candidate_int < 256 ) || ( candidate_int > 134217728 ) ){
!  396		      !            fprintf(stderr,"WARN : mandlebrot bail out is unreasonable\n");
!  397		      !            fprintf(stderr,"     : we shall assume 4096 and proceed.\n");
!  398		      !            mand_bail = (uint32_t)4096;
!  399		      !        } else {
!  400		      !            mand_bail = (uint32_t)candidate_int;
!  401		      !        }
!  403		      !        errno = 0;
!  404		      !        if ( sscanf( argv[2], "%lld", &candidate_magnify ) == 0 ) {
!  405		      !            fprintf(stderr,"INFO : magnify not understood as long long int\n");
!  406		      !            if ( errno != 0 ) perror("dBUG ");
!  408		      !            /* note that we failed to process argv[2] as a unsigned long long
!  409		      !             * wherein we should have more than 32bits available. We may now
!  410		      !             * fall back to a trivial int type which should be only 32bits */
!  411		      !            errno = 0;
!  412		      !            candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
!  413		      !            if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  414		      !                fprintf(stderr,"FAIL : magnify_integer not understood\n");
!  415		      !                perror("     ");
!  416		      !                return EXIT_FAILURE;
!  417		      !            }
!  418		      !            if ( ( candidate_int < 1 ) || ( candidate_int > ( 1<<30 ) ) ){
!  419		      !                fprintf(stderr,"WARN : magnify_integer is unreasonable\n");
!  420		      !                fprintf(stderr,"     : we shall assume 1 and proceed.\n");
!  421		      !                magnify = 1.0;
!  422		      !            } else {
!  423		      !                magnify = (double)candidate_int;
!  424		      !            }
!  425		      !        } else {
!  426		      !            fprintf(stderr,"INFO : magnify accepted as long long int\n");
!  427		      !            magnify = (double)candidate_magnify;
!  428		      !        }
!  430		      !        errno = 0;
!  431		      !        feclearexcept(FE_ALL_EXCEPT);
!  432		      !        candidate_double = strtod(argv[3], (char **)NULL);
!  433		      !        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
!  434		      !        if (fpe_raised!=0){
!  435		      !            printf("INFO : FP Exception raised is");
!  436		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  437		      !            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
!  438		      !            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
!  439		      !            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
!  440		      !            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
!  441		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  442		      !            printf("\n");
!  443		      !        }
!  444		      !        if ( fpe_raised & FE_INEXACT ) {
!  445		      !            printf("real : Perfectly safe to ignore FE_INEXACT\n");
!  446		      !        }
!  447		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  448		      !            fprintf(stderr,"FAIL : double real coordinate not understood\n");
!  449		      !            perror("     ");
!  450		      !            return EXIT_FAILURE;
!  451		      !        }
!  452		      !        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
!  453		      !            fprintf(stderr,"FAIL : double real coordinate is not normal\n");
!  454		      !            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
!  455		      !            return EXIT_FAILURE;
!  456		      !        }
!  457		      !        feclearexcept(FE_ALL_EXCEPT);
!  458		      !        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
!  459		      !            fprintf(stderr,"WARN : double real coordinate is out of range\n");
!  460		      !            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
!  461		      !            fprintf(stderr,"     : we shall assume zero.\n");
!  462		      !            real_translate = 0.0;
!  463		      !        } else {
!  464		      !            real_translate = candidate_double;
!  465		      !        }
!  467		      !        errno = 0;
!  468		      !        feclearexcept(FE_ALL_EXCEPT);
!  469		      !        candidate_double = strtod(argv[4], (char **)NULL);
!  470		      !        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
!  471		      !        if (fpe_raised!=0){
!  472		      !            printf("INFO : FP Exception raised is");
!  473		      !            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
!  474		      !            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
!  475		      !            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
!  476		      !            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
!  477		      !            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
!  478		      !            printf("\n");
!  479		      !        }
!  480		      !        if ( fpe_raised & FE_INEXACT ) {
!  481		      !            printf("imag : Perfectly safe to ignore FE_INEXACT\n");
!  482		      !        }
!  483		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  484		      !            fprintf(stderr,"FAIL : double imaginary coordinate not understood\n")
!  484		      >;
!  485		      !            perror("     ");
!  486		      !            return EXIT_FAILURE;
!  487		      !        }
!  488		      !        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
!  489		      !            fprintf(stderr,"FAIL : double imaginary coordinate is not normal\n");
!  490		      !            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
!  491		      !            return EXIT_FAILURE;
!  492		      !        }
!  493		      !        feclearexcept(FE_ALL_EXCEPT);
!  494		      !        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
!  495		      !            fprintf(stderr,"WARN : double imaginary coordinate is out of range\n"
!  495		      >);
!  496		      !            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
!  497		      !            fprintf(stderr,"     : we shall assume zero.\n");
!  498		      !            imag_translate = 0.0;
!  499		      !        } else {
!  500		      !            imag_translate = candidate_double;
!  501		      !        }
!  503		      !        candidate_int = (int)strtol(argv[5], (char **)NULL, 10);
!  504		      !        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
!  505		      !            fprintf(stderr,"FAIL : pthread_limit not understood\n");
!  506		      !            perror("     ");
!  507		      !            return EXIT_FAILURE;
!  508		      !        }
!  509		      !        if ( ( candidate_int < 1 ) || ( candidate_int > 64 ) ){
!  510		      !            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
!  511		      !            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
!  512		      !            pthread_limit = 1;
!  513		      !        } else {
!  515		      !            if ( candidate_int > 1 ) {
!  517		      !                /* snazzy little bit shifting and counting follows
!  518		      !                 * where this is not at all efficient but is sort of
!  519		      !                 * fun */
!  521		      !                k = 0; /* number of '1' bits in candidate_int */
!  522		      !                j = candidate_int;
!  523		      !                p = 0; /* bit position being tested */
!  524		      !                while (j) {
!  525		      !                    if ( j & 1 ) { /* test the LSB position */
!  526		      !                        k += 1;    /* count the '1' bit */
!  527		      !                    }
!  528		      !                    j = j >> 1;    /* shift left */
!  529		      !                    p += 1;        /* keep track of the bit position */
!  530		      !                }
!  531		      !                if ( k > 1 ) {
!  532		      !                    fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
!  533		      !                    fprintf(stderr,"     : power of two. We shall assume\n");
!  534		      !                    pthread_limit = 1 << ( p - 1 );
!  535		      !                    fprintf(stderr,"     : %i POSIX thread(s).\n", pthread_limit)
!  535		      >;
!  536		      !                } else {
!  537		      !                    pthread_limit = candidate_int;
!  538		      !                }
!  540		      !            } else {
!  541		      !                pthread_limit = 1;
!  542		      !            }
!  543		      !        }
!  545		      !    } else {
!  546		      !        fprintf(stderr,"WARN : No arguments received thus we have\n");

/* 0x0328	 546 */		add	%i4,1812,%o1
/* 0x032c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0330	     */		mov	%l4,%o0

!  547		      !        fprintf(stderr,"     : some hard coded values ... enjoy.\n");

/* 0x0334	 547 */		add	%i4,1860,%o1
/* 0x0338	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x033c	     */		mov	%l4,%o0

!  548		      !        mand_bail = DEFAULT_BAILOUT;
!  549		      !        magnify = DEFAULT_MAGNIFY;

/* 0x0340	 549 */		ldx	[%sp+2399],%g1
/* 0x0344	     */		sethi	%gdop_hix22(.L___const_seg_900000101),%g5

!  550		      !        real_translate = DEFAULT_REAL_CENTRE;
!  551		      !        imag_translate = DEFAULT_IMAG_CENTRE;

/* 0x0348	 551 */		stx	%g0,[%sp+2735]
/* 0x034c	 550 */		stx	%g0,[%sp+2727]
/* 0x0350	 548 */		sethi	%hi(0x1000),%o0
/* 0x0354	 549 */		xor	%g5,%gdop_lox10(.L___const_seg_900000101),%o1
/* 0x0358	 548 */		st	%o0,[%sp+2271]
/* 0x035c	 549 */		ldx	[%g1+%o1],%i5,%gdop(.L___const_seg_900000101)
/* 0x0360	     */		ldd	[%i5+16],%f32
/* 0x0364	     */		std	%f32,[%sp+2655]
/* 0x0368	 551 */		ba	.L900000774

!  552		      !    }
!  554		      !    printf("\n    mand_bail = %i\n", mand_bail);

/* 0x036c	 554 */		nop

! Registers live out of .L77002153: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77001953

			.L77001955:
/* 0x0370	 388 */		call	___errno	!params= 	!result=  %o0
/* 0x0374	   0 */		add	%l7,256,%i5
/* 0x0378	 389 */		mov	10,%o2
/* 0x037c	 388 */		st	%g0,[%o0]
/* 0x0380	 389 */		mov	0,%o1
/* 0x0384	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0388	     */		ldx	[%i1+8],%o0
/* 0x038c	 390 */		call	___errno	!params= 	!result=  %o0
/* 0x0390	 389 */		mov	%o0,%i3
/* 0x0394	 390 */		ld	[%o0],%g4
/* 0x0398	     */		cmp	%g4,34
/* 0x039c	     */		be,pn	%icc,.L77001961
/* 0x03a0	     */		nop

! Registers live out of .L77001955: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001955

			.L77001957:
/* 0x03a4	 390 */		call	___errno	!params= 	!result=  %o0
/* 0x03a8	     */		nop
/* 0x03ac	     */		ld	[%o0],%o4
/* 0x03b0	     */		cmp	%o4,22
/* 0x03b4	     */		be,pn	%icc,.L77001961
/* 0x03b8	 395 */		prefetch	[%i1+16],0

! Registers live out of .L77001957: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001957

			.L77001963:
/* 0x03bc	 395 */		sethi	%hi(0x7fffc00),%l4
/* 0x03c0	     */		add	%i3,-256,%o0
/* 0x03c4	     */		add	%l4,768,%l3
/* 0x03c8	     */		cmp	%o0,%l3
/* 0x03cc	     */		bleu,pn	%icc,.L77001971
/* 0x03d0	 396 */		add	%i4,684,%o1

! Registers live out of .L77001963: 
! g2 g3 o0 o1 sp l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001963

			.L77001969:
/* 0x03d4	 396 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x03d8	     */		mov	%i5,%o0
/* 0x03dc	 397 */		add	%i4,732,%o1
/* 0x03e0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x03e4	     */		mov	%i5,%o0
/* 0x03e8	 398 */		ldd	[%sp+2775],%f0
/* 0x03ec	     */		sethi	%hi(0x1000),%o7
/* 0x03f0	     */		ba	.L77001973
/* 0x03f4	     */		st	%o7,[%sp+2271]

! Registers live out of .L77001969: 
! g2 g3 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001963

			.L77001971:
/* 0x03f8	 390 */		ldd	[%sp+2775],%f0
/* 0x03fc	 400 */		st	%i3,[%sp+2271]

! Registers live out of .L77001971: 
! g2 g3 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001969 .L77001971

			.L77001973:
/* 0x0400	 403 */		call	___errno	!params= 	!result=  %o0
/* 0x0404	     */		std	%f0,[%sp+2775]
/* 0x0408	     */		st	%g0,[%o0]
/* 0x040c	 404 */		add	%i4,774,%o1
/* 0x0410	     */		ldx	[%i1+16],%o0
/* 0x0414	     */		call	sscanf	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0418	     */		add	%sp,2951,%o2
/* 0x041c	     */		orcc	%g0,%o0,%g0
/* 0x0420	     */		bne,pn	%icc,.L77001999
/* 0x0424	 405 */		add	%i4,780,%o1

! Registers live out of .L77001973: 
! g2 g3 o0 o1 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001973

			.L77001975:
/* 0x0428	 405 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x042c	     */		mov	%i5,%o0
/* 0x0430	 406 */		call	___errno	!params= 	!result=  %o0
/* 0x0434	     */		nop
/* 0x0438	     */		ld	[%o0],%l2
/* 0x043c	     */		cmp	%l2,0
/* 0x0440	     */		bne,pn	%icc,.L77001977
/* 0x0444	     */		nop

! Registers live out of .L77001975: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001975

			.L77001979:
/* 0x0448	 406 */		ldd	[%sp+2775],%f0
/* 0x044c	 411 */		std	%f0,[%sp+2775]

! Registers live out of .L77001979: 
! g2 g3 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001977 .L77001979

			.L900000692:
/* 0x0450	 411 */		call	___errno	!params= 	!result=  %o0
/* 0x0454	     */		nop
/* 0x0458	 412 */		mov	10,%o2
/* 0x045c	 411 */		st	%g0,[%o0]
/* 0x0460	 412 */		mov	0,%o1
/* 0x0464	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0468	     */		ldx	[%i1+16],%o0
/* 0x046c	 413 */		call	___errno	!params= 	!result=  %o0
/* 0x0470	 412 */		mov	%o0,%l7
/* 0x0474	 413 */		ld	[%o0],%l5
/* 0x0478	     */		cmp	%l5,34
/* 0x047c	     */		be,pn	%icc,.L77001985
/* 0x0480	     */		nop

! Registers live out of .L900000692: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000692

			.L77001981:
/* 0x0484	 413 */		call	___errno	!params= 	!result=  %o0
/* 0x0488	     */		nop
/* 0x048c	     */		ld	[%o0],%i0
/* 0x0490	     */		cmp	%i0,22
/* 0x0494	     */		be,pn	%icc,.L77001985
/* 0x0498	 418 */		prefetch	[%i1+24],0

! Registers live out of .L77001981: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001981

			.L77001987:
/* 0x049c	 418 */		sethi	%hi(0x3ffffc00),%o1
/* 0x04a0	     */		add	%l7,-1,%o5
/* 0x04a4	     */		add	%o1,1023,%o3
/* 0x04a8	     */		cmp	%o5,%o3
/* 0x04ac	     */		bleu,pn	%icc,.L77001995
/* 0x04b0	   0 */		sethi	%gdop_hix22(.L106),%o7

! Registers live out of .L77001987: 
! g2 g3 o1 sp o7 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001987

			.L77001993:
/* 0x04b4	   0 */		ldx	[%sp+2399],%l7
/* 0x04b8	   0 */		xor	%o7,%gdop_lox10(.L106),%l4
/* 0x04bc	 419 */		mov	%i5,%o0
/* 0x04c0	   0 */		ldx	[%l7+%l4],%l3,%gdop(.L106)
/* 0x04c4	 419 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x04c8	     */		mov	%l3,%o1
/* 0x04cc	 420 */		add	%l3,40,%o1
/* 0x04d0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x04d4	     */		mov	%i5,%o0
/* 0x04d8	 421 */		ldd	[%sp+2775],%f0
/* 0x04dc	     */		sethi	%gdop_hix22(.L___const_seg_900000101),%o0
/* 0x04e0	     */		xor	%o0,%gdop_lox10(.L___const_seg_900000101),%i5
/* 0x04e4	     */		ldx	[%l7+%i5],%g5,%gdop(.L___const_seg_900000101)
/* 0x04e8	     */		ldd	[%g5+16],%f32
/* 0x04ec	     */		ba	.L77002001
/* 0x04f0	     */		std	%f32,[%sp+2655]

! Registers live out of .L77001993: 
! g2 g3 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001987

			.L77001995:
/* 0x04f4	 423 */		st	%l7,[%fp+2023]
/* 0x04f8	     */		ld	[%fp+2023],%f10
/* 0x04fc	 413 */		ldd	[%sp+2775],%f0
/* 0x0500	 423 */		fitod	%f10,%f32
/* 0x0504	     */		ba	.L77002001
/* 0x0508	     */		std	%f32,[%sp+2655]

! Registers live out of .L77001995: 
! g2 g3 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001973

			.L77001999:
/* 0x050c	 426 */		ldx	[%sp+2399],%l4
/* 0x0510	     */		mov	%i5,%o0
/* 0x0514	     */		sethi	%gdop_hix22(.L110),%l5
/* 0x0518	     */		xor	%l5,%gdop_lox10(.L110),%l7
/* 0x051c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0520	     */		ldx	[%l4+%l7],%o1,%gdop(.L110)
/* 0x0524	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%g1
/* 0x0528	 427 */		ldd	[%sp+2951],%f2
/* 0x052c	   0 */		xor	%g1,%gdop_lox10(.L___const_seg_900000101),%o2
/* 0x0530	 427 */		ldd	[%sp+2775],%f0
/* 0x0534	     */		prefetch	[%i1+24],0
/* 0x0538	   0 */		ldx	[%l4+%o2],%l2,%gdop(.L___const_seg_900000101)
/* 0x053c	 427 */		fmovs	%f3,%f5
/* 0x0540	     */		fmovs	%f2,%f7
/* 0x0544	     */		ldd	[%l2+24],%f8
/* 0x0548	     */		ldd	[%l2+32],%f36
/* 0x054c	     */		fmovs	%f8,%f4
/* 0x0550	     */		fmovs	%f8,%f6
/* 0x0554	     */		fsubd	%f4,%f8,%f32
/* 0x0558	     */		fsubd	%f6,%f8,%f34
/* 0x055c	     */		fabsd	%f32,%f38
/* 0x0560	     */		fabsd	%f34,%f32
/* 0x0564	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x0568	     */		std	%f32,[%sp+2655]

! Registers live out of .L77001999: 
! g2 g3 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77001993 .L77001995 .L77001999

			.L77002001:
/* 0x056c	 430 */		call	___errno	!params= 	!result=  %o0
/* 0x0570	     */		std	%f0,[%sp+2775]
/* 0x0574	     */		st	%g0,[%o0]
/* 0x0578	 431 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x057c	     */		mov	31,%o0
/* 0x0580	 432 */		ldx	[%i1+24],%o0
/* 0x0584	     */		call	strtod	!params=  %o0 %o1	!result=  %f0 %f1
/* 0x0588	     */		mov	0,%o1
/* 0x058c	     */		std	%f0,[%sp+2959]
/* 0x0590	 433 */		call	fetestexcept	!params=  %o0	!result=  %o0
/* 0x0594	     */		mov	31,%o0
/* 0x0598	     */		ldd	[%sp+2775],%f0
/* 0x059c	     */		orcc	%g0,%o0,%l2
/* 0x05a0	 434 */		be,pn	%icc,.L77002033
/* 0x05a4	     */		nop

! Registers live out of .L77002001: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002001

			.L77002003:
/* 0x05a8	 435 */		call	printf	!params=  %o0	!result= 
/* 0x05ac	     */		add	%i4,1004,%o0
/* 0x05b0	 436 */		ldd	[%sp+2775],%f0
/* 0x05b4	     */		andcc	%l2,1,%i0
/* 0x05b8	     */		be,pn	%icc,.L900000787
/* 0x05bc	 437 */		andcc	%l2,2,%g0

! Registers live out of .L77002003: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002003

			.L77002005:
/* 0x05c0	 436 */		call	printf	!params=  %o0	!result= 
/* 0x05c4	     */		add	%i4,1036,%o0
/* 0x05c8	     */		ldd	[%sp+2775],%f0
/* 0x05cc	 437 */		andcc	%l2,2,%g0

! Registers live out of .L77002005: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002003 .L77002005

			.L900000787:
/* 0x05d0	 437 */		be,pn	%icc,.L900000786
/* 0x05d4	 438 */		andcc	%l2,4,%g0

! Registers live out of .L900000787: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000787

			.L77002009:
/* 0x05d8	 437 */		std	%f0,[%sp+2775]
/* 0x05dc	     */		call	printf	!params=  %o0	!result= 
/* 0x05e0	     */		add	%i4,1052,%o0
/* 0x05e4	     */		ldd	[%sp+2775],%f0
/* 0x05e8	 438 */		andcc	%l2,4,%g0

! Registers live out of .L77002009: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002009 .L900000787

			.L900000786:
/* 0x05ec	 438 */		be,pn	%icc,.L900000785
/* 0x05f0	 439 */		andcc	%l2,8,%g0

! Registers live out of .L900000786: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000786

			.L77002013:
/* 0x05f4	 438 */		std	%f0,[%sp+2775]
/* 0x05f8	     */		call	printf	!params=  %o0	!result= 
/* 0x05fc	     */		add	%i4,1068,%o0
/* 0x0600	     */		ldd	[%sp+2775],%f0
/* 0x0604	 439 */		andcc	%l2,8,%g0

! Registers live out of .L77002013: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002013 .L900000786

			.L900000785:
/* 0x0608	 439 */		be,pn	%icc,.L900000784
/* 0x060c	 440 */		andcc	%l2,16,%g0

! Registers live out of .L900000785: 
! g2 g3 o0 sp l2 l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000785

			.L77002017:
/* 0x0610	 439 */		std	%f0,[%sp+2775]
/* 0x0614	     */		call	printf	!params=  %o0	!result= 
/* 0x0618	     */		add	%i4,1084,%o0
/* 0x061c	     */		ldd	[%sp+2775],%f0
/* 0x0620	 440 */		andcc	%l2,16,%g0

! Registers live out of .L77002017: 
! g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002017 .L900000785

			.L900000784:
/* 0x0624	 440 */		be,pn	%icc,.L900000783
/* 0x0628	 441 */		cmp	%i0,0

! Registers live out of .L900000784: 
! g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000784

			.L77002021:
/* 0x062c	 440 */		std	%f0,[%sp+2775]
/* 0x0630	     */		call	printf	!params=  %o0	!result= 
/* 0x0634	     */		add	%i4,1100,%o0
/* 0x0638	     */		ldd	[%sp+2775],%f0
/* 0x063c	 441 */		cmp	%i0,0

! Registers live out of .L77002021: 
! g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002021 .L900000784

			.L900000783:
/* 0x0640	 441 */		be,pn	%icc,.L77003213
/* 0x0644	     */		std	%f0,[%sp+2775]

! Registers live out of .L900000783: 
! g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000783

			.L77002025:
/* 0x0648	 441 */		call	printf	!params=  %o0	!result= 
/* 0x064c	     */		add	%i4,1036,%o0
/* 0x0650	 442 */		call	printf	!params=  %o0	!result= 
/* 0x0654	     */		add	%i4,1112,%o0
/* 0x0658	 445 */		call	printf	!params=  %o0	!result= 
/* 0x065c	     */		add	%i4,1116,%o0
/* 0x0660	     */		ldd	[%sp+2775],%f0
/* 0x0664	     */		ba	.L77002033
/* 0x0668	     */		nop

! Registers live out of .L77002025: 
! g2 g3 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000783

			.L77003213:
/* 0x066c	 442 */		call	printf	!params=  %o0	!result= 
/* 0x0670	     */		add	%i4,1112,%o0
/* 0x0674	     */		ldd	[%sp+2775],%f0

! Registers live out of .L77003213: 
! g2 g3 sp l6 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002001 .L77002025 .L77003213

			.L77002033:
/* 0x0678	 447 */		call	___errno	!params= 	!result=  %o0
/* 0x067c	     */		std	%f0,[%sp+2775]
/* 0x0680	     */		ld	[%o0],%i3
/* 0x0684	     */		cmp	%i3,34
/* 0x0688	     */		be,pn	%icc,.L77002039
/* 0x068c	     */		nop

! Registers live out of .L77002033: 
! g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002033

			.L77002035:
/* 0x0690	 447 */		call	___errno	!params= 	!result=  %o0
/* 0x0694	     */		nop
/* 0x0698	     */		ld	[%o0],%g4
/* 0x069c	     */		cmp	%g4,22
/* 0x06a0	     */		be,pn	%icc,.L77002039
/* 0x06a4	 452 */		ld	[%sp+2959],%g1

! Registers live out of .L77002035: 
! g1 g2 g3 o0 sp l6 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002035

			.L77002041:
/* 0x06a8	 452 */		sethi	%hi(0x7ff00000),%i5
/* 0x06ac	     */		sethi	%hi(0x7fe00000),%l7
/* 0x06b0	     */		ldd	[%sp+2959],%f2
/* 0x06b4	     */		and	%g1,%i5,%o2
/* 0x06b8	     */		mov	%l7,%i3
/* 0x06bc	     */		sub	%o2,%l6,%l2
/* 0x06c0	     */		srl	%l2,0,%o7
/* 0x06c4	     */		sub	%o7,%l7,%l4
/* 0x06c8	     */		srlx	%l4,63,%o0
/* 0x06cc	     */		cmp	%o0,0
/* 0x06d0	     */		bne,pn	%icc,.L77002047
/* 0x06d4	     */		st	%f2,[%fp+2023]

! Registers live out of .L77002041: 
! g2 g3 o0 sp l4 l6 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77002041

			.L77002043:
/* 0x06d8	 452 */		fzero	%f32
/* 0x06dc	     */		fcmpd	%fcc0,%f2,%f32
/* 0x06e0	     */		fbe,pn	%fcc0,.L77002047
/* 0x06e4	   0 */		ldx	[%sp+2399],%o4

! Registers live out of .L77002043: 
! g2 g3 o0 o4 sp l4 l6 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002043

			.L77002045:
/* 0x06e8	   0 */		sethi	%gdop_hix22(__iob),%l6
/* 0x06ec	   0 */		sethi	%gdop_hix22(.L143),%i4
/* 0x06f0	   0 */		xor	%l6,%gdop_lox10(__iob),%i3
/* 0x06f4	   0 */		xor	%i4,%gdop_lox10(.L143),%i1
/* 0x06f8	   0 */		ldx	[%o4+%i1],%i0,%gdop(.L143)
/* 0x06fc	   0 */		ldx	[%o4+%i3],%i2,%gdop(__iob)
/* 0x0700	   0 */		add	%i2,256,%l5
/* 0x0704	 453 */		mov	%i0,%o1
/* 0x0708	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x070c	     */		mov	%l5,%o0
/* 0x0710	 454 */		ldx	[%sp+2959],%o2
/* 0x0714	     */		add	%i0,48,%o1
/* 0x0718	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x071c	     */		mov	%l5,%o0
/* 0x0720	 442 */		return	%i7+8	! Result =  %i0
/* 0x0724	     */		mov	1,%o0
                       
! predecessor blocks: .L77002041 .L77002043

			.L77002047:
/* 0x0728	   0 */		sethi	%gdop_hix22(.L131),%o1
/* 0x072c	   0 */		ldx	[%sp+2399],%i0
/* 0x0730	 457 */		mov	31,%o0
/* 0x0734	   0 */		xor	%o1,%gdop_lox10(.L131),%o3
/* 0x0738	 457 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x073c	   0 */		ldx	[%i0+%o3],%l4,%gdop(.L131)
/* 0x0740	 458 */		prefetch	[%i1+32],0
/* 0x0744	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%o5
/* 0x0748	   0 */		xor	%o5,%gdop_lox10(.L___const_seg_900000101),%o4
/* 0x074c	 458 */		ldd	[%sp+2959],%f34
/* 0x0750	   0 */		ldx	[%i0+%o4],%g4,%gdop(.L___const_seg_900000101)
/* 0x0754	 458 */		ldd	[%g4+40],%f32
/* 0x0758	     */		fnegd	%f32,%f32
/* 0x075c	     */		fcmped	%fcc1,%f34,%f32
/* 0x0760	     */		fbl,pn	%fcc1,.L77002053
/* 0x0764	     */		ldd	[%g4+40],%f32

! Registers live out of .L77002047: 
! g2 g3 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L77002047

			.L77002049:
/* 0x0768	 458 */		fcmped	%fcc2,%f34,%f32
/* 0x076c	     */		fbg,pn	%fcc2,.L77002053
/* 0x0770	     */		ldd	[%sp+2775],%f0

! Registers live out of .L77002049: 
! g2 g3 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 f34 
		                       
! predecessor blocks: .L77002049

			.L77002055:
/* 0x0774	 464 */		ba	.L77002057
/* 0x0778	     */		std	%f34,[%sp+2727]

! Registers live out of .L77002055: 
! g2 g3 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002047 .L77002049

			.L77002053:
/* 0x077c	   0 */		ldx	[%sp+2399],%g5
/* 0x0780	   0 */		sethi	%gdop_hix22(__iob),%o7
/* 0x0784	 459 */		add	%l4,180,%o1
/* 0x0788	   0 */		xor	%o7,%gdop_lox10(__iob),%o0
/* 0x078c	   0 */		ldx	[%g5+%o0],%g5,%gdop(__iob)
/* 0x0790	   0 */		add	%g5,256,%l3
/* 0x0794	 459 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0798	     */		mov	%l3,%o0
/* 0x079c	 460 */		ldx	[%sp+2959],%o2
/* 0x07a0	     */		add	%l4,228,%o1
/* 0x07a4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x07a8	     */		mov	%l3,%o0
/* 0x07ac	 461 */		mov	%l3,%o0
/* 0x07b0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x07b4	     */		add	%l4,260,%o1
/* 0x07b8	 462 */		ldd	[%sp+2775],%f0
/* 0x07bc	     */		stx	%g0,[%sp+2727]

! Registers live out of .L77002053: 
! g2 g3 sp l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002053 .L77002055

			.L77002057:
/* 0x07c0	 467 */		call	___errno	!params= 	!result=  %o0
/* 0x07c4	     */		std	%f0,[%sp+2775]
/* 0x07c8	     */		st	%g0,[%o0]
/* 0x07cc	 468 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x07d0	     */		mov	31,%o0
/* 0x07d4	 469 */		ldx	[%i1+32],%o0
/* 0x07d8	     */		call	strtod	!params=  %o0 %o1	!result=  %f0 %f1
/* 0x07dc	     */		mov	0,%o1
/* 0x07e0	     */		std	%f0,[%sp+2975]
/* 0x07e4	 470 */		call	fetestexcept	!params=  %o0	!result=  %o0
/* 0x07e8	     */		mov	31,%o0
/* 0x07ec	 471 */		ldd	[%sp+2775],%f0
/* 0x07f0	 470 */		orcc	%g0,%o0,%l7
/* 0x07f4	 471 */		be,pn	%icc,.L77002081
/* 0x07f8	     */		and	%o0,1,%l2

! Registers live out of .L77002057: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002057

			.L77002059:
/* 0x07fc	 472 */		call	printf	!params=  %o0	!result= 
/* 0x0800	     */		add	%l4,-108,%o0
/* 0x0804	 473 */		ldd	[%sp+2775],%f0
/* 0x0808	     */		cmp	%l2,0
/* 0x080c	     */		be,pn	%icc,.L900000782
/* 0x0810	 474 */		andcc	%l7,2,%g0

! Registers live out of .L77002059: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002059

			.L77002061:
/* 0x0814	 473 */		call	printf	!params=  %o0	!result= 
/* 0x0818	     */		add	%l4,-76,%o0
/* 0x081c	     */		ldd	[%sp+2775],%f0
/* 0x0820	 474 */		andcc	%l7,2,%g0

! Registers live out of .L77002061: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002059 .L77002061

			.L900000782:
/* 0x0824	 474 */		be,pn	%icc,.L900000781
/* 0x0828	 475 */		andcc	%l7,4,%g0

! Registers live out of .L900000782: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000782

			.L77002065:
/* 0x082c	 474 */		std	%f0,[%sp+2775]
/* 0x0830	     */		call	printf	!params=  %o0	!result= 
/* 0x0834	     */		add	%l4,-60,%o0
/* 0x0838	     */		ldd	[%sp+2775],%f0
/* 0x083c	 475 */		andcc	%l7,4,%g0

! Registers live out of .L77002065: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002065 .L900000782

			.L900000781:
/* 0x0840	 475 */		be,pn	%icc,.L900000780
/* 0x0844	 476 */		andcc	%l7,8,%g0

! Registers live out of .L900000781: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000781

			.L77002069:
/* 0x0848	 475 */		std	%f0,[%sp+2775]
/* 0x084c	     */		call	printf	!params=  %o0	!result= 
/* 0x0850	     */		add	%l4,-44,%o0
/* 0x0854	     */		ldd	[%sp+2775],%f0
/* 0x0858	 476 */		andcc	%l7,8,%g0

! Registers live out of .L77002069: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002069 .L900000781

			.L900000780:
/* 0x085c	 476 */		be,pn	%icc,.L900000779
/* 0x0860	 477 */		andcc	%l7,16,%g0

! Registers live out of .L900000780: 
! g2 g3 o0 sp l2 l4 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000780

			.L77002073:
/* 0x0864	 476 */		std	%f0,[%sp+2775]
/* 0x0868	     */		call	printf	!params=  %o0	!result= 
/* 0x086c	     */		add	%l4,-28,%o0
/* 0x0870	     */		ldd	[%sp+2775],%f0
/* 0x0874	 477 */		andcc	%l7,16,%g0

! Registers live out of .L77002073: 
! g2 g3 o0 sp l2 l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002073 .L900000780

			.L900000779:
/* 0x0878	 477 */		be,pn	%icc,.L900000778
/* 0x087c	 478 */		std	%f0,[%sp+2775]

! Registers live out of .L900000779: 
! g2 g3 o0 sp l2 l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000779

			.L77002077:
/* 0x0880	 477 */		call	printf	!params=  %o0	!result= 
/* 0x0884	     */		add	%l4,-12,%o0

! Registers live out of .L77002077: 
! g2 g3 o0 sp l2 l4 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002077 .L900000779

			.L900000778:
/* 0x0888	 478 */		call	printf	!params=  %o0	!result= 
/* 0x088c	     */		mov	%l4,%o0
/* 0x0890	     */		ldd	[%sp+2775],%f0

! Registers live out of .L900000778: 
! g2 g3 sp l2 l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002057 .L900000778

			.L77002081:
/* 0x0894	 480 */		cmp	%l2,0
/* 0x0898	     */		be,pn	%icc,.L77002085
/* 0x089c	 481 */		sethi	%gdop_hix22(.L167),%g1

! Registers live out of .L77002081: 
! g1 g2 g3 sp l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002081

			.L77002083:
/* 0x08a0	 481 */		ldx	[%sp+2399],%o0
/* 0x08a4	     */		xor	%g1,%gdop_lox10(.L167),%o2
/* 0x08a8	     */		std	%f0,[%sp+2775]
/* 0x08ac	     */		call	printf	!params=  %o0	!result= 
/* 0x08b0	     */		ldx	[%o0+%o2],%o0,%gdop(.L167)
/* 0x08b4	     */		ldd	[%sp+2775],%f0

! Registers live out of .L77002083: 
! g2 g3 sp l6 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002081 .L77002083

			.L77002085:
/* 0x08b8	 483 */		call	___errno	!params= 	!result=  %o0
/* 0x08bc	     */		std	%f0,[%sp+2775]
/* 0x08c0	     */		ld	[%o0],%l7
/* 0x08c4	     */		cmp	%l7,34
/* 0x08c8	     */		be,pn	%icc,.L77002091
/* 0x08cc	     */		nop

! Registers live out of .L77002085: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002085

			.L77002087:
/* 0x08d0	 483 */		call	___errno	!params= 	!result=  %o0
/* 0x08d4	     */		nop
/* 0x08d8	     */		ld	[%o0],%l5
/* 0x08dc	     */		cmp	%l5,22
/* 0x08e0	     */		be,pn	%icc,.L77002091
/* 0x08e4	 488 */		ld	[%sp+2975],%g5

! Registers live out of .L77002087: 
! g2 g3 g5 o0 sp l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002087

			.L77002093:
/* 0x08e8	 488 */		and	%g5,%i5,%o0
/* 0x08ec	     */		ldd	[%sp+2975],%f2
/* 0x08f0	     */		sub	%o0,%l6,%o1
/* 0x08f4	     */		srl	%o1,0,%i5
/* 0x08f8	     */		sub	%i5,%i3,%o3
/* 0x08fc	     */		srlx	%o3,63,%l2
/* 0x0900	     */		cmp	%l2,0
/* 0x0904	     */		bne,pn	%icc,.L77002099
/* 0x0908	     */		st	%f2,[%fp+2023]

! Registers live out of .L77002093: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77002093

			.L77002095:
/* 0x090c	 488 */		fzero	%f32
/* 0x0910	     */		fcmpd	%fcc3,%f2,%f32
/* 0x0914	     */		fbe,pn	%fcc3,.L77002099
/* 0x0918	   0 */		sethi	%gdop_hix22(__iob),%l6

! Registers live out of .L77002095: 
! g2 g3 o0 sp l6 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002095

			.L77002097:
/* 0x091c	   0 */		ldx	[%sp+2399],%g4
/* 0x0920	   0 */		sethi	%gdop_hix22(.L176),%l7
/* 0x0924	   0 */		xor	%l6,%gdop_lox10(__iob),%g1
/* 0x0928	   0 */		xor	%l7,%gdop_lox10(.L176),%o2
/* 0x092c	   0 */		ldx	[%g4+%g1],%o7,%gdop(__iob)
/* 0x0930	   0 */		ldx	[%g4+%o2],%i4,%gdop(.L176)
/* 0x0934	   0 */		add	%o7,256,%i1
/* 0x0938	 489 */		mov	%i4,%o1
/* 0x093c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0940	     */		mov	%i1,%o0
/* 0x0944	 490 */		ldx	[%sp+2975],%o2
/* 0x0948	     */		add	%i4,-248,%o1
/* 0x094c	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x0950	     */		mov	%i1,%o0
/* 0x0954	 442 */		return	%i7+8	! Result =  %i0
/* 0x0958	     */		mov	1,%o0
                       
! predecessor blocks: .L77002093 .L77002095

			.L77002099:
/* 0x095c	   0 */		ldx	[%sp+2399],%l5
/* 0x0960	   0 */		sethi	%gdop_hix22(.L207),%l3
/* 0x0964	   0 */		sethi	%gdop_hix22(__iob),%l2
/* 0x0968	   0 */		xor	%l3,%gdop_lox10(.L207),%o4
/* 0x096c	   0 */		xor	%l2,%gdop_lox10(__iob),%o5
/* 0x0970	 493 */		mov	31,%o0
/* 0x0974	   0 */		ldx	[%l5+%o5],%l4,%gdop(__iob)
/* 0x0978	   0 */		ldx	[%l5+%o4],%l2,%gdop(.L207)
/* 0x097c	 493 */		call	feclearexcept	!params=  %o0	!result= 
/* 0x0980	   0 */		add	%l4,256,%l3
/* 0x0984	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%g4
/* 0x0988	 494 */		ldd	[%sp+2975],%f34
/* 0x098c	   0 */		xor	%g4,%gdop_lox10(.L___const_seg_900000101),%i0
/* 0x0990	   0 */		ldx	[%l5+%i0],%l5,%gdop(.L___const_seg_900000101)
/* 0x0994	 494 */		ldd	[%l5+40],%f32
/* 0x0998	     */		fnegd	%f32,%f32
/* 0x099c	     */		fcmped	%fcc0,%f34,%f32
/* 0x09a0	     */		fbl,pn	%fcc0,.L77002105
/* 0x09a4	     */		ldd	[%l5+40],%f32

! Registers live out of .L77002099: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L77002099

			.L77002101:
/* 0x09a8	 494 */		fcmped	%fcc1,%f34,%f32
/* 0x09ac	     */		fbg,pn	%fcc1,.L77002105
/* 0x09b0	     */		ldd	[%sp+2775],%f0

! Registers live out of .L77002101: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 f34 
		                       
! predecessor blocks: .L77002101

			.L77002107:
/* 0x09b4	 500 */		std	%f34,[%sp+2735]
/* 0x09b8	     */		ba	.L900000777
/* 0x09bc	 503 */		std	%f0,[%sp+2775]

! Registers live out of .L77002107: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002099 .L77002101

			.L77002105:
/* 0x09c0	 495 */		add	%l2,-216,%o1
/* 0x09c4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x09c8	     */		mov	%l3,%o0
/* 0x09cc	 496 */		ldx	[%sp+2975],%o2
/* 0x09d0	     */		add	%l2,-440,%o1
/* 0x09d4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x09d8	     */		mov	%l3,%o0
/* 0x09dc	 497 */		add	%l2,-408,%o1
/* 0x09e0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x09e4	     */		mov	%l3,%o0
/* 0x09e8	 498 */		stx	%g0,[%sp+2735]

! Registers live out of .L77002105: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002105 .L77002107

			.L900000777:
/* 0x09ec	 503 */		mov	10,%o2
/* 0x09f0	     */		mov	0,%o1
/* 0x09f4	     */		call	strtol	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x09f8	     */		ldx	[%i1+40],%o0
/* 0x09fc	 504 */		call	___errno	!params= 	!result=  %o0
/* 0x0a00	 503 */		mov	%o0,%l5
/* 0x0a04	 504 */		ld	[%o0],%i3
/* 0x0a08	     */		cmp	%i3,34
/* 0x0a0c	     */		be,pn	%icc,.L77002115
/* 0x0a10	     */		nop

! Registers live out of .L900000777: 
! g2 g3 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000777

			.L77002111:
/* 0x0a14	 504 */		call	___errno	!params= 	!result=  %o0
/* 0x0a18	     */		nop
/* 0x0a1c	     */		ld	[%o0],%o3
/* 0x0a20	     */		cmp	%o3,22
/* 0x0a24	     */		be,pn	%icc,.L77002115
/* 0x0a28	 509 */		add	%l5,-1,%o7

! Registers live out of .L77002111: 
! g2 g3 o0 sp o7 l2 l5 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002111

			.L77002117:
/* 0x0a2c	 509 */		cmp	%o7,63
/* 0x0a30	     */		bleu,pn	%icc,.L77002125
/* 0x0a34	 140 */		mov	1,%o2

! Registers live out of .L77002117: 
! g2 g3 o0 o2 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002117

			.L77002123:
/* 0x0a38	 510 */		add	%l2,-120,%o1
/* 0x0a3c	 140 */		st	%o2,[%sp+2275]
/* 0x0a40	 510 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0a44	     */		mov	%l3,%o0
/* 0x0a48	 511 */		add	%l2,-864,%o1
/* 0x0a4c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0a50	     */		mov	%l3,%o0
/* 0x0a54	 512 */		ba	.L900000774
/* 0x0a58	 554 */		nop

! Registers live out of .L77002123: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002117

			.L77002125:
/* 0x0a5c	 504 */		ldd	[%sp+2775],%f0
/* 0x0a60	 515 */		cmp	%l5,1
/* 0x0a64	     */		bg,pn	%icc,.L900000776
/* 0x0a68	 521 */		mov	0,%l7

! Registers live out of .L77002125: 
! g2 g3 o0 sp l2 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002125

			.L77003378:
/* 0x0a6c	 140 */		mov	1,%l2
/* 0x0a70	     */		st	%l2,[%sp+2275]
/* 0x0a74	     */		ba	.L900000774
/* 0x0a78	 554 */		std	%f0,[%sp+2775]

! Registers live out of .L77003378: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002125

			.L900000776:
/* 0x0a7c	 522 */		mov	%l5,%g1
/* 0x0a80	 523 */		mov	0,%l4
/* 0x0a84	 525 */		and	%l5,1,%o2

! Registers live out of .L900000776: 
! g1 g2 g3 o0 o2 sp l2 l4 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002131 .L900000776

			.L900000775:
/* 0x0a88	 528 */		sra	%g1,1,%g1
/* 0x0a8c	 526 */		add	%l7,1,%o7
/* 0x0a90	   0 */		mov	%o2,%o1
/* 0x0a94	 526 */		movrnz	%o1,%o7,%l7
/* 0x0a98	 524 */		cmp	%g1,0
/* 0x0a9c	     */		be,pn	%icc,.L77002139
/* 0x0aa0	 529 */		add	%l4,1,%l4

! Registers live out of .L900000775: 
! g1 g2 g3 o0 sp l2 l4 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000775

			.L77002131:
/* 0x0aa4	 525 */		and	%g1,1,%o4
/* 0x0aa8	 528 */		sra	%g1,1,%g1
/* 0x0aac	 526 */		add	%l7,1,%g4
/* 0x0ab0	   0 */		mov	%o4,%i0
/* 0x0ab4	 529 */		add	%l4,1,%l4
/* 0x0ab8	 526 */		movrnz	%i0,%g4,%l7
/* 0x0abc	 524 */		cmp	%g1,0
/* 0x0ac0	     */		bne,pt	%icc,.L900000775
/* 0x0ac4	 525 */		and	%g1,1,%o2

! Registers live out of .L77002131: 
! g1 g2 g3 o0 o2 sp l2 l4 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002131 .L900000775

			.L77002139:
/* 0x0ac8	 531 */		cmp	%l7,1
/* 0x0acc	     */		ble,pn	%icc,.L77002143
/* 0x0ad0	 532 */		add	%l2,-80,%o1

! Registers live out of .L77002139: 
! g2 g3 o0 o1 sp l2 l4 l5 l7 i0 i1 i2 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002139

			.L77002141:
/* 0x0ad4	 532 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ad8	     */		mov	%l3,%o0
/* 0x0adc	 533 */		add	%l2,-40,%o1
/* 0x0ae0	 534 */		mov	1,%i3
/* 0x0ae4	 533 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ae8	     */		mov	%l3,%o0
/* 0x0aec	 534 */		add	%l4,-1,%o3
/* 0x0af0	 535 */		mov	%l2,%o1
/* 0x0af4	 534 */		sll	%i3,%o3,%o5
/* 0x0af8	 535 */		mov	%l3,%o0
/* 0x0afc	 534 */		st	%o5,[%sp+2275]
/* 0x0b00	 535 */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x0b04	     */		sra	%o5,0,%o2
/* 0x0b08	     */		ba	.L900000774
/* 0x0b0c	 554 */		nop

! Registers live out of .L77002141: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002139

			.L77002143:
/* 0x0b10	 537 */		st	%l5,[%sp+2275]
/* 0x0b14	 554 */		std	%f0,[%sp+2775]

! Registers live out of .L77002143: 
! g2 g3 o0 sp l7 i0 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002123 .L77002141 .L77002143 .L77002153 .L77003378

			.L900000774:
/* 0x0b18	 554 */		ld	[%sp+2271],%o1
/* 0x0b1c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0b20	     */		add	%i4,1908,%o0

!  555		      !    printf("pthread_limit = %i\n", pthread_limit);

/* 0x0b24	 555 */		add	%i4,1932,%o0
/* 0x0b28	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0b2c	     */		ldsw	[%sp+2275],%o1

!  557		      !    printf("    translate = ( %-+32.26e , %-+32.26e )\n",
!  558		      !                                      real_translate, imag_translate );

/* 0x0b30	 558 */		ldx	[%sp+2727],%o1
/* 0x0b34	     */		add	%i4,1956,%o0
/* 0x0b38	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0b3c	     */		ldx	[%sp+2735],%o2

!  560		      !    printf("      magnify = %-+32.26e\n\n", magnify );

/* 0x0b40	 560 */		add	%i4,2004,%o0
/* 0x0b44	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0b48	     */		ldx	[%sp+2655],%o1
/* 0x0b4c	     */		ldd	[%sp+2655],%f36

!  562		      !    /* TODO allow adjustment of these colourscheme values */
!  563		      !    gamma = 2.5;
!  564		      !    hue = 1.8;
!  565		      !    rotation = 5.0;
!  566		      !    shift = 1.0;
!  567		      !    t_param_exponent = 1.8;
!  569		      !    /* TODO perhaps use the terms real and imaginary for the
!  570		      !     * data axi and not just x and y. However x and y are nice
!  571		      !     * and short */
!  572		      !    obs_real = default_real / magnify;
!  573		      !    obs_imag = default_imag / magnify;

/* 0x0b50	 573 */		ldd	[%sp+2919],%f32
/* 0x0b54	 572 */		ldd	[%sp+2911],%f34

!  575		      !    width = WIN_WIDTH;
!  576		      !    height = WIN_HEIGHT;
!  577		      !    printf("\n X11 : ");

/* 0x0b58	 577 */		add	%i4,2032,%o0
/* 0x0b5c	 573 */		fdivd	%f32,%f36,%f32
/* 0x0b60	     */		std	%f32,[%sp+2751]
/* 0x0b64	 572 */		fdivd	%f34,%f36,%f32
/* 0x0b68	 577 */		call	printf	!params=  %o0	!result= 
/* 0x0b6c	 572 */		std	%f32,[%sp+2743]

!  578		      !    printf("default width=%4i height=%4i\n", width, height);

/* 0x0b70	 578 */		add	%i4,2044,%o0
/* 0x0b74	     */		mov	1044,%o2
/* 0x0b78	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0b7c	     */		mov	1044,%o1

!  580		      !    XSetErrorHandler(X_error_handler);

/* 0x0b80	 580 */		ldx	[%sp+2399],%o7
/* 0x0b84	     */		sethi	%gdop_hix22(X_error_handler),%o2
/* 0x0b88	     */		xor	%o2,%gdop_lox10(X_error_handler),%l5
/* 0x0b8c	     */		ldx	[%o7+%l5],%o0,%gdop(X_error_handler)
/* 0x0b90	     */		call	XSetErrorHandler	!params=  %o0	!result= 
/* 0x0b94	     */		nop

!  582		      !    /* should work with a null display name */
!  583		      !    dsp = XOpenDisplay(disp_name);

/* 0x0b98	 583 */		call	XOpenDisplay	!params=  %o0	!result=  %o0
/* 0x0b9c	     */		mov	0,%o0

!  584		      !    if (dsp == NULL) {

/* 0x0ba0	 584 */		brnz,pn	%o0,.L77002159
/* 0x0ba4	 586 */		add	%i4,2076,%o1

! Registers live out of .L900000774: 
! g2 g3 o0 o1 sp l7 i0 i1 i2 i4 fp gsr 
! 
		
!  585		      !        fprintf(stderr, "%s: no X server?? '%s'\n",
!  586		      !            argv[0], disp_name);

                       
! predecessor blocks: .L900000774

			.L77002157:
/* 0x0ba8	 586 */		ldx	[%sp+2399],%l7
/* 0x0bac	     */		sethi	%gdop_hix22(__iob),%i2
/* 0x0bb0	     */		xor	%i2,%gdop_lox10(__iob),%g1
/* 0x0bb4	     */		ldx	[%i1],%o2
/* 0x0bb8	     */		mov	0,%o3
/* 0x0bbc	     */		ldx	[%l7+%g1],%l7,%gdop(__iob)
/* 0x0bc0	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x0bc4	     */		add	%l7,256,%o0
/* 0x0bc8	 442 */		return	%i7+8	! Result =  %i0
/* 0x0bcc	     */		mov	1,%o0

!  587		      !        return EXIT_FAILURE;
!  588		      !    }
!  589		      !    conn_num = XConnectionNumber(dsp);

                       
! predecessor blocks: .L900000774

			.L77002159:
/* 0x0bd0	 589 */		call	XConnectionNumber	!params=  %o0	!result=  %o0
/* 0x0bd4	 583 */		mov	%o0,%l7
/* 0x0bd8	 589 */		mov	%o0,%o1

!  590		      !    printf("     : connection number %i\n", conn_num);

/* 0x0bdc	 590 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0be0	     */		add	%i4,2100,%o0

!  592		      !    screen_num = DefaultScreen(dsp);

/* 0x0be4	 592 */		ld	[%l7+224],%i3

!  593		      !    printf("     : screen number %i\n", screen_num);

/* 0x0be8	 593 */		add	%i4,2132,%o0
/* 0x0bec	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0bf0	     */		sra	%i3,0,%o1

!  595		      !    depth = XDefaultDepth(dsp,screen_num);

/* 0x0bf4	 595 */		mov	%l7,%o0
/* 0x0bf8	     */		call	XDefaultDepth	!params=  %o0 %o1	!result=  %o0
/* 0x0bfc	     */		sra	%i3,0,%o1

!  596		      !    printf("     : default depth is %i\n", depth);
!  598		      !    /* really we need to get a list of the available fonts and then
!  599		      !     * use one that should work in the correct size
!  600		      !     */
!  601		      !    type_font = XLoadFont(dsp, "lucidasanstypewriter-10");
!  603		      !    disp_width = DisplayWidth(dsp, screen_num);

/* 0x0c00	 603 */		sra	%i3,0,%l2
/* 0x0c04	 595 */		mov	%o0,%o1
/* 0x0c08	 596 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x0c0c	     */		add	%i4,2164,%o0
/* 0x0c10	 601 */		mov	%l7,%o0
/* 0x0c14	     */		call	XLoadFont	!params=  %o0 %o1	!result=  %o0
/* 0x0c18	     */		add	%i4,2196,%o1
/* 0x0c1c	 603 */		ldx	[%l7+232],%o5
/* 0x0c20	     */		sllx	%l2,7,%o4
/* 0x0c24	 601 */		mov	%o0,%i5
/* 0x0c28	 603 */		stx	%o4,[%sp+2671]

!  604		      !    disp_height = DisplayHeight(dsp, screen_num);
!  606		      !    printf("     : display seems to be %i wide and %i high.\n",
!  607		      !                                   disp_width, disp_height);

/* 0x0c2c	 607 */		add	%i4,2220,%o0
/* 0x0c30	 603 */		add	%o5,%o4,%g4
/* 0x0c34	 604 */		ld	[%g4+28],%l6
/* 0x0c38	 603 */		ld	[%g4+24],%i0
/* 0x0c3c	 607 */		sra	%l6,0,%o2
/* 0x0c40	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0c44	     */		sra	%i0,0,%o1

!  609		      !    if ( ( disp_width < (int)width )
!  610		      !         ||
!  611		      !         ( disp_height < (int)height ) ) {

/* 0x0c48	 611 */		cmp	%i0,1044
/* 0x0c4c	     */		bl,pn	%icc,.L77002165
/* 0x0c50	     */		cmp	%l6,1044

! Registers live out of .L77002159: 
! g2 g3 o0 sp l7 i0 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002159

			.L77002161:
/* 0x0c54	 611 */		bl,pn	%icc,.L77002165

!  612		      !        fprintf(stderr, "ERROR: screen is too small\n\n");
!  613		      !        return EXIT_FAILURE;
!  614		      !    }
!  616		      !    /* These are entirely temporary hard coded screen offsets */
!  617		      !    int win_offset_x = 20;
!  618		      !    int win_offset_y = 20;
!  620		      !    printf("     : offset x=%i y=%i\n", win_offset_x, win_offset_y);

/* 0x0c58	 620 */		mov	20,%o2

! Registers live out of .L77002161: 
! g2 g3 o0 o2 sp l7 i0 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002161

			.L77002167:
/* 0x0c5c	 620 */		mov	20,%o1

!  622		      !    /* Our primary plotting window has a pale grey background
!  623		      !     * but for debugging mouse locations then it may be nice
!  624		      !     * to use Rebecca Purple 0x663399 */
!  625		      !    unsigned long gc_bg = 0x0f0f0f;
!  626		      !    win = create_borderless_topwin(dsp, width, height,
!  627		      !                                        win_offset_x, win_offset_y,
!  628		      !                                        gc_bg);
!  629		      !    gc = create_gc(dsp, win);
!  631		      !    /* create a smaller darker window to the right */
!  632		      !    unsigned long gc2_bg = 0x040004;
!  633		      !    win2 = create_borderless_topwin(dsp, 400, 330, 1070, 740, gc2_bg );

/* 0x0c60	 633 */		sethi	%hi(0x40000),%i1
/* 0x0c64	 620 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x0c68	     */		add	%i4,2308,%o0
/* 0x0c6c	 628 */		sethi	%hi(0xf0c00),%o1
/* 0x0c70	     */		add	%o1,783,%o5
/* 0x0c74	     */		mov	20,%o4
/* 0x0c78	     */		mov	20,%o3
/* 0x0c7c	     */		mov	1044,%o2
/* 0x0c80	     */		mov	1044,%o1
/* 0x0c84	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0c88	     */		mov	%l7,%o0
/* 0x0c8c	     */		stx	%o0,[%sp+2711]
/* 0x0c90	     */		mov	%o0,%o1
/* 0x0c94	 629 */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0c98	     */		mov	%l7,%o0
/* 0x0c9c	     */		stx	%o0,[%sp+2703]
/* 0x0ca0	 633 */		mov	740,%o4
/* 0x0ca4	     */		mov	1070,%o3
/* 0x0ca8	     */		mov	330,%o2
/* 0x0cac	     */		mov	400,%o1
/* 0x0cb0	     */		mov	%l7,%o0
/* 0x0cb4	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0cb8	     */		add	%i1,4,%o5
/* 0x0cbc	     */		stx	%o0,[%sp+2687]
/* 0x0cc0	     */		mov	%o0,%o1

!  634		      !    gc2 = create_gc(dsp, win2);

/* 0x0cc4	 634 */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0cc8	     */		mov	%l7,%o0
/* 0x0ccc	     */		stx	%o0,[%sp+2679]
/* 0x0cd0	     */		mov	%o0,%o1

!  635		      !    XSetBackground(dsp, gc2, gc2_bg);

/* 0x0cd4	 635 */		add	%i1,4,%o2
/* 0x0cd8	     */		call	XSetBackground	!params=  %o0 %o1 %o2	!result= 
/* 0x0cdc	     */		mov	%l7,%o0

!  637		      !    /* create another small window below that */
!  638		      !    unsigned long gc3_bg = 0x000810;
!  639		      !    win3 = create_borderless_topwin(dsp, 440, 330, 1470, 740, gc3_bg );

/* 0x0ce0	 639 */		mov	2064,%o5
/* 0x0ce4	     */		mov	740,%o4
/* 0x0ce8	     */		mov	1470,%o3
/* 0x0cec	     */		mov	330,%o2
/* 0x0cf0	     */		mov	440,%o1
/* 0x0cf4	     */		call	create_borderless_topwin	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result=  %o0
/* 0x0cf8	     */		mov	%l7,%o0

!  640		      !    gc3 = create_gc(dsp, win2);

/* 0x0cfc	 640 */		ldx	[%sp+2687],%o1
/* 0x0d00	 639 */		stx	%o0,[%sp+2719]
/* 0x0d04	 640 */		call	create_gc	!params=  %o0 %o1	!result=  %o0
/* 0x0d08	     */		mov	%l7,%o0

!  641		      !    XSetBackground(dsp, gc3, gc3_bg);

/* 0x0d0c	 641 */		mov	2064,%o2
/* 0x0d10	 640 */		stx	%o0,[%sp+2695]
/* 0x0d14	     */		mov	%o0,%o1
/* 0x0d18	 641 */		call	XSetBackground	!params=  %o0 %o1 %o2	!result= 
/* 0x0d1c	     */		mov	%l7,%o0

!  643		      !    XSync(dsp, False);

/* 0x0d20	 643 */		mov	0,%o1
/* 0x0d24	     */		call	XSync	!params=  %o0 %o1	!result= 
/* 0x0d28	     */		mov	%l7,%o0

!  645		      !    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));

/* 0x0d2c	 645 */		ldsw	[%l7+224],%o1
/* 0x0d30	     */		call	XDefaultColormap	!params=  %o0 %o1	!result=  %o0
/* 0x0d34	     */		mov	%l7,%o0

!  646		      !    if (XAllocNamedColor(dsp,
!  647		      !                         screen_colormap,
!  648		      !                         "red", &red, &red) == 0) {

/* 0x0d38	 648 */		add	%sp,2479,%o3
/* 0x0d3c	 645 */		mov	%o0,%i1
/* 0x0d40	 648 */		mov	%o3,%o4
/* 0x0d44	     */		add	%i4,2336,%o2
/* 0x0d48	     */		mov	%l7,%o0
/* 0x0d4c	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0d50	     */		mov	%i1,%o1
/* 0x0d54	     */		orcc	%g0,%o0,%g0
/* 0x0d58	     */		bne,pn	%icc,.L77002171
/* 0x0d5c	 649 */		sethi	%gdop_hix22(__iob),%l4

! Registers live out of .L77002167: 
! g2 g3 o2 sp l4 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  649		      !        fprintf(stderr, "XAllocNamedColor - no red color?\n");

                       
! predecessor blocks: .L77002167

			.L77002169:
/* 0x0d60	 649 */		ldx	[%sp+2399],%i1
/* 0x0d64	     */		add	%i4,2340,%o1
/* 0x0d68	     */		xor	%l4,%gdop_lox10(__iob),%i4
/* 0x0d6c	     */		ldx	[%i1+%i4],%o0,%gdop(__iob)
/* 0x0d70	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0d74	     */		add	%o0,256,%o0
/* 0x0d78	 442 */		return	%i7+8	! Result =  %i0
/* 0x0d7c	     */		mov	1,%o0

!  650		      !        return EXIT_FAILURE;
!  651		      !    }
!  652		      !    if (XAllocNamedColor(dsp,
!  653		      !                         screen_colormap,
!  654		      !                         "green", &green, &green) == 0) {

                       
! predecessor blocks: .L77002167

			.L77002171:
/* 0x0d80	 654 */		add	%sp,2447,%o3
/* 0x0d84	     */		mov	%i1,%o1
/* 0x0d88	     */		mov	%o3,%o4
/* 0x0d8c	     */		mov	%l7,%o0
/* 0x0d90	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0d94	     */		add	%i4,2374,%o2
/* 0x0d98	     */		orcc	%g0,%o0,%g0
/* 0x0d9c	     */		bne,pn	%icc,.L77002175
/* 0x0da0	 655 */		sethi	%gdop_hix22(__iob),%o7

! Registers live out of .L77002171: 
! g2 g3 o0 o2 sp o7 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  655		      !        fprintf(stderr, "XAllocNamedColor - red works but green no??\n");

                       
! predecessor blocks: .L77002171

			.L77002173:
/* 0x0da4	 655 */		ldx	[%sp+2399],%l2
/* 0x0da8	     */		xor	%o7,%gdop_lox10(__iob),%l5
/* 0x0dac	     */		add	%i4,2380,%o1
/* 0x0db0	     */		ldx	[%l2+%l5],%g5,%gdop(__iob)
/* 0x0db4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0db8	     */		add	%g5,256,%o0
/* 0x0dbc	 442 */		return	%i7+8	! Result =  %i0
/* 0x0dc0	     */		mov	1,%o0

!  656		      !        return EXIT_FAILURE;
!  657		      !    }
!  658		      !    if (XAllocNamedColor(dsp,
!  659		      !                         screen_colormap,
!  660		      !                         "blue", &blue, &blue) == 0) {

                       
! predecessor blocks: .L77002171

			.L77002175:
/* 0x0dc4	 660 */		add	%sp,2895,%o3
/* 0x0dc8	     */		mov	%i1,%o1
/* 0x0dcc	     */		mov	%o3,%o4
/* 0x0dd0	     */		mov	%l7,%o0
/* 0x0dd4	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0dd8	     */		add	%i4,2426,%o2
/* 0x0ddc	     */		orcc	%g0,%o0,%g0
/* 0x0de0	     */		bne,pn	%icc,.L77002179
/* 0x0de4	 661 */		sethi	%gdop_hix22(__iob),%o2

! Registers live out of .L77002175: 
! g2 g3 o0 o2 sp l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  661		      !        fprintf(stderr, "XAllocNamedColor - red and green okay but blue??\n");

                       
! predecessor blocks: .L77002175

			.L77002177:
/* 0x0de8	 661 */		ldx	[%sp+2399],%l4
/* 0x0dec	     */		xor	%o2,%gdop_lox10(__iob),%i0
/* 0x0df0	     */		add	%i4,2436,%o1
/* 0x0df4	     */		ldx	[%l4+%i0],%l6,%gdop(__iob)
/* 0x0df8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0dfc	     */		add	%l6,256,%o0
/* 0x0e00	 442 */		return	%i7+8	! Result =  %i0
/* 0x0e04	     */		mov	1,%o0

!  662		      !        return EXIT_FAILURE;
!  663		      !    }
!  664		      !    if (XAllocNamedColor(dsp,
!  665		      !                         screen_colormap,
!  666		      !                         "yellow", &yellow, &yellow) == 0) {

                       
! predecessor blocks: .L77002175

			.L77002179:
/* 0x0e08	 666 */		add	%sp,2527,%o3
/* 0x0e0c	     */		mov	%i1,%o1
/* 0x0e10	     */		mov	%o3,%o4
/* 0x0e14	     */		mov	%l7,%o0
/* 0x0e18	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0e1c	     */		add	%i4,2486,%o2
/* 0x0e20	     */		orcc	%g0,%o0,%g0
/* 0x0e24	     */		bne,pn	%icc,.L77002183
/* 0x0e28	 667 */		add	%i4,2500,%o1

! Registers live out of .L77002179: 
! g2 g3 o0 o1 o2 sp l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  667		      !        fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");

                       
! predecessor blocks: .L77002179

			.L77002181:
/* 0x0e2c	 667 */		ldx	[%sp+2399],%i0
/* 0x0e30	     */		sethi	%gdop_hix22(__iob),%i2
/* 0x0e34	     */		xor	%i2,%gdop_lox10(__iob),%l7
/* 0x0e38	     */		ldx	[%i0+%l7],%g1,%gdop(__iob)
/* 0x0e3c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0e40	     */		add	%g1,256,%o0
/* 0x0e44	 442 */		return	%i7+8	! Result =  %i0
/* 0x0e48	     */		mov	1,%o0

!  668		      !        return EXIT_FAILURE;
!  669		      !    }
!  671		      !    if (XAllocNamedColor(dsp,
!  672		      !                         screen_colormap,
!  673		      !                         "cyan", &cyan, &cyan) == 0) {

                       
! predecessor blocks: .L77002179

			.L77002183:
/* 0x0e4c	 673 */		add	%sp,2511,%o3
/* 0x0e50	     */		mov	%i1,%o1
/* 0x0e54	     */		mov	%o3,%o4
/* 0x0e58	     */		mov	%l7,%o0
/* 0x0e5c	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0e60	     */		add	%i4,2544,%o2
/* 0x0e64	     */		orcc	%g0,%o0,%g0
/* 0x0e68	     */		bne,pn	%icc,.L77002187
/* 0x0e6c	 674 */		sethi	%gdop_hix22(__iob),%o5

! Registers live out of .L77002183: 
! g2 g3 o0 o2 o5 sp l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  674		      !        fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");

                       
! predecessor blocks: .L77002183

			.L77002185:
/* 0x0e70	 674 */		add	%i4,2556,%o1
/* 0x0e74	     */		ldx	[%sp+2399],%i4
/* 0x0e78	     */		xor	%o5,%gdop_lox10(__iob),%o4
/* 0x0e7c	     */		ldx	[%i4+%o4],%g4,%gdop(__iob)
/* 0x0e80	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0e84	     */		add	%g4,256,%o0
/* 0x0e88	 442 */		return	%i7+8	! Result =  %i0
/* 0x0e8c	     */		mov	1,%o0

!  675		      !        return EXIT_FAILURE;
!  676		      !    }
!  678		      !    if (XAllocNamedColor(dsp,
!  679		      !                         screen_colormap,
!  680		      !                         "magenta", &magenta, &magenta) == 0) {

                       
! predecessor blocks: .L77002183

			.L77002187:
/* 0x0e90	 680 */		add	%sp,2559,%o3
/* 0x0e94	     */		mov	%i1,%o1
/* 0x0e98	     */		mov	%o3,%o4
/* 0x0e9c	     */		mov	%l7,%o0
/* 0x0ea0	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0ea4	     */		add	%i4,2600,%o2
/* 0x0ea8	     */		orcc	%g0,%o0,%g0
/* 0x0eac	     */		bne,pn	%icc,.L77002191
/* 0x0eb0	 681 */		sethi	%gdop_hix22(__iob),%l3

! Registers live out of .L77002187: 
! g2 g3 o0 o2 sp l7 i0 i1 i2 i4 i5 fp gsr 
! 
		
!  681		      !        fprintf(stderr, "XAllocNamedColor - magenta bork bork!\n");

                       
! predecessor blocks: .L77002187

			.L77002189:
/* 0x0eb4	 681 */		ldx	[%sp+2399],%i5
/* 0x0eb8	     */		xor	%l3,%gdop_lox10(__iob),%i3
/* 0x0ebc	     */		add	%i4,2612,%o1
/* 0x0ec0	     */		ldx	[%i5+%i3],%l2,%gdop(__iob)
/* 0x0ec4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0ec8	     */		add	%l2,256,%o0
/* 0x0ecc	 442 */		return	%i7+8	! Result =  %i0
/* 0x0ed0	     */		mov	1,%o0

!  682		      !        return EXIT_FAILURE;
!  683		      !    }
!  685		      !    /* cornflowerblue is #6495ED */
!  686		      !    if (XAllocNamedColor(dsp,
!  687		      !                         screen_colormap,
!  688		      !                         "cornflowerblue",
!  689		      !                         &cornflowerblue, &cornflowerblue) == 0) {

                       
! predecessor blocks: .L77002187

			.L77002191:
/* 0x0ed4	 689 */		add	%sp,2591,%o3
/* 0x0ed8	     */		mov	%i1,%o1
/* 0x0edc	     */		mov	%o3,%o4
/* 0x0ee0	     */		mov	%l7,%o0
/* 0x0ee4	     */		call	XAllocNamedColor	!params=  %o0 %o1 %o2 %o3 %o4	!result=  %o0
/* 0x0ee8	     */		add	%i4,2652,%o2
/* 0x0eec	     */		orcc	%g0,%o0,%g0
/* 0x0ef0	     */		bne,pn	%icc,.L77002195
/* 0x0ef4	 690 */		add	%i4,2668,%o1

! Registers live out of .L77002191: 
! g2 g3 o0 o1 sp l7 i0 i1 i2 i5 fp gsr 
! 
		
!  690		      !        fprintf(stderr, "XAllocNamedColor - cornflowerblue fails.\n");

                       
! predecessor blocks: .L77002191

			.L77002193:
/* 0x0ef8	 690 */		ldx	[%sp+2399],%o2
/* 0x0efc	     */		sethi	%gdop_hix22(__iob),%i5
/* 0x0f00	     */		xor	%i5,%gdop_lox10(__iob),%o3
/* 0x0f04	     */		ldx	[%o2+%o3],%i1,%gdop(__iob)
/* 0x0f08	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0f0c	     */		add	%i1,256,%o0
/* 0x0f10	 442 */		return	%i7+8	! Result =  %i0
/* 0x0f14	     */		mov	1,%o0

!  691		      !        return EXIT_FAILURE;
!  692		      !    }
!  694		      !    /* request Royal Blue which should be #4169E1 however we
!  695		      !     * will get whatever the hardware can map closest to the
!  696		      !     * request */
!  697		      !    royal_blue.flags= DoRed | DoGreen | DoBlue;
!  698		      !    royal_blue.red = 0x4100;

                       
! predecessor blocks: .L77002191

			.L77002195:
/* 0x0f18	 698 */		sethi	%hi(0x4000),%o1

!  699		      !    royal_blue.green = 0x6900;

/* 0x0f1c	 699 */		sethi	%hi(0x6800),%l6
/* 0x0f20	 698 */		add	%o1,256,%o7
/* 0x0f24	 699 */		add	%l6,256,%i4
/* 0x0f28	     */		sll	%o7,16,%g5

!  700		      !    royal_blue.blue = 0xe100;

/* 0x0f2c	 700 */		sethi	%hi(0xe000),%l5
/* 0x0f30	 697 */		mov	7,%i3
/* 0x0f34	     */		stb	%i3,[%sp+2861]
/* 0x0f38	 699 */		or	%g5,%i4,%l4
/* 0x0f3c	 700 */		add	%l5,256,%o0
/* 0x0f40	 699 */		st	%l4,[%sp+2855]
/* 0x0f44	 700 */		sth	%o0,[%sp+2859]

!  701		      !    if ( XAllocColor(dsp, screen_colormap, &royal_blue) == 0 ) {

/* 0x0f48	 701 */		add	%sp,2847,%o2
/* 0x0f4c	     */		mov	%i1,%o1
/* 0x0f50	     */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0f54	     */		mov	%l7,%o0
/* 0x0f58	     */		orcc	%g0,%o0,%g0
/* 0x0f5c	     */		bne,pn	%icc,.L77002199
/* 0x0f60	 702 */		ldx	[%sp+2399],%o1

! Registers live out of .L77002195: 
! g2 g3 o0 o1 sp l7 i0 i1 i2 i3 i5 fp gsr 
! 
		
!  702		      !        fprintf(stderr, "XAllocColor - royal_blue fails.\n");

                       
! predecessor blocks: .L77002195

			.L77002197:
/* 0x0f64	 702 */		sethi	%gdop_hix22(__iob),%i2
/* 0x0f68	     */		sethi	%gdop_hix22(.L263),%l7
/* 0x0f6c	     */		xor	%i2,%gdop_lox10(__iob),%g1
/* 0x0f70	     */		xor	%l7,%gdop_lox10(.L263),%o2
/* 0x0f74	     */		ldx	[%o1+%g1],%i0,%gdop(__iob)
/* 0x0f78	     */		ldx	[%o1+%o2],%o1,%gdop(.L263)
/* 0x0f7c	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0f80	     */		add	%i0,256,%o0
/* 0x0f84	 442 */		return	%i7+8	! Result =  %i0
/* 0x0f88	     */		mov	1,%o0

!  703		      !        return EXIT_FAILURE;
!  704		      !    }
!  706		      !    /* possible idea for a progress bar to show that a file
!  707		      !     * is being dumped */
!  708		      !    oldlace.flags= DoRed | DoGreen | DoBlue;
!  709		      !    oldlace.red = 0xfd00;

                       
! predecessor blocks: .L77002195

			.L77002199:
/* 0x0f8c	 709 */		sethi	%hi(0xfc00),%l2

!  710		      !    oldlace.green = 0xf500;

/* 0x0f90	 710 */		sethi	%hi(0xf400),%o3
/* 0x0f94	 708 */		stb	%i3,[%sp+3045]
/* 0x0f98	 709 */		add	%l2,256,%o5

!  711		      !    oldlace.blue = 0xe600;

/* 0x0f9c	 711 */		sethi	%hi(0xe400),%l3
/* 0x0fa0	 709 */		sth	%o5,[%sp+3039]
/* 0x0fa4	 710 */		add	%o3,256,%o4
/* 0x0fa8	 711 */		add	%l3,512,%g4
/* 0x0fac	 710 */		sth	%o4,[%sp+3041]
/* 0x0fb0	 711 */		sth	%g4,[%sp+3043]

!  712		      !    if ( XAllocColor(dsp, screen_colormap, &oldlace) == 0 ) {

/* 0x0fb4	 712 */		add	%sp,3031,%o2
/* 0x0fb8	     */		mov	%i1,%o1
/* 0x0fbc	     */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x0fc0	     */		mov	%l7,%o0
/* 0x0fc4	     */		orcc	%g0,%o0,%g0
/* 0x0fc8	     */		bne,pn	%icc,.L77002203
/* 0x0fcc	 713 */		sethi	%gdop_hix22(.L266),%g5

! Registers live out of .L77002199: 
! g2 g3 g5 sp l2 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		
!  713		      !        fprintf(stderr, "XAllocColor - oldlace fails.\n");

                       
! predecessor blocks: .L77002199

			.L77002201:
/* 0x0fd0	 713 */		ldx	[%sp+2399],%o3
/* 0x0fd4	     */		sethi	%gdop_hix22(__iob),%i5
/* 0x0fd8	     */		xor	%g5,%gdop_lox10(.L266),%l4
/* 0x0fdc	     */		xor	%i5,%gdop_lox10(__iob),%l2
/* 0x0fe0	     */		ldx	[%o3+%l2],%o0,%gdop(__iob)
/* 0x0fe4	     */		ldx	[%o3+%l4],%o1,%gdop(.L266)
/* 0x0fe8	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x0fec	     */		add	%o0,256,%o0
/* 0x0ff0	 442 */		return	%i7+8	! Result =  %i0
/* 0x0ff4	     */		mov	1,%o0
                       
! predecessor blocks: .L77002199

			.L77002203:
/* 0x0ff8	   0 */		sethi	%hi(0x1c00),%l6

!  714		      !        return EXIT_FAILURE;
!  715		      !    }
!  717		      !    /* We need an inner grid which in our main plot window
!  718		      !     * which should be a subtle very very dark grey.
!  719		      !     * Here we manually define the rgb components using 16bit
!  720		      !     * values and then create the new color */
!  721		      !    very_dark_grey.flags= DoRed | DoGreen | DoBlue;
!  722		      !    very_dark_grey.red = 0x1f00;
!  723		      !    very_dark_grey.green = 0x1f00;
!  724		      !    very_dark_grey.blue = 0x1f00;
!  725		      !    if ( XAllocColor(dsp, screen_colormap, &very_dark_grey) == 0 ) {

/* 0x0ffc	 725 */		add	%sp,2863,%o2
/* 0x1000	 721 */		stb	%i3,[%sp+2877]
/* 0x1004	 722 */		add	%l6,768,%l5
/* 0x1008	 725 */		mov	%i1,%o1
/* 0x100c	 723 */		sll	%l5,16,%i4
/* 0x1010	 725 */		mov	%l7,%o0
/* 0x1014	 723 */		or	%i4,%l5,%o7
/* 0x1018	     */		st	%o7,[%sp+2871]
/* 0x101c	 725 */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x1020	 724 */		sth	%l5,[%sp+2875]
/* 0x1024	 725 */		orcc	%g0,%o0,%g0
/* 0x1028	     */		bne,pn	%icc,.L77002207
/* 0x102c	 726 */		sethi	%gdop_hix22(__iob),%g1

! Registers live out of .L77002203: 
! g1 g2 g3 o0 sp l2 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		
!  726		      !        fprintf(stderr, "XAllocColor - very_dark_grey fails.\n");

                       
! predecessor blocks: .L77002203

			.L77002205:
/* 0x1030	 726 */		ldx	[%sp+2399],%o5
/* 0x1034	     */		xor	%g1,%gdop_lox10(__iob),%o1
/* 0x1038	     */		sethi	%gdop_hix22(.L269),%o2
/* 0x103c	     */		xor	%o2,%gdop_lox10(.L269),%i0
/* 0x1040	     */		ldx	[%o5+%o1],%i3,%gdop(__iob)
/* 0x1044	     */		ldx	[%o5+%i0],%o1,%gdop(.L269)
/* 0x1048	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x104c	     */		add	%i3,256,%o0
/* 0x1050	 442 */		return	%i7+8	! Result =  %i0
/* 0x1054	     */		mov	1,%o0

!  727		      !        return EXIT_FAILURE;
!  728		      !    }
!  730		      !    /* this is a hack color data value that we will abuse later
!  731		      !     * inside the main mandlebrot computation loop. Colors to
!  732		      !     * be determined via a smooth function brought to you by
!  733		      !     * Patrick Scheibe. */
!  734		      !    mandlebrot.flags= DoRed | DoGreen | DoBlue;
!  735		      !    /* some dummy values */
!  736		      !    mandlebrot.green = 0x0000;
!  737		      !    mandlebrot.blue  = 0x0000;
!  738		      !    mandlebrot.red   = 0xff00;

                       
! predecessor blocks: .L77002203

			.L77002207:
/* 0x1058	 738 */		add	%l2,768,%o4
/* 0x105c	 734 */		stb	%i3,[%sp+3029]

!  740		      !    if ( XAllocColor(dsp, screen_colormap, &mandlebrot) == 0 ) {

/* 0x1060	 740 */		add	%sp,3015,%o2
/* 0x1064	 737 */		sth	%g0,[%sp+3027]
/* 0x1068	 738 */		sll	%o4,16,%g4
/* 0x106c	 740 */		mov	%i1,%o1
/* 0x1070	 738 */		st	%g4,[%sp+3023]
/* 0x1074	 740 */		call	XAllocColor	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x1078	     */		mov	%l7,%o0
/* 0x107c	     */		orcc	%g0,%o0,%g0
/* 0x1080	     */		bne,pn	%icc,.L77002211
/* 0x1084	 741 */		ldx	[%sp+2399],%o4

! Registers live out of .L77002207: 
! g2 g3 o0 o4 sp l7 i0 i2 i5 fp gsr 
! 
		
!  741		      !        fprintf(stderr, "XAllocColor - gee .. mandlebrot fail.\n");

                       
! predecessor blocks: .L77002207

			.L77002209:
/* 0x1088	 741 */		sethi	%gdop_hix22(__iob),%i2
/* 0x108c	     */		sethi	%gdop_hix22(.L272),%l7
/* 0x1090	     */		xor	%i2,%gdop_lox10(__iob),%l3
/* 0x1094	     */		xor	%l7,%gdop_lox10(.L272),%i1
/* 0x1098	     */		ldx	[%o4+%l3],%o5,%gdop(__iob)
/* 0x109c	     */		ldx	[%o4+%i1],%o1,%gdop(.L272)
/* 0x10a0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x10a4	     */		add	%o5,256,%o0
/* 0x10a8	 442 */		return	%i7+8	! Result =  %i0
/* 0x10ac	     */		mov	1,%o0

!  742		      !        return EXIT_FAILURE;
!  743		      !    }
!  745		      !    /* main plot window yellow pixel at each corner 5 pixels indent */
!  746		      !    XSetForeground(dsp, gc, yellow.pixel);

                       
! predecessor blocks: .L77002207

			.L77002211:
/* 0x10b0	 746 */		ldx	[%sp+2527],%o2
/* 0x10b4	     */		ldx	[%sp+2703],%o1
/* 0x10b8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x10bc	     */		mov	%l7,%o0

!  747		      !    XDrawPoint(dsp, win, gc, 5, 5);

/* 0x10c0	 747 */		ldx	[%sp+2711],%o1
/* 0x10c4	     */		mov	5,%o4
/* 0x10c8	     */		mov	5,%o3
/* 0x10cc	     */		mov	%l7,%o0
/* 0x10d0	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x10d4	     */		ldx	[%sp+2703],%o2

!  748		      !    XDrawPoint(dsp, win, gc, 5, (int)height - 5);

/* 0x10d8	 748 */		ldx	[%sp+2711],%o1
/* 0x10dc	     */		ldx	[%sp+2703],%o2
/* 0x10e0	     */		mov	1039,%o4
/* 0x10e4	     */		mov	5,%o3
/* 0x10e8	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x10ec	     */		mov	%l7,%o0

!  749		      !    XDrawPoint(dsp, win, gc, (int)width - 5, 5);

/* 0x10f0	 749 */		ldx	[%sp+2703],%o2
/* 0x10f4	     */		ldx	[%sp+2711],%o1
/* 0x10f8	     */		mov	5,%o4
/* 0x10fc	     */		mov	1039,%o3
/* 0x1100	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x1104	     */		mov	%l7,%o0

!  750		      !    XDrawPoint(dsp, win, gc, (int)width - 5, (int)height - 5);

/* 0x1108	 750 */		ldx	[%sp+2703],%o2
/* 0x110c	     */		ldx	[%sp+2711],%o1
/* 0x1110	     */		mov	1039,%o4
/* 0x1114	     */		mov	1039,%o3
/* 0x1118	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x111c	     */		mov	%l7,%o0

!  752		      !    XSetLineAttributes(dsp, gc2, 1, LineSolid,
!  753		      !                                    CapButt,
!  754		      !                                    JoinMiter);

/* 0x1120	 754 */		ldx	[%sp+2679],%o1
/* 0x1124	     */		mov	0,%o5
/* 0x1128	     */		mov	1,%o4
/* 0x112c	     */		mov	0,%o3
/* 0x1130	     */		mov	1,%o2
/* 0x1134	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x1138	     */		mov	%l7,%o0

!  756		      !    /* janky magnify slider container */
!  757		      !    XSetForeground(dsp, gc2, yellow.pixel);

/* 0x113c	 757 */		ldx	[%sp+2527],%o2
/* 0x1140	     */		ldx	[%sp+2679],%o1

!  758		      !    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);

/* 0x1144	 758 */		mov	12,%i1
/* 0x1148	 757 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x114c	     */		mov	%l7,%o0
/* 0x1150	 758 */		ldx	[%sp+2679],%o2
/* 0x1154	     */		ldx	[%sp+2687],%o1
/* 0x1158	     */		mov	176,%o5
/* 0x115c	     */		mov	10,%o4
/* 0x1160	     */		mov	215,%o3
/* 0x1164	     */		stx	%i1,[%sp+2223]
/* 0x1168	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x116c	     */		mov	%l7,%o0

!  760		      !    /* janky bail_out slider container */
!  761		      !    XSetForeground(dsp, gc2, WhitePixel(dsp, screen_num));

/* 0x1170	 761 */		ldx	[%l7+232],%g4
/* 0x1174	     */		ldx	[%sp+2671],%g1
/* 0x1178	     */		mov	%l7,%o0

!  762		      !    XDrawRectangle(dsp, win2, gc2, 215, 60, 176, 12);
!  764		      !    /* draw a blue box inside the second window */
!  765		      !    XSetForeground(dsp, gc2, blue.pixel);
!  766		      !    XDrawRectangle(dsp, win2, gc2, 5, 5, 390, 320);

/* 0x117c	 766 */		mov	320,%i0
/* 0x1180	 761 */		ldx	[%sp+2679],%o1
/* 0x1184	   0 */		sethi	%gdop_hix22(.L273),%i3

!  767		      !    XSetForeground(dsp, gc2, cyan.pixel);
!  769		      !    /* a little window to plot the vbox data into with a 3x3 grid
!  770		      !     * for each pixel we sample.  This shall be the 64x64 actual
!  771		      !     * vbox region with room to plot each of the 3x3 samples and
!  772		      !     * we also need room for the one pixel borders.
!  773		      !     *
!  774		      !     * Note : please see the defined VBOX_SAMPLE_REAL and
!  775		      !     *        VBOX_SAMPLE_IMAG values
!  776		      !     */
!  777		      !    XDrawRectangle(dsp, win2, gc2, 10, 10, 202, 202);
!  778		      !    XSetForeground(dsp, gc2, red.pixel);
!  780		      !    /* draw a blue box inside the third window */
!  781		      !    XSetForeground(dsp, gc3, blue.pixel);
!  782		      !    XSetLineAttributes(dsp, gc3, 1, LineSolid,
!  783		      !                                    CapButt,
!  784		      !                                    JoinMiter);
!  786		      !    XDrawRectangle(dsp, win3, gc3, 5, 5, 430, 320);
!  788		      !    /* set our graph box inside by OFFSET pixels
!  789		      !     * use them as interior offset distances for our plot */
!  790		      !    offset_x = 10;
!  791		      !    offset_y = 10;
!  793		      !    /* X11 upper left pixel in a plot region */
!  794		      !    ux = offset_x;
!  795		      !    uy = offset_y;
!  797		      !    /* X11 lower right pixel in a plot region */
!  798		      !    lx = (int)width - offset_x;
!  799		      !    ly = (int)height - offset_y;
!  801		      !    /* therefore we have effective box width and height */
!  802		      !    eff_width = lx - ux;
!  803		      !    eff_height = ly - uy;
!  805		      !    printf("     : eff_width = %5i    eff_height = %5i\n\n",
!  806		      !                           eff_width, eff_height);
!  807		      !    printf("--------------------------------------------\n");
!  809		      !    /* What is the real and imaginary axi pixel width which
!  810		      !     * gets used by the physical screen ?
!  811		      !     *
!  812		      !     * These values will change of course.
!  813		      !     * */
!  814		      !    pixel_real_width = obs_real / (double)eff_width;
!  815		      !    pixel_imag_height = obs_imag / (double)eff_height;

/* 0x1188	 815 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i4
/* 0x118c	   0 */		xor	%i3,%gdop_lox10(.L273),%l6
/* 0x1190	 761 */		add	%g1,%g4,%o2
/* 0x1194	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1198	     */		ldx	[%o2+88],%o2
/* 0x119c	 762 */		ldx	[%sp+2687],%o1
/* 0x11a0	     */		mov	176,%o5
/* 0x11a4	     */		mov	60,%o4
/* 0x11a8	     */		mov	215,%o3
/* 0x11ac	     */		mov	%l7,%o0
/* 0x11b0	     */		stx	%i1,[%sp+2223]
/* 0x11b4	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x11b8	     */		ldx	[%sp+2679],%o2
/* 0x11bc	 765 */		ldx	[%sp+2679],%o1
/* 0x11c0	     */		ldx	[%sp+2895],%o2
/* 0x11c4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x11c8	     */		mov	%l7,%o0
/* 0x11cc	 766 */		ldx	[%sp+2687],%o1
/* 0x11d0	     */		ldx	[%sp+2679],%o2
/* 0x11d4	     */		mov	390,%o5
/* 0x11d8	     */		mov	5,%o4
/* 0x11dc	     */		stx	%i0,[%sp+2223]
/* 0x11e0	     */		mov	5,%o3
/* 0x11e4	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x11e8	     */		mov	%l7,%o0
/* 0x11ec	 767 */		ldx	[%sp+2511],%o2
/* 0x11f0	     */		ldx	[%sp+2679],%o1
/* 0x11f4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x11f8	     */		mov	%l7,%o0
/* 0x11fc	 777 */		ldx	[%sp+2679],%o2
/* 0x1200	     */		mov	202,%o5
/* 0x1204	     */		mov	10,%o4
/* 0x1208	     */		mov	10,%o3
/* 0x120c	     */		mov	202,%o1
/* 0x1210	     */		stx	%o1,[%sp+2223]
/* 0x1214	     */		ldx	[%sp+2687],%o1
/* 0x1218	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x121c	     */		mov	%l7,%o0
/* 0x1220	 778 */		ldx	[%sp+2479],%o2
/* 0x1224	     */		ldx	[%sp+2679],%o1
/* 0x1228	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x122c	     */		mov	%l7,%o0
/* 0x1230	 781 */		ldx	[%sp+2695],%o1
/* 0x1234	     */		ldx	[%sp+2895],%o2
/* 0x1238	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x123c	     */		mov	%l7,%o0
/* 0x1240	 784 */		ldx	[%sp+2695],%o1
/* 0x1244	     */		mov	0,%o5
/* 0x1248	     */		mov	1,%o4
/* 0x124c	     */		mov	0,%o3
/* 0x1250	     */		mov	1,%o2
/* 0x1254	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x1258	     */		mov	%l7,%o0
/* 0x125c	 786 */		ldx	[%sp+2695],%o2
/* 0x1260	     */		ldx	[%sp+2719],%o1
/* 0x1264	     */		mov	430,%o5
/* 0x1268	     */		mov	5,%o4
/* 0x126c	     */		stx	%i0,[%sp+2223]
/* 0x1270	     */		mov	5,%o3
/* 0x1274	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1278	     */		mov	%l7,%o0
/* 0x127c	   0 */		ldx	[%sp+2399],%l5
/* 0x1280	 806 */		mov	1024,%o2
/* 0x1284	     */		mov	1024,%o1
/* 0x1288	   0 */		ldx	[%l5+%l6],%l4,%gdop(.L273)
/* 0x128c	 806 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x1290	     */		mov	%l4,%o0
/* 0x1294	 807 */		call	printf	!params=  %o0	!result= 
/* 0x1298	     */		add	%l4,48,%o0
/* 0x129c	 815 */		xor	%i4,%gdop_lox10(.L___const_seg_900000101),%o7
/* 0x12a0	     */		ldd	[%sp+2751],%f32

!  816		      !    printf("pixel_real_w = %-+32.26e\n",pixel_real_width);

/* 0x12a4	 816 */		ldd	[%sp+2743],%f34
/* 0x12a8	 815 */		ldx	[%l5+%o7],%l5,%gdop(.L___const_seg_900000101)
/* 0x12ac	 816 */		add	%l4,96,%o0
/* 0x12b0	 815 */		ld	[%l5+48],%f8
/* 0x12b4	     */		fitod	%f8,%f36
/* 0x12b8	     */		fdivd	%f32,%f36,%f38
/* 0x12bc	 816 */		fdivd	%f34,%f36,%f32
/* 0x12c0	     */		std	%f32,[%sp+2999]
/* 0x12c4	     */		std	%f38,[%fp+2023]
/* 0x12c8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x12cc	     */		ldx	[%sp+2999],%o1

!  817		      !    printf("pixel_imag_h = %-+32.26e\n",pixel_imag_height);

/* 0x12d0	 817 */		add	%l4,128,%o0
/* 0x12d4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x12d8	     */		ldx	[%fp+2023],%o1

!  819		      !    XSetLineAttributes(dsp, gc, 1, LineSolid,
!  820		      !                                   CapButt,
!  821		      !                                   JoinMiter);

/* 0x12dc	 821 */		mov	0,%o5
/* 0x12e0	     */		mov	1,%o4
/* 0x12e4	     */		mov	0,%o3
/* 0x12e8	     */		mov	1,%o2
/* 0x12ec	     */		mov	%l7,%o0
/* 0x12f0	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x12f4	     */		ldx	[%sp+2703],%o1

!  823		      !    XSetForeground(dsp, gc, WhitePixel(dsp, screen_num));

/* 0x12f8	 823 */		ldx	[%l7+232],%g5
/* 0x12fc	     */		ldx	[%sp+2671],%l2
/* 0x1300	     */		ldx	[%sp+2703],%o1
/* 0x1304	     */		mov	%l7,%o0
/* 0x1308	     */		add	%l2,%g5,%o3
/* 0x130c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1310	     */		ldx	[%o3+88],%o2

!  824		      !    XSetForeground(dsp, gc2, green.pixel);

/* 0x1314	 824 */		ldx	[%sp+2679],%o1
/* 0x1318	     */		ldx	[%sp+2447],%o2
/* 0x131c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1320	     */		mov	%l7,%o0

!  825		      !    XSetFont(dsp, gc2, type_font);

/* 0x1324	 825 */		ldx	[%sp+2679],%o1
/* 0x1328	     */		mov	%l7,%o0
/* 0x132c	     */		call	XSetFont	!params=  %o0 %o1 %o2	!result= 
/* 0x1330	     */		mov	%i5,%o2

!  826		      !    XSetFont(dsp, gc3, type_font);

/* 0x1334	 826 */		ldx	[%sp+2695],%o1
/* 0x1338	     */		mov	%i5,%o2
/* 0x133c	     */		call	XSetFont	!params=  %o0 %o1 %o2	!result= 
/* 0x1340	     */		mov	%l7,%o0

!  828		      !    /* big dumb red box for the REPLOT button */
!  829		      !    XSetForeground(dsp, gc2, cyan.pixel);

/* 0x1344	 829 */		ldx	[%sp+2511],%o2
/* 0x1348	     */		ldx	[%sp+2679],%o1
/* 0x134c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1350	     */		mov	%l7,%o0

!  830		      !    XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);

/* 0x1354	 830 */		mov	20,%g5
/* 0x1358	     */		ldx	[%sp+2679],%o2
/* 0x135c	     */		ldx	[%sp+2687],%o1
/* 0x1360	     */		mov	72,%o5
/* 0x1364	     */		mov	192,%o4
/* 0x1368	     */		mov	320,%o3
/* 0x136c	     */		stx	%g5,[%sp+2223]
/* 0x1370	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1374	     */		mov	%l7,%o0

!  831		      !    sprintf(buf,"REPLOT");

/* 0x1378	 831 */		add	%l4,154,%o1
/* 0x137c	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x1380	     */		ldx	[%sp+2647],%o0

!  832		      !    XDrawImageString( dsp, win2, gc2, 332, 207, buf, (int)strlen(buf));

/* 0x1384	 832 */		ldx	[%sp+2647],%o0
/* 0x1388	     */		ldub	[%o0],%o5

! Registers live out of .L77002211: 
! g2 g3 o0 o5 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002211 .L900000343

			.L900000773:
/* 0x138c	 832 */		brz,pn	%o5,.L900000344
/* 0x1390	     */		add	%o0,1,%o0

! Registers live out of .L900000773: 
! g2 g3 o0 o5 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000773

			.L900000343:
/* 0x1394	 832 */		ldub	[%o0],%l3
/* 0x1398	     */		add	%o0,1,%o0
/* 0x139c	     */		brnz,a,pt	%l3,.L900000773
/* 0x13a0	     */		ldub	[%o0],%o5

! Registers live out of .L900000343: 
! g2 g3 o0 o5 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000343 .L900000773

			.L900000344:
/* 0x13a4	 832 */		ldx	[%sp+2647],%o5
/* 0x13a8	     */		sub	%o0,1,%l6
/* 0x13ac	     */		ldx	[%sp+2679],%o2
/* 0x13b0	     */		mov	207,%o4
/* 0x13b4	     */		ldx	[%sp+2687],%o1
/* 0x13b8	     */		mov	332,%o3
/* 0x13bc	   0 */		sethi	%gdop_hix22(.L278),%l5
/* 0x13c0	   0 */		xor	%l5,%gdop_lox10(.L278),%l2
/* 0x13c4	 832 */		sub	%l6,%o5,%g1
/* 0x13c8	     */		sra	%g1,0,%g4
/* 0x13cc	     */		stx	%g4,[%sp+2223]
/* 0x13d0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x13d4	     */		mov	%l7,%o0
/* 0x13d8	   0 */		ldx	[%sp+2399],%i5
/* 0x13dc	   0 */		ldx	[%i5+%l2],%i3,%gdop(.L278)

!  834		      !    /* maybe create a file dump button */
!  835		      !    char *tmpdir = getenv("TMPDIR");

/* 0x13e0	 835 */		call	getenv	!params=  %o0	!result=  %o0
/* 0x13e4	     */		mov	%i3,%o0

!  836		      !    /* most compilers won't care that I separate these two checks */
!  837		      !    if (tmpdir == NULL) {

/* 0x13e8	 837 */		brnz,pn	%o0,.L77002215
/* 0x13ec	 835 */		stx	%o0,[%sp+2247]

! Registers live out of .L900000344: 
! g2 g3 o0 o1 o2 sp l7 i1 i2 i3 i5 fp gsr 
! 
		
!  838		      !        dumper_flag = -1;

                       
! predecessor blocks: .L900000344

			.L77002213:
/* 0x13f0	 838 */		mov	-1,%o4
/* 0x13f4	     */		st	%o4,[%sp+2315]
/* 0x13f8	     */		ba	.L900000772
/* 0x13fc	 845 */		ldx	[%sp+2647],%o0

! Registers live out of .L77002213: 
! g2 g3 o0 o1 sp l7 i1 i2 i3 fp gsr 
! 
		
!  839		      !    } else if (strlen(tmpdir) > _POSIX_PATH_MAX) {

                       
! predecessor blocks: .L900000344

			.L77002215:
/* 0x1400	 839 */		ldub	[%o0],%o3
/* 0x1404	     */		mov	%o0,%o5

! Registers live out of .L77002215: 
! g2 g3 o0 o1 o2 o3 o5 sp l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002215 .L900000339

			.L900000771:
/* 0x1408	 839 */		brz,pn	%o3,.L900000340
/* 0x140c	     */		add	%o5,1,%o5

! Registers live out of .L900000771: 
! g2 g3 o0 o1 o2 o3 o5 sp l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000771

			.L900000339:
/* 0x1410	 839 */		ldub	[%o5],%o1
/* 0x1414	     */		add	%o5,1,%o5
/* 0x1418	     */		brnz,a,pt	%o1,.L900000771
/* 0x141c	     */		ldub	[%o5],%o3

! Registers live out of .L900000339: 
! g2 g3 o0 o1 o2 o3 o5 sp l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000339 .L900000771

			.L900000340:
/* 0x1420	 839 */		sub	%o5,1,%i0
/* 0x1424	     */		sub	%i0,%o0,%o7
/* 0x1428	     */		cmp	%o7,256
/* 0x142c	     */		bgu,pn	%xcc,.L77002217
/* 0x1430	 854 */		mov	%l7,%o0

! Registers live out of .L900000340: 
! g2 g3 o0 o1 o2 sp l7 i1 i2 i3 i5 fp gsr 
! 
		
!  840		      !        dumper_flag = -1;
!  841		      !    }
!  843		      !    if ( dumper_flag == -1 ) {
!  844		      !        /* forget the dumper for now */
!  845		      !        sprintf(buf,"No TMPDIR");
!  846		      !        XSetForeground(dsp, gc2, red.pixel);
!  847		      !        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
!  848		      !        XDrawImageString(dsp, win2, gc2, 220, 178, buf, (int)strlen(buf));
!  849		      !        sprintf(buf,"DUMPER");
!  850		      !        XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));
!  851		      !        XDrawLine(dsp, win2, gc2, 320, 162, 392, 182);
!  852		      !        XDrawLine(dsp, win2, gc2, 320, 182, 392, 162);
!  853		      !    } else {
!  854		      !        XSetForeground(dsp, gc2, magenta.pixel);

                       
! predecessor blocks: .L900000340

			.L77002225:
/* 0x1434	 854 */		ldx	[%sp+2679],%o1
/* 0x1438	 109 */		st	%g0,[%sp+2315]
/* 0x143c	 854 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1440	     */		ldx	[%sp+2559],%o2

!  855		      !        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);

/* 0x1444	 855 */		mov	20,%o0
/* 0x1448	     */		stx	%o0,[%sp+2223]
/* 0x144c	     */		mov	72,%o5
/* 0x1450	     */		ldx	[%sp+2687],%o1
/* 0x1454	     */		mov	162,%o4
/* 0x1458	     */		mov	320,%o3
/* 0x145c	     */		mov	%l7,%o0
/* 0x1460	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1464	     */		ldx	[%sp+2679],%o2

!  856		      !        sprintf(buf,"DUMPER");

/* 0x1468	 856 */		add	%i3,20,%o1
/* 0x146c	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x1470	     */		ldx	[%sp+2647],%o0

!  857		      !        XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));

/* 0x1474	 857 */		ldx	[%sp+2647],%l4
/* 0x1478	     */		ldub	[%l4],%o3

! Registers live out of .L77002225: 
! g2 g3 o0 o3 sp l4 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002225 .L900000327

			.L900000770:
/* 0x147c	 857 */		brz,pn	%o3,.L900000328
/* 0x1480	     */		add	%l4,1,%l4

! Registers live out of .L900000770: 
! g2 g3 o0 o3 sp l4 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000770

			.L900000327:
/* 0x1484	 857 */		ldub	[%l4],%l3
/* 0x1488	     */		add	%l4,1,%l4
/* 0x148c	     */		brnz,a,pt	%l3,.L900000770
/* 0x1490	     */		ldub	[%l4],%o3

! Registers live out of .L900000327: 
! g2 g3 o0 o3 sp l4 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000327 .L900000770

			.L900000328:
/* 0x1494	 857 */		ldx	[%sp+2647],%o5
/* 0x1498	     */		sub	%l4,1,%g4
/* 0x149c	     */		mov	177,%o4
/* 0x14a0	     */		ldx	[%sp+2679],%o2
/* 0x14a4	     */		mov	332,%o3

!  858		      !    }
!  860		      !    /****************************************************************
!  861		      !     * NOTE : see VBOX_REAL_COUNT and VBOX_IMAG_COUNT
!  862		      !     *
!  863		      !     * The viewport is made up of a neat grid of 16 x 16 little box
!  864		      !     * areas and we can lay down a lightly colored dashed lines to
!  865		      !     * indicate where they are. We may as well refer to these little
!  866		      !     * boxes as view box regions. Starting from the lower left at
!  867		      !     * vbox [0] [0] upwards to the upper most right corner which
!  868		      !     * we can call vbox [15] [15].
!  869		      !     *
!  870		      !     * Each of these vbox elements has a height and width in the
!  871		      !     * on screen pixels of :
!  872		      !     *
!  873		      !     *     vbox_w = eff_width/VBOX_REAL_COUNT
!  874		      !     *
!  875		      !     *     vbox_h = eff_height/VBOX_IMAG_COUNT
!  876		      !     *
!  877		      !     * A given vbox has VBOX_SAMPLE_REAL * VBOX_SAMPLE_IMAGE points
!  878		      !     * of interest with a real width of sample_w and an imaginary
!  879		      !     * or complex height of sample_h.
!  880		      !     ****************************************************************/
!  881		      !    vbox_w = eff_width/VBOX_REAL_COUNT;
!  882		      !    vbox_h = eff_height/VBOX_IMAG_COUNT;
!  884		      !    /* horizontal tic marks */
!  885		      !    for ( j=offset_x + vbox_w; j<lx; j+=vbox_w ){

/* 0x14a8	 885 */		mov	74,%l4
/* 0x14ac	 857 */		ldx	[%sp+2687],%o1
/* 0x14b0	     */		sub	%g4,%o5,%l5
/* 0x14b4	     */		sra	%l5,0,%l2
/* 0x14b8	     */		stx	%l2,[%sp+2223]
/* 0x14bc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x14c0	     */		mov	%l7,%o0
/* 0x14c4	 885 */		ldd	[%sp+2775],%f0
/* 0x14c8	 857 */		ba	.L900000767
/* 0x14cc	 886 */		sra	%l4,0,%o3

! Registers live out of .L900000328: 
! g2 g3 o3 o5 sp l4 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000340

			.L77002217:
/* 0x14d0	 845 */		ldx	[%sp+2647],%o0
/* 0x14d4	 840 */		mov	-1,%l3
/* 0x14d8	     */		st	%l3,[%sp+2315]

! Registers live out of .L77002217: 
! g2 g3 o0 o1 sp l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002213 .L77002217

			.L900000772:
/* 0x14dc	 845 */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x14e0	     */		add	%i3,10,%o1
/* 0x14e4	 846 */		ldx	[%sp+2479],%o2
/* 0x14e8	     */		ldx	[%sp+2679],%o1
/* 0x14ec	 847 */		mov	20,%l3
/* 0x14f0	 846 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x14f4	     */		mov	%l7,%o0
/* 0x14f8	 847 */		ldx	[%sp+2679],%o2
/* 0x14fc	     */		ldx	[%sp+2687],%o1
/* 0x1500	     */		mov	72,%o5
/* 0x1504	     */		mov	162,%o4
/* 0x1508	     */		stx	%l3,[%sp+2223]
/* 0x150c	     */		mov	320,%o3
/* 0x1510	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1514	     */		mov	%l7,%o0
/* 0x1518	 848 */		ldx	[%sp+2647],%o3
/* 0x151c	     */		ldub	[%o3],%o5

! Registers live out of .L900000772: 
! g2 g3 o3 o5 sp l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000335 .L900000772

			.L900000769:
/* 0x1520	 848 */		brz,pn	%o5,.L900000336
/* 0x1524	     */		add	%o3,1,%o3

! Registers live out of .L900000769: 
! g2 g3 o3 o5 sp l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000769

			.L900000335:
/* 0x1528	 848 */		ldub	[%o3],%l4
/* 0x152c	     */		add	%o3,1,%o3
/* 0x1530	     */		brnz,a,pt	%l4,.L900000769
/* 0x1534	     */		ldub	[%o3],%o5

! Registers live out of .L900000335: 
! g2 g3 o3 o5 sp l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000335 .L900000769

			.L900000336:
/* 0x1538	 848 */		ldx	[%sp+2647],%o5
/* 0x153c	     */		sub	%o3,1,%o0
/* 0x1540	     */		mov	178,%o4
/* 0x1544	     */		ldx	[%sp+2687],%o1
/* 0x1548	     */		mov	220,%o3
/* 0x154c	     */		sub	%o0,%o5,%o2
/* 0x1550	     */		mov	%o5,%l4
/* 0x1554	     */		sra	%o2,0,%i4
/* 0x1558	     */		ldx	[%sp+2679],%o2
/* 0x155c	     */		stx	%i4,[%sp+2223]
/* 0x1560	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1564	     */		mov	%l7,%o0
/* 0x1568	 849 */		add	%i3,20,%o1
/* 0x156c	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x1570	     */		mov	%l4,%o0
/* 0x1574	 850 */		ldub	[%l4],%o2
/* 0x1578	     */		mov	%l4,%g1

! Registers live out of .L900000336: 
! g1 g2 g3 o0 o2 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000331 .L900000336

			.L900000768:
/* 0x157c	 850 */		brz,pn	%o2,.L900000332
/* 0x1580	     */		add	%g1,1,%g1

! Registers live out of .L900000768: 
! g1 g2 g3 o0 o2 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000768

			.L900000331:
/* 0x1584	 850 */		ldub	[%g1],%l6
/* 0x1588	     */		add	%g1,1,%g1
/* 0x158c	     */		brnz,a,pt	%l6,.L900000768
/* 0x1590	     */		ldub	[%g1],%o2

! Registers live out of .L900000331: 
! g1 g2 g3 o0 o2 sp l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000331 .L900000768

			.L900000332:
/* 0x1594	 850 */		sub	%g1,1,%o4
/* 0x1598	     */		mov	332,%o3
/* 0x159c	     */		ldx	[%sp+2647],%o5
/* 0x15a0	     */		ldx	[%sp+2679],%o2
/* 0x15a4	 885 */		mov	74,%l4
/* 0x15a8	 850 */		ldx	[%sp+2687],%o1
/* 0x15ac	     */		sub	%o4,%o5,%i5
/* 0x15b0	     */		mov	177,%o4
/* 0x15b4	     */		sra	%i5,0,%g5
/* 0x15b8	     */		stx	%g5,[%sp+2223]
/* 0x15bc	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x15c0	     */		mov	%l7,%o0
/* 0x15c4	 851 */		mov	182,%o5
/* 0x15c8	     */		stx	%o5,[%sp+2223]
/* 0x15cc	     */		ldx	[%sp+2679],%o2
/* 0x15d0	     */		mov	392,%o5
/* 0x15d4	     */		mov	162,%o4
/* 0x15d8	     */		ldx	[%sp+2687],%o1
/* 0x15dc	     */		mov	320,%o3
/* 0x15e0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x15e4	     */		mov	%l7,%o0
/* 0x15e8	 852 */		ldx	[%sp+2679],%o2
/* 0x15ec	     */		mov	162,%o3
/* 0x15f0	     */		mov	392,%o5
/* 0x15f4	     */		stx	%o3,[%sp+2223]
/* 0x15f8	     */		ldx	[%sp+2687],%o1
/* 0x15fc	     */		mov	182,%o4
/* 0x1600	     */		mov	320,%o3
/* 0x1604	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1608	     */		mov	%l7,%o0

!  886		      !        XDrawLine(dsp, win, gc, j, 8, j, 12);

/* 0x160c	 886 */		sra	%l4,0,%o3
/* 0x1610	 885 */		ldd	[%sp+2775],%f0

! Registers live out of .L900000332: 
! g2 g3 o3 o5 sp l4 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000328 .L900000332 .L900000767

			.L900000767:
/* 0x1614	 886 */		mov	8,%o4
/* 0x1618	     */		mov	%l7,%o0
/* 0x161c	     */		ldx	[%sp+2703],%o2
/* 0x1620	     */		ldx	[%sp+2711],%o1
/* 0x1624	     */		std	%f0,[%sp+2775]
/* 0x1628	     */		stx	%i1,[%sp+2223]
/* 0x162c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1630	     */		mov	%o3,%o5

!  887		      !        XDrawLine(dsp, win, gc, j, (int)height - 8, j, (int)height - 12);

/* 0x1634	 887 */		sra	%l4,0,%o5
/* 0x1638	     */		sra	%l4,0,%o3
/* 0x163c	     */		ldx	[%sp+2703],%o2
/* 0x1640	     */		ldx	[%sp+2711],%o1
/* 0x1644	     */		mov	1032,%o7
/* 0x1648	 885 */		add	%l4,64,%l4
/* 0x164c	 887 */		stx	%o7,[%sp+2223]
/* 0x1650	     */		mov	1036,%o4
/* 0x1654	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1658	     */		mov	%l7,%o0
/* 0x165c	 885 */		ldd	[%sp+2775],%f0
/* 0x1660	     */		cmp	%l4,1033
/* 0x1664	     */		ble,pt	%icc,.L900000767
/* 0x1668	 886 */		sra	%l4,0,%o3

! Registers live out of .L900000767: 
! g2 g3 o0 o3 o5 sp l4 l7 i1 i2 i5 fp gsr 
! f0 f1 
		
!  888		      !    }
!  889		      !    XFlush(dsp);
!  891		      !    /* vertical minor tic marks at every 16th of the interior viewport
!  892		      !     * drawing area */
!  893		      !    for ( j = offset_y + vbox_h; j < ly; j += vbox_h ){

                       
! predecessor blocks: .L900000767

			.L77002970:
/* 0x166c	 893 */		mov	74,%l5
/* 0x1670	 889 */		call	XFlush	!params=  %o0	!result= 
/* 0x1674	     */		mov	%l7,%o0
/* 0x1678	 893 */		ldd	[%sp+2775],%f0

!  894		      !        XDrawLine(dsp, win, gc, 8, j, 12, j);

/* 0x167c	 894 */		sra	%l5,0,%o4

! Registers live out of .L77002970: 
! g2 g3 o0 o4 sp l5 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002970 .L900000766

			.L900000766:
/* 0x1680	 894 */		mov	12,%o5
/* 0x1684	     */		mov	8,%o3
/* 0x1688	     */		ldx	[%sp+2703],%o2
/* 0x168c	     */		ldx	[%sp+2711],%o1
/* 0x1690	     */		stx	%o4,[%sp+2223]
/* 0x1694	     */		std	%f0,[%sp+2775]
/* 0x1698	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x169c	     */		mov	%l7,%o0

!  895		      !        XDrawLine(dsp, win, gc, (int)width - 8, j, (int)width - 12, j);

/* 0x16a0	 895 */		sra	%l5,0,%o3
/* 0x16a4	     */		sra	%l5,0,%o4
/* 0x16a8	     */		stx	%o3,[%sp+2223]
/* 0x16ac	     */		ldx	[%sp+2703],%o2
/* 0x16b0	     */		ldx	[%sp+2711],%o1
/* 0x16b4	 893 */		add	%l5,64,%l5
/* 0x16b8	 895 */		mov	1032,%o5
/* 0x16bc	     */		mov	1036,%o3
/* 0x16c0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x16c4	     */		mov	%l7,%o0
/* 0x16c8	 893 */		ldd	[%sp+2775],%f0
/* 0x16cc	     */		cmp	%l5,1033
/* 0x16d0	     */		ble,pt	%icc,.L900000766
/* 0x16d4	 894 */		sra	%l5,0,%o4

! Registers live out of .L900000766: 
! g2 g3 o0 o4 sp l5 l7 i2 i5 fp gsr 
! f0 f1 
		
!  896		      !    }
!  897		      !    XFlush(dsp);
!  899		      !    /* now we use the very dark grey color we created */
!  900		      !    XSetForeground(dsp,gc,very_dark_grey.pixel);
!  902		      !    /* draw the vertical lines */
!  903		      !    for ( j= offset_x + vbox_w; j<lx; j+=vbox_w ){

                       
! predecessor blocks: .L900000766

			.L77002972:
/* 0x16d8	 903 */		mov	74,%l3
/* 0x16dc	 897 */		call	XFlush	!params=  %o0	!result= 
/* 0x16e0	     */		mov	%l7,%o0
/* 0x16e4	 900 */		ldx	[%sp+2703],%o1
/* 0x16e8	     */		ldx	[%sp+2863],%o2
/* 0x16ec	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x16f0	     */		mov	%l7,%o0

!  904		      !        XDrawLine(dsp, win, gc, j, 13, j, (int)height - 13);

/* 0x16f4	 904 */		sra	%l3,0,%o3
/* 0x16f8	 903 */		ldd	[%sp+2775],%f0

! Registers live out of .L77002972: 
! g2 g3 o3 o5 sp l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002972 .L900000765

			.L900000765:
/* 0x16fc	 904 */		mov	1031,%l2
/* 0x1700	     */		ldx	[%sp+2703],%o2
/* 0x1704	 903 */		add	%l3,64,%l3
/* 0x1708	 904 */		ldx	[%sp+2711],%o1
/* 0x170c	     */		mov	13,%o4
/* 0x1710	     */		mov	%l7,%o0
/* 0x1714	     */		std	%f0,[%sp+2775]
/* 0x1718	     */		stx	%l2,[%sp+2223]
/* 0x171c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1720	     */		mov	%o3,%o5
/* 0x1724	 903 */		ldd	[%sp+2775],%f0
/* 0x1728	     */		cmp	%l3,1033
/* 0x172c	     */		ble,pt	%icc,.L900000765
/* 0x1730	 904 */		sra	%l3,0,%o3

! Registers live out of .L900000765: 
! g2 g3 o0 o3 o5 sp l7 i2 i5 fp gsr 
! f0 f1 
		
!  905		      !    }
!  907		      !    /* draw the horizontal lines */
!  908		      !    for ( j = offset_y + vbox_h; j<ly; j+=vbox_h ){

                       
! predecessor blocks: .L900000765

			.L77002251:
/* 0x1734	 908 */		mov	74,%l2

!  909		      !        XDrawLine(dsp, win, gc, 13, j, (int)width - 13, j);

/* 0x1738	 909 */		sra	%l2,0,%o4

! Registers live out of .L77002251: 
! g2 g3 o0 o4 sp l2 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002251 .L900000764

			.L900000764:
/* 0x173c	 909 */		ldx	[%sp+2703],%o2
/* 0x1740	 908 */		add	%l2,64,%l2
/* 0x1744	 909 */		mov	1031,%o5
/* 0x1748	     */		ldx	[%sp+2711],%o1
/* 0x174c	     */		mov	13,%o3
/* 0x1750	     */		std	%f0,[%sp+2775]
/* 0x1754	     */		stx	%o4,[%sp+2223]
/* 0x1758	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x175c	     */		mov	%l7,%o0
/* 0x1760	 908 */		ldd	[%sp+2775],%f0
/* 0x1764	     */		cmp	%l2,1033
/* 0x1768	     */		ble,pt	%icc,.L900000764
/* 0x176c	 909 */		sra	%l2,0,%o4

! Registers live out of .L900000764: 
! g2 g3 o0 o4 sp l2 l7 i2 i5 fp gsr 
! f0 f1 
		
!  910		      !    }
!  912		      !    /* gc3 green text as default */
!  913		      !    XSetForeground(dsp, gc3, green.pixel);

                       
! predecessor blocks: .L900000764

			.L77002259:
/* 0x1770	 913 */		ldx	[%sp+2447],%o2
/* 0x1774	     */		ldx	[%sp+2695],%o1

!  915		      !    /* royal blue border around the main viewport */
!  916		      !    XSetForeground(dsp, gc, royal_blue.pixel);
!  917		      !    XDrawLine(dsp, win, gc, 11, 11, (int)width - 11, 11);

/* 0x1778	 917 */		mov	11,%l5

!  918		      !    XDrawLine(dsp, win, gc, (int)width - 11, 11, (int)width - 11, (int)height - 1
!  918		      >0);

/* 0x177c	 918 */		mov	1034,%l6

!  919		      !    XDrawLine(dsp, win, gc, (int)width - 10, (int)height - 10, 10, (int)height - 
!  919		      >10);
!  920		      !    XDrawLine(dsp, win, gc, 10, (int)height - 10, 10, 11);
!  922		      !    XFlush(dsp);
!  924		      !    /* TODO : at the moment the only events we are trapping are
!  925		      !     * the mouse buttons but in the future we will want to redraw
!  926		      !     * and re-expose the window if there other event types */
!  928		      !    XGrabPointer(dsp, win, False, ButtonPressMask, GrabModeAsync,
!  929		      !                           GrabModeAsync, None, None, CurrentTime);
!  931		      !    XSelectInput(dsp, win, ButtonPressMask);
!  933		      !    /* some initial time data before anyone clicks anything */
!  934		      !    clock_gettime(CLOCK_REALTIME, &t0 );
!  935		      !    clock_gettime(CLOCK_REALTIME, &t1 );
!  936		      !    t_delta = timediff( t0, t1 );
!  937		      !    /* this t_delta is a baseline offset value wherein we at least
!  938		      !     * know how long the clock_gettime takes. Mostly. */
!  940		      !    sprintf(buf,"[0000] tdelta = %14" PRIu64 " nsec", t_delta);

/* 0x1780	 940 */		sethi	%gdop_hix22(.L309),%i4
/* 0x1784	 913 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1788	     */		mov	%l7,%o0
/* 0x178c	 916 */		ldx	[%sp+2703],%o1
/* 0x1790	     */		ldx	[%sp+2847],%o2
/* 0x1794	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1798	     */		mov	%l7,%o0
/* 0x179c	 917 */		ldx	[%sp+2711],%o1
/* 0x17a0	     */		ldx	[%sp+2703],%o2
/* 0x17a4	     */		mov	1033,%o5
/* 0x17a8	     */		mov	11,%o4
/* 0x17ac	     */		stx	%l5,[%sp+2223]
/* 0x17b0	     */		mov	11,%o3
/* 0x17b4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x17b8	     */		mov	%l7,%o0
/* 0x17bc	 918 */		ldx	[%sp+2703],%o2
/* 0x17c0	     */		mov	1033,%o5
/* 0x17c4	     */		ldx	[%sp+2711],%o1
/* 0x17c8	     */		mov	11,%o4
/* 0x17cc	     */		stx	%l6,[%sp+2223]
/* 0x17d0	     */		mov	1033,%o3
/* 0x17d4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x17d8	     */		mov	%l7,%o0
/* 0x17dc	 919 */		ldx	[%sp+2703],%o2
/* 0x17e0	     */		ldx	[%sp+2711],%o1
/* 0x17e4	     */		mov	10,%o5
/* 0x17e8	     */		mov	1034,%o4
/* 0x17ec	     */		stx	%l6,[%sp+2223]
/* 0x17f0	     */		mov	1034,%o3
/* 0x17f4	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x17f8	     */		mov	%l7,%o0
/* 0x17fc	 920 */		ldx	[%sp+2703],%o2
/* 0x1800	     */		ldx	[%sp+2711],%o1
/* 0x1804	     */		mov	10,%o5
/* 0x1808	     */		mov	1034,%o4
/* 0x180c	     */		stx	%l5,[%sp+2223]
/* 0x1810	     */		mov	10,%o3
/* 0x1814	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1818	     */		mov	%l7,%o0
/* 0x181c	 922 */		call	XFlush	!params=  %o0	!result= 
/* 0x1820	     */		mov	%l7,%o0
/* 0x1824	 929 */		ldx	[%sp+2711],%o1
/* 0x1828	     */		mov	1,%o5
/* 0x182c	     */		mov	1,%o4
/* 0x1830	     */		mov	4,%o3
/* 0x1834	     */		stx	%g0,[%sp+2223]
/* 0x1838	     */		stx	%g0,[%sp+2231]
/* 0x183c	     */		mov	0,%o2
/* 0x1840	     */		stx	%g0,[%sp+2239]
/* 0x1844	     */		call	XGrabPointer	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223 %sp+2231 %sp+2239	!result= 
/* 0x1848	     */		mov	%l7,%o0
/* 0x184c	 931 */		ldx	[%sp+2711],%o1
/* 0x1850	     */		mov	4,%o2
/* 0x1854	     */		call	XSelectInput	!params=  %o0 %o1 %o2	!result= 
/* 0x1858	     */		mov	%l7,%o0
/* 0x185c	 934 */		add	%sp,2575,%o1
/* 0x1860	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x1864	     */		mov	3,%o0
/* 0x1868	 935 */		add	%sp,2543,%o1
/* 0x186c	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x1870	     */		mov	3,%o0
/* 0x1874	 936 */		ldx	[%sp+2543],%o2
/* 0x1878	     */		ldx	[%sp+2575],%o0
/* 0x187c	     */		ldx	[%sp+2583],%o1
/* 0x1880	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x1884	     */		ldx	[%sp+2551],%o3
/* 0x1888	 940 */		ldx	[%sp+2399],%g4
/* 0x188c	     */		xor	%i4,%gdop_lox10(.L309),%o7
/* 0x1890	 936 */		mov	%o0,%o2
/* 0x1894	 940 */		ldx	[%g4+%o7],%o1,%gdop(.L309)
/* 0x1898	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x189c	     */		ldx	[%sp+2647],%o0

!  941		      !    XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));

/* 0x18a0	 941 */		ldx	[%sp+2647],%g5
/* 0x18a4	     */		ldub	[%g5],%l6

! Registers live out of .L77002259: 
! g2 g3 g5 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002259 .L900000323

			.L900000763:
/* 0x18a8	 941 */		brz,pn	%l6,.L900000324
/* 0x18ac	     */		add	%g5,1,%g5

! Registers live out of .L900000763: 
! g2 g3 g5 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000763

			.L900000323:
/* 0x18b0	 941 */		ldub	[%g5],%i3
/* 0x18b4	     */		add	%g5,1,%g5
/* 0x18b8	     */		brnz,a,pt	%i3,.L900000763
/* 0x18bc	     */		ldub	[%g5],%l6

! Registers live out of .L900000323: 
! g2 g3 g5 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000323 .L900000763

			.L900000324:
/* 0x18c0	 941 */		ldx	[%sp+2647],%o5
/* 0x18c4	     */		sub	%g5,1,%i1
/* 0x18c8	     */		ldx	[%sp+2719],%o1
/* 0x18cc	     */		mov	20,%o4
/* 0x18d0	     */		ldx	[%sp+2695],%o2
/* 0x18d4	     */		mov	10,%o3
/* 0x18d8	     */		sub	%i1,%o5,%i0
/* 0x18dc	     */		sra	%i0,0,%o7
/* 0x18e0	     */		stx	%o7,[%sp+2223]
/* 0x18e4	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x18e8	     */		mov	%l7,%o0

!  943		      !    /* TODO
!  944		      !     * someday we are going to provide zoom controls and colour edit
!  945		      !     * controls and need to bounce way back up here and setup a
!  946		      !     * whole new plot globally. For now we are going to get our threads
!  947		      !     * setup. */
!  948		      !    thread_parm *parm[MAX_THREADS];
!  949		      !    errno = 0;

/* 0x18ec	 949 */		call	___errno	!params= 	!result=  %o0
/* 0x18f0	     */		nop

!  951		      !    for ( pt = 0; pt < pthread_limit; pt++ ){

/* 0x18f4	 951 */		ld	[%sp+2275],%o1
/* 0x18f8	     */		ldd	[%sp+2775],%f0
/* 0x18fc	     */		cmp	%o1,0
/* 0x1900	     */		bg,pn	%icc,.L77003086
/* 0x1904	 949 */		st	%g0,[%o0]

! Registers live out of .L900000324: 
! g2 g3 o0 sp l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000324

			.L77003390:
/* 0x1908	 268 */		st	%g0,[%sp+2283]
/* 0x190c	     */		ba	.L900000762
/* 0x1910	 128 */		st	%g0,[%sp+2295]

! Registers live out of .L77003390: 
! g2 g3 o0 sp l7 i2 i5 fp gsr 
! f0 f1 
		
!  952		      !        parm[pt] = calloc( (size_t) 1, (size_t) sizeof(thread_parm) );
!  953		      !        if ( parm[pt] == NULL ) {

                       
! predecessor blocks: .L900000324

			.L77003086:
/* 0x1914	 953 */		std	%f0,[%sp+2775]

!  954		      !            if ( errno == ENOMEM ) {
!  955		      !                fprintf(stderr,"FAIL : calloc ENOMEM at %s:%d\n", __FILE__, __LIN
!  955		      >E__ );
!  956		      !            } else {
!  957		      !                fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE
!  957		      >__ );
!  958		      !            }
!  960		      !            perror("FAIL ");
!  962		      !            /* free up the big arrays */
!  963		      !            free(mandel_val);
!  964		      !            mandel_val = NULL;
!  965		      !            free(coord_r);
!  966		      !            coord_r = NULL;
!  967		      !            free(coord_j);
!  968		      !            coord_j = NULL;
!  970		      !            /* now free up the previously allocated parm[k] if they
!  971		      !             * exist */
!  972		      !            if ( pt > 0 ) {
!  973		      !                for ( q=pt-1; q>=0; --q ) {
!  974		      !                    free(parm[q]);
!  975		      !                    parm[q] = NULL;
!  976		      !                }
!  977		      !            }
!  979		      !            return EXIT_FAILURE;
!  981		      !        }
!  982		      !    }
!  984		      !    /* TODO at some point check for why we are fetching the x and y
!  985		      !     * values over and over and over inside the switch-case */
!  986		      !    while(1){
!  988		      !        XNextEvent(dsp,&event);
!  989		      !        /* in the future this will not be wise
!  990		      !         * if we track mouse drags */
!  991		      !        mouse_x=event.xbutton.x;
!  992		      !        mouse_y=event.xbutton.y;
!  994		      !        switch(event.type){
!  995		      !            case ButtonPress:
!  996		      !                switch(event.xbutton.button){
!  997		      !                    case Button1: /* left mouse button */
!  998		      !                        button=Button1;
!  999		      !                        left_count += 1;
! 1000		      !                        break;
! 1002		      !                    case Button2: /* middle mouse scroll button */
! 1003		      !                        button=Button2;
! 1004		      !                        mid_count += 1;
! 1005		      !                        break;
! 1007		      !                    case Button3: /* right mouse button */
! 1008		      !                        button=Button3;
! 1009		      !                        right_count += 1;
! 1010		      !                        break;
! 1012		      !                    case Button4: /* mouse scroll wheel up */
! 1013		      !                        button=Button4;
! 1014		      !                        roll_up += 1;
! 1015		      !                        break;
! 1017		      !                    case Button5: /* mouse scroll wheel down */
! 1018		      !                        button=Button5;
! 1019		      !                        roll_dn += 1;
! 1020		      !                        break;
! 1022		      !                    default:
! 1023		      !                        break;
! 1024		      !                }
! 1025		      !            break;
! 1026		      !        default:
! 1027		      !            break;
! 1028		      !        }
! 1030		      !        mouse_x_raw = mouse_x;
! 1031		      !        mouse_y_raw = mouse_y;
! 1032		      !        XSetForeground(dsp, gc3, red.pixel);
! 1033		      !        sprintf(buf,"raw  [ %-4i , %-4i ]", mouse_x_raw, mouse_y_raw);
! 1034		      !        fprintf(stderr,"%s\n", buf);
! 1035		      !        XDrawImageString( dsp, win3, gc3, 10, 40, buf, (int)strlen(buf));
! 1037		      !        /* jank adjustment of one or two pixels
! 1038		      !         * we see that the arrow tip of the
! 1039		      !         * mouse cursor seems to be off by a little
! 1040		      !         * figgle smush these numbers a little
! 1041		      !         * and also we keep the mouse_x_raw and mouse_y_raw data */
! 1042		      !        mouse_x = mouse_x - 1;
! 1043		      !        mouse_y = mouse_y - 2;
! 1045		      !        /* check left mouse button first */
! 1046		      !        if ( button == Button1 ){
! 1047		      !            /* are we inside the main plot region? */
! 1048		      !            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
! 1049		      !                 && ( mouse_x < ( eff_width + offset_x ) )
! 1050		      !                 && ( mouse_y < ( eff_height + offset_y ) ) ) {
! 1052		      !                /* invert the y axis because X11 is upside down */
! 1053		      !                invert_mouse_y = eff_height - mouse_y + offset_y;
! 1055		      !                sample_r = ( mouse_x - offset_x );
! 1056		      !                sample_j = invert_mouse_y;
! 1058		      !                fp_region(sample_r, sample_j, eff_width, eff_height, &coord);
! 1059		      !                win_r = coord.r;
! 1060		      !                win_j = coord.j;
! 1062		      !                XSetForeground(dsp, gc2, green.pixel);
! 1064		      !                /* a useful value is the vbox coordinates for
! 1065		      !                 * each of the 16x16 grid we previously laid out.
! 1066		      !                 * Since these are all integers we don't need to
! 1067		      !                 * care about rounding or fractional results. */
! 1068		      !                vbox_r = ( mouse_x - offset_x ) / vbox_w;
! 1069		      !                vbox_j = ( eff_height - mouse_y + offset_y ) / vbox_h;
! 1070		      !                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_r, vbox_j );
! 1071		      !                fprintf(stderr,"%s\n", buf);
! 1072		      !                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf))
! 1072		      >;
! 1074		      !                XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1075		      !                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )", win_r, win_j );
! 1076		      !                XDrawImageString(dsp, win2, gc2, 10, 290, buf, (int)strlen(buf));
! 1077		      !                printf("fp64( %-+32.26e,\n      %-+32.26e )\n", win_r, win_j );
! 1079		      !                /* At this moment we have normalized values for a
! 1080		      !                 * location within the observation viewport. We can
! 1081		      !                 * scale those values by half of the viewport width
! 1082		      !                 * and height to get actual x_prime and y_prime
! 1083		      !                 * values.
! 1084		      !                 */
! 1086		      !                /* translation and offset into the centre of a sample region */
! 1087		      !                fp_translate(win_r, win_j, magnify, real_translate, imag_translat
! 1087		      >e, &coord);
! 1089		      !                x_prime = coord.r;
! 1090		      !                y_prime = coord.j;
! 1092		      !                printf("c = ( %-+32.26e,\n      %-+32.26e )\n", x_prime, y_prime 
! 1092		      >);
! 1094		      !                XSetForeground(dsp, gc3, red.pixel);
! 1095		      !                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime 
! 1095		      >);
! 1096		      !                XDrawImageString(dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));
! 1098		      !                XSetForeground(dsp, gc3, green.pixel);
! 1099		      !                sprintf(buf,"bailout = %-8i with a pthread_limit = %-3i", mand_ba
! 1099		      >il, pthread_limit);
! 1100		      !                XDrawImageString(dsp, win3, gc3, 10, 100, buf, (int)strlen(buf));
! 1102		      !                sprintf(buf,"magnify = %-12.10e", magnify);
! 1103		      !                XDrawImageString(dsp, win3, gc3, 10, 120, buf, (int)strlen(buf));
! 1105		      !                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, i
! 1105		      >mag_translate);
! 1106		      !                XDrawImageString(dsp, win3, gc3, 10, 140, buf, (int)strlen(buf));
! 1108		      !                /* what is the real and imaginary axi pixel width which
! 1109		      !                 * gets used by the physical screen ? */
! 1110		      !                pixel_real_width = obs_real / (double)eff_width;
! 1111		      !                printf("pixel_real_w = %-+32.26e\n",pixel_real_width);
! 1112		      !                sprintf(buf,"pixel_real_w = %-+16.12e",pixel_real_width);
! 1113		      !                XDrawImageString(dsp, win3, gc3, 10, 180, buf, (int)strlen(buf));
! 1115		      !                pixel_imag_height = obs_imag / (double)eff_height;
! 1116		      !                printf("pixel_imag_h = %-+32.26e\n",pixel_imag_height);
! 1117		      !                sprintf(buf,"pixel_imag_h = %-+16.12e",pixel_imag_height);
! 1118		      !                XDrawImageString(dsp, win3, gc3, 10, 200, buf, (int)strlen(buf));
! 1120		      !                XSetForeground(dsp, gc3, cyan.pixel);
! 1122		      !                /* time the computation before we dispatch a thread */
! 1123		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );
! 1125		      !                /* TODO : perhaps accept another CLI argv flag to determine
! 1126		      !                 *        if we always do the computation here or not.
! 1127		      !                 *        That is to say, do we always recompute the data in
! 1128		      !                 *        a selected vbox regardless if we have already done
! 1129		      !                 *        the whole process before, either globally or with
! 1130		      !                 *        a single left mouse click.
! 1131		      !                 *
! 1132		      !                 * The key issue here is should we redo the computation if the
! 1133		      !                 * data already exists in the vbox? It is quite normal to paint
! 1134		      !                 * the entire screen first and thus every vbox_flag[][] will be
! 1135		      !                 * set to 1 as already computed. Therefore doing a dispatch of
! 1136		      !                 * a pile of threads to redo the computation serves no purpose
! 1137		      !                 * other then to grind the gears and get a timing report.
! 1138		      !                 *
! 1139		      !                 * Therefore we may use the strange conditional here of
! 1140		      !                 *     ( 1 || ( vbox_flag[vbox_r][vbox_j] == 0 ) )
! 1141		      !                 * which will forever be true. Thus we grind the gears and do
! 1142		      !                 * the thread dispatch every time.
! 1143		      !                 *
! 1144		      !                 * 22 Jun 2022 :
! 1145		      !                 * Sadly the threads are doing the wrong computation. At this
! 1146		      !                 * time.
! 1147		      !                 */
! 1148		      !                if ( vbox_flag[vbox_r][vbox_j] == 0 ) {
! 1149		      !                    for ( pt = 0; pt < pthread_limit; pt++ ) {
! 1150		      !                        parm[pt]->t_num = pt;
! 1151		      !                        parm[pt]->t_total = pthread_limit;
! 1152		      !                        parm[pt]->r_translate = real_translate;
! 1153		      !                        parm[pt]->i_translate = imag_translate;
! 1154		      !                        parm[pt]->magnify = magnify;
! 1155		      !                        parm[pt]->obs_real = obs_real;
! 1156		      !                        parm[pt]->obs_imag = obs_imag;
! 1157		      !                        parm[pt]->vbox_r = vbox_r;
! 1158		      !                        parm[pt]->vbox_j = vbox_j;
! 1159		      !                        parm[pt]->eff_width = eff_width;
! 1160		      !                        parm[pt]->eff_height = eff_height;
! 1161		      !                        parm[pt]->vbox_w = vbox_w;
! 1162		      !                        parm[pt]->vbox_h = vbox_h;
! 1163		      !                        parm[pt]->bail_out = mand_bail;
! 1165		      !                        /* pass along a pointer to where we want a result integer
! 1165		      > */
! 1166		      !                        parm[pt]->mandel_val = mandel_val;
! 1168		      !                        /* we also want the complex plane coordinates */
! 1169		      !                        parm[pt]->coord_r = coord_r;
! 1170		      !                        parm[pt]->coord_j = coord_j;
! 1171		      !                        parm[pt]->ret_val = 0;
! 1173		      !                        pthread_create( &tid[pt], NULL, mbrot_vbox_pthread, (void
! 1173		      > *)parm[pt] );
! 1174		      !                        /* TODO at some point maybe check the pthread_create err 
! 1174		      >status
! 1175		      !                         *
! 1176		      !                         * The pthread_create() function can return any of the fo
! 1176		      >llowing errors:
! 1177		      !                         *
! 1178		      !                         * [ENOMEM]  The system lacked the necessary resources to
! 1178		      > create
! 1179		      !                         *           another thread.
! 1180		      !                         *
! 1181		      !                         * [EAGAIN]  The system-imposed limit on the total number
! 1181		      > of
! 1182		      !                         *           threads in a process [PTHREAD_THREADS_MAX] w
! 1182		      >ould be
! 1183		      !                         *           exceeded.
! 1184		      !                         *
! 1185		      !                         * [EAGAIN]  The RACCT_NTHR limit would be exceeded; see 
! 1185		      >racct(2).
! 1186		      !                         *
! 1187		      !                         * [EPERM]   The caller does not have permission to set t
! 1187		      >he
! 1188		      !                         *           scheduling parameters or scheduling policy.
! 1189		      !                         *
! 1190		      !                         * [EINVAL]  A value specified by attr is invalid.
! 1191		      !                         *
! 1192		      !                         * [EDEADLK] The CPU set specified by attr would prevent 
! 1192		      >the thread
! 1193		      !                         *           from running on any CPU.
! 1194		      !                         *
! 1195		      !                         * [EFAULT]  The stack base specified by attr is invalid,
! 1195		      > or the
! 1196		      !                         *           kernel was unable to put required initial da
! 1196		      >ta on the
! 1197		      !                         *           stack.
! 1198		      !                         */
! 1199		      !                    }
! 1200		      !                    /* Blocking call here to gather up all the threads */
! 1201		      !                    for ( pt = 0; pt < pthread_limit; pt++ ) {
! 1202		      !                        pthread_join( tid[pt], NULL );
! 1203		      !                        printf("PTHRD: join %i done\n", pt);
! 1204		      !                    }
! 1205		      !                    vbox_flag[vbox_r][vbox_j] = 1;
! 1206		      !                }
! 1207		      !                clock_gettime(CLOCK_REALTIME, &soln_t1 );
! 1209		      !                t_delta = timediff( soln_t0, soln_t1 );
! 1210		      !                sprintf(buf,"[join] = %14" PRIu64 " nsec   %08.6e sec", t_delta, 
! 1210		      >((double)t_delta)/1.0e9);
! 1211		      !                fprintf(stderr,"%s\n",buf);
! 1212		      !                XSetForeground(dsp, gc3, magenta.pixel);
! 1213		      !                XDrawImageString( dsp, win3, gc3, 10, 270, buf, (int)strlen(buf))
! 1213		      >;
! 1215		      !                for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix++ ) {
! 1216		      !                    vbox_ll_y = vbox_j * vbox_h + mand_y_pix;
! 1217		      !                    sample_j = vbox_ll_y;
! 1218		      !                    for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x_pix++ ) {
! 1219		      !                        vbox_ll_x = vbox_r * vbox_w + mand_x_pix;
! 1220		      !                        sample_r = vbox_ll_x;
! 1222		      !                        /* use the data returned by the thread computation */
! 1223		      !                        mand_height = mandel_val[array_offset(vbox_r,vbox_j,mand_
! 1223		      >x_pix,mand_y_pix)];
! 1225		      !                        if ( mand_height == mand_bail ) {
! 1226		      !                            /* really we should use the color Black for portable 
! 1226		      >stuff */
! 1227		      !                            XSetForeground(dsp, gc, (unsigned long)0 );
! 1228		      !                        } else {
! 1229		      !                            mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand_height 
! 1229		      >& 0xff) ];
! 1230		      !                            XSetForeground(dsp, gc, mandlebrot.pixel);
! 1231		      !                        }
! 1233		      !                        /* plot onto the main plot graphics context gc */
! 1234		      !                        XDrawPoint(dsp, win, gc,
! 1235		      !                                   vbox_ll_x + offset_x,
! 1236		      !                                   ( eff_height - vbox_ll_y + offset_y ) );
! 1238		      !                        /* A few manual offsets of ( 16, 13 ) pixels to centre th
! 1238		      >e
! 1239		      !                         * plot data into a subwindow of gc2 */
! 1240		      !                        gc2_x = 16 + ( 3 * mand_x_pix );
! 1241		      !                        gc2_y = 13 + ( 192 - ( 3 * mand_y_pix ) );
! 1243		      !                        /* walk around the samples clock wise and begin with
! 1244		      !                         * offset the real coord by one third of pixel width */
! 1245		      !                        for ( p = 0; p < 3; p++ ) {
! 1246		      !                            for ( q = 0; q < 3; q++ ) {
! 1248		      !                                /* coordinates of the sub-sample location */
! 1249		      !                                sub_pixel_real = coord_r[array_offset(vbox_r,vbox
! 1249		      >_j,mand_x_pix,mand_y_pix)]
! 1250		      !                                                 + ( p - 1 ) * pixel_real_width /
! 1250		      > 3.0;
! 1252		      !                                sub_pixel_imag = coord_j[array_offset(vbox_r,vbox
! 1252		      >_j,mand_x_pix,mand_y_pix)]
! 1253		      !                                                 - ( q - 1 ) * pixel_imag_height 
! 1253		      >/ 3.0;
! 1255		      !                                sub_pixel_mand_height = mbrot(sub_pixel_real, sub
! 1255		      >_pixel_imag, mand_bail);
! 1257		      !                                /* TODO this has me mystified why it does not wor
! 1257		      >k
! 1258		      !                                if ((p!=1)&&(q!=1)) {
! 1259		      !                                    mand_height = mbrot(sub_pixel_real, sub_pixel
! 1259		      >_imag, mand_bail);
! 1260		      !                                } else {
! 1261		      !                                    mand_height = mandel_val[vbox_r][vbox_j][mand
! 1261		      >_x_pix][mand_y_pix];
! 1262		      !                                } */
! 1264		      !                                if ( sub_pixel_mand_height == mand_bail ) {
! 1265		      !                                    XSetForeground(dsp, gc2, (unsigned long)0 );
! 1266		      !                                } else {
! 1267		      !                                    /* trivial color */
! 1268		      !                                    mandlebrot.pixel = lsd_trippy[ (uint8_t)(sub_
! 1268		      >pixel_mand_height & 0xff) ];
! 1269		      !                                    XSetForeground(dsp, gc2, mandlebrot.pixel);
! 1270		      !                                }
! 1272		      !                                XDrawPoint( dsp, win2, gc2, gc2_x + p, gc2_y + q 
! 1272		      >);
! 1273		      !                            }
! 1274		      !                        }
! 1275		      !                    }
! 1276		      !                }
! 1278		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );
! 1280		      !                t_delta = timediff( soln_t1, soln_t0 );
! 1281		      !                sprintf(buf,"[plot] = %14" PRIu64 " nsec   %08.6e sec", t_delta, 
! 1281		      >((double)t_delta)/1.0e9);
! 1282		      !                fprintf(stderr,"%s\n",buf);
! 1283		      !                XSetForeground(dsp, gc3, green.pixel);
! 1284		      !                XDrawImageString( dsp, win3, gc3, 10, 290, buf, (int)strlen(buf))
! 1284		      >;
! 1286		      !            } else {
! 1288		      !                /* We need to locate the mouse in graphics context gc2 and here
! 1289		      !                 * the raw values for mouse position serve correctly. Thus the
! 1290		      !                 * question is are we inside the top jank slider for magnify ? */
! 1291		      !                if (   ( mouse_x_raw > 1268 ) && ( mouse_y_raw > 733 )
! 1292		      !                    && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < 742 ) ) {
! 1294		      !                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter
! 1294		      >);
! 1295		      !                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
! 1296		      !                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);
! 1298		      !                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter
! 1298		      >);
! 1299		      !                    /*
! 1300		      !                    XSetForeground(dsp, gc2, yellow.pixel);
! 1301		      !                    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);
! 1302		      !                    */
! 1304		      !                    /* horizontal midline */
! 1305		      !                    XSetForeground(dsp, gc2, green.pixel);
! 1306		      !                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);
! 1308		      !                    /* The slider shall have 21 possible positions where
! 1309		      !                     * they map to the values -10 upwards to positive 10.
! 1310		      !                     * These values in turn are used to select a factor
! 1311		      !                     * to modify the magnify value from 2^(-10) upwards
! 1312		      !                     * to 2^10 == 1024 which would be a reasonable upper
! 1313		      !                     * limit given the whole plotting surface is 1024^2.
! 1314		      !                     *
! 1315		      !                     * We did start with an initial value of 10 which maps
! 1316		      !                     * to the centre position at the zero spot.
! 1317		      !                     *
! 1318		      !                     * Let's draw the 21 possible locations on the scale.
! 1319		      !                     */
! 1320		      !                    XSetForeground(dsp, gc2, cyan.pixel);
! 1321		      !                    for ( j = 0; j<21; j++ ) {
! 1322		      !                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13,
! 1323		      !                                                  5 + 218 + 8 * j, 20 );
! 1324		      !                    }
! 1325		      !                    /* what is the current magnify_jank value ? */
! 1326		      !                    XSetForeground(dsp, gc2, red.pixel);
! 1327		      !                    XDrawLine(dsp, win2, gc2,
! 1328		      !                                           5 + 218 + 8 * magnify_jank, 13,
! 1329		      !                                           5 + 218 + 8 * magnify_jank, 20 );
! 1331		      !                    /* we know from direct tests that the centre line
! 1332		      !                     * is at 1354 raw mouse X and every tick mark left
! 1333		      !                     * or right with be 8 pixels away. */
! 1334		      !                    magnify_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 ) 
! 1334		      >/ 8);
! 1336		      !                    XDrawLine(dsp, win2, gc2,
! 1337		      !                                           4 + 218 + 8 * magnify_jank_in, 13,
! 1338		      !                                           4 + 218 + 8 * magnify_jank_in, 20 );
! 1340		      !                    XDrawLine(dsp, win2, gc2,
! 1341		      !                                           5 + 218 + 8 * magnify_jank_in, 13,
! 1342		      !                                           5 + 218 + 8 * magnify_jank_in, 20 );
! 1344		      !                    XDrawLine(dsp, win2, gc2,
! 1345		      !                                           6 + 218 + 8 * magnify_jank_in, 13,
! 1346		      !                                           6 + 218 + 8 * magnify_jank_in, 20 );
! 1348		      !                    XSetForeground(dsp, gc2, magenta.pixel);
! 1349		      !                    XDrawLine(dsp, win2, gc2,
! 1350		      !                                           5 + 218 + 8 * magnify_jank, 13,
! 1351		      !                                           5 + 218 + 8 * magnify_jank, 20 );
! 1353		      !                    magnify_factor = pow ( 2.0, magnify_jank_in - 10 );
! 1355		      !                    XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1356		      !                    sprintf(buf,"f(%-+2i) = %-9.5e  ",
! 1357		      !                                                 magnify_jank_in - 10,
! 1358		      !                                                 magnify_factor );
! 1360		      !                    XDrawImageString( dsp, win2, gc2, 215, 40, buf, (int)strlen(b
! 1360		      >uf));
! 1362		      !                    magnify_jank = magnify_jank_in;
! 1364		      !                    XFlush(dsp);
! 1366		      !                } else if ( ( mouse_x_raw > 1268 ) && ( mouse_y_raw > ( 733 + 50 
! 1366		      >) )
! 1367		      !                         && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < ( 742 + 50 
! 1367		      >) ) ) {
! 1369		      !                    /* we should be inside the janky bail_out control */
! 1370		      !                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter
! 1370		      >);
! 1371		      !                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
! 1372		      !                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);
! 1374		      !                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter
! 1374		      >);
! 1376		      !                    /* yellow horizontal midline */
! 1377		      !                    XSetForeground(dsp, gc2, yellow.pixel);
! 1378		      !                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);
! 1380		      !                    XSetForeground(dsp, gc2, cyan.pixel);
! 1381		      !                    for ( j = 0; j<21; j++ ) {
! 1382		      !                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13 + 50,
! 1383		      !                                                  5 + 218 + 8 * j, 20 + 50 );
! 1384		      !                    }
! 1385		      !                    /* what is the current bail_out_jank value ? */
! 1386		      !                    XSetForeground(dsp, gc2, red.pixel);
! 1387		      !                    XDrawLine(dsp, win2, gc2,
! 1388		      !                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
! 1389		      !                                           5 + 218 + 8 * bail_out_jank, 20 + 50 )
! 1389		      >;
! 1391		      !                    /* same as above where we did tests to locate the centre
! 1392		      !                     * and then hack along from there.  */
! 1393		      !                    bail_out_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 )
! 1393		      > / 8);
! 1395		      !                    XDrawLine(dsp, win2, gc2,
! 1396		      !                                           4 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1396		      >0,
! 1397		      !                                           4 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1397		      >0 );
! 1399		      !                    XDrawLine(dsp, win2, gc2,
! 1400		      !                                           5 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1400		      >0,
! 1401		      !                                           5 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1401		      >0 );
! 1403		      !                    XDrawLine(dsp, win2, gc2,
! 1404		      !                                           6 + 218 + 8 * bail_out_jank_in, 13 + 5
! 1404		      >0,
! 1405		      !                                           6 + 218 + 8 * bail_out_jank_in, 20 + 5
! 1405		      >0 );
! 1407		      !                    XSetForeground(dsp, gc2, magenta.pixel);
! 1408		      !                    XDrawLine(dsp, win2, gc2,
! 1409		      !                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
! 1410		      !                                           5 + 218 + 8 * bail_out_jank, 20 + 50 )
! 1410		      >;
! 1412		      !                    bail_out_factor = pow ( 2.0, bail_out_jank_in - 10 );
! 1413		      !                    /* perform a test to ensure that the bail_out never falls
! 1414		      !                     * below 256 */
! 1415		      !                    if ( ( (double)mand_bail * bail_out_factor ) < 256.0 ) {
! 1417		      !                        bail_out_factor = 1.0;
! 1418		      !                        XSetForeground(dsp, gc2, red.pixel);
! 1419		      !                        sprintf(buf,"  factor set to 1  ");
! 1420		      !                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
! 1421		      !                                          buf, (int)strlen(buf));
! 1423		      !                        /* force the bail_out jank to mid-point wherein
! 1424		      !                         * the bail_out_factor is 2^0 == 1 of course */
! 1425		      !                        bail_out_jank = 10;
! 1427		      !                    } else {
! 1429		      !                        XSetForeground(dsp, gc2, green.pixel);
! 1430		      !                        sprintf(buf,"f(%-+2i) = %-9.5e  ",
! 1431		      !                                                 bail_out_jank_in - 10,
! 1432		      !                                                 bail_out_factor );
! 1434		      !                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
! 1435		      !                                          buf, (int)strlen(buf));
! 1437		      !                        bail_out_jank = bail_out_jank_in;
! 1439		      !                    }
! 1441		      !                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 915 )
! 1442		      !                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 932 )
! 1443		      !                             && ( ( x_prime + 8.0 ) > EPSILON )
! 1444		      !                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {
! 1446		      !                    /* The above is a janky EPSILON check which verifies
! 1447		      !                     * the mouse location is inside the REPLOT button
! 1448		      !                     * window area.
! 1449		      !                     *
! 1450		      !                     * Also verify x_prime and y_prime are NOT the initial
! 1451		      !                     *     impossible values ( -8.0, -8.0 )
! 1452		      !                     */
! 1454		      !                    if ( replot_flag == 0 ) {
! 1455		      !                        /* we need that button to be double clicked so
! 1456		      !                         * at this time we flip the button to yellow warning stat
! 1456		      >us */
! 1457		      !                        XSetForeground(dsp, gc2, yellow.pixel);
! 1458		      !                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
! 1459		      !                        sprintf(buf,">REPLOT<");
! 1460		      !                        XDrawImageString( dsp, win2, gc2, 324, 207, buf, (int)str
! 1460		      >len(buf));
! 1461		      !                        replot_flag = 1;
! 1463		      !                    } else {
! 1464		      !                        /* we are confirmed. Switch the replot button back to
! 1465		      !                         * red and actually replot
! 1466		      !                         *
! 1467		      !                         * however we need to adjust the magnify as well as
! 1468		      !                         * other factors
! 1469		      !                         *
! 1470		      !                         * So now we have bail_out_jank and we need to trap for
! 1471		      !                         * strange values.
! 1472		      !                         */
! 1473		      !                        XSetForeground(dsp, gc2, cyan.pixel);
! 1474		      !                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
! 1475		      !                        sprintf(buf," REPLOT ");
! 1476		      !                        XDrawImageString(dsp, win2, gc2, 324, 207, buf, (int)strl
! 1476		      >en(buf));
! 1477		      !                        replot_flag = 0;
! 1478		      !                        /* we now need to figure out what minimal stuff we can do
! 1478		      > to
! 1479		      !                         * actually get a replot at the selected center and with
! 1480		      !                         * the magnify_factor * whatever the current magnify is *
! 1480		      >/
! 1482		      !                        mouse_x = 512;   /* try to be dead center */
! 1483		      !                        mouse_y = 518;   /* after a hokey adjustment */
! 1485		      !                        mand_bail = (uint32_t)((double)mand_bail * bail_out_facto
! 1485		      >r);
! 1486		      !                        fprintf(stderr,"INFO : mand_bail changed to %" PRIu32 "\n
! 1486		      >", mand_bail);
! 1488		      !                        magnify *= magnify_factor;
! 1489		      !                        fprintf(stderr,"INFO : magnify changed to %-+16.10e\n", m
! 1489		      >agnify);
! 1490		      !                        obs_real = 4.0 / magnify;
! 1491		      !                        obs_imag = 4.0 / magnify;
! 1493		      !                        colour_method_flag = 1;
! 1494		      !                        invert_me_dammit = 0;
! 1496		      !                        button = Button2;
! 1498		      !                        /* trigger a recalc and thus flush vbox_flag to zero */
! 1499		      !                        memset( &vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_I
! 1499		      >MAG_COUNT)*sizeof(int));
! 1501		      !                        real_translate = x_prime;
! 1502		      !                        imag_translate = y_prime;
! 1503		      !                        fprintf(stderr,"INFO : c = %-+16.12e, %-+16.12e  ", x_pri
! 1503		      >me, y_prime);
! 1505		      !                        /* flush away all the data we computed before */
! 1506		      !                        for ( vbox_r=0; vbox_r<VBOX_REAL_COUNT; vbox_r++ ) {
! 1507		      !                            for ( vbox_j=0; vbox_j<VBOX_IMAG_COUNT; vbox_j++ ) {
! 1508		      !                                vbox_flag[vbox_r][vbox_j] = 0;
! 1509		      !                            }
! 1510		      !                        }
! 1512		      !                        goto replot;
! 1514		      !                    }
! 1516		      !                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 885 )
! 1517		      !                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 903 )
! 1518		      !                             && ( ( x_prime + 8.0 ) > EPSILON )
! 1519		      !                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {
! 1521		      !                    /* The above is a janky EPSILON check which verifies
! 1522		      !                     * the mouse location is inside the DUMPER button
! 1523		      !                     * window area.
! 1524		      !                     *
! 1525		      !                     * Also verify x_prime and y_prime are NOT the initial
! 1526		      !                     *     impossible values ( -8.0, -8.0 )
! 1527		      !                     */
! 1529		      !                    if ( dumper_flag > -1 ) {
! 1531		      !                        if ( dumper_flag == 0 ) {
! 1532		      !                            /* we need that button to be double clicked so
! 1533		      !                             * at this time we flip the button to cornflowerblue 
! 1533		      >*/
! 1534		      !                            XSetForeground(dsp, gc2, cornflowerblue.pixel);
! 1535		      !                            XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
! 1536		      !                            sprintf(buf,">DUMPER<");
! 1537		      !                            XDrawImageString( dsp, win2, gc2, 324, 177, buf, (int
! 1537		      >)strlen(buf));
! 1538		      !                            sprintf(buf,"Confirm ? ");
! 1539		      !                            XSetForeground(dsp, gc2, green.pixel);
! 1540		      !                            XDrawImageString(dsp, win2, gc2, 220, 178, buf, (int)
! 1540		      >strlen(buf));
! 1541		      !                            dumper_flag = 1;
! 1542		      !                            fprintf(stderr,"INFO : dumper_flag = 1\n");
! 1544		      !                        } else {
! 1546		      !                            /* We are confirmed. Switch the dumper button back to
! 1547		      !                             * magenta and create a new data file in the users TM
! 1547		      >PDIR
! 1548		      !                             * if we can.
! 1549		      !                             */
! 1551		      !                            XSetForeground(dsp, gc2, magenta.pixel);
! 1552		      !                            XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
! 1553		      !                            sprintf(buf,"DUMPER");
! 1554		      !                            XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)
! 1554		      >strlen(buf));
! 1556		      !                            /* do we have all sample data ready? */
! 1557		      !                            data_ready = 1;
! 1558		      !                            for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ 
! 1558		      >) {
! 1559		      !                                for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_
! 1559		      >r++ ) {
! 1560		      !                                    data_ready &= vbox_flag[vbox_r][vbox_j];
! 1561		      !                                }
! 1562		      !                            }
! 1564		      !                            if ( data_ready ) {
! 1566		      !                                /* indicate that the data is ready */
! 1567		      !                                sprintf(buf,"Data Ready");
! 1568		      !                                XSetForeground(dsp, gc2, green.pixel);
! 1569		      !                                XDrawImageString(dsp, win2, gc2, 220, 178, buf, (
! 1569		      >int)strlen(buf));
! 1571		      !                                time(&time_now);
! 1572		      !                                ptm = gmtime(&time_now);
! 1574		      !                                /* TODO we need to check the calloc return value 
! 1574		      >*/
! 1575		      !                                timestamp_filename = calloc(_POSIX_PATH_MAX,sizeo
! 1575		      >f(unsigned char));
! 1576		      !                                filename_len = strftime(timestamp, 32, "%Y%m%d%H%
! 1576		      >M%S", ptm);
! 1578		      !                                /* at the moment we are not even using the error 
! 1578		      >status return */
! 1579		      !                                err_status = strcat(timestamp_filename, tmpdir);
! 1580		      !                                err_status = strcat(timestamp_filename, "/");
! 1581		      !                                err_status = strcat(timestamp_filename, timestamp
! 1581		      >);
! 1583		      !                                status = stat(timestamp_filename, &status_buffer)
! 1583		      >;
! 1584		      !                                if ( status == 0 ) {

/* 0x1918	1584 */		prefetch	[%sp+3911],3
/* 0x191c	 951 */		add	%sp,3655,%l2
/* 0x1920	     */		mov	0,%l4

! Registers live out of .L77003086: 
! g2 g3 o0 sp l2 l4 l7 i0 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003074 .L77003086

			.L900000761:
/* 0x1924	 953 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x1928	     */		mov	112,%o0
/* 0x192c	     */		brnz,pn	%o0,.L900000104
/* 0x1930	     */		ldd	[%sp+2775],%f0

! Registers live out of .L900000761: 
! g2 g3 o0 o1 sp l2 l4 l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000761

			.L77003076:
/* 0x1934	 953 */		ba	.L77003075
/* 0x1938	     */		mov	%o0,%l5

! Registers live out of .L77003076: 
! g2 g3 o0 sp l2 l4 l5 l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000761

			.L900000104:
/* 0x193c	1584 */		mov	112,%o2
/* 0x1940	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x1944	     */		mov	0,%o1
/* 0x1948	     */		ldd	[%sp+2775],%f0
/* 0x194c	     */		mov	%o0,%l5

! Registers live out of .L900000104: 
! g2 g3 o0 sp l2 l4 l5 l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003076 .L900000104

			.L77003075:
/* 0x1950	 953 */		brz,pn	%l5,.L77002265
/* 0x1954	 951 */		ld	[%sp+2275],%o4

! Registers live out of .L77003075: 
! g2 g3 o0 o4 sp l2 l4 l5 l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003075

			.L77003074:
/* 0x1958	 951 */		add	%l4,1,%l4
/* 0x195c	1584 */		stx	%l5,[%l2]
/* 0x1960	     */		prefetch	[%l2+512],3
/* 0x1964	 951 */		add	%l2,8,%l2
/* 0x1968	     */		cmp	%l4,%o4
/* 0x196c	     */		bl,a,pt	%icc,.L900000761
/* 0x1970	 953 */		std	%f0,[%sp+2775]

! Registers live out of .L77003074: 
! g2 g3 o0 sp l2 l4 l7 i0 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003074

			.L77003406:
/* 0x1974	 268 */		st	%g0,[%sp+2283]
/* 0x1978	 128 */		st	%g0,[%sp+2295]

! Registers live out of .L77003406: 
! g2 g3 o0 sp l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003390 .L77003406

			.L900000762:
/* 0x197c	   0 */		ldx	[%sp+2399],%l6
/* 0x1980	 102 */		ld	[%sp+2275],%g5
/* 0x1984	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%l3
/* 0x1988	 102 */		mov	1,%g1
/* 0x198c	     */		st	%g1,[%sp+2287]
/* 0x1990	   0 */		xor	%l3,%gdop_lox10(.L___const_seg_900000101),%l5
/* 0x1994	 102 */		st	%g0,[%sp+2291]
/* 0x1998	 103 */		st	%g0,[%sp+2299]
/* 0x199c	 106 */		st	%g0,[%sp+2303]
/* 0x19a0	 988 */		std	%f0,[%sp+2775]
/* 0x19a4	   0 */		ldx	[%l6+%l5],%o1,%gdop(.L___const_seg_900000101)
/* 0x19a8	 287 */		mov	10,%l5
/* 0x19ac	     */		stb	%l5,[%sp+2264]
/* 0x19b0	 102 */		add	%g5,-1,%g5
/* 0x19b4	 281 */		stb	%l5,[%sp+2263]
/* 0x19b8	 102 */		st	%g5,[%sp+2279]
/* 0x19bc	   0 */		add	%o1,64,%l6

! Registers live out of .L900000762: 
! g2 g3 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000698 .L900000762

			.L900000696:
/* 0x19c0	 988 */		add	%sp,3207,%o1
/* 0x19c4	     */		call	XNextEvent	!params=  %o0 %o1	!result= 
/* 0x19c8	     */		mov	%l7,%o0
/* 0x19cc	 994 */		ld	[%sp+3207],%l4
/* 0x19d0	 992 */		ldx	[%sp+3271],%i3
/* 0x19d4	 994 */		cmp	%l4,4
/* 0x19d8	 992 */		srl	%i3,0,%i1
/* 0x19dc	 994 */		bne,pn	%icc,.L77002311
/* 0x19e0	 992 */		srlx	%i3,32,%l4

! Registers live out of .L900000696: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000696

			.L77002293:
/* 0x19e4	 996 */		ld	[%sp+3291],%i0
/* 0x19e8	     */		cmp	%i0,4
/* 0x19ec	     */		bge,pn	%icc,.L900000626
/* 0x19f0	     */		nop

! Registers live out of .L77002293: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002293

			.L900000628:
/* 0x19f4	 996 */		cmp	%i0,1
/* 0x19f8	     */		be,pn	%icc,.L77002295
/* 0x19fc	     */		cmp	%i0,2

! Registers live out of .L900000628: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000628

			.L900000629:
/* 0x1a00	 996 */		be,pt	%icc,.L900000760
/* 0x1a04	1003 */		mov	2,%i5

! Registers live out of .L900000629: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000629

			.L900000630:
/* 0x1a08	 996 */		cmp	%i0,3
/* 0x1a0c	     */		bne,pn	%icc,.L77002311
/* 0x1a10	1009 */		ld	[%sp+2283],%o0

! Registers live out of .L900000630: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000630

			.L77002299:
/* 0x1a14	1008 */		mov	3,%o1
/* 0x1a18	     */		st	%o1,[%sp+2295]
/* 0x1a1c	1009 */		add	%o0,1,%l2
/* 0x1a20	     */		st	%l2,[%sp+2283]
/* 0x1a24	1010 */		ba	.L900000759
/* 0x1a28	1032 */		ldx	[%sp+2479],%o2

! Registers live out of .L77002299: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000629

			.L900000760:
/* 0x1a2c	1003 */		st	%i5,[%sp+2295]
/* 0x1a30	1005 */		ba	.L900000759
/* 0x1a34	1032 */		ldx	[%sp+2479],%o2

! Registers live out of .L900000760: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000628

			.L77002295:
/* 0x1a38	 998 */		mov	1,%i3
/* 0x1a3c	     */		st	%i3,[%sp+2295]
/* 0x1a40	1000 */		ba	.L900000759
/* 0x1a44	1032 */		ldx	[%sp+2479],%o2

! Registers live out of .L77002295: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002293

			.L900000626:
/* 0x1a48	 996 */		be,pn	%icc,.L77002301
/* 0x1a4c	     */		cmp	%i0,5

! Registers live out of .L900000626: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000626

			.L900000631:
/* 0x1a50	 996 */		bne,pn	%icc,.L77002311
/* 0x1a54	1018 */		mov	5,%g4

! Registers live out of .L900000631: 
! g2 g3 g4 o0 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000631

			.L77002303:
/* 0x1a58	1018 */		st	%g4,[%sp+2295]
/* 0x1a5c	     */		ba	.L900000759
/* 0x1a60	1032 */		ldx	[%sp+2479],%o2

! Registers live out of .L77002303: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000626

			.L77002301:
/* 0x1a64	1013 */		mov	4,%l5
/* 0x1a68	     */		st	%l5,[%sp+2295]

! Registers live out of .L77002301: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002301 .L900000630 .L900000631 .L900000696

			.L77002311:
/* 0x1a6c	1032 */		ldx	[%sp+2479],%o2

! Registers live out of .L77002311: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002295 .L77002299 .L77002303 .L77002311 .L900000760

			.L900000759:
/* 0x1a70	1032 */		ldx	[%sp+2695],%o1
/* 0x1a74	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1a78	     */		mov	%l7,%o0
/* 0x1a7c	1033 */		ldx	[%sp+2399],%l2
/* 0x1a80	     */		sethi	%gdop_hix22(.L343),%o7
/* 0x1a84	     */		ldx	[%sp+2647],%o0
/* 0x1a88	     */		sra	%i1,0,%o3
/* 0x1a8c	     */		sra	%l4,0,%o2
/* 0x1a90	     */		xor	%o7,%gdop_lox10(.L343),%g5
/* 0x1a94	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1a98	     */		ldx	[%l2+%g5],%o1,%gdop(.L343)
/* 0x1a9c	1034 */		sethi	%gdop_hix22(__iob),%o3
/* 0x1aa0	     */		sethi	%gdop_hix22(.L344),%o5
/* 0x1aa4	     */		ldx	[%sp+2647],%o2
/* 0x1aa8	     */		xor	%o5,%gdop_lox10(.L344),%o4
/* 0x1aac	     */		xor	%o3,%gdop_lox10(__iob),%l3
/* 0x1ab0	     */		ldx	[%l2+%o4],%o1,%gdop(.L344)
/* 0x1ab4	     */		ldx	[%l2+%l3],%g1,%gdop(__iob)
/* 0x1ab8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1abc	     */		add	%g1,256,%o0
/* 0x1ac0	1035 */		ldx	[%sp+2647],%o2
/* 0x1ac4	     */		ldub	[%o2],%o7

! Registers live out of .L900000759: 
! g2 g3 o2 sp o7 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000319 .L900000759

			.L900000758:
/* 0x1ac8	1035 */		brz,pn	%o7,.L900000320
/* 0x1acc	     */		add	%o2,1,%o2

! Registers live out of .L900000758: 
! g2 g3 o2 sp o7 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000758

			.L900000319:
/* 0x1ad0	1035 */		ldub	[%o2],%o4
/* 0x1ad4	     */		add	%o2,1,%o2
/* 0x1ad8	     */		brnz,a,pt	%o4,.L900000758
/* 0x1adc	     */		ldub	[%o2],%o7

! Registers live out of .L900000319: 
! g2 g3 o2 sp o7 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000319 .L900000758

			.L900000320:
/* 0x1ae0	1035 */		ldx	[%sp+2647],%o5
/* 0x1ae4	     */		sub	%o2,1,%o0
/* 0x1ae8	     */		ldx	[%sp+2719],%o1
/* 0x1aec	     */		mov	40,%o4
/* 0x1af0	     */		mov	10,%o3
/* 0x1af4	     */		sub	%o0,%o5,%o2
/* 0x1af8	     */		sra	%o2,0,%i4
/* 0x1afc	     */		ldx	[%sp+2695],%o2
/* 0x1b00	     */		stx	%i4,[%sp+2223]
/* 0x1b04	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1b08	     */		mov	%l7,%o0
/* 0x1b0c	1046 */		ld	[%sp+2295],%o2
/* 0x1b10	     */		ldd	[%sp+2775],%f0
/* 0x1b14	     */		cmp	%o2,1
/* 0x1b18	     */		bne,pn	%icc,.L77002631
/* 0x1b1c	1042 */		add	%l4,-1,%i4

! Registers live out of .L900000320: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000320

			.L77002313:
/* 0x1b20	1050 */		cmp	%i4,10
/* 0x1b24	     */		bl,pn	%icc,.L77003396
/* 0x1b28	1042 */		st	%i4,[%sp+2307]

! Registers live out of .L77002313: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002313

			.L77002315:
/* 0x1b2c	1043 */		add	%i1,-2,%i3
/* 0x1b30	     */		cmp	%i3,10
/* 0x1b34	     */		bl,pn	%icc,.L77002387
/* 0x1b38	     */		st	%i3,[%sp+2311]

! Registers live out of .L77002315: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002315

			.L77002317:
/* 0x1b3c	1043 */		cmp	%i4,1034
/* 0x1b40	     */		bge,pn	%icc,.L77002387
/* 0x1b44	     */		cmp	%i3,1034

! Registers live out of .L77002317: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002317

			.L77002319:
/* 0x1b48	1043 */		bge,pn	%icc,.L77002387
/* 0x1b4c	1058 */		add	%l4,-11,%l3

! Registers live out of .L77002319: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002319

			.L77002321:
/* 0x1b50	1058 */		sra	%l3,0,%o0
/* 0x1b54	     */		mov	1034,%i4
/* 0x1b58	     */		sub	%i4,%i3,%i3
/* 0x1b5c	     */		sra	%i3,0,%o1
/* 0x1b60	     */		add	%sp,2431,%o4
/* 0x1b64	     */		mov	1024,%o3
/* 0x1b68	     */		call	fp_region	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x1b6c	     */		mov	1024,%o2
/* 0x1b70	1062 */		mov	%l7,%o0
/* 0x1b74	1059 */		ldd	[%sp+2431],%f34
/* 0x1b78	1060 */		ldd	[%sp+2439],%f32
/* 0x1b7c	1062 */		ldx	[%sp+2679],%o1
/* 0x1b80	1060 */		std	%f32,[%sp+2887]
/* 0x1b84	1070 */		sethi	%gdop_hix22(.L352),%i4
/* 0x1b88	1071 */		sethi	%gdop_hix22(.L344),%l2
/* 0x1b8c	1059 */		std	%f34,[%sp+2879]
/* 0x1b90	1062 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1b94	     */		ldx	[%sp+2447],%o2
/* 0x1b98	1068 */		sra	%l3,31,%o7
/* 0x1b9c	1069 */		ld	[%sp+2311],%o5
/* 0x1ba0	1070 */		xor	%i4,%gdop_lox10(.L352),%o3
/* 0x1ba4	     */		ldx	[%sp+2399],%i0
/* 0x1ba8	1068 */		and	%o7,63,%g5
/* 0x1bac	1071 */		xor	%l2,%gdop_lox10(.L344),%i5
/* 0x1bb0	1070 */		ldx	[%sp+2647],%o0
/* 0x1bb4	1068 */		add	%l3,%g5,%o2
/* 0x1bb8	1069 */		add	%o5,-1034,%g4
/* 0x1bbc	1068 */		sra	%o2,6,%i3
/* 0x1bc0	1070 */		ldx	[%i0+%o3],%o1,%gdop(.L352)
/* 0x1bc4	1069 */		sra	%g4,31,%o4
/* 0x1bc8	1070 */		mov	%i3,%o2
/* 0x1bcc	1069 */		and	%o4,63,%g1
/* 0x1bd0	     */		add	%g4,%g1,%l4
/* 0x1bd4	     */		sra	%l4,6,%l5
/* 0x1bd8	     */		sub	%g0,%l5,%i4
/* 0x1bdc	1070 */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1be0	     */		sra	%i4,0,%o3
/* 0x1be4	1071 */		sethi	%gdop_hix22(__iob),%o1
/* 0x1be8	     */		ldx	[%sp+2647],%o2
/* 0x1bec	     */		xor	%o1,%gdop_lox10(__iob),%o0
/* 0x1bf0	     */		ldx	[%i0+%i5],%o1,%gdop(.L344)
/* 0x1bf4	     */		ldx	[%i0+%o0],%i1,%gdop(__iob)
/* 0x1bf8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1bfc	     */		add	%i1,256,%o0
/* 0x1c00	1072 */		ldx	[%sp+2647],%i0
/* 0x1c04	     */		ldub	[%i0],%o1

! Registers live out of .L77002321: 
! g2 g3 o0 o1 sp l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002321 .L900000315

			.L900000757:
/* 0x1c08	1072 */		brz,pn	%o1,.L900000316
/* 0x1c0c	     */		add	%i0,1,%i0

! Registers live out of .L900000757: 
! g2 g3 o0 o1 sp l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000757

			.L900000315:
/* 0x1c10	1072 */		ldub	[%i0],%o3
/* 0x1c14	     */		add	%i0,1,%i0
/* 0x1c18	     */		brnz,a,pt	%o3,.L900000757
/* 0x1c1c	     */		ldub	[%i0],%o1

! Registers live out of .L900000315: 
! g2 g3 o0 o1 sp l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000315 .L900000757

			.L900000316:
/* 0x1c20	1072 */		ldx	[%sp+2647],%o5
/* 0x1c24	     */		sub	%i0,1,%l4
/* 0x1c28	     */		ldx	[%sp+2679],%o2
/* 0x1c2c	     */		mov	270,%o4
/* 0x1c30	     */		ldx	[%sp+2687],%o1
/* 0x1c34	     */		mov	10,%o3
/* 0x1c38	     */		sub	%l4,%o5,%i5
/* 0x1c3c	     */		mov	%o5,%i1
/* 0x1c40	     */		sra	%i5,0,%g5
/* 0x1c44	     */		stx	%g5,[%sp+2223]
/* 0x1c48	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1c4c	     */		mov	%l7,%o0
/* 0x1c50	1074 */		ldx	[%sp+2591],%o2
/* 0x1c54	     */		ldx	[%sp+2679],%o1
/* 0x1c58	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1c5c	     */		mov	%l7,%o0
/* 0x1c60	1075 */		ldx	[%sp+2399],%g5
/* 0x1c64	     */		sethi	%gdop_hix22(.L353),%o5
/* 0x1c68	     */		ldx	[%sp+2879],%o2
/* 0x1c6c	     */		mov	%i1,%o0
/* 0x1c70	     */		ldx	[%sp+2887],%o3
/* 0x1c74	     */		xor	%o5,%gdop_lox10(.L353),%g1
/* 0x1c78	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1c7c	     */		ldx	[%g5+%g1],%o1,%gdop(.L353)
/* 0x1c80	1076 */		ldub	[%i1],%i5
/* 0x1c84	     */		mov	%i1,%o7

! Registers live out of .L900000316: 
! g2 g3 o0 sp o7 l6 l7 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000311 .L900000316

			.L900000756:
/* 0x1c88	1076 */		brz,pn	%i5,.L900000312
/* 0x1c8c	     */		add	%o7,1,%o7

! Registers live out of .L900000756: 
! g2 g3 o0 sp o7 l6 l7 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000756

			.L900000311:
/* 0x1c90	1076 */		ldub	[%o7],%l2
/* 0x1c94	     */		add	%o7,1,%o7
/* 0x1c98	     */		brnz,a,pt	%l2,.L900000756
/* 0x1c9c	     */		ldub	[%o7],%i5

! Registers live out of .L900000311: 
! g2 g3 o0 sp o7 l6 l7 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000311 .L900000756

			.L900000312:
/* 0x1ca0	1076 */		ldx	[%sp+2647],%o5
/* 0x1ca4	     */		sub	%o7,1,%g4
/* 0x1ca8	     */		ldx	[%sp+2679],%o2
/* 0x1cac	     */		mov	290,%o4
/* 0x1cb0	     */		ldx	[%sp+2687],%o1
/* 0x1cb4	     */		mov	10,%o3
/* 0x1cb8	   0 */		sethi	%gdop_hix22(.L354),%i1
/* 0x1cbc	   0 */		xor	%i1,%gdop_lox10(.L354),%i0
/* 0x1cc0	1076 */		sub	%g4,%o5,%l5
/* 0x1cc4	     */		mov	%o5,%l2
/* 0x1cc8	     */		sra	%l5,0,%l3
/* 0x1ccc	     */		stx	%l3,[%sp+2223]
/* 0x1cd0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1cd4	     */		mov	%l7,%o0
/* 0x1cd8	   0 */		ldx	[%sp+2399],%o3
/* 0x1cdc	1077 */		ldx	[%sp+2879],%o1
/* 0x1ce0	     */		ldx	[%sp+2887],%o2
/* 0x1ce4	   0 */		ldx	[%o3+%i0],%l4,%gdop(.L354)
/* 0x1ce8	1077 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x1cec	     */		mov	%l4,%o0
/* 0x1cf0	1087 */		ldd	[%sp+2727],%f6
/* 0x1cf4	     */		ldd	[%sp+2735],%f8
/* 0x1cf8	     */		add	%sp,2431,%o5
/* 0x1cfc	     */		ldd	[%sp+2887],%f2
/* 0x1d00	     */		ldd	[%sp+2879],%f0
/* 0x1d04	     */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x1d08	     */		ldd	[%sp+2655],%f4
/* 0x1d0c	1089 */		ldd	[%sp+2431],%f34
/* 0x1d10	1092 */		add	%l4,40,%o0
/* 0x1d14	1090 */		ldd	[%sp+2439],%f32
/* 0x1d18	1092 */		ldx	[%sp+2431],%o1
/* 0x1d1c	1090 */		std	%f32,[%sp+2767]
/* 0x1d20	1089 */		std	%f34,[%sp+2759]
/* 0x1d24	1092 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x1d28	     */		ldx	[%sp+2439],%o2
/* 0x1d2c	1094 */		mov	%l7,%o0
/* 0x1d30	     */		ldx	[%sp+2479],%o2
/* 0x1d34	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1d38	     */		ldx	[%sp+2695],%o1
/* 0x1d3c	1095 */		mov	%l2,%o0
/* 0x1d40	     */		ldx	[%sp+2759],%o2
/* 0x1d44	     */		add	%l4,80,%o1
/* 0x1d48	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1d4c	     */		ldx	[%sp+2767],%o3
/* 0x1d50	1096 */		ldub	[%l2],%o7
/* 0x1d54	     */		mov	%l2,%o5

! Registers live out of .L900000312: 
! g2 g3 o5 sp o7 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000307 .L900000312

			.L900000755:
/* 0x1d58	1096 */		brz,pn	%o7,.L900000308
/* 0x1d5c	     */		add	%o5,1,%o5

! Registers live out of .L900000755: 
! g2 g3 o5 sp o7 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000755

			.L900000307:
/* 0x1d60	1096 */		ldub	[%o5],%g5
/* 0x1d64	     */		add	%o5,1,%o5
/* 0x1d68	     */		brnz,a,pt	%g5,.L900000755
/* 0x1d6c	     */		ldub	[%o5],%o7

! Registers live out of .L900000307: 
! g2 g3 o5 sp o7 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000307 .L900000755

			.L900000308:
/* 0x1d70	1096 */		sub	%o5,1,%o0
/* 0x1d74	     */		ldx	[%sp+2647],%o5
/* 0x1d78	     */		ldx	[%sp+2719],%o1
/* 0x1d7c	     */		mov	80,%o4
/* 0x1d80	     */		mov	10,%o3
/* 0x1d84	     */		sub	%o0,%o5,%o2
/* 0x1d88	     */		mov	%o5,%l3
/* 0x1d8c	     */		sra	%o2,0,%i5
/* 0x1d90	     */		ldx	[%sp+2695],%o2
/* 0x1d94	     */		stx	%i5,[%sp+2223]
/* 0x1d98	1100 */		mov	%l3,%i1
/* 0x1d9c	1096 */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1da0	     */		mov	%l7,%o0
/* 0x1da4	1098 */		ldx	[%sp+2447],%o2
/* 0x1da8	     */		ldx	[%sp+2695],%o1
/* 0x1dac	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x1db0	     */		mov	%l7,%o0
/* 0x1db4	1099 */		ld	[%sp+2271],%o2
/* 0x1db8	     */		ldsw	[%sp+2275],%o3
/* 0x1dbc	     */		mov	%l3,%o0
/* 0x1dc0	     */		sethi	%gdop_hix22(.L357),%o1
/* 0x1dc4	     */		xor	%o1,%gdop_lox10(.L357),%o4
/* 0x1dc8	     */		ldx	[%sp+2399],%o1
/* 0x1dcc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1dd0	     */		ldx	[%o1+%o4],%o1,%gdop(.L357)
/* 0x1dd4	1100 */		ldub	[%l3],%l4

! Registers live out of .L900000308: 
! g2 g3 o0 sp l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000303 .L900000308

			.L900000754:
/* 0x1dd8	1100 */		brz,pn	%l4,.L900000304
/* 0x1ddc	     */		add	%i1,1,%i1

! Registers live out of .L900000754: 
! g2 g3 o0 sp l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000754

			.L900000303:
/* 0x1de0	1100 */		ldub	[%i1],%i0
/* 0x1de4	     */		add	%i1,1,%i1
/* 0x1de8	     */		brnz,a,pt	%i0,.L900000754
/* 0x1dec	     */		ldub	[%i1],%l4

! Registers live out of .L900000303: 
! g2 g3 o0 sp l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000303 .L900000754

			.L900000304:
/* 0x1df0	1100 */		ldx	[%sp+2647],%o5
/* 0x1df4	     */		sub	%i1,1,%g1
/* 0x1df8	     */		mov	100,%o4
/* 0x1dfc	     */		ldx	[%sp+2719],%o1
/* 0x1e00	1102 */		sethi	%gdop_hix22(.L358),%l5
/* 0x1e04	1100 */		ldx	[%sp+2695],%o2
/* 0x1e08	1102 */		xor	%l5,%gdop_lox10(.L358),%l3
/* 0x1e0c	1100 */		sub	%g1,%o5,%o3
/* 0x1e10	     */		mov	%o5,%i5
/* 0x1e14	     */		sra	%o3,0,%g4
/* 0x1e18	     */		mov	10,%o3
/* 0x1e1c	     */		stx	%g4,[%sp+2223]
/* 0x1e20	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1e24	     */		mov	%l7,%o0
/* 0x1e28	1102 */		ldx	[%sp+2399],%o4
/* 0x1e2c	     */		ldx	[%sp+2655],%o2
/* 0x1e30	     */		mov	%i5,%o0
/* 0x1e34	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1e38	     */		ldx	[%o4+%l3],%o1,%gdop(.L358)
/* 0x1e3c	1103 */		ldub	[%i5],%o2
/* 0x1e40	     */		mov	%i5,%o4

! Registers live out of .L900000304: 
! g2 g3 o2 o4 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000299 .L900000304

			.L900000753:
/* 0x1e44	1103 */		brz,pn	%o2,.L900000300
/* 0x1e48	     */		add	%o4,1,%o4

! Registers live out of .L900000753: 
! g2 g3 o2 o4 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000753

			.L900000299:
/* 0x1e4c	1103 */		ldub	[%o4],%l4
/* 0x1e50	     */		add	%o4,1,%o4
/* 0x1e54	     */		brnz,a,pt	%l4,.L900000753
/* 0x1e58	     */		ldub	[%o4],%o2

! Registers live out of .L900000299: 
! g2 g3 o2 o4 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000299 .L900000753

			.L900000300:
/* 0x1e5c	1103 */		ldx	[%sp+2647],%o5
/* 0x1e60	     */		sub	%o4,1,%l2
/* 0x1e64	     */		ldx	[%sp+2719],%o1
/* 0x1e68	     */		mov	120,%o4
/* 0x1e6c	     */		ldx	[%sp+2695],%o2
/* 0x1e70	     */		mov	10,%o3
/* 0x1e74	1105 */		sethi	%gdop_hix22(.L359),%i5
/* 0x1e78	1103 */		sub	%l2,%o5,%o7
/* 0x1e7c	     */		mov	%o5,%l4
/* 0x1e80	     */		sra	%o7,0,%o0
/* 0x1e84	     */		stx	%o0,[%sp+2223]
/* 0x1e88	1106 */		mov	%l4,%i0
/* 0x1e8c	1103 */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1e90	     */		mov	%l7,%o0
/* 0x1e94	1105 */		ldx	[%sp+2399],%o5
/* 0x1e98	     */		ldx	[%sp+2727],%o2
/* 0x1e9c	     */		xor	%i5,%gdop_lox10(.L359),%o1
/* 0x1ea0	     */		ldx	[%sp+2735],%o3
/* 0x1ea4	     */		mov	%l4,%o0
/* 0x1ea8	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x1eac	     */		ldx	[%o5+%o1],%o1,%gdop(.L359)
/* 0x1eb0	1106 */		ldub	[%l4],%l2

! Registers live out of .L900000300: 
! g2 g3 o0 sp l2 l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000295 .L900000300

			.L900000752:
/* 0x1eb4	1106 */		brz,pn	%l2,.L900000296
/* 0x1eb8	     */		add	%i0,1,%i0

! Registers live out of .L900000752: 
! g2 g3 o0 sp l2 l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000752

			.L900000295:
/* 0x1ebc	1106 */		ldub	[%i0],%l5
/* 0x1ec0	     */		add	%i0,1,%i0
/* 0x1ec4	     */		brnz,a,pt	%l5,.L900000752
/* 0x1ec8	     */		ldub	[%i0],%l2

! Registers live out of .L900000295: 
! g2 g3 o0 sp l2 l6 l7 i0 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000295 .L900000752

			.L900000296:
/* 0x1ecc	1106 */		ldx	[%sp+2647],%o5
/* 0x1ed0	     */		sub	%i0,1,%o2
/* 0x1ed4	     */		ldx	[%sp+2719],%o1
/* 0x1ed8	     */		mov	140,%o4
/* 0x1edc	     */		mov	10,%o3
/* 0x1ee0	1112 */		sethi	%gdop_hix22(.L360),%l2
/* 0x1ee4	1106 */		sub	%o2,%o5,%g5
/* 0x1ee8	     */		ldx	[%sp+2695],%o2
/* 0x1eec	     */		mov	%o5,%l5
/* 0x1ef0	     */		sra	%g5,0,%g1
/* 0x1ef4	     */		stx	%g1,[%sp+2223]
/* 0x1ef8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1efc	     */		mov	%l7,%o0
/* 0x1f00	1110 */		ldx	[%sp+2399],%i0
/* 0x1f04	     */		sethi	%gdop_hix22(.L___const_seg_900000101),%o5
/* 0x1f08	     */		ldd	[%sp+2743],%f34
/* 0x1f0c	     */		xor	%o5,%gdop_lox10(.L___const_seg_900000101),%g4
/* 0x1f10	1111 */		sethi	%gdop_hix22(.L275),%o3
/* 0x1f14	     */		xor	%o3,%gdop_lox10(.L275),%l3
/* 0x1f18	1110 */		ldx	[%i0+%g4],%i1,%gdop(.L___const_seg_900000101)
/* 0x1f1c	1111 */		ldx	[%i0+%l3],%o0,%gdop(.L275)
/* 0x1f20	1113 */		mov	%l5,%l3
/* 0x1f24	1110 */		ld	[%i1+48],%f0
/* 0x1f28	     */		fitod	%f0,%f32
/* 0x1f2c	     */		fdivd	%f34,%f32,%f32
/* 0x1f30	     */		std	%f32,[%sp+2783]
/* 0x1f34	1111 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x1f38	     */		ldx	[%sp+2783],%o1
/* 0x1f3c	1112 */		xor	%l2,%gdop_lox10(.L360),%o7
/* 0x1f40	     */		ldx	[%sp+2783],%o2
/* 0x1f44	     */		ldx	[%i0+%o7],%o1,%gdop(.L360)
/* 0x1f48	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1f4c	     */		mov	%l5,%o0
/* 0x1f50	1113 */		ldub	[%l5],%o3

! Registers live out of .L900000296: 
! g2 g3 o3 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000291 .L900000296

			.L900000751:
/* 0x1f54	1113 */		brz,pn	%o3,.L900000292
/* 0x1f58	     */		add	%l3,1,%l3

! Registers live out of .L900000751: 
! g2 g3 o3 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000751

			.L900000291:
/* 0x1f5c	1113 */		ldub	[%l3],%g4
/* 0x1f60	     */		add	%l3,1,%l3
/* 0x1f64	     */		brnz,a,pt	%g4,.L900000751
/* 0x1f68	     */		ldub	[%l3],%o3

! Registers live out of .L900000291: 
! g2 g3 o3 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000291 .L900000751

			.L900000292:
/* 0x1f6c	1113 */		ldx	[%sp+2647],%o5
/* 0x1f70	     */		sub	%l3,1,%o0
/* 0x1f74	     */		ldx	[%sp+2719],%o1
/* 0x1f78	     */		mov	180,%o4
/* 0x1f7c	     */		ldx	[%sp+2695],%o2
/* 0x1f80	     */		mov	10,%o3
/* 0x1f84	     */		sub	%o0,%o5,%i5
/* 0x1f88	     */		mov	%o5,%i1
/* 0x1f8c	     */		sra	%i5,0,%l4
/* 0x1f90	     */		stx	%l4,[%sp+2223]
/* 0x1f94	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x1f98	     */		mov	%l7,%o0
/* 0x1f9c	1115 */		ldx	[%sp+2399],%l3
/* 0x1fa0	     */		sethi	%gdop_hix22(.L___const_seg_900000101),%o1
/* 0x1fa4	     */		ldd	[%sp+2751],%f34
/* 0x1fa8	     */		xor	%o1,%gdop_lox10(.L___const_seg_900000101),%o2
/* 0x1fac	1116 */		sethi	%gdop_hix22(.L276),%o4
/* 0x1fb0	     */		xor	%o4,%gdop_lox10(.L276),%g5
/* 0x1fb4	1115 */		ldx	[%l3+%o2],%g1,%gdop(.L___const_seg_900000101)
/* 0x1fb8	1116 */		ldx	[%l3+%g5],%o0,%gdop(.L276)
/* 0x1fbc	1115 */		ld	[%g1+48],%f0
/* 0x1fc0	     */		fitod	%f0,%f32
/* 0x1fc4	     */		fdivd	%f34,%f32,%f32
/* 0x1fc8	     */		std	%f32,[%sp+2791]
/* 0x1fcc	1116 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x1fd0	     */		ldx	[%sp+2791],%o1
/* 0x1fd4	1117 */		sethi	%gdop_hix22(.L361),%o5
/* 0x1fd8	     */		ldx	[%sp+2791],%o2
/* 0x1fdc	     */		mov	%i1,%o0
/* 0x1fe0	     */		xor	%o5,%gdop_lox10(.L361),%o3
/* 0x1fe4	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x1fe8	     */		ldx	[%l3+%o3],%o1,%gdop(.L361)
/* 0x1fec	1118 */		ldub	[%i1],%l5
/* 0x1ff0	     */		mov	%i1,%g1

! Registers live out of .L900000292: 
! g1 g2 g3 o0 sp l5 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000287 .L900000292

			.L900000750:
/* 0x1ff4	1118 */		brz,pn	%l5,.L900000288
/* 0x1ff8	     */		add	%g1,1,%g1

! Registers live out of .L900000750: 
! g1 g2 g3 o0 sp l5 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000750

			.L900000287:
/* 0x1ffc	1118 */		ldub	[%g1],%g5
/* 0x2000	     */		add	%g1,1,%g1
/* 0x2004	     */		brnz,a,pt	%g5,.L900000750
/* 0x2008	     */		ldub	[%g1],%l5

! Registers live out of .L900000287: 
! g1 g2 g3 o0 sp l5 l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000287 .L900000750

			.L900000288:
/* 0x200c	1118 */		ldx	[%sp+2647],%o5
/* 0x2010	     */		sub	%g1,1,%i1
/* 0x2014	1148 */		sra	%i3,0,%l5
/* 0x2018	1118 */		ldx	[%sp+2719],%o1
/* 0x201c	     */		ldx	[%sp+2695],%o2
/* 0x2020	     */		mov	200,%o4
/* 0x2024	     */		mov	10,%o3
/* 0x2028	1148 */		sllx	%l5,4,%i0
/* 0x202c	1118 */		sub	%i1,%o5,%l2
/* 0x2030	     */		sra	%l2,0,%o7
/* 0x2034	     */		stx	%o7,[%sp+2223]
/* 0x2038	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x203c	     */		mov	%l7,%o0
/* 0x2040	1120 */		ldx	[%sp+2511],%o2
/* 0x2044	     */		ldx	[%sp+2695],%o1
/* 0x2048	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x204c	     */		mov	%l7,%o0
/* 0x2050	1123 */		add	%sp,2463,%o1
/* 0x2054	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x2058	     */		mov	3,%o0
/* 0x205c	1148 */		ldd	[%sp+2775],%f0
/* 0x2060	     */		sra	%i4,0,%o0
/* 0x2064	     */		add	%fp,-1049,%i5
/* 0x2068	     */		add	%o0,%i0,%l4
/* 0x206c	     */		sllx	%l4,2,%o1
/* 0x2070	     */		ld	[%o1+%i5],%o2
/* 0x2074	     */		add	%o1,%i5,%o4
/* 0x2078	     */		cmp	%o2,0
/* 0x207c	     */		bne,pn	%icc,.L77002984
/* 0x2080	     */		stx	%o4,[%sp+2255]

! Registers live out of .L900000288: 
! g2 g3 o0 sp l6 l7 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000288

			.L77002323:
/* 0x2084	1149 */		ld	[%sp+2275],%i1
/* 0x2088	     */		cmp	%i1,0
/* 0x208c	     */		ble,pn	%icc,.L77002331
/* 0x2090	1173 */		sethi	%gdop_hix22(mbrot_vbox_pthread),%o2

! Registers live out of .L77002323: 
! g2 g3 o0 o2 sp l6 l7 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002323

			.L77003249:
/* 0x2094	1173 */		ldx	[%sp+2399],%o4
/* 0x2098	     */		xor	%o2,%gdop_lox10(mbrot_vbox_pthread),%o3
/* 0x209c	1149 */		add	%sp,3655,%i1
/* 0x20a0	1150 */		prefetch	[%sp+3911],0
/* 0x20a4	1149 */		mov	0,%l3
/* 0x20a8	     */		add	%sp,3399,%l5
/* 0x20ac	1173 */		ldx	[%o4+%o3],%l2,%gdop(mbrot_vbox_pthread)
/* 0x20b0	1150 */		ldx	[%sp+3655],%o3

! Registers live out of .L77003249: 
! g2 g3 o3 sp l2 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003249 .L900000749

			.L900000749:
/* 0x20b4	1155 */		ldd	[%sp+2743],%f36
/* 0x20b8	1156 */		ldd	[%sp+2751],%f34
/* 0x20bc	1162 */		mov	64,%o4
/* 0x20c0	1159 */		mov	1024,%g5
/* 0x20c4	1151 */		ld	[%sp+2275],%g4
/* 0x20c8	1173 */		std	%f0,[%sp+2775]
/* 0x20cc	     */		mov	%l5,%o0
/* 0x20d0	     */		mov	0,%o1
/* 0x20d4	1150 */		st	%l3,[%o3+100]
/* 0x20d8	1151 */		st	%g4,[%o3+104]
/* 0x20dc	1173 */		mov	%l2,%o2
/* 0x20e0	1149 */		add	%l3,1,%l3
/* 0x20e4	1152 */		ldd	[%sp+2727],%f32
/* 0x20e8	     */		std	%f32,[%o3]
/* 0x20ec	1149 */		add	%l5,4,%l5
/* 0x20f0	1153 */		ldd	[%sp+2735],%f32
/* 0x20f4	     */		std	%f32,[%o3+8]
/* 0x20f8	1154 */		ldd	[%sp+2655],%f32
/* 0x20fc	1156 */		std	%f34,[%o3+32]
/* 0x2100	1155 */		std	%f36,[%o3+24]
/* 0x2104	1157 */		st	%i3,[%o3+72]
/* 0x2108	1158 */		st	%i4,[%o3+76]
/* 0x210c	1159 */		st	%g5,[%o3+80]
/* 0x2110	1160 */		st	%g5,[%o3+84]
/* 0x2114	1161 */		st	%o4,[%o3+88]
/* 0x2118	1162 */		st	%o4,[%o3+92]
/* 0x211c	1150 */		prefetch	[%i1+512],0
/* 0x2120	1149 */		add	%i1,8,%i1
/* 0x2124	1154 */		std	%f32,[%o3+16]
/* 0x2128	1163 */		ld	[%sp+2271],%o4
/* 0x212c	     */		st	%o4,[%o3+96]
/* 0x2130	1171 */		stx	%g0,[%o3+64]
/* 0x2134	1169 */		stx	%i2,[%o3+40]
/* 0x2138	1170 */		ldx	[%sp+2639],%i5
/* 0x213c	     */		stx	%i5,[%o3+48]
/* 0x2140	1166 */		ldx	[%sp+2407],%o5
/* 0x2144	1173 */		call	pthread_create	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2148	1166 */		stx	%o5,[%o3+56]
/* 0x214c	1149 */		ld	[%sp+2279],%o3
/* 0x2150	     */		ldd	[%sp+2775],%f0
/* 0x2154	     */		cmp	%l3,%o3
/* 0x2158	     */		ble,a,pt	%icc,.L900000749
/* 0x215c	1150 */		ldx	[%i1],%o3

! Registers live out of .L900000749: 
! g2 g3 o0 o3 sp l2 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002323 .L900000749

			.L77002331:
/* 0x2160	1201 */		ld	[%sp+2275],%i5
/* 0x2164	     */		cmp	%i5,0
/* 0x2168	     */		ble,pn	%icc,.L77002339
/* 0x216c	1203 */		sethi	%gdop_hix22(.L373),%g1

! Registers live out of .L77002331: 
! g1 g2 g3 o0 sp l6 l7 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002331

			.L77003250:
/* 0x2170	1203 */		ldx	[%sp+2399],%o3
/* 0x2174	     */		xor	%g1,%gdop_lox10(.L373),%g4
/* 0x2178	1202 */		std	%f0,[%sp+2775]
/* 0x217c	1201 */		add	%sp,3399,%i5
/* 0x2180	1202 */		prefetch	[%sp+3655],0
/* 0x2184	1201 */		mov	0,%i0
/* 0x2188	1203 */		ldx	[%o3+%g4],%l4,%gdop(.L373)

! Registers live out of .L77003250: 
! g2 g3 sp l4 l6 l7 i0 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003250 .L900000748

			.L900000748:
/* 0x218c	1202 */		ld	[%i5],%o0
/* 0x2190	     */		mov	0,%o1
/* 0x2194	     */		call	pthread_join	!params=  %o0 %o1	!result= 
/* 0x2198	     */		prefetch	[%i5+512],0
/* 0x219c	1203 */		sra	%i0,0,%o1
/* 0x21a0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x21a4	     */		mov	%l4,%o0
/* 0x21a8	1201 */		ld	[%sp+2279],%g4
/* 0x21ac	     */		add	%i0,1,%i0
/* 0x21b0	     */		ldd	[%sp+2775],%f0
/* 0x21b4	     */		add	%i5,4,%i5
/* 0x21b8	     */		cmp	%i0,%g4
/* 0x21bc	     */		ble,a,pt	%icc,.L900000748
/* 0x21c0	1202 */		std	%f0,[%sp+2775]

! Registers live out of .L900000748: 
! g2 g3 o0 sp l4 l6 l7 i0 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002331 .L900000748

			.L77002339:
/* 0x21c4	1205 */		ldx	[%sp+2255],%l2
/* 0x21c8	     */		mov	1,%i5
/* 0x21cc	     */		st	%i5,[%l2]

! Registers live out of .L77002339: 
! g2 g3 o0 sp l6 l7 i2 i3 i4 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002339 .L900000288

			.L77002984:
/* 0x21d0	1207 */		add	%sp,2495,%o1
/* 0x21d4	     */		std	%f0,[%sp+2775]
/* 0x21d8	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x21dc	     */		mov	3,%o0
/* 0x21e0	1209 */		ldx	[%sp+2463],%o0
/* 0x21e4	     */		ldx	[%sp+2471],%o1
/* 0x21e8	     */		ldx	[%sp+2495],%o2
/* 0x21ec	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x21f0	     */		ldx	[%sp+2503],%o3
/* 0x21f4	1210 */		sethi	%gdop_hix22(.L375),%o4
/* 0x21f8	     */		stx	%o0,[%fp+2023]
/* 0x21fc	     */		ldd	[%l6-40],%f4
/* 0x2200	     */		xor	%o4,%gdop_lox10(.L375),%o5
/* 0x2204	     */		ldd	[%fp+2023],%f0
/* 0x2208	     */		ldd	[%l6-32],%f36
/* 0x220c	     */		ldd	[%l6],%f40
/* 0x2210	     */		ldx	[%sp+2399],%l4
/* 0x2214	1209 */		mov	%o0,%o2
/* 0x2218	1210 */		ldx	[%sp+2647],%o0
/* 0x221c	     */		fmovs	%f4,%f2
/* 0x2220	     */		fmovs	%f4,%f6
/* 0x2224	     */		fmovs	%f1,%f3
/* 0x2228	     */		fmovs	%f0,%f7
/* 0x222c	     */		ldx	[%l4+%o5],%o1,%gdop(.L375)
/* 0x2230	     */		fsubd	%f2,%f4,%f32
/* 0x2234	     */		fsubd	%f6,%f4,%f34
/* 0x2238	     */		fabsd	%f32,%f38
/* 0x223c	     */		fabsd	%f34,%f32
/* 0x2240	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x2244	     */		fdivd	%f32,%f40,%f32
/* 0x2248	     */		std	%f32,[%sp+2991]
/* 0x224c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2250	     */		ldx	[%sp+2991],%o3
/* 0x2254	1211 */		sethi	%gdop_hix22(__iob),%o7
/* 0x2258	     */		sethi	%gdop_hix22(.L344),%g5
/* 0x225c	     */		ldx	[%sp+2647],%o2
/* 0x2260	     */		xor	%o7,%gdop_lox10(__iob),%o1
/* 0x2264	     */		xor	%g5,%gdop_lox10(.L344),%o0
/* 0x2268	     */		ldx	[%l4+%o1],%l5,%gdop(__iob)
/* 0x226c	     */		ldx	[%l4+%o0],%o1,%gdop(.L344)
/* 0x2270	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x2274	     */		add	%l5,256,%o0
/* 0x2278	1212 */		ldx	[%sp+2559],%o2
/* 0x227c	     */		ldx	[%sp+2695],%o1
/* 0x2280	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2284	     */		mov	%l7,%o0
/* 0x2288	1213 */		ldx	[%sp+2647],%g1
/* 0x228c	     */		ldub	[%g1],%o5

! Registers live out of .L77002984: 
! g1 g2 g3 o0 o5 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002984 .L900000203

			.L900000747:
/* 0x2290	1213 */		brz,pn	%o5,.L900000204
/* 0x2294	     */		add	%g1,1,%g1

! Registers live out of .L900000747: 
! g1 g2 g3 o0 o5 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000747

			.L900000203:
/* 0x2298	1213 */		ldub	[%g1],%l2
/* 0x229c	     */		add	%g1,1,%g1
/* 0x22a0	     */		brnz,a,pt	%l2,.L900000747
/* 0x22a4	     */		ldub	[%g1],%o5

! Registers live out of .L900000203: 
! g1 g2 g3 o0 o5 sp l6 l7 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000203 .L900000747

			.L900000204:
/* 0x22a8	1213 */		sub	%g1,1,%i1
/* 0x22ac	     */		mov	270,%o4
/* 0x22b0	     */		ldx	[%sp+2647],%o5
/* 0x22b4	     */		ldx	[%sp+2719],%o1
/* 0x22b8	     */		mov	10,%o3
/* 0x22bc	1215 */		mov	0,%i5
/* 0x22c0	1213 */		ldx	[%sp+2695],%o2
/* 0x22c4	     */		sub	%i1,%o5,%l4
/* 0x22c8	1268 */		sethi	%hi(0x1400),%i1
/* 0x22cc	1213 */		sra	%l4,0,%g1
/* 0x22d0	1268 */		add	%i1,71,%i1
/* 0x22d4	1213 */		stx	%g1,[%sp+2223]
/* 0x22d8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x22dc	     */		mov	%l7,%o0
/* 0x22e0	1268 */		ldd	[%sp+2775],%f0
/* 0x22e4	1215 */		sll	%i4,6,%o1
/* 0x22e8	     */		sll	%i3,6,%o4
/* 0x22ec	     */		mov	1034,%o7
/* 0x22f0	     */		add	%o4,10,%g4
/* 0x22f4	     */		st	%g4,[%sp+2327]
/* 0x22f8	     */		sub	%o7,%o1,%l2
/* 0x22fc	     */		mov	205,%l4
/* 0x2300	     */		st	%l2,[%sp+2323]
/* 0x2304	     */		st	%l4,[%sp+2319]
/* 0x2308	1268 */		add	%i1,%sp,%i1
/* 0x230c	1218 */		mov	0,%l2

! Registers live out of .L900000204: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002381 .L900000204

			.L900000741:
/* 0x2310	1218 */		ld	[%sp+2327],%o1
/* 0x2314	     */		st	%o1,[%sp+2331]
/* 0x2318	     */		mov	16,%o2
/* 0x231c	     */		st	%o2,[%sp+2335]
/* 0x2320	1223 */		std	%f0,[%sp+2775]

! Registers live out of .L900000741: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002377 .L900000741

			.L900000742:
/* 0x2324	1223 */		sra	%i5,0,%o3
/* 0x2328	     */		sra	%l2,0,%o2
/* 0x232c	     */		sra	%i4,0,%o1
/* 0x2330	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x2334	     */		sra	%i3,0,%o0
/* 0x2338	     */		ldx	[%sp+2407],%o3
/* 0x233c	1225 */		ld	[%sp+2271],%l4
/* 0x2340	1223 */		sllx	%o0,2,%g4
/* 0x2344	     */		ld	[%g4+%o3],%l5
/* 0x2348	1225 */		cmp	%l5,%l4
/* 0x234c	     */		bne,pn	%icc,.L77002353
/* 0x2350	1227 */		ldx	[%sp+2703],%o1

! Registers live out of .L900000742: 
! g2 g3 o0 o1 sp l2 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000742

			.L77002351:
/* 0x2354	1227 */		mov	0,%o2
/* 0x2358	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x235c	     */		mov	%l7,%o0
/* 0x2360	     */		ba	.L900000746
/* 0x2364	1236 */		nop

! Registers live out of .L77002351: 
! g2 g3 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000742

			.L77002353:
/* 0x2368	1229 */		sethi	%hi(0x1400),%l3
/* 0x236c	     */		and	%l5,255,%i0
/* 0x2370	     */		add	%l3,71,%l3
/* 0x2374	     */		sllx	%i0,3,%g1
/* 0x2378	     */		add	%l3,%sp,%l3
/* 0x237c	     */		ldx	[%g1+%l3],%o2
/* 0x2380	     */		stx	%o2,[%sp+3015]
/* 0x2384	1230 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2388	     */		mov	%l7,%o0

! Registers live out of .L77002353: 
! g2 g3 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002351 .L77002353

			.L900000746:
/* 0x238c	1236 */		ld	[%sp+2323],%g1
/* 0x2390	     */		ld	[%sp+2331],%o0
/* 0x2394	1245 */		mov	0,%i0
/* 0x2398	1246 */		mov	0,%l5
/* 0x239c	1236 */		ldx	[%sp+2703],%o2
/* 0x23a0	     */		ldx	[%sp+2711],%o1
/* 0x23a4	     */		sra	%g1,0,%o4
/* 0x23a8	     */		sra	%o0,0,%o3
/* 0x23ac	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x23b0	     */		mov	%l7,%o0
/* 0x23b4	1245 */		ldd	[%sp+2775],%f0
/* 0x23b8	     */		ld	[%sp+2335],%l3

! Registers live out of .L900000746: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002373 .L900000746

			.L900000743:
/* 0x23bc	1246 */		ld	[%sp+2319],%l4
/* 0x23c0	1250 */		std	%f0,[%sp+2775]
/* 0x23c4	1246 */		add	%i0,-1,%o5
/* 0x23c8	     */		st	%o5,[%sp+2347]

! Registers live out of .L900000743: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000743 .L900000745

			.L900000744:
/* 0x23cc	1250 */		sra	%i5,0,%o3
/* 0x23d0	     */		sra	%l2,0,%o2
/* 0x23d4	     */		sra	%i4,0,%o1
/* 0x23d8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x23dc	     */		sra	%i3,0,%o0
/* 0x23e0	     */		ld	[%sp+2347],%f8
/* 0x23e4	     */		ldd	[%sp+2783],%f32
/* 0x23e8	     */		ldd	[%l6-8],%f36
/* 0x23ec	     */		sllx	%o0,3,%o1
/* 0x23f0	1253 */		sra	%i5,0,%o3
/* 0x23f4	1250 */		ldd	[%o1+%i2],%f38
/* 0x23f8	1253 */		sra	%l2,0,%o2
/* 0x23fc	     */		sra	%i4,0,%o1
/* 0x2400	1250 */		fitod	%f8,%f34
/* 0x2404	1253 */		sra	%i3,0,%o0
/* 0x2408	1250 */		fmuld	%f34,%f32,%f32
/* 0x240c	     */		fdivd	%f32,%f36,%f32
/* 0x2410	     */		faddd	%f38,%f32,%f32
/* 0x2414	1253 */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x2418	1250 */		std	%f32,[%fp+2023]
/* 0x241c	1253 */		add	%l5,-1,%o5
/* 0x2420	     */		st	%o5,[%fp+2031]
/* 0x2424	     */		ld	[%fp+2031],%f8
/* 0x2428	     */		sllx	%o0,3,%o2
/* 0x242c	     */		ldd	[%sp+2791],%f32
/* 0x2430	     */		ldd	[%l6-8],%f36
/* 0x2434	     */		ldx	[%sp+2639],%o4
/* 0x2438	1255 */		ldd	[%fp+2023],%f0
/* 0x243c	1253 */		fitod	%f8,%f34
/* 0x2440	     */		ldd	[%o2+%o4],%f38
/* 0x2444	     */		fmuld	%f34,%f32,%f32
/* 0x2448	     */		fdivd	%f32,%f36,%f32
/* 0x244c	     */		fsubd	%f38,%f32,%f2
/* 0x2450	1255 */		call	mbrot	!params=  %o2 %f0 %f1 %f2 %f3	!result=  %o0
/* 0x2454	     */		ld	[%sp+2271],%o2
/* 0x2458	1264 */		ld	[%sp+2271],%o4
/* 0x245c	     */		cmp	%o0,%o4
/* 0x2460	     */		bne,pn	%icc,.L77002367
/* 0x2464	1265 */		ldx	[%sp+2679],%o1

! Registers live out of .L900000744: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000744

			.L77002365:
/* 0x2468	1265 */		mov	0,%o2
/* 0x246c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2470	     */		mov	%l7,%o0
/* 0x2474	     */		ba	.L900000745
/* 0x2478	1272 */		nop

! Registers live out of .L77002365: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000744

			.L77002367:
/* 0x247c	1268 */		and	%o0,255,%o3
/* 0x2480	1269 */		mov	%l7,%o0
/* 0x2484	1268 */		sllx	%o3,3,%g5
/* 0x2488	     */		ldx	[%g5+%i1],%o2
/* 0x248c	1269 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2490	1268 */		stx	%o2,[%sp+3015]

! Registers live out of .L77002367: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002365 .L77002367

			.L900000745:
/* 0x2494	1272 */		sra	%l4,0,%o4
/* 0x2498	     */		sra	%l3,0,%o3
/* 0x249c	     */		ldx	[%sp+2679],%o2
/* 0x24a0	     */		ldx	[%sp+2687],%o1
/* 0x24a4	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x24a8	     */		mov	%l7,%o0
/* 0x24ac	1246 */		add	%l5,1,%l5
/* 0x24b0	     */		ldd	[%sp+2775],%f0
/* 0x24b4	     */		add	%l4,1,%l4
/* 0x24b8	     */		cmp	%l5,2
/* 0x24bc	     */		ble,a,pt	%icc,.L900000744
/* 0x24c0	1250 */		std	%f0,[%sp+2775]

! Registers live out of .L900000745: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000745

			.L77002373:
/* 0x24c4	1245 */		add	%i0,1,%i0
/* 0x24c8	     */		add	%l3,1,%l3
/* 0x24cc	     */		cmp	%i0,2
/* 0x24d0	     */		ble,pt	%icc,.L900000743
/* 0x24d4	1246 */		mov	0,%l5

! Registers live out of .L77002373: 
! g2 g3 o0 sp l2 l5 l6 l7 i0 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002373

			.L77002377:
/* 0x24d8	1218 */		ld	[%sp+2331],%o0
/* 0x24dc	     */		ld	[%sp+2335],%o7
/* 0x24e0	     */		add	%l2,1,%l2
/* 0x24e4	     */		cmp	%l2,63
/* 0x24e8	     */		add	%o0,1,%g4
/* 0x24ec	     */		st	%g4,[%sp+2331]
/* 0x24f0	     */		add	%o7,3,%g1
/* 0x24f4	     */		st	%g1,[%sp+2335]
/* 0x24f8	     */		ble,a,pt	%icc,.L900000742
/* 0x24fc	1223 */		std	%f0,[%sp+2775]

! Registers live out of .L77002377: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002377

			.L77002381:
/* 0x2500	1215 */		ld	[%sp+2319],%o5
/* 0x2504	     */		ld	[%sp+2323],%o1
/* 0x2508	     */		add	%i5,1,%i5
/* 0x250c	     */		cmp	%i5,63
/* 0x2510	     */		add	%o5,-3,%o3
/* 0x2514	     */		add	%o1,-1,%o2
/* 0x2518	     */		st	%o3,[%sp+2319]
/* 0x251c	     */		st	%o2,[%sp+2323]
/* 0x2520	     */		ble,pt	%icc,.L900000741
/* 0x2524	1218 */		mov	0,%l2

! Registers live out of .L77002381: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002381

			.L77002385:
/* 0x2528	1278 */		add	%sp,2463,%o1
/* 0x252c	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x2530	     */		mov	3,%o0
/* 0x2534	1280 */		ldx	[%sp+2463],%o2
/* 0x2538	     */		ldx	[%sp+2495],%o0
/* 0x253c	     */		ldx	[%sp+2503],%o1
/* 0x2540	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x2544	     */		ldx	[%sp+2471],%o3
/* 0x2548	1281 */		sethi	%gdop_hix22(.L402),%g1
/* 0x254c	     */		stx	%o0,[%fp+2023]
/* 0x2550	     */		ldd	[%l6-40],%f4
/* 0x2554	     */		xor	%g1,%gdop_lox10(.L402),%i1
/* 0x2558	     */		ldd	[%fp+2023],%f0
/* 0x255c	     */		ldd	[%l6-32],%f36
/* 0x2560	     */		ldd	[%l6],%f40
/* 0x2564	     */		ldx	[%sp+2399],%i3
/* 0x2568	1280 */		mov	%o0,%o2
/* 0x256c	1281 */		ldx	[%sp+2647],%o0
/* 0x2570	     */		fmovs	%f4,%f2
/* 0x2574	     */		fmovs	%f4,%f6
/* 0x2578	     */		fmovs	%f1,%f3
/* 0x257c	     */		fmovs	%f0,%f7
/* 0x2580	     */		ldx	[%i3+%i1],%o1,%gdop(.L402)
/* 0x2584	     */		fsubd	%f2,%f4,%f32
/* 0x2588	     */		fsubd	%f6,%f4,%f34
/* 0x258c	     */		fabsd	%f32,%f38
/* 0x2590	     */		fabsd	%f34,%f32
/* 0x2594	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x2598	     */		fdivd	%f32,%f40,%f32
/* 0x259c	     */		std	%f32,[%sp+2983]
/* 0x25a0	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x25a4	     */		ldx	[%sp+2983],%o3
/* 0x25a8	1282 */		sethi	%gdop_hix22(__iob),%o0
/* 0x25ac	     */		sethi	%gdop_hix22(.L344),%g4
/* 0x25b0	     */		ldx	[%sp+2647],%o2
/* 0x25b4	     */		xor	%o0,%gdop_lox10(__iob),%i4
/* 0x25b8	     */		xor	%g4,%gdop_lox10(.L344),%l4
/* 0x25bc	     */		ldx	[%i3+%i4],%l5,%gdop(__iob)
/* 0x25c0	     */		ldx	[%i3+%l4],%o1,%gdop(.L344)
/* 0x25c4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x25c8	     */		add	%l5,256,%o0
/* 0x25cc	1283 */		ldx	[%sp+2447],%o2
/* 0x25d0	     */		ldx	[%sp+2695],%o1
/* 0x25d4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x25d8	     */		mov	%l7,%o0
/* 0x25dc	1284 */		ldx	[%sp+2647],%o7
/* 0x25e0	     */		ldub	[%o7],%i4

! Registers live out of .L77002385: 
! g2 g3 o0 sp o7 l5 l6 l7 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002385 .L900000283

			.L900000740:
/* 0x25e4	1284 */		brz,pn	%i4,.L900000284
/* 0x25e8	     */		add	%o7,1,%o7

! Registers live out of .L900000740: 
! g2 g3 o0 sp o7 l5 l6 l7 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000740

			.L900000283:
/* 0x25ec	1284 */		ldub	[%o7],%o5
/* 0x25f0	     */		add	%o7,1,%o7
/* 0x25f4	     */		brnz,a,pt	%o5,.L900000740
/* 0x25f8	     */		ldub	[%o7],%i4

! Registers live out of .L900000283: 
! g2 g3 o0 sp o7 l5 l6 l7 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000283 .L900000740

			.L900000284:
/* 0x25fc	1284 */		ldx	[%sp+2647],%o5
/* 0x2600	     */		sub	%o7,1,%i3
/* 0x2604	     */		mov	290,%o4
/* 0x2608	     */		ldx	[%sp+2719],%o1
/* 0x260c	     */		mov	10,%o3
/* 0x2610	     */		ldx	[%sp+2695],%o2
/* 0x2614	     */		sub	%i3,%o5,%i4
/* 0x2618	     */		sra	%i4,0,%g4
/* 0x261c	     */		stx	%g4,[%sp+2223]
/* 0x2620	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2624	     */		mov	%l7,%o0
/* 0x2628	     */		ldd	[%sp+2775],%f0
/* 0x262c	     */		ba	.L900000698
/* 0x2630	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000284: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002313

			.L77003396:
/* 0x2634	1043 */		add	%i1,-2,%i5
/* 0x2638	     */		st	%i5,[%sp+2311]

! Registers live out of .L77003396: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002315 .L77002317 .L77002319 .L77003396

			.L77002387:
/* 0x263c	1292 */		cmp	%l4,1268
/* 0x2640	     */		ble,pn	%icc,.L77002781
/* 0x2644	     */		cmp	%i1,733

! Registers live out of .L77002387: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002387

			.L77002389:
/* 0x2648	1292 */		ble,pn	%icc,.L77002781
/* 0x264c	     */		cmp	%l4,1440

! Registers live out of .L77002389: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002389

			.L77002391:
/* 0x2650	1292 */		bl,pn	%icc,.L77002393
/* 0x2654	 951 */		cmp	%i1,783

! Registers live out of .L77002391: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002391

			.L77003183:
/* 0x2658	 951 */		ble,pn	%icc,.L77002781
/* 0x265c	1444 */		cmp	%i1,915

! Registers live out of .L77003183: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003183

			.L77002431:
/* 0x2660	1444 */		ble,pn	%icc,.L77002467
/* 0x2664	     */		cmp	%l4,1442

! Registers live out of .L77002431: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002431

			.L77002433:
/* 0x2668	1444 */		bl,a,pt	%icc,.L900000739
/* 0x266c	     */		cmp	%i1,932

! Registers live out of .L77002433: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002433

			.L900000789:
/* 0x2670	1444 */		ba	.L900000698
/* 0x2674	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000789: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002391

			.L77002393:
/* 0x2678	   0 */		ldx	[%sp+2399],%o4
/* 0x267c	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i0
/* 0x2680	1292 */		cmp	%i1,742
/* 0x2684	   0 */		xor	%i0,%gdop_lox10(.L___const_seg_900000101),%l2
/* 0x2688	   0 */		ldx	[%o4+%l2],%o4,%gdop(.L___const_seg_900000101)
/* 0x268c	1292 */		bge,pn	%icc,.L77002407
/* 0x2690	   0 */		add	%o4,40,%i5

! Registers live out of .L77002393: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002393

			.L77002985:
/* 0x2694	1294 */		mov	0,%o5
/* 0x2698	     */		ldx	[%sp+2679],%o1
/* 0x269c	     */		mov	1,%o4
/* 0x26a0	     */		mov	0,%o3
/* 0x26a4	     */		mov	8,%o2
/* 0x26a8	1296 */		mov	16,%i4
/* 0x26ac	1294 */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x26b0	     */		mov	%l7,%o0
/* 0x26b4	1295 */		ldx	[%l7+232],%o2
/* 0x26b8	1321 */		mov	223,%l2
/* 0x26bc	1295 */		ldx	[%sp+2671],%g4
/* 0x26c0	     */		mov	%l7,%o0
/* 0x26c4	1321 */		mov	0,%l3
/* 0x26c8	1295 */		ldx	[%sp+2679],%o1
/* 0x26cc	     */		add	%o2,%g4,%o3
/* 0x26d0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x26d4	     */		ldx	[%o3+96],%o2
/* 0x26d8	1296 */		mov	388,%o5
/* 0x26dc	     */		mov	16,%o4
/* 0x26e0	     */		ldx	[%sp+2687],%o1
/* 0x26e4	     */		mov	218,%o3
/* 0x26e8	     */		mov	%l7,%o0
/* 0x26ec	     */		stx	%i4,[%sp+2223]
/* 0x26f0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x26f4	     */		ldx	[%sp+2679],%o2
/* 0x26f8	1298 */		mov	0,%o5
/* 0x26fc	     */		ldx	[%sp+2679],%o1
/* 0x2700	     */		mov	1,%o4
/* 0x2704	     */		mov	0,%o3
/* 0x2708	     */		mov	1,%o2
/* 0x270c	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x2710	     */		mov	%l7,%o0
/* 0x2714	1305 */		ldx	[%sp+2447],%o2
/* 0x2718	     */		ldx	[%sp+2679],%o1
/* 0x271c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2720	     */		mov	%l7,%o0
/* 0x2724	1306 */		ldx	[%sp+2679],%o2
/* 0x2728	     */		mov	388,%o5
/* 0x272c	     */		ldx	[%sp+2687],%o1
/* 0x2730	     */		mov	16,%o4
/* 0x2734	     */		stx	%i4,[%sp+2223]
/* 0x2738	     */		mov	218,%o3
/* 0x273c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2740	     */		mov	%l7,%o0
/* 0x2744	1320 */		ldx	[%sp+2511],%o2
/* 0x2748	     */		ldx	[%sp+2679],%o1
/* 0x274c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2750	     */		mov	%l7,%o0
/* 0x2754	1323 */		sra	%l2,0,%o3
/* 0x2758	1321 */		ldd	[%sp+2775],%f0

! Registers live out of .L77002985: 
! g2 g3 o3 o5 sp l2 l4 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002985 .L900000738

			.L900000738:
/* 0x275c	1323 */		mov	20,%i0
/* 0x2760	     */		ldx	[%sp+2679],%o2
/* 0x2764	     */		mov	13,%o4
/* 0x2768	     */		ldx	[%sp+2687],%o1
/* 0x276c	     */		mov	%l7,%o0
/* 0x2770	1321 */		add	%l3,1,%l3
/* 0x2774	1323 */		std	%f0,[%sp+2775]
/* 0x2778	     */		stx	%i0,[%sp+2223]
/* 0x277c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2780	     */		mov	%o3,%o5
/* 0x2784	1321 */		add	%l2,8,%l2
/* 0x2788	     */		ldd	[%sp+2775],%f0
/* 0x278c	     */		cmp	%l3,20
/* 0x2790	     */		ble,pt	%icc,.L900000738
/* 0x2794	1323 */		sra	%l2,0,%o3

! Registers live out of .L900000738: 
! g2 g3 o0 o3 o5 sp l2 l4 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000738

			.L77002403:
/* 0x2798	1326 */		ldx	[%sp+2479],%o2
/* 0x279c	1329 */		mov	20,%i0
/* 0x27a0	1326 */		ldx	[%sp+2679],%o1
/* 0x27a4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x27a8	     */		mov	%l7,%o0
/* 0x27ac	1329 */		mov	13,%o4
/* 0x27b0	     */		ldub	[%sp+2263],%g1
/* 0x27b4	     */		ldx	[%sp+2687],%o1
/* 0x27b8	     */		mov	%l7,%o0
/* 0x27bc	     */		ldx	[%sp+2679],%o2
/* 0x27c0	     */		stx	%i0,[%sp+2223]
/* 0x27c4	     */		sll	%g1,3,%i1
/* 0x27c8	     */		add	%i1,223,%l5
/* 0x27cc	     */		sra	%l5,0,%o5
/* 0x27d0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x27d4	     */		mov	%o5,%o3
/* 0x27d8	1334 */		add	%l4,-1270,%g4
/* 0x27dc	1338 */		ldx	[%sp+2679],%o2
/* 0x27e0	     */		ldx	[%sp+2687],%o1
/* 0x27e4	1334 */		sra	%g4,31,%o0
/* 0x27e8	1338 */		mov	13,%o4
/* 0x27ec	     */		stx	%i0,[%sp+2223]
/* 0x27f0	1334 */		and	%o0,7,%i4
/* 0x27f4	1338 */		mov	%l7,%o0
/* 0x27f8	1334 */		add	%g4,%i4,%l4
/* 0x27fc	     */		sra	%l4,3,%o3
/* 0x2800	1338 */		and	%l4,2040,%i3
/* 0x2804	     */		add	%i3,222,%o7
/* 0x2808	     */		sra	%o7,0,%o5
/* 0x280c	1334 */		and	%o3,255,%l4
/* 0x2810	1338 */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2814	     */		mov	%o5,%o3
/* 0x2818	1342 */		add	%i3,223,%o1
/* 0x281c	     */		ldx	[%sp+2679],%o2
/* 0x2820	     */		stx	%i0,[%sp+2223]
/* 0x2824	     */		sra	%o1,0,%o5
/* 0x2828	     */		ldx	[%sp+2687],%o1
/* 0x282c	     */		mov	13,%o4
/* 0x2830	     */		mov	%l7,%o0
/* 0x2834	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2838	     */		mov	%o5,%o3
/* 0x283c	1346 */		add	%i3,224,%g5
/* 0x2840	     */		ldx	[%sp+2679],%o2
/* 0x2844	     */		ldx	[%sp+2687],%o1
/* 0x2848	     */		sra	%g5,0,%o5
/* 0x284c	     */		mov	13,%o4
/* 0x2850	     */		stx	%i0,[%sp+2223]
/* 0x2854	     */		mov	%l7,%o0
/* 0x2858	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x285c	     */		mov	%o5,%o3
/* 0x2860	1348 */		ldx	[%sp+2559],%o2
/* 0x2864	     */		ldx	[%sp+2679],%o1
/* 0x2868	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x286c	     */		mov	%l7,%o0
/* 0x2870	1351 */		sra	%l5,0,%o5
/* 0x2874	     */		ldx	[%sp+2679],%o2
/* 0x2878	     */		ldx	[%sp+2687],%o1
/* 0x287c	     */		mov	13,%o4
/* 0x2880	     */		stx	%i0,[%sp+2223]
/* 0x2884	     */		mov	%l7,%o0
/* 0x2888	1353 */		add	%l4,-10,%l3
/* 0x288c	1351 */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2890	     */		sra	%l5,0,%o3
/* 0x2894	1353 */		st	%l3,[%fp+2023]
/* 0x2898	     */		ldd	[%i5],%f0
/* 0x289c	1358 */		sethi	%gdop_hix22(.L414),%i5
/* 0x28a0	1353 */		ld	[%fp+2023],%f8
/* 0x28a4	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x28a8	     */		fitod	%f8,%f2
/* 0x28ac	1355 */		ldx	[%sp+2591],%o2
/* 0x28b0	     */		ldx	[%sp+2679],%o1
/* 0x28b4	1353 */		std	%f0,[%sp+2663]
/* 0x28b8	1355 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x28bc	     */		mov	%l7,%o0
/* 0x28c0	1358 */		ldx	[%sp+2399],%i1
/* 0x28c4	     */		ldx	[%sp+2663],%o3
/* 0x28c8	     */		ldx	[%sp+2647],%o0
/* 0x28cc	     */		xor	%i5,%gdop_lox10(.L414),%o5
/* 0x28d0	     */		sra	%l3,0,%o2
/* 0x28d4	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x28d8	     */		ldx	[%i1+%o5],%o1,%gdop(.L414)
/* 0x28dc	1360 */		ldx	[%sp+2647],%o2
/* 0x28e0	     */		ldub	[%o2],%l2

! Registers live out of .L77002403: 
! g2 g3 o0 o2 sp l2 l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002403 .L900000279

			.L900000737:
/* 0x28e4	1360 */		brz,pn	%l2,.L900000280
/* 0x28e8	     */		add	%o2,1,%o2

! Registers live out of .L900000737: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000737

			.L900000279:
/* 0x28ec	1360 */		ldub	[%o2],%l2
/* 0x28f0	     */		add	%o2,1,%o2
/* 0x28f4	     */		brnz,a,pt	%l2,.L900000737
/* 0x28f8	     */		ldub	[%o2],%l2

! Registers live out of .L900000279: 
! g2 g3 o0 o2 sp l2 l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000279 .L900000737

			.L900000280:
/* 0x28fc	1360 */		ldx	[%sp+2647],%o5
/* 0x2900	     */		sub	%o2,1,%o3
/* 0x2904	     */		mov	40,%o4
/* 0x2908	     */		ldx	[%sp+2679],%o2
/* 0x290c	     */		ldx	[%sp+2687],%o1
/* 0x2910	     */		sub	%o3,%o5,%l3
/* 0x2914	     */		mov	215,%o3
/* 0x2918	     */		sra	%l3,0,%i1
/* 0x291c	     */		stx	%i1,[%sp+2223]
/* 0x2920	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2924	     */		mov	%l7,%o0
/* 0x2928	1362 */		stb	%l4,[%sp+2263]
/* 0x292c	1364 */		call	XFlush	!params=  %o0	!result= 
/* 0x2930	     */		mov	%l7,%o0
/* 0x2934	     */		ldd	[%sp+2775],%f0
/* 0x2938	     */		ba	.L900000698
/* 0x293c	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000280: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002393

			.L77002407:
/* 0x2940	1364 */		cmp	%i1,783
/* 0x2944	     */		ble,pn	%icc,.L77002781
/* 0x2948	     */		cmp	%i1,792

! Registers live out of .L77002407: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002407

			.L77002411:
/* 0x294c	1364 */		bge,pn	%icc,.L77002429
/* 0x2950	1370 */		mov	0,%o5

! Registers live out of .L77002411: 
! g2 g3 o0 o5 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002411

			.L77002987:
/* 0x2954	1370 */		ldx	[%sp+2679],%o1
/* 0x2958	     */		mov	1,%o4
/* 0x295c	     */		mov	0,%o3
/* 0x2960	     */		mov	8,%o2
/* 0x2964	1372 */		mov	66,%i0
/* 0x2968	1370 */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x296c	     */		mov	%l7,%o0
/* 0x2970	1381 */		mov	223,%i3
/* 0x2974	1371 */		ldx	[%l7+232],%l5
/* 0x2978	     */		ldx	[%sp+2671],%l3
/* 0x297c	     */		mov	%l7,%o0
/* 0x2980	1381 */		mov	0,%i1
/* 0x2984	1371 */		ldx	[%sp+2679],%o1
/* 0x2988	     */		add	%l5,%l3,%g1
/* 0x298c	1383 */		mov	70,%l5
/* 0x2990	1371 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2994	     */		ldx	[%g1+96],%o2
/* 0x2998	1372 */		mov	388,%o5
/* 0x299c	     */		mov	66,%o4
/* 0x29a0	     */		ldx	[%sp+2687],%o1
/* 0x29a4	     */		mov	218,%o3
/* 0x29a8	     */		mov	%l7,%o0
/* 0x29ac	     */		stx	%i0,[%sp+2223]
/* 0x29b0	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x29b4	     */		ldx	[%sp+2679],%o2
/* 0x29b8	1374 */		mov	0,%o5
/* 0x29bc	     */		mov	1,%o4
/* 0x29c0	     */		ldx	[%sp+2679],%o1
/* 0x29c4	     */		mov	0,%o3
/* 0x29c8	     */		mov	1,%o2
/* 0x29cc	     */		call	XSetLineAttributes	!params=  %o0 %o1 %o2 %o3 %o4 %o5	!result= 
/* 0x29d0	     */		mov	%l7,%o0
/* 0x29d4	1377 */		ldx	[%sp+2527],%o2
/* 0x29d8	     */		ldx	[%sp+2679],%o1
/* 0x29dc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x29e0	     */		mov	%l7,%o0
/* 0x29e4	1378 */		mov	388,%o5
/* 0x29e8	     */		ldx	[%sp+2679],%o2
/* 0x29ec	     */		mov	66,%o4
/* 0x29f0	     */		mov	218,%o3
/* 0x29f4	     */		ldx	[%sp+2687],%o1
/* 0x29f8	     */		stx	%i0,[%sp+2223]
/* 0x29fc	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a00	     */		mov	%l7,%o0
/* 0x2a04	1380 */		ldx	[%sp+2511],%o2
/* 0x2a08	     */		ldx	[%sp+2679],%o1
/* 0x2a0c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2a10	     */		mov	%l7,%o0
/* 0x2a14	1383 */		sra	%i3,0,%o3

! Registers live out of .L77002987: 
! g2 g3 o3 o5 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002987 .L900000736

			.L900000736:
/* 0x2a18	1383 */		mov	63,%o4
/* 0x2a1c	     */		mov	%l7,%o0
/* 0x2a20	     */		ldx	[%sp+2679],%o2
/* 0x2a24	     */		ldx	[%sp+2687],%o1
/* 0x2a28	1381 */		add	%i1,1,%i1
/* 0x2a2c	1383 */		stx	%l5,[%sp+2223]
/* 0x2a30	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a34	     */		mov	%o3,%o5
/* 0x2a38	1381 */		add	%i3,8,%i3
/* 0x2a3c	     */		cmp	%i1,20
/* 0x2a40	     */		ble,pt	%icc,.L900000736
/* 0x2a44	1383 */		sra	%i3,0,%o3

! Registers live out of .L900000736: 
! g2 g3 o0 o3 o5 sp l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000736

			.L77002421:
/* 0x2a48	1386 */		ldx	[%sp+2479],%o2
/* 0x2a4c	     */		ldx	[%sp+2679],%o1
/* 0x2a50	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2a54	     */		mov	%l7,%o0
/* 0x2a58	1389 */		ldub	[%sp+2264],%i4
/* 0x2a5c	     */		ldx	[%sp+2687],%o1
/* 0x2a60	     */		ldx	[%sp+2679],%o2
/* 0x2a64	     */		mov	63,%o4
/* 0x2a68	     */		mov	%l7,%o0
/* 0x2a6c	     */		stx	%l5,[%sp+2223]
/* 0x2a70	     */		sll	%i4,3,%g4
/* 0x2a74	     */		add	%g4,223,%i3
/* 0x2a78	     */		sra	%i3,0,%o5
/* 0x2a7c	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2a80	     */		mov	%o5,%o3
/* 0x2a84	1397 */		ldx	[%sp+2679],%o2
/* 0x2a88	     */		ldx	[%sp+2687],%o1
/* 0x2a8c	     */		mov	63,%o4
/* 0x2a90	1393 */		add	%l4,-1270,%o3
/* 0x2a94	1397 */		mov	%l7,%o0
/* 0x2a98	     */		stx	%l5,[%sp+2223]
/* 0x2a9c	1393 */		sra	%o3,31,%l4
/* 0x2aa0	     */		and	%l4,7,%o7
/* 0x2aa4	     */		add	%o3,%o7,%g5
/* 0x2aa8	1397 */		and	%g5,2040,%i0
/* 0x2aac	1393 */		sra	%g5,3,%l3
/* 0x2ab0	1397 */		add	%i0,222,%o5
/* 0x2ab4	     */		sra	%o5,0,%o5
/* 0x2ab8	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2abc	     */		mov	%o5,%o3
/* 0x2ac0	1401 */		add	%i0,223,%o2
/* 0x2ac4	     */		ldx	[%sp+2687],%o1
/* 0x2ac8	     */		stx	%l5,[%sp+2223]
/* 0x2acc	     */		sra	%o2,0,%o5
/* 0x2ad0	     */		ldx	[%sp+2679],%o2
/* 0x2ad4	     */		mov	63,%o4
/* 0x2ad8	     */		mov	%l7,%o0
/* 0x2adc	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2ae0	     */		mov	%o5,%o3
/* 0x2ae4	1405 */		add	%i0,224,%o4
/* 0x2ae8	     */		ldx	[%sp+2679],%o2
/* 0x2aec	     */		ldx	[%sp+2687],%o1
/* 0x2af0	     */		sra	%o4,0,%o5
/* 0x2af4	     */		mov	63,%o4
/* 0x2af8	     */		stx	%l5,[%sp+2223]
/* 0x2afc	     */		mov	%l7,%o0
/* 0x2b00	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2b04	     */		mov	%o5,%o3
/* 0x2b08	1407 */		ldx	[%sp+2559],%o2
/* 0x2b0c	     */		ldx	[%sp+2679],%o1
/* 0x2b10	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2b14	     */		mov	%l7,%o0
/* 0x2b18	1393 */		and	%l3,255,%l3
/* 0x2b1c	1410 */		ldx	[%sp+2679],%o2
/* 0x2b20	     */		ldx	[%sp+2687],%o1
/* 0x2b24	     */		sra	%i3,0,%o5
/* 0x2b28	     */		mov	63,%o4
/* 0x2b2c	     */		stx	%l5,[%sp+2223]
/* 0x2b30	     */		mov	%l7,%o0
/* 0x2b34	     */		call	XDrawLine	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2b38	     */		sra	%i3,0,%o3
/* 0x2b3c	1412 */		add	%l3,-10,%l2
/* 0x2b40	     */		st	%l2,[%fp+2023]
/* 0x2b44	     */		ldd	[%i5],%f0
/* 0x2b48	     */		ld	[%fp+2023],%f8
/* 0x2b4c	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x2b50	     */		fitod	%f8,%f2
/* 0x2b54	1415 */		ldd	[%i5-16],%f4
/* 0x2b58	     */		ldd	[%i5+32],%f34
/* 0x2b5c	     */		ld	[%sp+2271],%f3
/* 0x2b60	     */		fmovs	%f4,%f2
/* 0x2b64	     */		fsubd	%f2,%f4,%f32
/* 0x2b68	     */		fabsd	%f32,%f32
/* 0x2b6c	     */		fmuld	%f32,%f0,%f32
/* 0x2b70	     */		fcmped	%fcc2,%f32,%f34
/* 0x2b74	     */		fbuge,pn	%fcc2,.L77002425
/* 0x2b78	1418 */		ldx	[%sp+2679],%o1

! Registers live out of .L77002421: 
! g2 g3 o0 o1 o2 sp l2 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002421

			.L77002423:
/* 0x2b7c	1417 */		ldd	[%i5-24],%f0
/* 0x2b80	1418 */		mov	%l7,%o0
/* 0x2b84	     */		std	%f0,[%sp+2775]
/* 0x2b88	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2b8c	     */		ldx	[%sp+2479],%o2
/* 0x2b90	1419 */		sethi	%gdop_hix22(.L428),%i0
/* 0x2b94	     */		ldx	[%sp+2399],%l5
/* 0x2b98	     */		ldx	[%sp+2647],%o0
/* 0x2b9c	     */		xor	%i0,%gdop_lox10(.L428),%l2
/* 0x2ba0	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2ba4	     */		ldx	[%l5+%l2],%o1,%gdop(.L428)
/* 0x2ba8	1421 */		ldx	[%sp+2647],%i1
/* 0x2bac	     */		ldub	[%i1],%i3

! Registers live out of .L77002423: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002423 .L900000275

			.L900000735:
/* 0x2bb0	1421 */		brz,pn	%i3,.L900000276
/* 0x2bb4	     */		add	%i1,1,%i1

! Registers live out of .L900000735: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000735

			.L900000275:
/* 0x2bb8	1421 */		ldub	[%i1],%o0
/* 0x2bbc	     */		add	%i1,1,%i1
/* 0x2bc0	     */		brnz,a,pt	%o0,.L900000735
/* 0x2bc4	     */		ldub	[%i1],%i3

! Registers live out of .L900000275: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000275 .L900000735

			.L900000276:
/* 0x2bc8	1421 */		ldx	[%sp+2647],%o5
/* 0x2bcc	     */		sub	%i1,1,%o7
/* 0x2bd0	     */		ldx	[%sp+2679],%o2
/* 0x2bd4	     */		mov	90,%o4
/* 0x2bd8	     */		mov	215,%o3
/* 0x2bdc	     */		ldx	[%sp+2687],%o1
/* 0x2be0	     */		sub	%o7,%o5,%l5
/* 0x2be4	     */		sra	%l5,0,%i0
/* 0x2be8	     */		stx	%i0,[%sp+2223]
/* 0x2bec	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2bf0	     */		mov	%l7,%o0
/* 0x2bf4	1425 */		mov	10,%g4
/* 0x2bf8	     */		ldd	[%sp+2775],%f0
/* 0x2bfc	     */		stb	%g4,[%sp+2264]
/* 0x2c00	     */		ba	.L900000698
/* 0x2c04	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000276: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002421

			.L77002425:
/* 0x2c08	1429 */		ldx	[%sp+2447],%o2
/* 0x2c0c	     */		ldx	[%sp+2679],%o1
/* 0x2c10	     */		std	%f0,[%sp+2775]
/* 0x2c14	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2c18	     */		mov	%l7,%o0
/* 0x2c1c	1432 */		sethi	%gdop_hix22(.L414),%g1
/* 0x2c20	     */		ldx	[%sp+2399],%l4
/* 0x2c24	     */		ldx	[%sp+2647],%o0
/* 0x2c28	     */		xor	%g1,%gdop_lox10(.L414),%l5
/* 0x2c2c	     */		ldx	[%sp+2775],%o3
/* 0x2c30	     */		sra	%l2,0,%o2
/* 0x2c34	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2c38	     */		ldx	[%l4+%l5],%o1,%gdop(.L414)
/* 0x2c3c	1435 */		ldx	[%sp+2647],%i5
/* 0x2c40	     */		ldub	[%i5],%l4

! Registers live out of .L77002425: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002425 .L900000271

			.L900000734:
/* 0x2c44	1435 */		brz,pn	%l4,.L900000272
/* 0x2c48	     */		add	%i5,1,%i5

! Registers live out of .L900000734: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000734

			.L900000271:
/* 0x2c4c	1435 */		ldub	[%i5],%o4
/* 0x2c50	     */		add	%i5,1,%i5
/* 0x2c54	     */		brnz,a,pt	%o4,.L900000734
/* 0x2c58	     */		ldub	[%i5],%l4

! Registers live out of .L900000271: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000271 .L900000734

			.L900000272:
/* 0x2c5c	1435 */		ldx	[%sp+2647],%o5
/* 0x2c60	     */		sub	%i5,1,%l4
/* 0x2c64	     */		ldx	[%sp+2679],%o2
/* 0x2c68	     */		mov	90,%o4
/* 0x2c6c	     */		mov	215,%o3
/* 0x2c70	     */		sub	%l4,%o5,%i5
/* 0x2c74	     */		sra	%i5,0,%o1
/* 0x2c78	     */		stx	%o1,[%sp+2223]
/* 0x2c7c	     */		ldx	[%sp+2687],%o1
/* 0x2c80	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2c84	     */		mov	%l7,%o0
/* 0x2c88	1437 */		ldd	[%sp+2775],%f0
/* 0x2c8c	     */		stb	%l3,[%sp+2264]
/* 0x2c90	     */		ba	.L900000698
/* 0x2c94	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000272: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002411

			.L77002429:
/* 0x2c98	1444 */		cmp	%l4,1372
/* 0x2c9c	     */		ble,pn	%icc,.L77002781
/* 0x2ca0	 951 */		cmp	%i1,915

! Registers live out of .L77002429: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002429

			.L77003191:
/* 0x2ca4	 951 */		ble,pn	%icc,.L900000733
/* 0x2ca8	1461 */		cmp	%i1,885

! Registers live out of .L77003191: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77003191

			.L77002435:
/* 0x2cac	1444 */		cmp	%i1,932

! Registers live out of .L77002435: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002433 .L77002435

			.L900000739:
/* 0x2cb0	1444 */		bge,pn	%icc,.L77002781
/* 0x2cb4	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%i3

! Registers live out of .L900000739: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000739

			.L77002437:
/* 0x2cb8	   0 */		ldx	[%sp+2399],%l3
/* 0x2cbc	1444 */		ldd	[%sp+2759],%f34
/* 0x2cc0	   0 */		xor	%i3,%gdop_lox10(.L___const_seg_900000101),%o0
/* 0x2cc4	   0 */		ldx	[%l3+%o0],%o5,%gdop(.L___const_seg_900000101)
/* 0x2cc8	1444 */		ldd	[%o5+8],%f32
/* 0x2ccc	     */		ldd	[%o5+80],%f36
/* 0x2cd0	     */		faddd	%f34,%f32,%f32
/* 0x2cd4	     */		fcmped	%fcc3,%f32,%f36
/* 0x2cd8	     */		fbule,pn	%fcc3,.L77002781
/* 0x2cdc	     */		ldd	[%sp+2767],%f34

! Registers live out of .L77002437: 
! g2 g3 o0 o5 sp l4 l5 l6 l7 i2 i5 fp gsr 
! f0 f1 f34 f36 
		                       
! predecessor blocks: .L77002437

			.L77002439:
/* 0x2ce0	1444 */		ldd	[%o5+8],%f32
/* 0x2ce4	     */		faddd	%f34,%f32,%f32
/* 0x2ce8	     */		fcmped	%fcc0,%f32,%f36
/* 0x2cec	     */		fbule,pn	%fcc0,.L77002781
/* 0x2cf0	1454 */		ld	[%sp+2303],%g5

! Registers live out of .L77002439: 
! g2 g3 g5 o0 o5 sp l4 l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002439

			.L77002441:
/* 0x2cf4	1454 */		cmp	%g5,0
/* 0x2cf8	     */		bne,pn	%icc,.L77002990
/* 0x2cfc	1457 */		ldx	[%sp+2679],%o1

! Registers live out of .L77002441: 
! g2 g3 o0 o1 o5 sp l4 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002441

			.L77002443:
/* 0x2d00	1457 */		ldx	[%sp+2527],%o2
/* 0x2d04	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2d08	     */		mov	%l7,%o0
/* 0x2d0c	1458 */		mov	20,%i5
/* 0x2d10	     */		ldx	[%sp+2687],%o1
/* 0x2d14	     */		mov	72,%o5
/* 0x2d18	     */		mov	192,%o4
/* 0x2d1c	     */		stx	%i5,[%sp+2223]
/* 0x2d20	     */		mov	320,%o3
/* 0x2d24	     */		mov	%l7,%o0
/* 0x2d28	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2d2c	     */		ldx	[%sp+2679],%o2
/* 0x2d30	1459 */		ldx	[%sp+2399],%l2
/* 0x2d34	     */		sethi	%gdop_hix22(.L440),%o1
/* 0x2d38	     */		xor	%o1,%gdop_lox10(.L440),%o7
/* 0x2d3c	     */		ldx	[%l2+%o7],%o1,%gdop(.L440)
/* 0x2d40	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2d44	     */		ldx	[%sp+2647],%o0
/* 0x2d48	1460 */		ldx	[%sp+2647],%o3
/* 0x2d4c	     */		ldub	[%o3],%l3

! Registers live out of .L77002443: 
! g2 g3 o0 o3 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002443 .L900000267

			.L900000732:
/* 0x2d50	1460 */		brz,pn	%l3,.L900000268
/* 0x2d54	     */		add	%o3,1,%o3

! Registers live out of .L900000732: 
! g2 g3 o0 o3 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000732

			.L900000267:
/* 0x2d58	1460 */		ldub	[%o3],%i3
/* 0x2d5c	     */		add	%o3,1,%o3
/* 0x2d60	     */		brnz,a,pt	%i3,.L900000732
/* 0x2d64	     */		ldub	[%o3],%l3

! Registers live out of .L900000267: 
! g2 g3 o0 o3 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000267 .L900000732

			.L900000268:
/* 0x2d68	1460 */		ldx	[%sp+2647],%o5
/* 0x2d6c	     */		sub	%o3,1,%o2
/* 0x2d70	     */		ldx	[%sp+2687],%o1
/* 0x2d74	     */		mov	207,%o4
/* 0x2d78	     */		mov	324,%o3
/* 0x2d7c	1461 */		mov	1,%l2
/* 0x2d80	1460 */		sub	%o2,%o5,%g5
/* 0x2d84	     */		ldx	[%sp+2679],%o2
/* 0x2d88	     */		sra	%g5,0,%g1
/* 0x2d8c	     */		stx	%g1,[%sp+2223]
/* 0x2d90	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2d94	     */		mov	%l7,%o0
/* 0x2d98	1461 */		ldd	[%sp+2775],%f0
/* 0x2d9c	     */		st	%l2,[%sp+2303]
/* 0x2da0	     */		ba	.L900000698
/* 0x2da4	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000268: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002441

			.L77002990:
/* 0x2da8	1473 */		ldx	[%sp+2511],%o2
/* 0x2dac	     */		mov	%l7,%o0
/* 0x2db0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x2db4	   0 */		add	%o5,8,%l4
/* 0x2db8	1474 */		ldx	[%sp+2687],%o1
/* 0x2dbc	     */		mov	72,%o5
/* 0x2dc0	     */		mov	192,%o4
/* 0x2dc4	     */		mov	320,%o3
/* 0x2dc8	1475 */		sethi	%gdop_hix22(.L442),%i1
/* 0x2dcc	     */		xor	%i1,%gdop_lox10(.L442),%i4
/* 0x2dd0	1474 */		mov	20,%o2
/* 0x2dd4	     */		stx	%o2,[%sp+2223]
/* 0x2dd8	     */		ldx	[%sp+2679],%o2
/* 0x2ddc	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2de0	     */		mov	%l7,%o0
/* 0x2de4	1475 */		ldx	[%sp+2399],%o7
/* 0x2de8	     */		ldx	[%o7+%i4],%o1,%gdop(.L442)
/* 0x2dec	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x2df0	     */		ldx	[%sp+2647],%o0
/* 0x2df4	1476 */		ldx	[%sp+2647],%l2
/* 0x2df8	     */		ldub	[%l2],%i0

! Registers live out of .L77002990: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002990 .L900000199

			.L900000731:
/* 0x2dfc	1476 */		brz,pn	%i0,.L900000200
/* 0x2e00	     */		add	%l2,1,%l2

! Registers live out of .L900000731: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000731

			.L900000199:
/* 0x2e04	1476 */		ldub	[%l2],%l5
/* 0x2e08	     */		add	%l2,1,%l2
/* 0x2e0c	     */		brnz,a,pt	%l5,.L900000731
/* 0x2e10	     */		ldub	[%l2],%i0

! Registers live out of .L900000199: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000199 .L900000731

			.L900000200:
/* 0x2e14	1476 */		ldx	[%sp+2647],%o5
/* 0x2e18	     */		sub	%l2,1,%o3
/* 0x2e1c	     */		ldx	[%sp+2679],%o2
/* 0x2e20	     */		mov	207,%o4
/* 0x2e24	     */		ldx	[%sp+2687],%o1
/* 0x2e28	1483 */		mov	518,%l3
/* 0x2e2c	1476 */		sub	%o3,%o5,%i4
/* 0x2e30	     */		mov	324,%o3
/* 0x2e34	     */		sra	%i4,0,%o7
/* 0x2e38	     */		stx	%o7,[%sp+2223]
/* 0x2e3c	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x2e40	     */		mov	%l7,%o0
/* 0x2e44	1485 */		ldd	[%l4+16],%f4
/* 0x2e48	     */		ld	[%sp+2271],%f3
/* 0x2e4c	1482 */		mov	512,%o0
/* 0x2e50	1485 */		ldd	[%sp+2775],%f0
/* 0x2e54	     */		ldd	[%l4+168],%f34
/* 0x2e58	1483 */		st	%l3,[%sp+2311]
/* 0x2e5c	1482 */		st	%o0,[%sp+2307]
/* 0x2e60	1485 */		fmovs	%f4,%f2
/* 0x2e64	     */		fsubd	%f2,%f4,%f32
/* 0x2e68	     */		fabsd	%f32,%f32
/* 0x2e6c	     */		fmuld	%f32,%f0,%f32
/* 0x2e70	     */		fcmpd	%f32,%f34
/* 0x2e74	     */		fbuge,a,pn	%fcc0,.L900000730
/* 0x2e78	     */		fsubd	%f32,%f34,%f32

! Registers live out of .L900000200: 
! g2 g3 sp l4 l5 l6 l7 i2 fp gsr y
! f32 
		                       
! predecessor blocks: .L900000200

			.L900000622:
/* 0x2e7c	1485 */		fdtoi	%f32,%f0
/* 0x2e80	     */		st	%f0,[%sp+2383]
/* 0x2e84	     */		ld	[%sp+2383],%g5
/* 0x2e88	     */		ba	.L900000729
/* 0x2e8c	1486 */		srl	%g5,0,%o2

! Registers live out of .L900000622: 
! g2 g3 g5 o2 sp l4 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000200

			.L900000730:
/* 0x2e90	1485 */		fdtoi	%f32,%f0
/* 0x2e94	     */		st	%f0,[%sp+2391]
/* 0x2e98	     */		ld	[%sp+2391],%o3
/* 0x2e9c	     */		sethi	%hi(0x80000000),%o5
/* 0x2ea0	     */		or	%o3,%o5,%g5
/* 0x2ea4	1486 */		srl	%g5,0,%o2

! Registers live out of .L900000730: 
! g2 g3 g5 o2 sp l4 l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000622 .L900000730

			.L900000729:
/* 0x2ea8	   0 */		ldx	[%sp+2399],%l2
/* 0x2eac	   0 */		sethi	%gdop_hix22(__iob),%o7
/* 0x2eb0	   0 */		sethi	%gdop_hix22(.L443),%o1
/* 0x2eb4	1485 */		st	%g5,[%sp+2271]
/* 0x2eb8	   0 */		xor	%o1,%gdop_lox10(.L443),%o0
/* 0x2ebc	   0 */		xor	%o7,%gdop_lox10(__iob),%i3
/* 0x2ec0	1493 */		mov	1,%l3
/* 0x2ec4	   0 */		ldx	[%l2+%o0],%i4,%gdop(.L443)
/* 0x2ec8	   0 */		ldx	[%l2+%i3],%o4,%gdop(__iob)
/* 0x2ecc	   0 */		add	%o4,256,%i5
/* 0x2ed0	1486 */		mov	%i4,%o1
/* 0x2ed4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x2ed8	     */		mov	%i5,%o0
/* 0x2edc	1488 */		ldd	[%sp+2655],%f34
/* 0x2ee0	     */		ldd	[%sp+2663],%f32
/* 0x2ee4	1489 */		add	%i4,32,%o1
/* 0x2ee8	     */		mov	%i5,%o0
/* 0x2eec	1488 */		fmuld	%f34,%f32,%f34
/* 0x2ef0	     */		std	%f34,[%sp+2655]
/* 0x2ef4	1489 */		std	%f34,[%fp+2023]
/* 0x2ef8	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x2efc	     */		ldx	[%sp+2655],%o2
/* 0x2f00	1490 */		ldd	[%l4-8],%f32
/* 0x2f04	1499 */		add	%fp,-1049,%o0
/* 0x2f08	     */		mov	0,%o1
/* 0x2f0c	1490 */		ldd	[%fp+2023],%f34
/* 0x2f10	1493 */		st	%l3,[%sp+2291]
/* 0x2f14	1496 */		mov	2,%o2
/* 0x2f18	     */		st	%o2,[%sp+2295]
/* 0x2f1c	1499 */		mov	1024,%o2
/* 0x2f20	1490 */		fdivd	%f32,%f34,%f32
/* 0x2f24	1491 */		std	%f32,[%sp+2751]
/* 0x2f28	1499 */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x2f2c	1490 */		std	%f32,[%sp+2743]
/* 0x2f30	1501 */		ldd	[%sp+2759],%f34
/* 0x2f34	1503 */		ldx	[%sp+2759],%o2
/* 0x2f38	     */		add	%i4,72,%o1
/* 0x2f3c	     */		mov	%i5,%o0
/* 0x2f40	1501 */		std	%f34,[%sp+2727]
/* 0x2f44	1506 */		mov	0,%i4
/* 0x2f48	1502 */		ldd	[%sp+2767],%f32
/* 0x2f4c	     */		std	%f32,[%sp+2735]
/* 0x2f50	1503 */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x2f54	     */		ldx	[%sp+2767],%o3
/* 0x2f58	1506 */		add	%fp,-1049,%i1

! Registers live out of .L900000729: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000641 .L900000729

			.L900000641:
/* 0x2f5c	1508 */		st	%g0,[%i1]
/* 0x2f60	     */		cmp	%i4,252
/* 0x2f64	     */		add	%i4,2,%i4
/* 0x2f68	     */		st	%g0,[%i1+4]
/* 0x2f6c	     */		ble,pt	%xcc,.L900000641
/* 0x2f70	     */		add	%i1,8,%i1

! Registers live out of .L900000641: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000641

			.L900000643:
/* 0x2f74	1494 */		st	%g0,[%sp+2299]
/* 0x2f78	1477 */		st	%g0,[%sp+2303]
/* 0x2f7c	1494 */		ba	.L77002643
/* 0x2f80	   0 */		sethi	%gdop_hix22(.L582),%l5

! Registers live out of .L900000643: 
! g2 g3 o0 sp l5 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002431

			.L77002467:
/* 0x2f84	1461 */		cmp	%i1,885

! Registers live out of .L77002467: 
! g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002467 .L77003191

			.L900000733:
/* 0x2f88	1461 */		ble,pn	%icc,.L77002781
/* 0x2f8c	     */		cmp	%l4,1442

! Registers live out of .L900000733: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000733

			.L77002469:
/* 0x2f90	1461 */		bge,pn	%icc,.L77002781
/* 0x2f94	     */		cmp	%i1,903

! Registers live out of .L77002469: 
! g2 g3 o0 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002469

			.L77002471:
/* 0x2f98	1461 */		bge,pn	%icc,.L77002781
/* 0x2f9c	   0 */		sethi	%gdop_hix22(.L___const_seg_900000101),%l4

! Registers live out of .L77002471: 
! g2 g3 o0 sp l4 l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002471

			.L77002473:
/* 0x2fa0	   0 */		ldx	[%sp+2399],%i4
/* 0x2fa4	1461 */		ldd	[%sp+2759],%f34
/* 0x2fa8	   0 */		xor	%l4,%gdop_lox10(.L___const_seg_900000101),%o4
/* 0x2fac	   0 */		ldx	[%i4+%o4],%o2,%gdop(.L___const_seg_900000101)
/* 0x2fb0	1461 */		ldd	[%o2+8],%f32
/* 0x2fb4	     */		ldd	[%o2+80],%f36
/* 0x2fb8	     */		faddd	%f34,%f32,%f32
/* 0x2fbc	     */		fcmped	%fcc1,%f32,%f36
/* 0x2fc0	     */		fbule,pn	%fcc1,.L77002781
/* 0x2fc4	     */		ldd	[%sp+2767],%f34

! Registers live out of .L77002473: 
! g2 g3 o0 o2 sp l5 l6 l7 i2 i4 i5 fp gsr 
! f0 f1 f34 f36 
		                       
! predecessor blocks: .L77002473

			.L77002475:
/* 0x2fc8	1461 */		ldd	[%o2+8],%f32
/* 0x2fcc	     */		faddd	%f34,%f32,%f32
/* 0x2fd0	     */		fcmped	%fcc2,%f32,%f36
/* 0x2fd4	     */		fbule,pn	%fcc2,.L77002781
/* 0x2fd8	1529 */		ld	[%sp+2315],%g4

! Registers live out of .L77002475: 
! g2 g3 g4 o0 sp l5 l6 l7 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002475

			.L77002477:
/* 0x2fdc	1529 */		cmp	%g4,-1
/* 0x2fe0	     */		ble,pn	%icc,.L77002781
/* 0x2fe4	   0 */		sethi	%gdop_hix22(__iob),%i5

! Registers live out of .L77002477: 
! g2 g3 g4 o0 sp l5 l6 l7 i2 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002477

			.L77002479:
/* 0x2fe8	   0 */		xor	%i5,%gdop_lox10(__iob),%i0
/* 0x2fec	   0 */		mov	%i4,%o0
/* 0x2ff0	   0 */		ldx	[%i4+%i0],%i4,%gdop(__iob)
/* 0x2ff4	   0 */		sethi	%gdop_hix22(.L471),%l2
/* 0x2ff8	1531 */		orcc	%g0,%g4,%g0
/* 0x2ffc	   0 */		xor	%l2,%gdop_lox10(.L471),%i1
/* 0x3000	   0 */		ldx	[%o0+%i1],%g4,%gdop(.L471)
/* 0x3004	   0 */		stx	%g4,[%sp+2807]
/* 0x3008	   0 */		add	%i4,256,%g5
/* 0x300c	   0 */		stx	%g5,[%sp+2815]
/* 0x3010	1531 */		bne,pn	%icc,.L77002995
/* 0x3014	1534 */		ldx	[%sp+2679],%o1

! Registers live out of .L77002479: 
! g2 g3 o0 o1 sp l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002479

			.L77002481:
/* 0x3018	1534 */		ldx	[%sp+2591],%o2
/* 0x301c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3020	     */		mov	%l7,%o0
/* 0x3024	1535 */		mov	20,%o7
/* 0x3028	     */		ldx	[%sp+2687],%o1
/* 0x302c	     */		mov	72,%o5
/* 0x3030	     */		mov	162,%o4
/* 0x3034	     */		stx	%o7,[%sp+2223]
/* 0x3038	     */		mov	320,%o3
/* 0x303c	     */		mov	%l7,%o0
/* 0x3040	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3044	     */		ldx	[%sp+2679],%o2
/* 0x3048	1536 */		ldx	[%sp+2647],%o0
/* 0x304c	     */		ldx	[%sp+2807],%g1
/* 0x3050	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x3054	     */		add	%g1,-28,%o1
/* 0x3058	1537 */		ldx	[%sp+2647],%l5
/* 0x305c	     */		ldub	[%l5],%o4

! Registers live out of .L77002481: 
! g2 g3 o0 o4 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002481 .L900000263

			.L900000728:
/* 0x3060	1537 */		brz,pn	%o4,.L900000264
/* 0x3064	     */		add	%l5,1,%l5

! Registers live out of .L900000728: 
! g2 g3 o0 o4 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000728

			.L900000263:
/* 0x3068	1537 */		ldub	[%l5],%o5
/* 0x306c	     */		add	%l5,1,%l5
/* 0x3070	     */		brnz,a,pt	%o5,.L900000728
/* 0x3074	     */		ldub	[%l5],%o4

! Registers live out of .L900000263: 
! g2 g3 o0 o4 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000263 .L900000728

			.L900000264:
/* 0x3078	1537 */		ldx	[%sp+2647],%o5
/* 0x307c	     */		sub	%l5,1,%i4
/* 0x3080	     */		mov	177,%o4
/* 0x3084	     */		ldx	[%sp+2679],%o2
/* 0x3088	     */		mov	324,%o3
/* 0x308c	     */		ldx	[%sp+2687],%o1
/* 0x3090	     */		sub	%i4,%o5,%g4
/* 0x3094	     */		mov	%o5,%i3
/* 0x3098	     */		sra	%g4,0,%l3
/* 0x309c	     */		stx	%l3,[%sp+2223]
/* 0x30a0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x30a4	     */		mov	%l7,%o0
/* 0x30a8	1538 */		ldx	[%sp+2807],%o1
/* 0x30ac	     */		mov	%i3,%o0
/* 0x30b0	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x30b4	     */		add	%o1,-16,%o1
/* 0x30b8	1539 */		ldx	[%sp+2447],%o2
/* 0x30bc	     */		ldx	[%sp+2679],%o1
/* 0x30c0	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x30c4	     */		mov	%l7,%o0
/* 0x30c8	1540 */		ldub	[%i3],%g4
/* 0x30cc	     */		mov	%i3,%l5

! Registers live out of .L900000264: 
! g2 g3 g4 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000259 .L900000264

			.L900000727:
/* 0x30d0	1540 */		brz,pn	%g4,.L900000260
/* 0x30d4	     */		add	%l5,1,%l5

! Registers live out of .L900000727: 
! g2 g3 g4 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000727

			.L900000259:
/* 0x30d8	1540 */		ldub	[%l5],%o7
/* 0x30dc	     */		add	%l5,1,%l5
/* 0x30e0	     */		brnz,a,pt	%o7,.L900000727
/* 0x30e4	     */		ldub	[%l5],%g4

! Registers live out of .L900000259: 
! g2 g3 g4 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000259 .L900000727

			.L900000260:
/* 0x30e8	1540 */		ldx	[%sp+2647],%o5
/* 0x30ec	     */		sub	%l5,1,%o3
/* 0x30f0	     */		ldx	[%sp+2679],%o2
/* 0x30f4	     */		mov	178,%o4
/* 0x30f8	     */		ldx	[%sp+2687],%o1
/* 0x30fc	1541 */		mov	1,%i4
/* 0x3100	1540 */		sub	%o3,%o5,%i1
/* 0x3104	     */		mov	220,%o3
/* 0x3108	     */		sra	%i1,0,%l2
/* 0x310c	     */		stx	%l2,[%sp+2223]
/* 0x3110	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3114	     */		mov	%l7,%o0
/* 0x3118	1542 */		ldx	[%sp+2807],%o1
/* 0x311c	1541 */		st	%i4,[%sp+2315]
/* 0x3120	1542 */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x3124	     */		ldx	[%sp+2815],%o0
/* 0x3128	     */		ldd	[%sp+2775],%f0
/* 0x312c	     */		ba	.L900000698
/* 0x3130	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000260: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002479

			.L77002995:
/* 0x3134	1551 */		ldx	[%sp+2559],%o2
/* 0x3138	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x313c	     */		mov	%l7,%o0
/* 0x3140	1552 */		mov	20,%i3
/* 0x3144	     */		ldx	[%sp+2687],%o1
/* 0x3148	     */		mov	72,%o5
/* 0x314c	     */		mov	162,%o4
/* 0x3150	     */		stx	%i3,[%sp+2223]
/* 0x3154	     */		mov	320,%o3
/* 0x3158	     */		mov	%l7,%o0
/* 0x315c	     */		call	XDrawRectangle	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3160	     */		ldx	[%sp+2679],%o2
/* 0x3164	1553 */		ldx	[%sp+2807],%i1
/* 0x3168	     */		ldx	[%sp+2647],%o0
/* 0x316c	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x3170	     */		add	%i1,-770,%o1
/* 0x3174	1554 */		ldx	[%sp+2647],%o5
/* 0x3178	     */		ldub	[%o5],%i5

! Registers live out of .L77002995: 
! g2 g3 o0 o5 sp l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002995 .L900000182

			.L900000726:
/* 0x317c	1554 */		brz,pn	%i5,.L900000183
/* 0x3180	     */		add	%o5,1,%o5

! Registers live out of .L900000726: 
! g2 g3 o0 o5 sp l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000726

			.L900000182:
/* 0x3184	1554 */		ldub	[%o5],%i0
/* 0x3188	     */		add	%o5,1,%o5
/* 0x318c	     */		brnz,a,pt	%i0,.L900000726
/* 0x3190	     */		ldub	[%o5],%i5

! Registers live out of .L900000182: 
! g2 g3 o0 o5 sp l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000182 .L900000726

			.L900000183:
/* 0x3194	1554 */		ldx	[%sp+2679],%o2
/* 0x3198	     */		ldx	[%sp+2687],%o1
/* 0x319c	     */		sub	%o5,1,%i0
/* 0x31a0	     */		mov	177,%o4
/* 0x31a4	     */		ldx	[%sp+2647],%o5
/* 0x31a8	     */		mov	332,%o3
/* 0x31ac	     */		sub	%i0,%o5,%i3
/* 0x31b0	     */		sra	%i3,0,%i5
/* 0x31b4	     */		stx	%i5,[%sp+2223]
/* 0x31b8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x31bc	     */		mov	%l7,%o0
/* 0x31c0	1560 */		ld	[%fp-1049],%i1
/* 0x31c4	     */		ld	[%fp-1045],%i5
/* 0x31c8	     */		add	%fp,-985,%o7
/* 0x31cc	     */		ld	[%fp-1041],%i4
/* 0x31d0	     */		ld	[%fp-1037],%i3
/* 0x31d4	     */		mov	16,%o5
/* 0x31d8	     */		ld	[%fp-1033],%o4
/* 0x31dc	     */		ld	[%fp-1029],%o3
/* 0x31e0	     */		ld	[%fp-1025],%o2
/* 0x31e4	     */		ld	[%fp-1021],%o1
/* 0x31e8	     */		ld	[%fp-1017],%g5
/* 0x31ec	     */		ld	[%fp-1013],%g1
/* 0x31f0	     */		and	%i1,1,%o0
/* 0x31f4	     */		ld	[%fp-1009],%g4
/* 0x31f8	     */		ld	[%fp-1005],%l4
/* 0x31fc	     */		ld	[%fp-1001],%l5
/* 0x3200	     */		ld	[%fp-997],%l2
/* 0x3204	     */		ld	[%fp-993],%l3
/* 0x3208	     */		ld	[%fp-989],%i1

! Registers live out of .L900000183: 
! g1 g2 g3 g4 g5 o0 o1 o2 o3 o4 o5 sp o7 l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000183 .L900000644

			.L900000644:
/* 0x320c	1560 */		and	%o0,%i5,%o0
/* 0x3210	     */		add	%o5,16,%o5
/* 0x3214	     */		ld	[%o7],%i0
/* 0x3218	     */		and	%o0,%i4,%o0
/* 0x321c	     */		ld	[%o7+4],%i5
/* 0x3220	     */		add	%o7,64,%o7
/* 0x3224	     */		and	%o0,%i3,%o0
/* 0x3228	     */		ld	[%o7-56],%i4
/* 0x322c	     */		and	%o0,%o4,%o0
/* 0x3230	     */		ld	[%o7-52],%i3
/* 0x3234	     */		and	%o0,%o3,%o0
/* 0x3238	     */		ld	[%o7-48],%o4
/* 0x323c	     */		and	%o0,%o2,%o0
/* 0x3240	     */		ld	[%o7-44],%o3
/* 0x3244	     */		and	%o0,%o1,%o0
/* 0x3248	     */		ld	[%o7-40],%o2
/* 0x324c	     */		and	%o0,%g5,%o0
/* 0x3250	     */		ld	[%o7-36],%o1
/* 0x3254	     */		and	%o0,%g1,%o0
/* 0x3258	     */		ld	[%o7-32],%g5
/* 0x325c	     */		and	%o0,%g4,%o0
/* 0x3260	     */		ld	[%o7-28],%g1
/* 0x3264	     */		and	%o0,%l4,%o0
/* 0x3268	     */		ld	[%o7-24],%g4
/* 0x326c	     */		and	%o0,%l5,%o0
/* 0x3270	     */		ld	[%o7-20],%l4
/* 0x3274	     */		and	%o0,%l2,%o0
/* 0x3278	     */		ld	[%o7-16],%l5
/* 0x327c	     */		and	%o0,%l3,%o0
/* 0x3280	     */		ld	[%o7-12],%l2
/* 0x3284	     */		and	%o0,%i1,%o0
/* 0x3288	     */		cmp	%o5,240
/* 0x328c	     */		ld	[%o7-8],%l3
/* 0x3290	     */		and	%o0,%i0,%o0
/* 0x3294	     */		ble,pt	%xcc,.L900000644
/* 0x3298	     */		ld	[%o7-4],%i1

! Registers live out of .L900000644: 
! g1 g2 g3 g4 g5 o0 o1 o2 o3 o4 o5 sp o7 l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000644

			.L900000646:
/* 0x329c	1560 */		and	%o0,%i5,%o0
/* 0x32a0	     */		and	%o0,%i4,%i4
/* 0x32a4	     */		and	%i4,%i3,%i0
/* 0x32a8	     */		and	%i0,%o4,%o4
/* 0x32ac	     */		and	%o4,%o3,%i5
/* 0x32b0	     */		and	%i5,%o2,%o5
/* 0x32b4	     */		and	%o5,%o1,%o3
/* 0x32b8	     */		and	%o3,%g5,%g5
/* 0x32bc	     */		and	%g5,%g1,%g1
/* 0x32c0	     */		and	%g1,%g4,%g4
/* 0x32c4	     */		and	%g4,%l4,%l4
/* 0x32c8	     */		and	%l4,%l5,%l5
/* 0x32cc	     */		and	%l5,%l2,%l2
/* 0x32d0	     */		and	%l2,%l3,%l3
/* 0x32d4	     */		and	%l3,%i1,%i1
/* 0x32d8	1564 */		cmp	%i1,0
/* 0x32dc	     */		be,pn	%icc,.L77002613
/* 0x32e0	1567 */		ldx	[%sp+2647],%o0

! Registers live out of .L900000646: 
! g2 g3 o0 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000646

			.L77002501:
/* 0x32e4	1567 */		ldx	[%sp+2807],%o2
/* 0x32e8	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x32ec	     */		add	%o2,24,%o1
/* 0x32f0	1568 */		ldx	[%sp+2447],%o2
/* 0x32f4	     */		ldx	[%sp+2679],%o1
/* 0x32f8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x32fc	     */		mov	%l7,%o0
/* 0x3300	1569 */		ldx	[%sp+2647],%l3
/* 0x3304	     */		ldub	[%l3],%o1

! Registers live out of .L77002501: 
! g2 g3 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002501 .L900000255

			.L900000725:
/* 0x3308	1569 */		brz,pn	%o1,.L900000256
/* 0x330c	     */		add	%l3,1,%l3

! Registers live out of .L900000725: 
! g2 g3 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000725

			.L900000255:
/* 0x3310	1569 */		ldub	[%l3],%i5
/* 0x3314	     */		add	%l3,1,%l3
/* 0x3318	     */		brnz,a,pt	%i5,.L900000725
/* 0x331c	     */		ldub	[%l3],%o1

! Registers live out of .L900000255: 
! g2 g3 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000255 .L900000725

			.L900000256:
/* 0x3320	1569 */		ldx	[%sp+2647],%o5
/* 0x3324	     */		sub	%l3,1,%i0
/* 0x3328	     */		mov	178,%o4
/* 0x332c	     */		ldx	[%sp+2679],%o2
/* 0x3330	     */		ldx	[%sp+2687],%o1
/* 0x3334	     */		mov	220,%o3
/* 0x3338	     */		sub	%i0,%o5,%o0
/* 0x333c	     */		sra	%o0,0,%l4
/* 0x3340	     */		stx	%l4,[%sp+2223]
/* 0x3344	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3348	     */		mov	%l7,%o0
/* 0x334c	1571 */		call	time	!params=  %o0	!result= 
/* 0x3350	     */		add	%sp,3007,%o0
/* 0x3354	1572 */		call	gmtime	!params=  %o0	!result=  %o0
/* 0x3358	     */		add	%sp,3007,%o0
/* 0x335c	     */		mov	%o0,%i3
/* 0x3360	1575 */		call	malloc	!params=  %o0	!result=  %o0
/* 0x3364	     */		mov	256,%o0
/* 0x3368	     */		brz,a,pt	%o0,.L900000724
/* 0x336c	     */		ldd	[%sp+2775],%f0

! Registers live out of .L900000256: 
! g2 g3 o0 o1 sp l5 l6 l7 i0 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000256

			.L900000117:
/* 0x3370	 307 */		mov	256,%o2
/* 0x3374	     */		call	memset	!params=  %o0 %o1 %o2	!result=  %o0
/* 0x3378	     */		mov	0,%o1
/* 0x337c	     */		ldd	[%sp+2775],%f0
/* 0x3380	     */		mov	%o0,%i1
/* 0x3384	     */		ba	.L900000723
/* 0x3388	1576 */		add	%sp,3047,%o0

! Registers live out of .L900000117: 
! g2 g3 o0 sp l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000256

			.L900000724:
/* 0x338c	1575 */		mov	%o0,%i1
/* 0x3390	1576 */		add	%sp,3047,%o0

! Registers live out of .L900000724: 
! g2 g3 o0 sp l5 l6 l7 i0 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000117 .L900000724

			.L900000723:
/* 0x3394	1576 */		ldx	[%sp+2807],%l3
/* 0x3398	     */		mov	%i3,%o3
/* 0x339c	     */		mov	32,%o1
/* 0x33a0	     */		std	%f0,[%sp+2775]
/* 0x33a4	     */		add	%l3,40,%o2
/* 0x33a8	     */		call	strftime	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x33ac	   0 */		add	%sp,3047,%i0
/* 0x33b0	1579 */		ldx	[%sp+2247],%o1
/* 0x33b4	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x33b8	     */		mov	%i1,%o0
/* 0x33bc	1580 */		mov	%i1,%o0
/* 0x33c0	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x33c4	     */		add	%l3,53,%o1
/* 0x33c8	1581 */		mov	%i1,%o0
/* 0x33cc	     */		call	strcat	!params=  %o0 %o1	!result=  %o0
/* 0x33d0	   0 */		mov	%i0,%o1
/* 0x33d4	1583 */		add	%sp,3079,%o1
/* 0x33d8	     */		call	stat	!params=  %o0 %o1	!result=  %o0
/* 0x33dc	     */		mov	%i1,%o0
/* 0x33e0	     */		orcc	%g0,%o0,%g0
/* 0x33e4	1584 */		bne,pn	%icc,.L77002505
/* 0x33e8	1585 */		mov	%i1,%o2

! Registers live out of .L900000723: 
! g2 g3 o0 o2 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		
! 1585		      !                                    fprintf (stderr,"FAIL : file %s can not be cr
! 1585		      >eated.\n",timestamp_filename);

                       
! predecessor blocks: .L900000723

			.L77002503:
/* 0x33ec	1585 */		ldx	[%sp+2807],%i0
/* 0x33f0	     */		add	%i0,56,%o1
/* 0x33f4	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x33f8	     */		ldx	[%sp+2815],%o0

! 1586		      !                                    dumper_flag = -1;

/* 0x33fc	1586 */		ba	.L900000691

! 1587		      !                                } else {
! 1588		      !                                    errno = 0;
! 1589		      !                                    fp = fopen(timestamp_filename, "wb");
! 1590		      !                                    if ( fp == NULL ) {
! 1591		      !                                        perror("FAIL fopen of filename");
! 1592		      !                                        dumper_flag = -1;
! 1593		      !                                    } else {
! 1594		      !                                        /* finally we know we have a file */
! 1595		      !                                        fprintf (stderr,"INFO : file %s dump begi
! 1595		      >ns.\n",timestamp_filename);
! 1597		      !                                        /* header data is done separately */
! 1598		      !                                        if ( endian_flag ) {
! 1599		      !                                            rotated32 = swap_four(num_elements);
! 1600		      !                                            num_written = fwrite(&rotated32, size
! 1600		      >of(uint32_t), 1, fp);
! 1601		      !                                        } else {
! 1602		      !                                            num_written = fwrite(&num_elements, s
! 1602		      >izeof(uint32_t), 1, fp);
! 1603		      !                                        }
! 1604		      !                                        printf("     : %2lu byte uint32_t num_ele
! 1604		      >ments num_written = %lu\n",
! 1605		      !                                                    sizeof(uint32_t), num_written
! 1605		      >);
! 1606		      !                                        printf("     : num_elements = %8i\n",num_
! 1606		      >elements);
! 1608		      !                                        if ( endian_flag ) {
! 1609		      !                                            rotated32 = swap_four(mand_bail);
! 1610		      !                                            num_written = fwrite(&rotated32, size
! 1610		      >of(uint32_t), 1, fp);
! 1611		      !                                        } else {
! 1612		      !                                            num_written = fwrite(&mand_bail, size
! 1612		      >of(uint32_t), 1, fp);
! 1613		      !                                        }
! 1614		      !                                        printf("     : %2lu byte uint32_t mand_ba
! 1614		      >il    num_written = %lu\n",
! 1615		      !                                                sizeof(uint32_t), num_written);
! 1616		      !                                        printf("     : mand_bail = %8i\n",mand_ba
! 1616		      >il);
! 1618		      !                                        /* need to swap around bytes of the 8-byt
! 1618		      >e floating point double */
! 1619		      !                                        if ( endian_flag ) {
! 1620		      !                                            rotated64 = swap_eight(*((uint64_t *)
! 1620		      >&magnify));
! 1621		      !                                            num_written = fwrite(&rotated64, size
! 1621		      >of(uint64_t), 1, fp);
! 1622		      !                                        } else {
! 1623		      !                                            num_written = fwrite(&magnify, sizeof
! 1623		      >(double), 1, fp);
! 1624		      !                                        }
! 1625		      !                                        printf("     : %2lu byte double magnify  
! 1625		      >      num_written = %lu\n",
! 1626		      !                                                sizeof(double), num_written);
! 1627		      !                                        printf("     :        magnify = %-+32.26e
! 1627		      >\n", magnify);
! 1629		      !                                        if ( endian_flag ) {
! 1630		      !                                            rotated64 = swap_eight(*((uint64_t *)
! 1630		      >&real_translate));
! 1631		      !                                            num_written = fwrite(&rotated64, size
! 1631		      >of(uint64_t), 1, fp);
! 1632		      !                                        } else {
! 1633		      !                                            num_written = fwrite(&real_translate,
! 1633		      > sizeof(double), 1, fp);
! 1634		      !                                        }
! 1635		      !                                        printf("DBUG : %2lu byte double real_tran
! 1635		      >slate num_written = %lu\n",
! 1636		      !                                                sizeof(double), num_written);
! 1637		      !                                        printf("     : real_translate = %-+32.26e
! 1637		      >\n",real_translate);
! 1639		      !                                        if ( endian_flag ) {
! 1640		      !                                            rotated64 = swap_eight(*((uint64_t *)
! 1640		      >&imag_translate));
! 1641		      !                                            num_written = fwrite(&rotated64, size
! 1641		      >of(uint64_t), 1, fp);
! 1642		      !                                        } else {
! 1643		      !                                            num_written = fwrite(&imag_translate,
! 1643		      > sizeof(double), 1, fp);
! 1644		      !                                        }
! 1645		      !                                        printf("     : %2lu byte double imag_tran
! 1645		      >slate num_written = %lu\n",
! 1646		      !                                                sizeof(double), num_written);
! 1647		      !                                        printf("     : imag_translate = %-+32.26e
! 1647		      >\n",imag_translate);
! 1649		      !                                        /* append the VBOX and SAMPLE structure d
! 1649		      >ata */
! 1650		      !                                        temp32bit = VBOX_REAL_COUNT;
! 1651		      !                                        if ( endian_flag ) {
! 1652		      !                                            rotated32 = swap_four(temp32bit);
! 1653		      !                                            num_written = fwrite(&rotated32, size
! 1653		      >of(uint32_t), 1, fp);
! 1654		      !                                        } else {
! 1655		      !                                            num_written = fwrite(&temp32bit, size
! 1655		      >of(uint32_t), 1, fp);
! 1656		      !                                        }
! 1657		      !                                        printf("     : %2lu byte uint32_t VBOX_RE
! 1657		      >AL_COUNT num_written = %lu\n",
! 1658		      !                                                sizeof(uint32_t), num_written);
! 1659		      !                                        printf("     : VBOX_REAL_COUNT = %8i\n",V
! 1659		      >BOX_REAL_COUNT);
! 1661		      !                                        temp32bit = VBOX_IMAG_COUNT;
! 1662		      !                                        if ( endian_flag ) {
! 1663		      !                                            rotated32 = swap_four(temp32bit);
! 1664		      !                                            num_written = fwrite(&rotated32, size
! 1664		      >of(uint32_t), 1, fp);
! 1665		      !                                        } else {
! 1666		      !                                            num_written = fwrite(&temp32bit, size
! 1666		      >of(uint32_t), 1, fp);
! 1667		      !                                        }
! 1668		      !                                        printf("     : %2lu byte uint32_t VBOX_RE
! 1668		      >AL_COUNT num_written = %lu\n",
! 1669		      !                                                sizeof(uint32_t), num_written);
! 1670		      !                                        printf("     : VBOX_IMAG_COUNT = %8i\n",V
! 1670		      >BOX_IMAG_COUNT);
! 1673		      !                                        temp32bit = VBOX_SAMPLE_REAL;
! 1674		      !                                        if ( endian_flag ) {
! 1675		      !                                            rotated32 = swap_four(temp32bit);
! 1676		      !                                            num_written = fwrite(&rotated32, size
! 1676		      >of(uint32_t), 1, fp);
! 1677		      !                                        } else {
! 1678		      !                                            num_written = fwrite(&temp32bit, size
! 1678		      >of(uint32_t), 1, fp);
! 1679		      !                                        }
! 1680		      !                                        printf("     : %2lu byte uint32_t VBOX_SA
! 1680		      >MPLE_REAL num_written = %lu\n",
! 1681		      !                                                sizeof(uint32_t), num_written);
! 1682		      !                                        printf("     : VBOX_SAMPLE_REAL = %8i\n",
! 1682		      >VBOX_SAMPLE_REAL);
! 1684		      !                                        temp32bit = VBOX_SAMPLE_IMAG;
! 1685		      !                                        if ( endian_flag ) {
! 1686		      !                                            rotated32 = swap_four(temp32bit);
! 1687		      !                                            num_written = fwrite(&rotated32, size
! 1687		      >of(uint32_t), 1, fp);
! 1688		      !                                        } else {
! 1689		      !                                            num_written = fwrite(&temp32bit, size
! 1689		      >of(uint32_t), 1, fp);
! 1690		      !                                        }
! 1691		      !                                        printf("     : %2lu byte uint32_t VBOX_SA
! 1691		      >MPLE_IMAG num_written = %lu\n",
! 1692		      !                                                sizeof(uint32_t), num_written);
! 1693		      !                                        printf("     : VBOX_SAMPLE_IMAG = %8i\n",
! 1693		      >VBOX_SAMPLE_IMAG);
! 1695		      !                                        /* dump all data */
! 1696		      !                                        for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUN
! 1696		      >T; vbox_j++ ) {
! 1697		      !                                            for ( vbox_r = 0; vbox_r < VBOX_REAL_
! 1697		      >COUNT; vbox_r++ ) {
! 1698		      !                                                for ( mand_y_pix = 0; mand_y_pix 
! 1698		      >< vbox_h; mand_y_pix++ ) {
! 1699		      !                                                    for ( mand_x_pix = 0; mand_x_
! 1699		      >pix < vbox_w; mand_x_pix++ ) {
! 1700		      !                                                        if ( endian_flag ) {
! 1701		      !                                                            /* dump data from big
! 1701		      > endian machines */
! 1702		      !                                                            rotated64 = swap_eigh
! 1702		      >t(*((uint64_t *)(&coord_r[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)])));
! 1703		      !                                                            num_written = fwrite(
! 1703		      >&rotated64, sizeof(uint64_t), 1, fp);
! 1704		      !                                                            rotated64 = swap_eigh
! 1704		      >t(*((uint64_t *)(&coord_j[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)])));
! 1705		      !                                                            num_written = fwrite(
! 1705		      >&rotated64, sizeof(uint64_t), 1, fp);
! 1706		      !                                                            rotated32 = swap_four
! 1706		      >(*((uint32_t *)(&mandel_val[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)])))
! 1706		      >;
! 1707		      !                                                            num_written = fwrite(
! 1707		      >&rotated32, sizeof(uint32_t), 1, fp);
! 1708		      !                                                        } else {
! 1709		      !                                                            /* dump data from lit
! 1709		      >tle endian machines */
! 1710		      !                                                            num_written = fwrite(
! 1710		      >&coord_r[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)], sizeof(double), 1, f
! 1710		      >p);
! 1711		      !                                                            num_written = fwrite(
! 1711		      >&coord_j[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)], sizeof(double), 1, f
! 1711		      >p);
! 1712		      !                                                            num_written = fwrite(
! 1712		      >&mandel_val[array_offset(vbox_r,vbox_j,mand_x_pix,mand_y_pix)], sizeof(uint32_t),
! 1712		      > 1, fp);
! 1713		      !                                                        }
! 1714		      !                                                    }
! 1715		      !                                                }
! 1716		      !                                            }
! 1717		      !                                        }
! 1718		      !                                        fclose(fp);
! 1719		      !                                        fprintf (stderr,"INFO : file %s closed.\n
! 1719		      >",timestamp_filename);
! 1720		      !                                    }
! 1721		      !                                }
! 1722		      !                                free(timestamp_filename);

/* 0x3400	1722 */		nop

! Registers live out of .L77002503: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000723

			.L77002505:
/* 0x3404	1588 */		call	___errno	!params= 	!result=  %o0
/* 0x3408	     */		nop
/* 0x340c	     */		st	%g0,[%o0]
/* 0x3410	1589 */		ldx	[%sp+2807],%o1
/* 0x3414	     */		add	%o1,92,%o1
/* 0x3418	     */		call	fopen	!params=  %o0 %o1	!result=  %o0
/* 0x341c	     */		mov	%i1,%o0
/* 0x3420	1590 */		brz,pn	%o0,.L77002507
/* 0x3424	1589 */		mov	%o0,%l5

! Registers live out of .L77002505: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002505

			.L77002509:
/* 0x3428	1595 */		ldx	[%sp+2807],%o4
/* 0x342c	     */		mov	%i1,%o2
/* 0x3430	1697 */		mov	0,%l2
/* 0x3434	1595 */		add	%o4,120,%o1
/* 0x3438	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x343c	     */		ldx	[%sp+2815],%o0
/* 0x3440	1599 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x3444	     */		ld	[%sp+2267],%o0
/* 0x3448	   0 */		add	%sp,2351,%l4
/* 0x344c	1600 */		mov	%l5,%o3
/* 0x3450	     */		mov	1,%o2
/* 0x3454	     */		mov	4,%o1
/* 0x3458	1599 */		st	%o0,[%sp+2351]
/* 0x345c	1600 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3460	     */		add	%sp,2351,%o0
/* 0x3464	   0 */		sethi	%gdop_hix22(.L501),%o3
/* 0x3468	   0 */		ldx	[%sp+2399],%o5
/* 0x346c	   0 */		xor	%o3,%gdop_lox10(.L501),%g5
/* 0x3470	1600 */		mov	%o0,%o2
/* 0x3474	1605 */		mov	4,%o1
/* 0x3478	   0 */		ldx	[%o5+%g5],%i3,%gdop(.L501)
/* 0x347c	1605 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3480	     */		mov	%i3,%o0
/* 0x3484	1606 */		ld	[%sp+2267],%o1
/* 0x3488	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x348c	     */		add	%i3,64,%o0
/* 0x3490	1609 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x3494	     */		ld	[%sp+2271],%o0
/* 0x3498	1610 */		mov	%l5,%o3
/* 0x349c	     */		mov	1,%o2
/* 0x34a0	1609 */		st	%o0,[%sp+2351]
/* 0x34a4	1610 */		mov	4,%o1
/* 0x34a8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x34ac	   0 */		mov	%l4,%o0
/* 0x34b0	1615 */		mov	4,%o1
/* 0x34b4	1610 */		mov	%o0,%o2
/* 0x34b8	1615 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x34bc	     */		add	%i3,96,%o0
/* 0x34c0	1616 */		add	%i3,160,%o0
/* 0x34c4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x34c8	     */		ld	[%sp+2271],%o1
/* 0x34cc	1620 */		call	swap_eight	!params=  %o0	!result=  %o0
/* 0x34d0	     */		ldx	[%sp+2655],%o0
/* 0x34d4	   0 */		add	%sp,2823,%l3
/* 0x34d8	1621 */		mov	%l5,%o3
/* 0x34dc	     */		mov	1,%o2
/* 0x34e0	1620 */		stx	%o0,[%sp+2823]
/* 0x34e4	1621 */		mov	8,%o1
/* 0x34e8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x34ec	     */		add	%sp,2823,%o0
/* 0x34f0	1626 */		mov	8,%o1
/* 0x34f4	1621 */		mov	%o0,%o2
/* 0x34f8	1626 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x34fc	     */		add	%i3,184,%o0
/* 0x3500	1627 */		ldx	[%sp+2655],%o1
/* 0x3504	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3508	     */		add	%i3,248,%o0
/* 0x350c	1630 */		call	swap_eight	!params=  %o0	!result=  %o0
/* 0x3510	     */		ldx	[%sp+2727],%o0
/* 0x3514	1631 */		mov	%l5,%o3
/* 0x3518	     */		mov	1,%o2
/* 0x351c	1630 */		stx	%o0,[%sp+2823]
/* 0x3520	1631 */		mov	8,%o1
/* 0x3524	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3528	   0 */		mov	%l3,%o0
/* 0x352c	1636 */		mov	8,%o1
/* 0x3530	1631 */		mov	%o0,%o2
/* 0x3534	1636 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3538	     */		add	%i3,288,%o0
/* 0x353c	1637 */		ldx	[%sp+2727],%o1
/* 0x3540	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3544	     */		add	%i3,352,%o0
/* 0x3548	1640 */		call	swap_eight	!params=  %o0	!result=  %o0
/* 0x354c	     */		ldx	[%sp+2735],%o0
/* 0x3550	1641 */		mov	%l5,%o3
/* 0x3554	     */		mov	1,%o2
/* 0x3558	1640 */		stx	%o0,[%sp+2823]
/* 0x355c	1641 */		mov	8,%o1
/* 0x3560	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3564	   0 */		mov	%l3,%o0
/* 0x3568	1646 */		mov	8,%o1
/* 0x356c	1641 */		mov	%o0,%o2
/* 0x3570	1646 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3574	     */		add	%i3,392,%o0
/* 0x3578	1647 */		ldx	[%sp+2735],%o1
/* 0x357c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3580	     */		add	%i3,456,%o0
/* 0x3584	1652 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x3588	     */		mov	16,%o0
/* 0x358c	1653 */		mov	%l5,%o3
/* 0x3590	1652 */		st	%o0,[%sp+2351]
/* 0x3594	1653 */		mov	1,%o2
/* 0x3598	     */		mov	4,%o1
/* 0x359c	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x35a0	   0 */		mov	%l4,%o0
/* 0x35a4	1653 */		mov	%o0,%o2
/* 0x35a8	1658 */		mov	4,%o1
/* 0x35ac	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x35b0	     */		add	%i3,496,%o0
/* 0x35b4	1659 */		mov	16,%o1
/* 0x35b8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x35bc	     */		add	%i3,560,%o0
/* 0x35c0	1663 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x35c4	     */		mov	16,%o0
/* 0x35c8	1664 */		mov	%l5,%o3
/* 0x35cc	1663 */		st	%o0,[%sp+2351]
/* 0x35d0	1664 */		mov	1,%o2
/* 0x35d4	     */		mov	4,%o1
/* 0x35d8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x35dc	   0 */		mov	%l4,%o0
/* 0x35e0	1669 */		mov	4,%o1
/* 0x35e4	1664 */		mov	%o0,%o2
/* 0x35e8	1669 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x35ec	     */		add	%i3,496,%o0
/* 0x35f0	1670 */		mov	16,%o1
/* 0x35f4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x35f8	     */		add	%i3,592,%o0
/* 0x35fc	1675 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x3600	     */		mov	64,%o0
/* 0x3604	1676 */		mov	%l5,%o3
/* 0x3608	1675 */		st	%o0,[%sp+2351]
/* 0x360c	1676 */		mov	1,%o2
/* 0x3610	     */		mov	4,%o1
/* 0x3614	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3618	   0 */		mov	%l4,%o0
/* 0x361c	1681 */		mov	4,%o1
/* 0x3620	1676 */		mov	%o0,%o2
/* 0x3624	1681 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3628	     */		add	%i3,624,%o0
/* 0x362c	1682 */		mov	64,%o1
/* 0x3630	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3634	     */		add	%i3,688,%o0
/* 0x3638	1686 */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x363c	     */		mov	64,%o0
/* 0x3640	1687 */		mov	%l5,%o3
/* 0x3644	1686 */		st	%o0,[%sp+2351]
/* 0x3648	1687 */		mov	1,%o2
/* 0x364c	     */		mov	4,%o1
/* 0x3650	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3654	   0 */		mov	%l4,%o0
/* 0x3658	1692 */		mov	4,%o1
/* 0x365c	1687 */		mov	%o0,%o2
/* 0x3660	1692 */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3664	     */		add	%i3,720,%o0
/* 0x3668	1693 */		mov	64,%o1
/* 0x366c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3670	     */		add	%i3,784,%o0
/* 0x3674	1696 */		ldd	[%sp+2775],%f0
/* 0x3678	     */		mov	0,%i3

! Registers live out of .L77002509: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002509 .L77002597

			.L77002571:
/* 0x367c	1698 */		mov	0,%i5

! Registers live out of .L77002571: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002571 .L77002593

			.L77002575:
/* 0x3680	1699 */		mov	0,%i4

! Registers live out of .L77002575: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002575 .L77002589

			.L77002991:
/* 0x3684	1702 */		std	%f0,[%sp+2775]

! Registers live out of .L77002991: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002991 .L900000722

			.L900000722:
/* 0x3688	1702 */		sra	%i4,0,%o2
/* 0x368c	     */		sra	%i5,0,%o3
/* 0x3690	     */		sra	%i3,0,%o1
/* 0x3694	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3698	     */		sra	%l2,0,%o0
/* 0x369c	     */		sllx	%o0,3,%o7
/* 0x36a0	     */		ldx	[%o7+%i2],%o0
/* 0x36a4	     */		call	swap_eight	!params=  %o0	!result=  %o0
/* 0x36a8	     */		nop
/* 0x36ac	1703 */		mov	%l5,%o3
/* 0x36b0	     */		mov	1,%o2
/* 0x36b4	     */		mov	8,%o1
/* 0x36b8	1702 */		stx	%o0,[%sp+2823]
/* 0x36bc	1703 */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x36c0	   0 */		mov	%l3,%o0
/* 0x36c4	1704 */		sra	%i4,0,%o2
/* 0x36c8	     */		sra	%i5,0,%o3
/* 0x36cc	     */		sra	%i3,0,%o1
/* 0x36d0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x36d4	     */		sra	%l2,0,%o0
/* 0x36d8	     */		ldx	[%sp+2639],%o1
/* 0x36dc	     */		sllx	%o0,3,%g5
/* 0x36e0	     */		call	swap_eight	!params=  %o0	!result=  %o0
/* 0x36e4	     */		ldx	[%g5+%o1],%o0
/* 0x36e8	1705 */		mov	%l5,%o3
/* 0x36ec	     */		mov	1,%o2
/* 0x36f0	1704 */		stx	%o0,[%sp+2823]
/* 0x36f4	1705 */		mov	8,%o1
/* 0x36f8	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x36fc	   0 */		mov	%l3,%o0
/* 0x3700	1706 */		sra	%i4,0,%o2
/* 0x3704	     */		sra	%i5,0,%o3
/* 0x3708	     */		sra	%i3,0,%o1
/* 0x370c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3710	     */		sra	%l2,0,%o0
/* 0x3714	     */		ldx	[%sp+2407],%o5
/* 0x3718	1699 */		add	%i4,1,%i4
/* 0x371c	1706 */		sllx	%o0,2,%o1
/* 0x3720	     */		call	swap_four	!params=  %o0	!result=  %o0
/* 0x3724	     */		ld	[%o1+%o5],%o0
/* 0x3728	1707 */		mov	%l5,%o3
/* 0x372c	     */		mov	1,%o2
/* 0x3730	1706 */		st	%o0,[%sp+2351]
/* 0x3734	1707 */		mov	4,%o1
/* 0x3738	     */		call	fwrite	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x373c	   0 */		mov	%l4,%o0
/* 0x3740	1699 */		ldd	[%sp+2775],%f0
/* 0x3744	     */		cmp	%i4,63
/* 0x3748	     */		ble,a,pt	%icc,.L900000722
/* 0x374c	1702 */		std	%f0,[%sp+2775]

! Registers live out of .L900000722: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000722

			.L77002589:
/* 0x3750	1698 */		add	%i5,1,%i5
/* 0x3754	     */		cmp	%i5,63
/* 0x3758	     */		ble,pt	%icc,.L77002991
/* 0x375c	1699 */		mov	0,%i4

! Registers live out of .L77002589: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002589

			.L77002593:
/* 0x3760	1697 */		add	%l2,1,%l2
/* 0x3764	     */		cmp	%l2,15
/* 0x3768	     */		ble,pt	%icc,.L77002575
/* 0x376c	1698 */		mov	0,%i5

! Registers live out of .L77002593: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002593

			.L77002597:
/* 0x3770	1696 */		add	%i3,1,%i3
/* 0x3774	     */		cmp	%i3,15
/* 0x3778	     */		ble,pt	%icc,.L77002571
/* 0x377c	1697 */		mov	0,%l2

! Registers live out of .L77002597: 
! g2 g3 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002597

			.L900000634:
/* 0x3780	1718 */		call	fclose	!params=  %o0	!result= 
/* 0x3784	     */		mov	%l5,%o0
/* 0x3788	1719 */		ldx	[%sp+2807],%i3
/* 0x378c	     */		mov	%i1,%o2
/* 0x3790	     */		add	%i3,968,%o1
/* 0x3794	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x3798	     */		ldx	[%sp+2815],%o0

! Registers live out of .L900000634: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002503 .L77002507 .L900000634

			.L900000691:
/* 0x379c	1722 */		call	free	!params=  %o0	!result= 
/* 0x37a0	     */		mov	%i1,%o0

! 1723		      !                                sprintf(buf,"File Done ");

/* 0x37a4	1723 */		ldx	[%sp+2807],%i3
/* 0x37a8	     */		ldx	[%sp+2647],%o0
/* 0x37ac	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x37b0	     */		add	%i3,992,%o1

! 1724		      !                                XSetForeground(dsp, gc2, green.pixel);

/* 0x37b4	1724 */		ldx	[%sp+2447],%o2
/* 0x37b8	     */		ldx	[%sp+2679],%o1
/* 0x37bc	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x37c0	     */		mov	%l7,%o0

! 1725		      !                                XDrawImageString(dsp, win2, gc2, 220, 178, buf, (
! 1725		      >int)strlen(buf));

/* 0x37c4	1725 */		ldx	[%sp+2647],%o7
/* 0x37c8	     */		ldub	[%o7],%g1

! Registers live out of .L900000691: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000251 .L900000691

			.L900000721:
/* 0x37cc	1725 */		brz,pn	%g1,.L900000252
/* 0x37d0	     */		add	%o7,1,%o7

! Registers live out of .L900000721: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000721

			.L900000251:
/* 0x37d4	1725 */		ldub	[%o7],%o4
/* 0x37d8	     */		add	%o7,1,%o7
/* 0x37dc	     */		brnz,a,pt	%o4,.L900000721
/* 0x37e0	     */		ldub	[%o7],%g1

! Registers live out of .L900000251: 
! g1 g2 g3 o0 sp o7 l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000251 .L900000721

			.L900000252:
/* 0x37e4	1725 */		ldx	[%sp+2647],%o5
/* 0x37e8	     */		sub	%o7,1,%o1
/* 0x37ec	     */		mov	178,%o4
/* 0x37f0	     */		mov	220,%o3
/* 0x37f4	     */		sub	%o1,%o5,%o2
/* 0x37f8	     */		ldx	[%sp+2687],%o1
/* 0x37fc	     */		sra	%o2,0,%g5
/* 0x3800	     */		ldx	[%sp+2679],%o2
/* 0x3804	     */		stx	%g5,[%sp+2223]
/* 0x3808	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x380c	     */		mov	%l7,%o0

! 1726		      !                                /* if the dumper flag is -1 then we need to
! 1727		      !                                 * indicate that the dump is impossible */
! 1728		      !                                if ( dumper_flag < 0 ) {
! 1729		      !                                    sprintf(buf,"Bad TMPDIR");
! 1730		      !                                    XSetForeground(dsp, gc2, red.pixel);
! 1731		      !                                    XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 
! 1731		      >20);
! 1732		      !                                    XDrawImageString(dsp, win2, gc2, 220, 178, bu
! 1732		      >f, (int)strlen(buf));
! 1733		      !                                    sprintf(buf,"DUMPER");
! 1734		      !                                    XDrawImageString(dsp, win2, gc2, 332, 177, bu
! 1734		      >f, (int)strlen(buf));
! 1735		      !                                    XDrawLine(dsp, win2, gc2, 320, 162, 392, 182)
! 1735		      >;
! 1736		      !                                    XDrawLine(dsp, win2, gc2, 320, 182, 392, 162)
! 1736		      >;
! 1737		      !                                } else {
! 1738		      !                                    fprintf(stderr,"INFO : dumper_flag = 0\n");

/* 0x3810	1738 */		ldx	[%sp+2807],%o5
/* 0x3814	     */		add	%o5,1016,%o1
/* 0x3818	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x381c	     */		ldx	[%sp+2815],%o0

! 1739		      !                                    dumper_flag = 0;

/* 0x3820	1739 */		ldd	[%sp+2775],%f0
/* 0x3824	     */		st	%g0,[%sp+2315]
/* 0x3828	     */		ba	.L900000698
/* 0x382c	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000252: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		
! 1740		      !                                }
! 1742		      !                            } else {
! 1743		      !                                /* indicate that the data is not ready */
! 1744		      !                                sprintf(buf,"Not Ready");

                       
! predecessor blocks: .L900000646

			.L77002613:
/* 0x3830	1744 */		ldx	[%sp+2807],%i1
/* 0x3834	     */		call	sprintf	!params=  %o0 %o1	!result= 
/* 0x3838	     */		add	%i1,1040,%o1

! 1745		      !                                XSetForeground(dsp, gc2, red.pixel);

/* 0x383c	1745 */		ldx	[%sp+2479],%o2
/* 0x3840	     */		ldx	[%sp+2679],%o1
/* 0x3844	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3848	     */		mov	%l7,%o0

! 1746		      !                                XDrawImageString(dsp, win2, gc2, 220, 178, buf, (
! 1746		      >int)strlen(buf));

/* 0x384c	1746 */		ldx	[%sp+2647],%o1
/* 0x3850	     */		ldub	[%o1],%l3

! Registers live out of .L77002613: 
! g2 g3 o0 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77002613 .L900000247

			.L900000720:
/* 0x3854	1746 */		brz,pn	%l3,.L900000248
/* 0x3858	     */		add	%o1,1,%o1

! Registers live out of .L900000720: 
! g2 g3 o0 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000720

			.L900000247:
/* 0x385c	1746 */		ldub	[%o1],%g4
/* 0x3860	     */		add	%o1,1,%o1
/* 0x3864	     */		brnz,a,pt	%g4,.L900000720
/* 0x3868	     */		ldub	[%o1],%l3

! Registers live out of .L900000247: 
! g2 g3 o0 o1 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000247 .L900000720

			.L900000248:
/* 0x386c	1746 */		ldx	[%sp+2647],%o5
/* 0x3870	     */		sub	%o1,1,%g1
/* 0x3874	     */		mov	178,%o4
/* 0x3878	     */		ldx	[%sp+2679],%o2
/* 0x387c	     */		mov	220,%o3
/* 0x3880	     */		ldx	[%sp+2687],%o1
/* 0x3884	     */		sub	%g1,%o5,%i3
/* 0x3888	     */		sra	%i3,0,%i4
/* 0x388c	     */		stx	%i4,[%sp+2223]
/* 0x3890	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3894	     */		mov	%l7,%o0
/* 0x3898	     */		ldd	[%sp+2775],%f0
/* 0x389c	     */		ba	.L900000698
/* 0x38a0	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000248: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		
! 1747		      !                            }
! 1748		      !                        }
! 1749		      !                    }
! 1750		      !                }
! 1751		      !            }
! 1753		      !        } else if ( button == Button2 ) {

                       
! predecessor blocks: .L900000320

			.L77002631:
/* 0x38a4	1753 */		cmp	%o2,2
/* 0x38a8	     */		bne,pt	%icc,.L900000719
/* 0x38ac	   0 */		sethi	%gdop_hix22(.L677),%i5

! Registers live out of .L77002631: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002631

			.L77002635:
/* 0x38b0	1042 */		add	%l4,-1,%l4
/* 0x38b4	1043 */		add	%i1,-2,%o4
/* 0x38b8	     */		st	%o4,[%sp+2311]

! 1755		      !replot:
! 1756		      !            /* determine if we are inside the primary window plotting region */
! 1757		      !            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
! 1758		      !                 && ( mouse_x < ( eff_width + offset_x ) )
! 1759		      !                 && ( mouse_y < ( eff_height + offset_y ) ) ) {

/* 0x38bc	1759 */		cmp	%l4,10
/* 0x38c0	     */		bl,pn	%icc,.L77002753
/* 0x38c4	1042 */		st	%l4,[%sp+2307]

! Registers live out of .L77002635: 
! g2 g3 o0 o4 sp l4 l6 l7 i2 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002635

			.L77002637:
/* 0x38c8	1759 */		cmp	%o4,10
/* 0x38cc	     */		bl,pn	%icc,.L77002753
/* 0x38d0	     */		cmp	%l4,1034

! Registers live out of .L77002637: 
! g2 g3 o0 o4 sp l6 l7 i2 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002637

			.L77002639:
/* 0x38d4	1759 */		bge,pn	%icc,.L77002753
/* 0x38d8	     */		cmp	%o4,1034

! Registers live out of .L77002639: 
! g2 g3 o0 sp l6 l7 i2 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002639

			.L77002641:
/* 0x38dc	1759 */		bge,pn	%icc,.L77002753
/* 0x38e0	   0 */		sethi	%gdop_hix22(.L582),%l5

! Registers live out of .L77002641: 
! g2 g3 o0 sp l5 l6 l7 i2 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002641 .L900000643

			.L77002643:
/* 0x38e4	   0 */		ldx	[%sp+2399],%l4
/* 0x38e8	   0 */		xor	%l5,%gdop_lox10(.L582),%i5

! 1761		      !                /****************************************************
! 1762		      !                 * The next chunk is pretty but means little for the
! 1763		      !                 * actual computions needed later. All we do is look
! 1764		      !                 * at the mouse coordinates here/
! 1765		      !                 * **************************************************/
! 1767		      !                /* invert the y axis */
! 1768		      !                invert_mouse_y = eff_height - mouse_y + offset_y;
! 1769		      !                sample_r = ( mouse_x - offset_x );
! 1770		      !                sample_j = invert_mouse_y;
! 1771		      !                printf("DBUG : sample space [ %-6i, %-6i ]\n", sample_r, sample_j
! 1771		      >);

/* 0x38ec	1771 */		ld	[%sp+2311],%i0
/* 0x38f0	     */		mov	1034,%l5
/* 0x38f4	     */		ld	[%sp+2307],%i4
/* 0x38f8	   0 */		ldx	[%l4+%i5],%i1,%gdop(.L582)
/* 0x38fc	1771 */		sub	%l5,%i0,%l2
/* 0x3900	     */		sra	%l2,0,%o2
/* 0x3904	     */		add	%i4,-10,%l4
/* 0x3908	     */		sra	%l4,0,%o1
/* 0x390c	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x3910	     */		mov	%i1,%o0

! 1773		      !                fp_region(sample_r, sample_j, eff_width, eff_height, &coord);

/* 0x3914	1773 */		sra	%l2,0,%o1
/* 0x3918	     */		sra	%l4,0,%o0
/* 0x391c	     */		mov	1024,%o3
/* 0x3920	     */		mov	1024,%o2
/* 0x3924	     */		call	fp_region	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x3928	   0 */		add	%sp,2431,%o4

! 1774		      !                win_r = coord.r;

/* 0x392c	1774 */		ldd	[%sp+2431],%f34

! 1775		      !                win_j = coord.j;

/* 0x3930	1775 */		ldd	[%sp+2439],%f32

! 1777		      !                XSetForeground(dsp, gc2, green.pixel);

/* 0x3934	1777 */		ldx	[%sp+2679],%o1
/* 0x3938	     */		mov	%l7,%o0
/* 0x393c	1775 */		std	%f32,[%sp+2839]
/* 0x3940	1774 */		std	%f34,[%sp+2831]
/* 0x3944	1777 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3948	     */		ldx	[%sp+2447],%o2

! 1778		      !                sprintf(buf,"fp64( %-10.8e , %-10.8e )", win_r, win_j );

/* 0x394c	1778 */		ldx	[%sp+2647],%o0
/* 0x3950	     */		ldx	[%sp+2831],%o2
/* 0x3954	     */		add	%i1,40,%o1
/* 0x3958	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x395c	     */		ldx	[%sp+2839],%o3

! 1779		      !                XDrawImageString( dsp, win2, gc2, 10, 250, buf, (int)strlen(buf))
! 1779		      >;

/* 0x3960	1779 */		ldx	[%sp+2647],%g4
/* 0x3964	     */		ldub	[%g4],%g5

! Registers live out of .L77002643: 
! g2 g3 g4 g5 o0 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002643 .L900000243

			.L900000718:
/* 0x3968	1779 */		brz,pn	%g5,.L900000244
/* 0x396c	     */		add	%g4,1,%g4

! Registers live out of .L900000718: 
! g2 g3 g4 g5 o0 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000718

			.L900000243:
/* 0x3970	1779 */		ldub	[%g4],%l3
/* 0x3974	     */		add	%g4,1,%g4
/* 0x3978	     */		brnz,a,pt	%l3,.L900000718
/* 0x397c	     */		ldub	[%g4],%g5

! Registers live out of .L900000243: 
! g2 g3 g4 g5 o0 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000243 .L900000718

			.L900000244:
/* 0x3980	1779 */		ldx	[%sp+2647],%o5
/* 0x3984	     */		sub	%g4,1,%o3
/* 0x3988	     */		mov	250,%o4
/* 0x398c	     */		ldx	[%sp+2679],%o2
/* 0x3990	     */		ldx	[%sp+2687],%o1
/* 0x3994	     */		sub	%o3,%o5,%i1
/* 0x3998	     */		mov	%o5,%l3
/* 0x399c	     */		sra	%i1,0,%l2
/* 0x39a0	     */		mov	10,%o3
/* 0x39a4	     */		stx	%l2,[%sp+2223]
/* 0x39a8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x39ac	     */		mov	%l7,%o0

! 1781		      !                /* vbox[] coordinates for the 16x16 grid */
! 1782		      !                vbox_r = ( mouse_x - offset_x ) / vbox_w;
! 1783		      !                vbox_j = ( eff_height - mouse_y + offset_y ) / vbox_h;
! 1784		      !                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_r, vbox_j );

/* 0x39b0	1784 */		ld	[%sp+2311],%i5
/* 0x39b4	     */		sra	%l4,31,%o5
/* 0x39b8	     */		sethi	%gdop_hix22(.L352),%o7
/* 0x39bc	     */		xor	%o7,%gdop_lox10(.L352),%i0
/* 0x39c0	     */		and	%o5,63,%l5
/* 0x39c4	     */		mov	%l3,%o0
/* 0x39c8	     */		add	%i5,-1034,%g1
/* 0x39cc	     */		add	%l4,%l5,%o2
/* 0x39d0	     */		ldx	[%sp+2399],%l5
/* 0x39d4	     */		sra	%g1,31,%g5
/* 0x39d8	     */		sra	%o2,6,%o2
/* 0x39dc	     */		and	%g5,63,%o4

! 1785		      !                printf("     : %s\n",buf);
! 1786		      !                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf))
! 1786		      >;

/* 0x39e0	1786 */		mov	%l3,%i1
/* 0x39e4	1784 */		add	%g1,%o4,%i3
/* 0x39e8	     */		ldx	[%l5+%i0],%o1,%gdop(.L352)
/* 0x39ec	     */		sra	%i3,6,%i4
/* 0x39f0	     */		sub	%g0,%i4,%g4
/* 0x39f4	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x39f8	     */		sra	%g4,0,%o3
/* 0x39fc	1785 */		sethi	%gdop_hix22(.L584),%o0
/* 0x3a00	     */		mov	%l3,%o1
/* 0x3a04	     */		xor	%o0,%gdop_lox10(.L584),%o3
/* 0x3a08	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3a0c	     */		ldx	[%l5+%o3],%o0,%gdop(.L584)
/* 0x3a10	1786 */		ldub	[%l3],%o0

! Registers live out of .L900000244: 
! g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000239 .L900000244

			.L900000717:
/* 0x3a14	1786 */		brz,pn	%o0,.L900000240
/* 0x3a18	     */		add	%i1,1,%i1

! Registers live out of .L900000717: 
! g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000717

			.L900000239:
/* 0x3a1c	1786 */		ldub	[%i1],%i0
/* 0x3a20	     */		add	%i1,1,%i1
/* 0x3a24	     */		brnz,a,pt	%i0,.L900000717
/* 0x3a28	     */		ldub	[%i1],%o0

! Registers live out of .L900000239: 
! g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000239 .L900000717

			.L900000240:
/* 0x3a2c	1786 */		ldx	[%sp+2647],%o5
/* 0x3a30	     */		sub	%i1,1,%o1
/* 0x3a34	     */		ldx	[%sp+2679],%o2
/* 0x3a38	     */		mov	270,%o4
/* 0x3a3c	     */		mov	10,%o3
/* 0x3a40	     */		sub	%o1,%o5,%l2
/* 0x3a44	     */		ldx	[%sp+2687],%o1
/* 0x3a48	     */		mov	%o5,%i1
/* 0x3a4c	     */		sra	%l2,0,%o7
/* 0x3a50	     */		stx	%o7,[%sp+2223]
/* 0x3a54	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3a58	     */		mov	%l7,%o0
/* 0x3a5c	   0 */		ldx	[%sp+2399],%o2
/* 0x3a60	   0 */		sethi	%gdop_hix22(.L585),%o5

! 1788		      !                printf("     : win_r = %-+32.26e\n", win_r );

/* 0x3a64	1788 */		ldx	[%sp+2831],%o1
/* 0x3a68	   0 */		xor	%o5,%gdop_lox10(.L585),%l5
/* 0x3a6c	   0 */		ldx	[%o2+%l5],%l4,%gdop(.L585)
/* 0x3a70	1788 */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3a74	     */		mov	%l4,%o0

! 1789		      !                printf("     : win_j = %-+32.26e\n", win_j );

/* 0x3a78	1789 */		ldx	[%sp+2839],%o1
/* 0x3a7c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3a80	     */		add	%l4,32,%o0

! 1791		      !                XSetForeground(dsp, gc2, cornflowerblue.pixel);

/* 0x3a84	1791 */		ldx	[%sp+2591],%o2
/* 0x3a88	     */		mov	%l7,%o0
/* 0x3a8c	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3a90	     */		ldx	[%sp+2679],%o1

! 1792		      !                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )  ", win_r, win_j );

/* 0x3a94	1792 */		ldx	[%sp+2831],%o2
/* 0x3a98	     */		mov	%i1,%o0
/* 0x3a9c	     */		add	%l4,64,%o1
/* 0x3aa0	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x3aa4	     */		ldx	[%sp+2839],%o3

! 1793		      !                XDrawImageString( dsp, win2, gc2, 10, 290, buf, (int)strlen(buf))
! 1793		      >;

/* 0x3aa8	1793 */		ldub	[%i1],%o0
/* 0x3aac	     */		mov	%i1,%g4

! Registers live out of .L900000240: 
! g2 g3 g4 o0 sp l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000235 .L900000240

			.L900000716:
/* 0x3ab0	1793 */		brz,pn	%o0,.L900000236
/* 0x3ab4	     */		add	%g4,1,%g4

! Registers live out of .L900000716: 
! g2 g3 g4 o0 sp l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000716

			.L900000235:
/* 0x3ab8	1793 */		ldub	[%g4],%i4
/* 0x3abc	     */		add	%g4,1,%g4
/* 0x3ac0	     */		brnz,a,pt	%i4,.L900000716
/* 0x3ac4	     */		ldub	[%g4],%o0

! Registers live out of .L900000235: 
! g2 g3 g4 o0 sp l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000235 .L900000716

			.L900000236:
/* 0x3ac8	1793 */		ldx	[%sp+2647],%o5
/* 0x3acc	     */		sub	%g4,1,%i5
/* 0x3ad0	     */		ldx	[%sp+2687],%o1
/* 0x3ad4	     */		mov	290,%o4
/* 0x3ad8	     */		mov	10,%o3
/* 0x3adc	     */		sub	%i5,%o5,%o2
/* 0x3ae0	     */		mov	%o5,%l2
/* 0x3ae4	     */		sra	%o2,0,%g5
/* 0x3ae8	     */		ldx	[%sp+2679],%o2
/* 0x3aec	     */		stx	%g5,[%sp+2223]
/* 0x3af0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3af4	     */		mov	%l7,%o0

! 1795		      !                /* translation and offset into the centre of a sample region */
! 1796		      !                fp_translate(win_r, win_j, magnify, real_translate, imag_translat
! 1796		      >e, &coord);

/* 0x3af8	1796 */		ldd	[%sp+2727],%f6
/* 0x3afc	     */		ldd	[%sp+2735],%f8
/* 0x3b00	     */		ldd	[%sp+2839],%f2
/* 0x3b04	     */		ldd	[%sp+2831],%f0
/* 0x3b08	   0 */		add	%sp,2431,%o5
/* 0x3b0c	1796 */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x3b10	     */		ldd	[%sp+2655],%f4
/* 0x3b14	   0 */		ldx	[%sp+2399],%o7
/* 0x3b18	   0 */		sethi	%gdop_hix22(.L588),%o4

! 1797		      !                x_prime = coord.r;
! 1798		      !                y_prime = coord.j;
! 1800		      !                printf("     : after translation\n");
! 1801		      !                printf("     : r_trn   = %-+32.26e\n", real_translate );
! 1802		      !                printf("     : j_trn   = %-+32.26e\n", imag_translate );
! 1803		      !                printf("     : x_prime = %-+32.26e\n", x_prime );
! 1804		      !                printf("     : y_prime = %-+32.26e\n", y_prime );
! 1805		      !                /****************************************************
! 1806		      !                 *    NONE OF THE ABOVE HAS much to do with the
! 1807		      !                 *    actual computations needed. All we did was
! 1808		      !                 *    determine the complex coordinates of the
! 1809		      !                 *    mouse in the sample space.
! 1810		      !                 ****************************************************/
! 1812		      !                XSetForeground(dsp, gc3, red.pixel);
! 1813		      !                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime 
! 1813		      >);
! 1814		      !                XDrawImageString( dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));

/* 0x3b1c	1814 */		mov	%l2,%l4
/* 0x3b20	   0 */		xor	%o4,%gdop_lox10(.L588),%g1
/* 0x3b24	1797 */		ldd	[%sp+2431],%f34
/* 0x3b28	1798 */		ldd	[%sp+2439],%f32
/* 0x3b2c	     */		std	%f32,[%sp+2767]
/* 0x3b30	1797 */		std	%f34,[%sp+2759]
/* 0x3b34	   0 */		ldx	[%o7+%g1],%i3,%gdop(.L588)
/* 0x3b38	1800 */		call	printf	!params=  %o0	!result= 
/* 0x3b3c	     */		mov	%i3,%o0
/* 0x3b40	1801 */		ldx	[%sp+2727],%o1
/* 0x3b44	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3b48	     */		add	%i3,32,%o0
/* 0x3b4c	1802 */		ldx	[%sp+2735],%o1
/* 0x3b50	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3b54	     */		add	%i3,64,%o0
/* 0x3b58	1803 */		ldx	[%sp+2759],%o1
/* 0x3b5c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3b60	     */		add	%i3,96,%o0
/* 0x3b64	1804 */		ldx	[%sp+2767],%o1
/* 0x3b68	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3b6c	     */		add	%i3,128,%o0
/* 0x3b70	1812 */		ldx	[%sp+2479],%o2
/* 0x3b74	     */		mov	%l7,%o0
/* 0x3b78	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3b7c	     */		ldx	[%sp+2695],%o1
/* 0x3b80	1813 */		ldx	[%sp+2759],%o2
/* 0x3b84	     */		ldx	[%sp+2767],%o3
/* 0x3b88	     */		add	%i3,-1760,%o1
/* 0x3b8c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x3b90	     */		mov	%l2,%o0
/* 0x3b94	1814 */		ldub	[%l2],%g5

! Registers live out of .L900000236: 
! g2 g3 g5 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000231 .L900000236

			.L900000715:
/* 0x3b98	1814 */		brz,pn	%g5,.L900000232
/* 0x3b9c	     */		add	%l4,1,%l4

! Registers live out of .L900000715: 
! g2 g3 g5 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000715

			.L900000231:
/* 0x3ba0	1814 */		ldub	[%l4],%l5
/* 0x3ba4	     */		add	%l4,1,%l4
/* 0x3ba8	     */		brnz,a,pt	%l5,.L900000715
/* 0x3bac	     */		ldub	[%l4],%g5

! Registers live out of .L900000231: 
! g2 g3 g5 sp l4 l6 l7 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000231 .L900000715

			.L900000232:
/* 0x3bb0	1814 */		ldx	[%sp+2647],%o5
/* 0x3bb4	     */		sub	%l4,1,%o0
/* 0x3bb8	     */		mov	80,%o4
/* 0x3bbc	     */		ldx	[%sp+2719],%o1
/* 0x3bc0	     */		ldx	[%sp+2695],%o2
/* 0x3bc4	     */		sub	%o0,%o5,%o3
/* 0x3bc8	     */		mov	%o5,%l4
/* 0x3bcc	     */		sra	%o3,0,%l3
/* 0x3bd0	     */		mov	10,%o3
/* 0x3bd4	     */		stx	%l3,[%sp+2223]
/* 0x3bd8	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3bdc	     */		mov	%l7,%o0

! 1816		      !                XSetForeground(dsp, gc3, green.pixel);

/* 0x3be0	1816 */		ldx	[%sp+2447],%o2
/* 0x3be4	     */		ldx	[%sp+2695],%o1
/* 0x3be8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3bec	     */		mov	%l7,%o0

! 1817		      !                sprintf(buf,"bailout = %-8i          ", mand_bail);

/* 0x3bf0	1817 */		ldx	[%sp+2399],%i5

! 1818		      !                printf("     : %s\n", buf);
! 1819		      !                XDrawImageString( dsp, win3, gc3, 10, 100, buf, (int)strlen(buf))
! 1819		      >;

/* 0x3bf4	1819 */		mov	%l4,%i4
/* 0x3bf8	1817 */		ld	[%sp+2271],%o2
/* 0x3bfc	     */		mov	%l4,%o0
/* 0x3c00	     */		sethi	%gdop_hix22(.L593),%o1
/* 0x3c04	     */		xor	%o1,%gdop_lox10(.L593),%l2
/* 0x3c08	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c0c	     */		ldx	[%i5+%l2],%o1,%gdop(.L593)
/* 0x3c10	1818 */		sethi	%gdop_hix22(.L584),%o7
/* 0x3c14	     */		xor	%o7,%gdop_lox10(.L584),%o5
/* 0x3c18	     */		ldx	[%i5+%o5],%o0,%gdop(.L584)
/* 0x3c1c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c20	     */		mov	%l4,%o1
/* 0x3c24	1819 */		ldub	[%l4],%g4

! Registers live out of .L900000232: 
! g2 g3 g4 o0 sp l6 l7 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000227 .L900000232

			.L900000714:
/* 0x3c28	1819 */		brz,pn	%g4,.L900000228
/* 0x3c2c	     */		add	%i4,1,%i4

! Registers live out of .L900000714: 
! g2 g3 g4 o0 sp l6 l7 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000714

			.L900000227:
/* 0x3c30	1819 */		ldub	[%i4],%i3
/* 0x3c34	     */		add	%i4,1,%i4
/* 0x3c38	     */		brnz,a,pt	%i3,.L900000714
/* 0x3c3c	     */		ldub	[%i4],%g4

! Registers live out of .L900000227: 
! g2 g3 g4 o0 sp l6 l7 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000227 .L900000714

			.L900000228:
/* 0x3c40	1819 */		ldx	[%sp+2647],%o5
/* 0x3c44	     */		sub	%i4,1,%i0
/* 0x3c48	     */		ldx	[%sp+2719],%o1
/* 0x3c4c	     */		mov	100,%o4
/* 0x3c50	     */		mov	10,%o3
/* 0x3c54	     */		ldx	[%sp+2695],%o2
/* 0x3c58	     */		sub	%i0,%o5,%i1
/* 0x3c5c	     */		mov	%o5,%l5
/* 0x3c60	     */		sra	%i1,0,%i5
/* 0x3c64	     */		stx	%i5,[%sp+2223]
/* 0x3c68	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3c6c	     */		mov	%l7,%o0

! 1821		      !                sprintf(buf,"magnify = %-12.10e", magnify);

/* 0x3c70	1821 */		ldx	[%sp+2399],%i0
/* 0x3c74	     */		sethi	%gdop_hix22(.L358),%g5
/* 0x3c78	     */		ldx	[%sp+2655],%o2
/* 0x3c7c	     */		xor	%g5,%gdop_lox10(.L358),%o4
/* 0x3c80	     */		mov	%l5,%o0
/* 0x3c84	     */		call	sprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x3c88	     */		ldx	[%i0+%o4],%o1,%gdop(.L358)

! 1822		      !                printf("     : magnify = %-18.12e\n", magnify);

/* 0x3c8c	1822 */		sethi	%gdop_hix22(.L594),%o2
/* 0x3c90	     */		ldx	[%sp+2655],%o1
/* 0x3c94	     */		xor	%o2,%gdop_lox10(.L594),%g1
/* 0x3c98	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x3c9c	     */		ldx	[%i0+%g1],%o0,%gdop(.L594)

! 1823		      !                XDrawImageString( dsp, win3, gc3, 10, 120, buf, (int)strlen(buf))
! 1823		      >;

/* 0x3ca0	1823 */		ldub	[%l5],%i0
/* 0x3ca4	     */		mov	%l5,%o7

! Registers live out of .L900000228: 
! g2 g3 sp o7 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000223 .L900000228

			.L900000713:
/* 0x3ca8	1823 */		brz,pn	%i0,.L900000224
/* 0x3cac	     */		add	%o7,1,%o7

! Registers live out of .L900000713: 
! g2 g3 sp o7 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000713

			.L900000223:
/* 0x3cb0	1823 */		ldub	[%o7],%o3
/* 0x3cb4	     */		add	%o7,1,%o7
/* 0x3cb8	     */		brnz,a,pt	%o3,.L900000713
/* 0x3cbc	     */		ldub	[%o7],%i0

! Registers live out of .L900000223: 
! g2 g3 sp o7 l6 l7 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L900000223 .L900000713

			.L900000224:
/* 0x3cc0	1823 */		ldx	[%sp+2647],%o5
/* 0x3cc4	     */		sub	%o7,1,%g4
/* 0x3cc8	     */		ldx	[%sp+2719],%o1
/* 0x3ccc	     */		mov	120,%o4
/* 0x3cd0	     */		ldx	[%sp+2695],%o2
/* 0x3cd4	     */		mov	10,%o3
/* 0x3cd8	     */		sub	%g4,%o5,%o0
/* 0x3cdc	     */		mov	%o5,%i3
/* 0x3ce0	     */		sra	%o0,0,%l3
/* 0x3ce4	     */		stx	%l3,[%sp+2223]

! 1825		      !                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, i
! 1825		      >mag_translate);
! 1826		      !                XDrawImageString( dsp, win3, gc3, 10, 140, buf, (int)strlen(buf))
! 1826		      >;

/* 0x3ce8	1826 */		mov	%i3,%i1
/* 0x3cec	1823 */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3cf0	     */		mov	%l7,%o0
/* 0x3cf4	1825 */		ldx	[%sp+2399],%g1
/* 0x3cf8	     */		ldx	[%sp+2727],%o2
/* 0x3cfc	     */		sethi	%gdop_hix22(.L359),%o1
/* 0x3d00	     */		ldx	[%sp+2735],%o3
/* 0x3d04	     */		mov	%i3,%o0
/* 0x3d08	     */		xor	%o1,%gdop_lox10(.L359),%l2
/* 0x3d0c	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x3d10	     */		ldx	[%g1+%l2],%o1,%gdop(.L359)
/* 0x3d14	1826 */		ldub	[%i3],%i3

! Registers live out of .L900000224: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000219 .L900000224

			.L900000712:
/* 0x3d18	1826 */		brz,pn	%i3,.L900000220
/* 0x3d1c	     */		add	%i1,1,%i1

! Registers live out of .L900000712: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000712

			.L900000219:
/* 0x3d20	1826 */		ldub	[%i1],%o5
/* 0x3d24	     */		add	%i1,1,%i1
/* 0x3d28	     */		brnz,a,pt	%o5,.L900000712
/* 0x3d2c	     */		ldub	[%i1],%i3

! Registers live out of .L900000219: 
! g2 g3 o0 sp l6 l7 i1 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000219 .L900000712

			.L900000220:
/* 0x3d30	1826 */		ldx	[%sp+2647],%o5
/* 0x3d34	     */		sub	%i1,1,%l5
/* 0x3d38	     */		ldx	[%sp+2719],%o1
/* 0x3d3c	     */		mov	140,%o4
/* 0x3d40	     */		ldx	[%sp+2695],%o2
/* 0x3d44	     */		mov	10,%o3
/* 0x3d48	     */		sub	%l5,%o5,%l4
/* 0x3d4c	     */		sra	%l4,0,%i0
/* 0x3d50	     */		stx	%i0,[%sp+2223]
/* 0x3d54	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3d58	     */		mov	%l7,%o0

! 1827		      !                XSetForeground(dsp, gc3, cyan.pixel);

/* 0x3d5c	1827 */		ldx	[%sp+2511],%o2
/* 0x3d60	     */		ldx	[%sp+2695],%o1
/* 0x3d64	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x3d68	     */		mov	%l7,%o0

! 1829		      !                clock_gettime(CLOCK_REALTIME, &soln_t0 );

/* 0x3d6c	1829 */		add	%sp,2463,%o1
/* 0x3d70	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x3d74	     */		mov	3,%o0

! 1831		      !                if ( colour_method_flag == 1 ) {

/* 0x3d78	1831 */		ld	[%sp+2291],%g4
/* 0x3d7c	     */		cmp	%g4,1
/* 0x3d80	     */		bne,pn	%icc,.L77002647
/* 0x3d84	1844 */		add	%fp,-1049,%i1

! Registers live out of .L900000220: 
! g2 g3 o0 sp l6 l7 i1 i2 fp gsr 
! 
		
! 1832		      !                    colour_method_flag = 0;

                       
! predecessor blocks: .L900000220

			.L77002645:
/* 0x3d88	1832 */		st	%g0,[%sp+2291]

! 1833		      !                } else {
! 1834		      !                    colour_method_flag = 1;
! 1835		      !                    if ( invert_me_dammit == 0 ) {
! 1836		      !                        invert_me_dammit = 1;
! 1837		      !                    } else {
! 1838		      !                        invert_me_dammit = 0;
! 1839		      !                    }
! 1840		      !                }
! 1842		      !                /* here we loop over the vbox coords */
! 1843		      !                for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ ) {
! 1844		      !                    for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_r++ ) {

/* 0x3d8c	1844 */		mov	10,%i4
/* 0x3d90	     */		st	%i4,[%sp+2343]
/* 0x3d94	1843 */		mov	1034,%l2
/* 0x3d98	     */		st	%l2,[%sp+2339]
/* 0x3d9c	1844 */		mov	0,%i3
/* 0x3da0	1843 */		mov	0,%i4
/* 0x3da4	     */		stx	%i1,[%sp+2799]
/* 0x3da8	1832 */		ba	.L900000700
/* 0x3dac	1848 */		ld	[%i1],%l2

! Registers live out of .L77002645: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000220

			.L77002647:
/* 0x3db0	1836 */		ld	[%sp+2299],%o7
/* 0x3db4	1834 */		mov	1,%g1
/* 0x3db8	1843 */		mov	1034,%o0
/* 0x3dbc	1834 */		st	%g1,[%sp+2291]
/* 0x3dc0	1843 */		add	%fp,-1049,%g4
/* 0x3dc4	     */		mov	0,%i4
/* 0x3dc8	     */		st	%o0,[%sp+2339]
/* 0x3dcc	     */		stx	%g4,[%sp+2799]
/* 0x3dd0	1836 */		sub	%g0,%o7,%l3
/* 0x3dd4	     */		srlx	%l3,63,%i3
/* 0x3dd8	     */		xor	%i3,1,%g5
/* 0x3ddc	     */		st	%g5,[%sp+2299]

! Registers live out of .L77002647: 
! g2 g3 o0 sp l6 l7 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002647 .L77002747

			.L77002659:
/* 0x3de0	1844 */		ldx	[%sp+2799],%i1
/* 0x3de4	     */		mov	10,%o2
/* 0x3de8	     */		st	%o2,[%sp+2343]
/* 0x3dec	     */		mov	0,%i3

! 1845		      !                        /* printf("     : vbox [ %-3i, %-3i ]\n", vbox_r, vbox_j)
! 1845		      >; */
! 1846		      !                        /* loop over the pixels ( samples ) inside a vbox */
! 1847		      !                        /* TODO grind the gears */
! 1848		      !                        if ( vbox_flag[vbox_r][vbox_j] == 0 ) {

/* 0x3df0	1848 */		ld	[%i1],%l2

! Registers live out of .L77002659: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002645 .L77002659 .L77002743

			.L900000700:
/* 0x3df4	1848 */		cmp	%l2,0
/* 0x3df8	     */		bne,pn	%icc,.L77002743
/* 0x3dfc	1849 */		add	%sp,2607,%o1

! Registers live out of .L900000700: 
! g2 g3 o0 o1 sp l2 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1849		      !                            clock_gettime(CLOCK_REALTIME, &vbox_t0 );
! 1850		      !                            for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix
! 1850		      >++ ) {

                       
! predecessor blocks: .L900000700

			.L77002979:
/* 0x3e00	1850 */		mov	0,%l4
/* 0x3e04	1849 */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x3e08	     */		mov	3,%o0
/* 0x3e0c	1850 */		ld	[%sp+2339],%l2

! 1851		      !                                vbox_ll_y = vbox_j * vbox_h + mand_y_pix;
! 1852		      !                                sample_j = vbox_ll_y;
! 1853		      !                                for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x
! 1853		      >_pix++ ) {

/* 0x3e10	1853 */		mov	0,%l5

! Registers live out of .L77002979: 
! g2 g3 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1854		      !                                    vbox_ll_x = vbox_r * vbox_w + mand_x_pix;
! 1855		      !                                    sample_r = vbox_ll_x;
! 1857		      !                                    fp_vbox(vbox_r, vbox_j, mand_x_pix, mand_y_pi
! 1857		      >x, eff_width, eff_height, &coord);

                       
! predecessor blocks: .L77002737 .L77002979

			.L900000702:
/* 0x3e14	1857 */		sra	%l4,0,%o3
/* 0x3e18	1853 */		ld	[%sp+2343],%l3

! Registers live out of .L900000702: 
! g2 g3 o3 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000702 .L900000704

			.L900000703:
/* 0x3e1c	1857 */		sra	%l5,0,%o2
/* 0x3e20	     */		sra	%i4,0,%o1
/* 0x3e24	     */		sra	%i3,0,%o0
/* 0x3e28	     */		add	%sp,2431,%i0
/* 0x3e2c	     */		stx	%i0,[%sp+2223]
/* 0x3e30	     */		mov	1024,%o5
/* 0x3e34	     */		call	fp_vbox	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x3e38	     */		mov	1024,%o4

! 1858		      !                                    win_r = coord.r;
! 1859		      !                                    win_j = coord.j;
! 1861		      !                                    fp_translate(win_r, win_j, magnify, real_tran
! 1861		      >slate, imag_translate, &coord);

/* 0x3e3c	1861 */		ldd	[%sp+2431],%f0
/* 0x3e40	     */		ldd	[%sp+2439],%f2
/* 0x3e44	     */		mov	%i0,%o5
/* 0x3e48	     */		ldd	[%sp+2735],%f8
/* 0x3e4c	     */		ldd	[%sp+2727],%f6
/* 0x3e50	     */		call	fp_translate	!params=  %o5 %f0 %f1 %f2 %f3 %f4 %f5 %f6 %f7 %f8 %f9	!result= 
/* 0x3e54	     */		ldd	[%sp+2655],%f4

! 1862		      !                                    x_prime = coord.r;
! 1863		      !                                    y_prime = coord.j;
! 1865		      !                                    /* DEBUG *
! 1866		      !                                    printf("     : sample[%-4i][%-4i] -> Wr = %-+
! 1866		      >32.26e\n",
! 1867		      !                                                   sample_r, sample_j, win_r);
! 1869		      !                                    printf("     :                    -> Wj = %-+
! 1869		      >32.26e\n",
! 1870		      !                                                   win_j);
! 1872		      !                                    printf("     : r[%-2i][%-2i][%-2i][%-2i] = %-
! 1872		      >+32.26e\n",
! 1873		      !                                                   vbox_r,vbox_j,mand_x_pix,mand_
! 1873		      >y_pix,x_prime);
! 1875		      !                                    printf("     : j[%-2i][%-2i][%-2i][%-2i] = %-
! 1875		      >+32.26e\n",
! 1876		      !                                                   vbox_r,vbox_j,mand_x_pix,mand_
! 1876		      >y_pix,y_prime);
! 1877		      !                                    */
! 1879		      !                                    if ( vbox_flag[vbox_r][vbox_j] == 1 ) {

/* 0x3e58	1879 */		ld	[%i1],%o0
/* 0x3e5c	1863 */		ldd	[%sp+2439],%f32
/* 0x3e60	1862 */		ldd	[%sp+2431],%f34
/* 0x3e64	1863 */		std	%f32,[%sp+2767]
/* 0x3e68	1862 */		std	%f34,[%sp+2759]
/* 0x3e6c	1879 */		cmp	%o0,1
/* 0x3e70	     */		bne,pn	%icc,.L77002677
/* 0x3e74	1880 */		sra	%l4,0,%o3

! Registers live out of .L900000703: 
! g2 g3 o0 o3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1880		      !                                        mand_height = mandel_val[array_offset(vbo
! 1880		      >x_r,vbox_j,mand_x_pix,mand_y_pix)];

                       
! predecessor blocks: .L900000703

			.L77002675:
/* 0x3e78	1880 */		sra	%l5,0,%o2
/* 0x3e7c	     */		sra	%i4,0,%o1
/* 0x3e80	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3e84	     */		sra	%i3,0,%o0
/* 0x3e88	     */		ldx	[%sp+2407],%o1
/* 0x3e8c	     */		ld	[%sp+2271],%g1
/* 0x3e90	     */		sllx	%o0,2,%g5
/* 0x3e94	     */		ld	[%g5+%o1],%i5
/* 0x3e98	     */		ba	.L900000711
/* 0x3e9c	1889 */		ld	[%sp+2291],%o4

! Registers live out of .L77002675: 
! g1 g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		
! 1881		      !                                    } else {
! 1882		      !                                        coord_r[array_offset(vbox_r,vbox_j,mand_x
! 1882		      >_pix,mand_y_pix)] = x_prime;

                       
! predecessor blocks: .L900000703

			.L77002677:
/* 0x3ea0	1882 */		sra	%l5,0,%o2
/* 0x3ea4	     */		sra	%i4,0,%o1
/* 0x3ea8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3eac	     */		sra	%i3,0,%o0

! 1883		      !                                        coord_j[array_offset(vbox_r,vbox_j,mand_x
! 1883		      >_pix,mand_y_pix)] = y_prime;

/* 0x3eb0	1883 */		sra	%l4,0,%o3
/* 0x3eb4	1882 */		ldd	[%sp+2759],%f32
/* 0x3eb8	1883 */		sra	%l5,0,%o2
/* 0x3ebc	     */		sra	%i4,0,%o1
/* 0x3ec0	1882 */		sllx	%o0,3,%o7
/* 0x3ec4	     */		std	%f32,[%o7+%i2]
/* 0x3ec8	1883 */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3ecc	     */		sra	%i3,0,%o0

! 1884		      !                                        /* the actual mandelbrot computation for 
! 1884		      >(x_prime, y_prime) */
! 1885		      !                                        mand_height = mbrot(x_prime, y_prime, man
! 1885		      >d_bail);

/* 0x3ed0	1885 */		ldd	[%sp+2759],%f0
/* 0x3ed4	1883 */		ldd	[%sp+2767],%f2
/* 0x3ed8	1885 */		ld	[%sp+2271],%o2
/* 0x3edc	1883 */		sllx	%o0,3,%o3
/* 0x3ee0	     */		ldx	[%sp+2639],%o5
/* 0x3ee4	1885 */		call	mbrot	!params=  %o2 %f0 %f1 %f2 %f3	!result=  %o0
/* 0x3ee8	1883 */		std	%f2,[%o3+%o5]

! 1886		      !                                        mandel_val[array_offset(vbox_r,vbox_j,man
! 1886		      >d_x_pix,mand_y_pix)] = mand_height;

/* 0x3eec	1886 */		sra	%l4,0,%o3
/* 0x3ef0	     */		sra	%l5,0,%o2
/* 0x3ef4	     */		sra	%i4,0,%o1
/* 0x3ef8	1885 */		mov	%o0,%i5
/* 0x3efc	1886 */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x3f00	     */		sra	%i3,0,%o0
/* 0x3f04	     */		ldx	[%sp+2407],%o3
/* 0x3f08	     */		ld	[%sp+2271],%g1

! 1887		      !                                    }
! 1889		      !                                    if ( colour_method_flag == 1 ) {

/* 0x3f0c	1889 */		ld	[%sp+2291],%o4
/* 0x3f10	1886 */		sllx	%o0,2,%o5
/* 0x3f14	     */		st	%i5,[%o5+%o3]

! Registers live out of .L77002677: 
! g1 g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		                       
! predecessor blocks: .L77002675 .L77002677

			.L900000711:
/* 0x3f18	1889 */		cmp	%o4,1
/* 0x3f1c	     */		bne,pn	%icc,.L77002725
/* 0x3f20	1891 */		ld	[%sp+2299],%g5

! Registers live out of .L900000711: 
! g1 g2 g3 g5 o0 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 
		
! 1891		      !                                        if ( invert_me_dammit == 0 ) {

                       
! predecessor blocks: .L900000711

			.L77002681:
/* 0x3f24	1891 */		cmp	%g5,0
/* 0x3f28	     */		bne,pn	%icc,.L77002685
/* 0x3f2c	1892 */		ldd	[%l6-40],%f4

! Registers live out of .L77002681: 
! g1 g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! f2 f3 f4 f5 
		
! 1892		      !                                            t_param = pow( ( (double)mand_height 
! 1892		      >/ (double)mand_bail ), t_param_exponent);

                       
! predecessor blocks: .L77002681

			.L77002683:
/* 0x3f30	1892 */		st	%g1,[%fp+2023]
/* 0x3f34	     */		st	%i5,[%fp+2027]
/* 0x3f38	     */		ld	[%fp+2023],%f1
/* 0x3f3c	     */		ld	[%fp+2027],%f7
/* 0x3f40	     */		fmovs	%f4,%f0
/* 0x3f44	     */		fmovs	%f4,%f6
/* 0x3f48	     */		fsubd	%f0,%f4,%f32
/* 0x3f4c	     */		fsubd	%f6,%f4,%f34
/* 0x3f50	     */		fabsd	%f32,%f32
/* 0x3f54	     */		fabsd	%f34,%f34
/* 0x3f58	     */		fdivd	%f34,%f32,%f0
/* 0x3f5c	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x3f60	     */		ldd	[%l6+24],%f2
/* 0x3f64	     */		fmovd	%f0,%f46
/* 0x3f68	     */		ba	.L900000710
/* 0x3f6c	1897 */		fmovd	%f0,%f0

! Registers live out of .L77002683: 
! g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! f0 f1 f46 
		
! 1893		      !                                        } else {
! 1894		      !                                            t_param = pow( 1.0 - ( (double)mand_h
! 1894		      >eight / (double)mand_bail ), t_param_exponent);

                       
! predecessor blocks: .L77002681

			.L77002685:
/* 0x3f70	1894 */		st	%g1,[%fp+2023]
/* 0x3f74	     */		st	%i5,[%fp+2027]
/* 0x3f78	     */		fmovs	%f4,%f0
/* 0x3f7c	     */		fmovs	%f4,%f6
/* 0x3f80	     */		ld	[%fp+2023],%f1
/* 0x3f84	     */		ld	[%fp+2027],%f7
/* 0x3f88	     */		ldd	[%l6-48],%f36
/* 0x3f8c	     */		fsubd	%f0,%f4,%f32
/* 0x3f90	     */		fsubd	%f6,%f4,%f34
/* 0x3f94	     */		fabsd	%f34,%f34
/* 0x3f98	     */		fabsd	%f32,%f32
/* 0x3f9c	     */		fdivd	%f34,%f32,%f32
/* 0x3fa0	     */		fsubd	%f36,%f32,%f0
/* 0x3fa4	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x3fa8	     */		ldd	[%l6+24],%f2
/* 0x3fac	     */		fmovd	%f0,%f46

! Registers live out of .L77002685: 
! g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! f0 f1 f46 
		
! 1895		      !                                        }
! 1897		      !                                        gamma_factor = pow( t_param, gamma );

                       
! predecessor blocks: .L77002683 .L77002685

			.L900000710:
/* 0x3fb0	1897 */		ldd	[%l6+32],%f2
/* 0x3fb4	     */		call	pow	!params=  %f0 %f1 %f2 %f3	!result=  %f0 %f1
/* 0x3fb8	     */		std	%f46,[%fp+2039]

! 1899		      !                                        red_level  =  gamma_factor + ( hue * gamm
! 1899		      >a_factor * ( 1.0 - gamma_factor )
! 1900		      !                                                        * ( -0.14861 * cos( 2.0 *
! 1900		      > M_PI * ( shift/3.0 + rotation * t_param ) )
! 1901		      !                                                        + 1.78277 * sin( 2.0 * M_
! 1901		      >PI * ( shift/3.0 + rotation * t_param ))))/2.0;

/* 0x3fbc	1901 */		add	%sp,2415,%o1
/* 0x3fc0	     */		ldd	[%l6-48],%f34
/* 0x3fc4	     */		ldd	[%l6-8],%f32
/* 0x3fc8	     */		add	%sp,2423,%o2
/* 0x3fcc	     */		ldd	[%l6+24],%f36
/* 0x3fd0	     */		ldd	[%l6+40],%f38
/* 0x3fd4	     */		ldd	[%l6+48],%f42
/* 0x3fd8	     */		ldd	[%l6-24],%f40
/* 0x3fdc	     */		ldd	[%fp+2039],%f46
/* 0x3fe0	     */		std	%f0,[%fp+2023]
/* 0x3fe4	     */		fdivd	%f34,%f32,%f44
/* 0x3fe8	     */		fsubd	%f34,%f0,%f32
/* 0x3fec	     */		fmuld	%f0,%f36,%f34
/* 0x3ff0	     */		fmuld	%f40,%f38,%f36
/* 0x3ff4	     */		fmuld	%f34,%f32,%f48
/* 0x3ff8	     */		fmaddd	%f46,%f42,%f44,%f32
/* 0x3ffc	     */		fmuld	%f36,%f32,%f0
/* 0x4000	     */		call	__sincos	!params=  %o1 %o2 %f0 %f1	!result= 
/* 0x4004	     */		std	%f48,[%fp+2031]
/* 0x4008	     */		ldd	[%l6+56],%f32
/* 0x400c	     */		ldd	[%l6+64],%f34
/* 0x4010	     */		ldd	[%sp+2415],%f38

! 1903		      !                                        green_level = gamma_factor + ( hue * gamm
! 1903		      >a_factor * ( 1.0 - gamma_factor )
! 1904		      !                                                        * ( -0.29227 * cos( 2.0 *
! 1904		      > M_PI * ( shift/3.0 + rotation * t_param ) )
! 1905		      !                                                        - 0.90649 * sin( 2.0 * M_
! 1905		      >PI * ( shift/3.0 + rotation * t_param ))))/2.0;

/* 0x4014	1905 */		ldd	[%l6+88],%f36
/* 0x4018	     */		ldd	[%l6+80],%f40
/* 0x401c	1901 */		ldd	[%sp+2423],%f46

! 1907		      !                                        blue_level  = gamma_factor + ( hue * gamm
! 1907		      >a_factor * ( 1.0 - gamma_factor)
! 1908		      !                                                        * (1.97294 * cos( 2.0 * M
! 1908		      >_PI * (shift/3.0 + rotation * t_param ))))/2.0;

/* 0x4020	1908 */		ldd	[%l6+96],%f42
/* 0x4024	1901 */		ldd	[%fp+2031],%f48
/* 0x4028	     */		ldd	[%fp+2023],%f0
/* 0x402c	     */		fnegd	%f32,%f44
/* 0x4030	     */		ldd	[%l6+72],%f50

! 1910		      !                                        red_bits     = (uint8_t) ( 255.0 * ( red_
! 1910		      >level > 1.0 ? 1.0 :
! 1911		      !                                                                           ( red_
! 1911		      >level < 0.0 ? 0.0 : red_level ) ) );

/* 0x4034	1911 */		ldd	[%l6-48],%f52
/* 0x4038	1901 */		fmuld	%f38,%f34,%f32
/* 0x403c	1905 */		fmuld	%f38,%f36,%f34
/* 0x4040	     */		fnegd	%f40,%f36
/* 0x4044	1908 */		fmuld	%f46,%f42,%f38
/* 0x4048	1901 */		fmaddd	%f44,%f46,%f32,%f32
/* 0x404c	1905 */		fmsubd	%f36,%f46,%f34,%f34
/* 0x4050	1908 */		fmuld	%f48,%f38,%f36
/* 0x4054	1901 */		fmuld	%f48,%f32,%f38
/* 0x4058	1905 */		fmuld	%f48,%f34,%f34
/* 0x405c	1908 */		fmaddd	%f36,%f50,%f0,%f32
/* 0x4060	1901 */		fmaddd	%f38,%f50,%f0,%f36
/* 0x4064	1911 */		fcmped	%fcc3,%f36,%f52
/* 0x4068	     */		fbule,pn	%fcc3,.L77002691
/* 0x406c	1905 */		fmaddd	%f34,%f50,%f0,%f34

! Registers live out of .L900000710: 
! g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900000710

			.L77002689:
/* 0x4070	1911 */		fmovd	%f52,%f36
/* 0x4074	     */		ba	.L900000709
/* 0x4078	     */		ldd	[%l6+104],%f38

! Registers live out of .L77002689: 
! g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f38 f52 
		                       
! predecessor blocks: .L900000710

			.L77002691:
/* 0x407c	1911 */		fzero	%f38
/* 0x4080	     */		fcmped	%fcc0,%f36,%f38
/* 0x4084	     */		fmovdl	%fcc0,%f38,%f36
/* 0x4088	     */		ldd	[%l6+104],%f38

! Registers live out of .L77002691: 
! g2 g3 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f38 f52 
		                       
! predecessor blocks: .L77002689 .L77002691

			.L900000709:
/* 0x408c	1911 */		fmuld	%f36,%f38,%f36

! 1913		      !                                        green_bits   = (uint8_t) ( 255.0 * ( gree
! 1913		      >n_level > 1.0 ? 1.0 :
! 1914		      !                                                                           ( gree
! 1914		      >n_level < 0.0 ? 0.0 : green_level ) ) );

/* 0x4090	1914 */		fcmped	%fcc1,%f34,%f52
/* 0x4094	1911 */		fdtoi	%f36,%f8
/* 0x4098	     */		st	%f8,[%sp+2359]
/* 0x409c	     */		ldub	[%sp+2362],%o2
/* 0x40a0	1914 */		fbule,a,pn	%fcc1,.L900000708
/* 0x40a4	     */		fzero	%f36

! Registers live out of .L900000709: 
! g2 g3 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900000709

			.L77002701:
/* 0x40a8	1914 */		fmovd	%f52,%f34
/* 0x40ac	     */		ba	.L900000707
/* 0x40b0	     */		ldd	[%l6+104],%f36

! Registers live out of .L77002701: 
! g2 g3 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L900000709

			.L900000708:
/* 0x40b4	1914 */		fcmped	%fcc2,%f34,%f36
/* 0x40b8	     */		fmovdl	%fcc2,%f36,%f34
/* 0x40bc	     */		ldd	[%l6+104],%f36

! Registers live out of .L900000708: 
! g2 g3 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f36 f52 
		                       
! predecessor blocks: .L77002701 .L900000708

			.L900000707:
/* 0x40c0	1914 */		fmuld	%f34,%f36,%f34

! 1916		      !                                        blue_bits    = (uint8_t) ( 255.0 * ( blue
! 1916		      >_level > 1.0 ? 1.0 :
! 1917		      !                                                                           ( blue
! 1917		      >_level < 0.0 ? 0.0 : blue_level ) ) );

/* 0x40c4	1917 */		fcmped	%fcc3,%f32,%f52
/* 0x40c8	1914 */		fdtoi	%f34,%f8
/* 0x40cc	     */		st	%f8,[%sp+2367]
/* 0x40d0	     */		ldub	[%sp+2370],%o1
/* 0x40d4	1917 */		fbule,a,pn	%fcc3,.L900000706
/* 0x40d8	     */		fzero	%f34

! Registers live out of .L900000707: 
! g2 g3 o1 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 f52 
		                       
! predecessor blocks: .L900000707

			.L77002713:
/* 0x40dc	1917 */		fmovd	%f52,%f32
/* 0x40e0	     */		ba	.L900000705
/* 0x40e4	1920 */		ldd	[%l6+104],%f34

! Registers live out of .L77002713: 
! g2 g3 o1 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L900000707

			.L900000706:
/* 0x40e8	1917 */		fcmped	%fcc0,%f32,%f34
/* 0x40ec	     */		fmovdl	%fcc0,%f34,%f32

! 1920		      !                                        mandlebrot.pixel = (unsigned long)( ( red
! 1920		      >_bits<<16 ) + ( green_bits<<8 ) + blue_bits );

/* 0x40f0	1920 */		ldd	[%l6+104],%f34

! Registers live out of .L900000706: 
! g2 g3 o1 o2 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr y
! f32 f34 
		                       
! predecessor blocks: .L77002713 .L900000706

			.L900000705:
/* 0x40f4	1920 */		fmuld	%f32,%f34,%f32
/* 0x40f8	     */		sll	%o2,16,%g1
/* 0x40fc	     */		sll	%o1,8,%i0

! 1922		      !                                        XSetForeground(dsp, gc, mandlebrot.pixel)
! 1922		      >;

/* 0x4100	1922 */		ldx	[%sp+2703],%o1
/* 0x4104	     */		mov	%l7,%o0
/* 0x4108	1920 */		fdtoi	%f32,%f8
/* 0x410c	     */		st	%f8,[%sp+2375]
/* 0x4110	     */		ldub	[%sp+2378],%i5
/* 0x4114	     */		add	%i5,%g1,%g4
/* 0x4118	     */		add	%g4,%i0,%o4
/* 0x411c	     */		sra	%o4,0,%o2
/* 0x4120	1922 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4124	1920 */		stx	%o2,[%sp+3015]
/* 0x4128	1922 */		ba	.L900000704
/* 0x412c	1934 */		sra	%l2,0,%o4

! Registers live out of .L900000705: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1924		      !                                    } else {
! 1926		      !                                        if ( mand_height == mand_bail ) {

                       
! predecessor blocks: .L900000711

			.L77002725:
/* 0x4130	1926 */		cmp	%i5,%g1
/* 0x4134	     */		bne,pn	%icc,.L77002729
/* 0x4138	1927 */		ldx	[%sp+2703],%o1

! Registers live out of .L77002725: 
! g2 g3 o0 o1 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 i5 fp gsr 
! 
		
! 1927		      !                                            XSetForeground(dsp, gc, (unsigned lon
! 1927		      >g)0 );

                       
! predecessor blocks: .L77002725

			.L77002727:
/* 0x413c	1927 */		mov	0,%o2
/* 0x4140	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4144	     */		mov	%l7,%o0
/* 0x4148	     */		ba	.L900000704
/* 0x414c	1934 */		sra	%l2,0,%o4

! Registers live out of .L77002727: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1928		      !                                        } else {
! 1929		      !                                            mandlebrot.pixel = lsd_trippy[ (uint8
! 1929		      >_t)(mand_height & 0xff) ];

                       
! predecessor blocks: .L77002725

			.L77002729:
/* 0x4150	1929 */		sethi	%hi(0x1400),%g5
/* 0x4154	     */		and	%i5,255,%o5
/* 0x4158	     */		add	%g5,71,%g5
/* 0x415c	     */		sllx	%o5,3,%o0
/* 0x4160	     */		add	%g5,%sp,%g5
/* 0x4164	     */		ldx	[%o0+%g5],%o2
/* 0x4168	     */		stx	%o2,[%sp+3015]

! 1930		      !                                            XSetForeground(dsp, gc, mandlebrot.pi
! 1930		      >xel);

/* 0x416c	1930 */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4170	     */		mov	%l7,%o0

! 1931		      !                                        }
! 1932		      !                                    }
! 1934		      !                                    XDrawPoint(dsp, win, gc, vbox_ll_x + offset_x
! 1934		      >, ( eff_height - vbox_ll_y + offset_y ) );

/* 0x4174	1934 */		sra	%l2,0,%o4

! Registers live out of .L77002729: 
! g2 g3 o0 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002727 .L77002729 .L900000705

			.L900000704:
/* 0x4178	1934 */		sra	%l3,0,%o3
/* 0x417c	1853 */		add	%l5,1,%l5
/* 0x4180	1934 */		ldx	[%sp+2703],%o2
/* 0x4184	     */		ldx	[%sp+2711],%o1
/* 0x4188	     */		call	XDrawPoint	!params=  %o0 %o1 %o2 %o3 %o4	!result= 
/* 0x418c	     */		mov	%l7,%o0
/* 0x4190	1853 */		add	%l3,1,%l3
/* 0x4194	     */		cmp	%l5,63
/* 0x4198	     */		ble,pt	%icc,.L900000703
/* 0x419c	1857 */		sra	%l4,0,%o3

! Registers live out of .L900000704: 
! g2 g3 o3 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000704

			.L77002737:
/* 0x41a0	1850 */		add	%l4,1,%l4
/* 0x41a4	     */		add	%l2,-1,%l2
/* 0x41a8	     */		cmp	%l4,63
/* 0x41ac	     */		ble,pt	%icc,.L900000702
/* 0x41b0	1853 */		mov	0,%l5

! Registers live out of .L77002737: 
! g2 g3 o4 sp l2 l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		
! 1936		      !                                }
! 1937		      !                            }
! 1938		      !                            vbox_flag[vbox_r][vbox_j] = 1;

                       
! predecessor blocks: .L77002737

			.L77002741:
/* 0x41b4	1938 */		ld	[%sp+2287],%o3

! 1939		      !                            clock_gettime(CLOCK_REALTIME, &vbox_t1 );

/* 0x41b8	1939 */		add	%sp,2623,%o1
/* 0x41bc	     */		mov	3,%o0
/* 0x41c0	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x41c4	1938 */		st	%o3,[%i1]

! 1940		      !                            t_delta = timediff( vbox_t0, vbox_t1);

/* 0x41c8	1940 */		ldx	[%sp+2607],%o0
/* 0x41cc	     */		ldx	[%sp+2615],%o1

! 1941		      !                            sprintf(buf,"[vbox] = %14" PRIu64 " nsec   %08.6e sec
! 1941		      >", t_delta, ((double)t_delta)/1.0e9);

/* 0x41d0	1941 */		sethi	%gdop_hix22(.L651),%l5
/* 0x41d4	1940 */		ldx	[%sp+2623],%o2
/* 0x41d8	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x41dc	     */		ldx	[%sp+2631],%o3
/* 0x41e0	1941 */		xor	%l5,%gdop_lox10(.L651),%o7
/* 0x41e4	     */		stx	%o0,[%fp+2023]
/* 0x41e8	     */		ldd	[%l6-40],%f4
/* 0x41ec	     */		ldd	[%fp+2023],%f0
/* 0x41f0	     */		ldd	[%l6-32],%f36
/* 0x41f4	     */		ldd	[%l6],%f40
/* 0x41f8	     */		ldx	[%sp+2399],%g4
/* 0x41fc	1940 */		mov	%o0,%o2
/* 0x4200	1941 */		ldx	[%sp+2647],%o0
/* 0x4204	     */		fmovs	%f4,%f2
/* 0x4208	     */		fmovs	%f4,%f6
/* 0x420c	     */		fmovs	%f1,%f3
/* 0x4210	     */		fmovs	%f0,%f7
/* 0x4214	     */		ldx	[%g4+%o7],%o1,%gdop(.L651)
/* 0x4218	     */		fsubd	%f2,%f4,%f32
/* 0x421c	     */		fsubd	%f6,%f4,%f34
/* 0x4220	     */		fabsd	%f32,%f38
/* 0x4224	     */		fabsd	%f34,%f32
/* 0x4228	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x422c	     */		fdivd	%f32,%f40,%f32
/* 0x4230	     */		std	%f32,[%sp+2943]
/* 0x4234	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4238	     */		ldx	[%sp+2943],%o3

! 1942		      !                            XSetForeground(dsp, gc3, yellow.pixel);

/* 0x423c	1942 */		ldx	[%sp+2527],%o2
/* 0x4240	     */		ldx	[%sp+2695],%o1
/* 0x4244	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x4248	     */		mov	%l7,%o0

! 1943		      !                            XDrawImageString( dsp, win3, gc3, 10, 310, buf, (int)
! 1943		      >strlen(buf));

/* 0x424c	1943 */		ldx	[%sp+2647],%l4
/* 0x4250	     */		ldub	[%l4],%o4

! Registers live out of .L77002741: 
! g2 g3 o0 o4 sp l2 l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002741 .L900000215

			.L900000701:
/* 0x4254	1943 */		brz,pn	%o4,.L900000216
/* 0x4258	     */		add	%l4,1,%l4

! Registers live out of .L900000701: 
! g2 g3 o0 sp l2 l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000701

			.L900000215:
/* 0x425c	1943 */		ldub	[%l4],%o4
/* 0x4260	     */		add	%l4,1,%l4
/* 0x4264	     */		brnz,a,pt	%o4,.L900000701
/* 0x4268	     */		ldub	[%l4],%o4

! Registers live out of .L900000215: 
! g2 g3 o0 o4 sp l2 l4 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000215 .L900000701

			.L900000216:
/* 0x426c	1943 */		ldx	[%sp+2647],%o5
/* 0x4270	     */		sub	%l4,1,%i5
/* 0x4274	     */		mov	310,%o4
/* 0x4278	     */		ldx	[%sp+2719],%o1
/* 0x427c	     */		mov	10,%o3
/* 0x4280	     */		sub	%i5,%o5,%g5
/* 0x4284	     */		sra	%g5,0,%o2
/* 0x4288	     */		stx	%o2,[%sp+2223]
/* 0x428c	     */		ldx	[%sp+2695],%o2
/* 0x4290	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x4294	     */		mov	%l7,%o0

! Registers live out of .L900000216: 
! g2 g3 sp l2 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000216 .L900000700

			.L77002743:
/* 0x4298	1844 */		ld	[%sp+2343],%g1
/* 0x429c	     */		add	%i3,1,%i3
/* 0x42a0	     */		add	%i1,64,%i1
/* 0x42a4	     */		cmp	%i3,15
/* 0x42a8	     */		add	%g1,64,%o0
/* 0x42ac	     */		st	%o0,[%sp+2343]
/* 0x42b0	     */		ble,a,pt	%icc,.L900000700
/* 0x42b4	1848 */		ld	[%i1],%l2

! Registers live out of .L77002743: 
! g2 g3 o0 sp l2 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002743

			.L77002747:
/* 0x42b8	1843 */		ldx	[%sp+2799],%i3
/* 0x42bc	     */		ld	[%sp+2339],%o7
/* 0x42c0	     */		add	%i4,1,%i4
/* 0x42c4	     */		cmp	%i4,15
/* 0x42c8	     */		add	%i3,4,%o2
/* 0x42cc	     */		add	%o7,-64,%l4
/* 0x42d0	     */		stx	%o2,[%sp+2799]
/* 0x42d4	     */		ble,pn	%icc,.L77002659
/* 0x42d8	     */		st	%l4,[%sp+2339]

! Registers live out of .L77002747: 
! g2 g3 o0 sp l6 l7 i2 i4 fp gsr 
! 
		
! 1944		      !                        }
! 1945		      !                    } /* vbox_r for */
! 1946		      !                } /* vbox_j for */
! 1948		      !                /* reset the mand_bail adjustment parameters */
! 1949		      !                bail_out_factor = 1.0;

                       
! predecessor blocks: .L77002747

			.L77002751:
/* 0x42dc	1949 */		ldd	[%l6-48],%f0

! 1950		      !                bail_out_jank = 10;

/* 0x42e0	1950 */		mov	10,%i3
/* 0x42e4	     */		stb	%i3,[%sp+2264]

! Registers live out of .L77002751: 
! g2 g3 o0 sp l6 l7 i2 fp gsr 
! f0 f1 
		
! 1951		      !            } /* inside main plot area check */
! 1953		      !            XSetForeground(dsp, gc, yellow.pixel);

                       
! predecessor blocks: .L77002635 .L77002637 .L77002639 .L77002641 .L77002751

			.L77002753:
/* 0x42e8	1953 */		ldx	[%sp+2527],%o2

! 1954		      !            clock_gettime(CLOCK_REALTIME, &soln_t1 );
! 1955		      !            t_delta = timediff( soln_t0, soln_t1 );
! 1956		      !            sprintf(buf,"[mand] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((do
! 1956		      >uble)t_delta)/1.0e9);
! 1957		      !            fprintf(stderr,"%s\n\n",buf);

/* 0x42ec	1957 */		sethi	%gdop_hix22(__iob),%i1
/* 0x42f0	1953 */		ldx	[%sp+2703],%o1
/* 0x42f4	     */		std	%f0,[%sp+2775]
/* 0x42f8	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x42fc	     */		mov	%l7,%o0
/* 0x4300	1957 */		xor	%i1,%gdop_lox10(__iob),%l2
/* 0x4304	1954 */		add	%sp,2495,%o1
/* 0x4308	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x430c	     */		mov	3,%o0
/* 0x4310	1955 */		ldx	[%sp+2463],%o0
/* 0x4314	     */		ldx	[%sp+2471],%o1
/* 0x4318	     */		ldx	[%sp+2495],%o2
/* 0x431c	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4320	     */		ldx	[%sp+2503],%o3
/* 0x4324	1956 */		stx	%o0,[%fp+2023]
/* 0x4328	   0 */		sethi	%gdop_hix22(.L654),%g4
/* 0x432c	1956 */		ldd	[%l6-40],%f4
/* 0x4330	     */		ldd	[%fp+2023],%f0
/* 0x4334	   0 */		xor	%g4,%gdop_lox10(.L654),%o4
/* 0x4338	1956 */		ldd	[%l6-32],%f36
/* 0x433c	     */		ldd	[%l6],%f40
/* 0x4340	   0 */		ldx	[%sp+2399],%i0
/* 0x4344	1955 */		mov	%o0,%o2
/* 0x4348	1956 */		ldx	[%sp+2647],%o0
/* 0x434c	     */		fmovs	%f4,%f2
/* 0x4350	     */		fmovs	%f1,%f3
/* 0x4354	     */		fmovs	%f4,%f6
/* 0x4358	     */		fmovs	%f0,%f7
/* 0x435c	   0 */		ldx	[%i0+%o4],%i3,%gdop(.L654)
/* 0x4360	1956 */		fsubd	%f2,%f4,%f32
/* 0x4364	     */		fsubd	%f6,%f4,%f34
/* 0x4368	     */		mov	%i3,%o1
/* 0x436c	     */		fabsd	%f32,%f38
/* 0x4370	     */		fabsd	%f34,%f32
/* 0x4374	     */		fmaddd	%f32,%f36,%f38,%f32
/* 0x4378	     */		fdivd	%f32,%f40,%f32
/* 0x437c	     */		std	%f32,[%sp+2967]
/* 0x4380	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4384	     */		ldx	[%sp+2967],%o3
/* 0x4388	1957 */		ldx	[%i0+%l2],%l3,%gdop(__iob)
/* 0x438c	     */		ldx	[%sp+2647],%o2
/* 0x4390	     */		add	%i3,34,%o1
/* 0x4394	     */		call	fprintf	!params=  %o0 %o1 %o2	!result= 
/* 0x4398	     */		add	%l3,256,%o0

! 1958		      !            XSetForeground(dsp, gc2, red.pixel);

/* 0x439c	1958 */		ldx	[%sp+2479],%o2
/* 0x43a0	     */		ldx	[%sp+2679],%o1
/* 0x43a4	     */		call	XSetForeground	!params=  %o0 %o1 %o2	!result= 
/* 0x43a8	     */		mov	%l7,%o0

! 1959		      !            XDrawImageString( dsp, win2, gc2, 10, 310, buf, (int)strlen(buf));

/* 0x43ac	1959 */		ldx	[%sp+2647],%o2
/* 0x43b0	     */		ldub	[%o2],%g1

! Registers live out of .L77002753: 
! g1 g2 g3 o0 o2 sp l6 l7 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77002753 .L900000211

			.L900000699:
/* 0x43b4	1959 */		brz,pn	%g1,.L900000212
/* 0x43b8	     */		add	%o2,1,%o2

! Registers live out of .L900000699: 
! g1 g2 g3 o0 o2 sp l6 l7 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000699

			.L900000211:
/* 0x43bc	1959 */		ldub	[%o2],%o0
/* 0x43c0	     */		add	%o2,1,%o2
/* 0x43c4	     */		brnz,a,pt	%o0,.L900000699
/* 0x43c8	     */		ldub	[%o2],%g1

! Registers live out of .L900000211: 
! g1 g2 g3 o0 o2 sp l6 l7 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L900000211 .L900000699

			.L900000212:
/* 0x43cc	1959 */		sub	%o2,1,%g1
/* 0x43d0	     */		mov	310,%o4
/* 0x43d4	     */		ldx	[%sp+2647],%o5
/* 0x43d8	     */		ldx	[%sp+2679],%o2
/* 0x43dc	     */		mov	10,%o3
/* 0x43e0	     */		ldx	[%sp+2687],%o1
/* 0x43e4	     */		sub	%g1,%o5,%i4
/* 0x43e8	     */		sra	%i4,0,%g4
/* 0x43ec	     */		stx	%g4,[%sp+2223]
/* 0x43f0	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x43f4	     */		mov	%l7,%o0

! 1961		      !            printf("\nraw data values -------------------------------------------
! 1961		      >------------\n");

/* 0x43f8	1961 */		call	printf	!params=  %o0	!result= 
/* 0x43fc	     */		add	%i3,40,%o0

! 1963		      !            printf("     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1963		      >fset(0,0,0,0)));

/* 0x4400	1963 */		mov	0,%o3
/* 0x4404	     */		mov	0,%o2
/* 0x4408	     */		mov	0,%o1
/* 0x440c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4410	     */		mov	0,%o0
/* 0x4414	     */		sllx	%o0,3,%l3
/* 0x4418	     */		add	%i3,120,%o0
/* 0x441c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4420	     */		ldx	[%l3+%i2],%o1

! 1964		      !            printf("     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1964		      >fset(0,0,0,0)));

/* 0x4424	1964 */		mov	0,%o3
/* 0x4428	     */		mov	0,%o2
/* 0x442c	     */		mov	0,%o0
/* 0x4430	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4434	     */		mov	0,%o1
/* 0x4438	     */		ldx	[%sp+2639],%l3
/* 0x443c	     */		sllx	%o0,3,%o1
/* 0x4440	     */		add	%i3,160,%o0
/* 0x4444	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4448	     */		ldx	[%o1+%l3],%o1

! 1965		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1965		      >fset(0,0,0,0)));

/* 0x444c	1965 */		mov	0,%o3
/* 0x4450	     */		mov	0,%o2
/* 0x4454	     */		mov	0,%o0
/* 0x4458	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x445c	     */		mov	0,%o1
/* 0x4460	     */		sllx	%o0,2,%l2
/* 0x4464	     */		ldx	[%sp+2407],%i1
/* 0x4468	     */		add	%i3,200,%o0
/* 0x446c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4470	     */		ld	[%l2+%i1],%o1

! 1967		      !            printf("     : r[ 7][ 7][63][63] = %-+32.26e\n", *(coord_r + array_of
! 1967		      >fset(7,7,63,63)));

/* 0x4474	1967 */		mov	63,%o3
/* 0x4478	     */		mov	63,%o2
/* 0x447c	     */		mov	7,%o0
/* 0x4480	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4484	     */		mov	7,%o1
/* 0x4488	     */		sllx	%o0,3,%o3
/* 0x448c	     */		add	%i3,232,%o0
/* 0x4490	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4494	     */		ldx	[%o3+%i2],%o1

! 1968		      !            printf("     : j[ 7][ 7][63][63] = %-+32.26e\n", *(coord_j + array_of
! 1968		      >fset(7,7,63,63)));

/* 0x4498	1968 */		mov	63,%o3
/* 0x449c	     */		mov	63,%o2
/* 0x44a0	     */		mov	7,%o0
/* 0x44a4	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x44a8	     */		mov	7,%o1
/* 0x44ac	     */		sllx	%o0,3,%o7
/* 0x44b0	     */		ldx	[%o7+%l3],%o1
/* 0x44b4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x44b8	     */		add	%i3,272,%o0

! 1969		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1969		      >fset(7,7,63,63)));

/* 0x44bc	1969 */		mov	63,%o3
/* 0x44c0	     */		mov	63,%o2
/* 0x44c4	     */		mov	7,%o0
/* 0x44c8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x44cc	     */		mov	7,%o1
/* 0x44d0	     */		sllx	%o0,2,%l5
/* 0x44d4	     */		add	%i3,200,%o0
/* 0x44d8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x44dc	     */		ld	[%l5+%i1],%o1

! 1971		      !            printf("     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1971		      >fset(8,8,0,0)));

/* 0x44e0	1971 */		mov	0,%o3
/* 0x44e4	     */		mov	0,%o2
/* 0x44e8	     */		mov	8,%o0
/* 0x44ec	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x44f0	     */		mov	8,%o1
/* 0x44f4	     */		sllx	%o0,3,%l4
/* 0x44f8	     */		add	%i3,312,%o0
/* 0x44fc	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4500	     */		ldx	[%l4+%i2],%o1

! 1972		      !            printf("     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1972		      >fset(8,8,0,0)));

/* 0x4504	1972 */		mov	0,%o3
/* 0x4508	     */		mov	0,%o2
/* 0x450c	     */		mov	8,%o0
/* 0x4510	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4514	     */		mov	8,%o1
/* 0x4518	     */		sllx	%o0,3,%i0
/* 0x451c	     */		add	%i3,352,%o0
/* 0x4520	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4524	     */		ldx	[%i0+%l3],%o1

! 1973		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1973		      >fset(8,8,0,0)));

/* 0x4528	1973 */		mov	0,%o3
/* 0x452c	     */		mov	0,%o2
/* 0x4530	     */		mov	8,%o0
/* 0x4534	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4538	     */		mov	8,%o1
/* 0x453c	     */		sllx	%o0,2,%o5
/* 0x4540	     */		add	%i3,200,%o0
/* 0x4544	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4548	     */		ld	[%o5+%i1],%o1

! 1975		      !            printf("     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n", *(coord_r + array_of
! 1975		      >fset(8,8,1,0)));

/* 0x454c	1975 */		mov	0,%o3
/* 0x4550	     */		mov	1,%o2
/* 0x4554	     */		mov	8,%o0
/* 0x4558	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x455c	     */		mov	8,%o1
/* 0x4560	     */		sllx	%o0,3,%i5
/* 0x4564	     */		add	%i3,392,%o0
/* 0x4568	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x456c	     */		ldx	[%i5+%i2],%o1

! 1976		      !            printf("     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n", *(coord_j + array_of
! 1976		      >fset(8,8,1,0)));

/* 0x4570	1976 */		mov	0,%o3
/* 0x4574	     */		mov	1,%o2
/* 0x4578	     */		mov	8,%o0
/* 0x457c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4580	     */		mov	8,%o1
/* 0x4584	     */		sllx	%o0,3,%g5
/* 0x4588	     */		add	%i3,432,%o0
/* 0x458c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4590	     */		ldx	[%g5+%l3],%o1

! 1977		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1977		      >fset(8,8,1,0)));

/* 0x4594	1977 */		mov	0,%o3
/* 0x4598	     */		mov	1,%o2
/* 0x459c	     */		mov	8,%o0
/* 0x45a0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x45a4	     */		mov	8,%o1
/* 0x45a8	     */		sllx	%o0,2,%o2
/* 0x45ac	     */		add	%i3,200,%o0
/* 0x45b0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x45b4	     */		ld	[%o2+%i1],%o1

! 1979		      !            printf("     : r[ 8][ 8][32][32] = %-+32.26e\n", *(coord_r + array_of
! 1979		      >fset(8,8,32,32)));

/* 0x45b8	1979 */		mov	32,%o3
/* 0x45bc	     */		mov	32,%o2
/* 0x45c0	     */		mov	8,%o0
/* 0x45c4	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x45c8	     */		mov	8,%o1
/* 0x45cc	     */		sllx	%o0,3,%o4
/* 0x45d0	     */		add	%i3,472,%o0
/* 0x45d4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x45d8	     */		ldx	[%o4+%i2],%o1

! 1980		      !            printf("     : j[ 8][ 8][32][32] = %-+32.26e\n", *(coord_j + array_of
! 1980		      >fset(8,8,32,32)));

/* 0x45dc	1980 */		mov	32,%o3
/* 0x45e0	     */		mov	32,%o2
/* 0x45e4	     */		mov	8,%o0
/* 0x45e8	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x45ec	     */		mov	8,%o1
/* 0x45f0	     */		sllx	%o0,3,%g1
/* 0x45f4	     */		add	%i3,512,%o0
/* 0x45f8	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x45fc	     */		ldx	[%g1+%l3],%o1

! 1981		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1981		      >fset(8,8,32,32)));

/* 0x4600	1981 */		mov	32,%o3
/* 0x4604	     */		mov	32,%o2
/* 0x4608	     */		mov	8,%o0
/* 0x460c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4610	     */		mov	8,%o1
/* 0x4614	     */		sllx	%o0,2,%i4
/* 0x4618	     */		add	%i3,200,%o0
/* 0x461c	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4620	     */		ld	[%i4+%i1],%o1

! 1983		      !            printf("     : r[ 3][12][44][21] = %-+32.26e\n", *(coord_r + array_of
! 1983		      >fset(3,12,44,21)));

/* 0x4624	1983 */		mov	21,%o3
/* 0x4628	     */		mov	44,%o2
/* 0x462c	     */		mov	3,%o0
/* 0x4630	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4634	     */		mov	12,%o1
/* 0x4638	     */		sllx	%o0,3,%g4
/* 0x463c	     */		add	%i3,552,%o0
/* 0x4640	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4644	     */		ldx	[%g4+%i2],%o1

! 1984		      !            printf("     : j[ 3][12][44][21] = %-+32.26e\n", *(coord_j + array_of
! 1984		      >fset(3,12,44,21)));

/* 0x4648	1984 */		mov	21,%o3
/* 0x464c	     */		mov	44,%o2
/* 0x4650	     */		mov	3,%o0
/* 0x4654	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x4658	     */		mov	12,%o1
/* 0x465c	     */		sllx	%o0,3,%o1
/* 0x4660	     */		add	%i3,592,%o0
/* 0x4664	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x4668	     */		ldx	[%o1+%l3],%o1

! 1985		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1985		      >fset(3,12,44,21)));

/* 0x466c	1985 */		mov	21,%o3
/* 0x4670	     */		mov	44,%o2
/* 0x4674	     */		mov	3,%o0
/* 0x4678	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x467c	     */		mov	12,%o1
/* 0x4680	     */		sllx	%o0,2,%l2
/* 0x4684	     */		add	%i3,200,%o0
/* 0x4688	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x468c	     */		ld	[%l2+%i1],%o1

! 1987		      !            printf("     : r[15][15][63][63] = %-+32.26e\n", *(coord_r + array_of
! 1987		      >fset(15,15,63,63)));

/* 0x4690	1987 */		mov	63,%o3
/* 0x4694	     */		mov	63,%o2
/* 0x4698	     */		mov	15,%o0
/* 0x469c	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x46a0	     */		mov	15,%o1
/* 0x46a4	     */		sllx	%o0,3,%o3
/* 0x46a8	     */		add	%i3,632,%o0
/* 0x46ac	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x46b0	     */		ldx	[%o3+%i2],%o1

! 1988		      !            printf("     : j[15][15][63][63] = %-+32.26e\n", *(coord_j + array_of
! 1988		      >fset(15,15,63,63)));

/* 0x46b4	1988 */		mov	63,%o3
/* 0x46b8	     */		mov	63,%o2
/* 0x46bc	     */		mov	15,%o0
/* 0x46c0	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x46c4	     */		mov	15,%o1
/* 0x46c8	     */		sllx	%o0,3,%o7
/* 0x46cc	     */		ldx	[%o7+%l3],%o1
/* 0x46d0	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x46d4	     */		add	%i3,672,%o0

! 1989		      !            printf("     :       mand_height = %9i\n",    *(mandel_val + array_of
! 1989		      >fset(15,15,63,63)));

/* 0x46d8	1989 */		mov	63,%o3
/* 0x46dc	     */		mov	63,%o2
/* 0x46e0	     */		mov	15,%o0
/* 0x46e4	     */		call	array_offset	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x46e8	     */		mov	15,%o1
/* 0x46ec	     */		sllx	%o0,2,%l3
/* 0x46f0	     */		add	%i3,200,%o0
/* 0x46f4	     */		call	printf	!params=  %o0 %o1	!result= 
/* 0x46f8	     */		ld	[%l3+%i1],%o1

! 1991		      !            printf("--------------------------- full plot done ------------------
! 1991		      >-----------\n");

/* 0x46fc	1991 */		call	printf	!params=  %o0	!result= 
/* 0x4700	     */		add	%i3,712,%o0
/* 0x4704	     */		ldd	[%sp+2775],%f0
/* 0x4708	     */		ba	.L900000698
/* 0x470c	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L900000212: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002631

			.L900000719:
/* 0x4710	   0 */		ldx	[%sp+2399],%o1
/* 0x4714	   0 */		xor	%i5,%gdop_lox10(.L677),%i0

! 1993		      !        } else if ( button == Button3 ) {

/* 0x4718	1993 */		cmp	%o2,3
/* 0x471c	   0 */		ldx	[%o1+%i0],%i4,%gdop(.L677)
/* 0x4720	1993 */		be,pn	%icc,.L77002757
/* 0x4724	1042 */		add	%l4,-1,%o0

! Registers live out of .L900000719: 
! g2 g3 o0 o2 sp l4 l5 l6 l7 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000719

			.L77002763:
/* 0x4728	1043 */		add	%i1,-2,%o1
/* 0x472c	     */		st	%o1,[%sp+2311]

! 1995		      !            printf("right click\n");
! 1996		      !            clock_gettime(CLOCK_REALTIME, &t1 );
! 1997		      !            t_delta = timediff( t0, t1 );
! 1999		      !            sprintf(buf,"[%04i] tdelta = %14" PRIu64 " nsec", right_count, t_delt
! 1999		      >a);
! 2001		      !            XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));
! 2003		      !            t0.tv_sec = t1.tv_sec;
! 2004		      !            t0.tv_nsec = t1.tv_nsec;
! 2005		      !            /* If a 200ms right double click anywhere then quit */
! 2006		      !            if ( t_delta < 200000000 ) {
! 2007		      !                printf("\n\n");
! 2008		      !                /* If we allocate memory for any purpose whatsoever
! 2009		      !                 * then we had better free() it. */
! 2010		      !                break;
! 2011		      !            }
! 2013		      !        } else if ( button == Button4 ) {

/* 0x4730	2013 */		cmp	%o2,4
/* 0x4734	     */		bne,pn	%icc,.L77002767
/* 0x4738	1042 */		st	%o0,[%sp+2307]

! Registers live out of .L77002763: 
! g2 g3 o0 o2 sp l5 l6 l7 i2 i4 i5 fp gsr 
! 
		
! 2015		      !            /* TODO note that a mouse wheel event being used here to
! 2016		      !             * track observation plane position will result in all
! 2017		      !             * data being redrawn. */
! 2018		      !            printf("roll up\n");

                       
! predecessor blocks: .L77002763

			.L77002765:
/* 0x473c	2018 */		call	printf	!params=  %o0	!result= 
/* 0x4740	     */		add	%i4,32,%o0
/* 0x4744	     */		ldd	[%sp+2775],%f0
/* 0x4748	     */		ba	.L900000698
/* 0x474c	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L77002765: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		
! 2020		      !        } else if ( button == Button5 ) {

                       
! predecessor blocks: .L77002763

			.L77002767:
/* 0x4750	2020 */		cmp	%o2,5
/* 0x4754	     */		bne,pn	%icc,.L77002771
/* 0x4758	     */		nop

! Registers live out of .L77002767: 
! g2 g3 o0 sp l5 l6 l7 i2 i4 i5 fp gsr 
! 
		
! 2022		      !            printf("roll down\n");

                       
! predecessor blocks: .L77002767

			.L77002769:
/* 0x475c	2022 */		call	printf	!params=  %o0	!result= 
/* 0x4760	     */		add	%i4,44,%o0
/* 0x4764	     */		ldd	[%sp+2775],%f0
/* 0x4768	     */		ba	.L900000698
/* 0x476c	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L77002769: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		
! 2024		      !        } else {
! 2026		      !            printf("\n ??? unknown button ???\n");

                       
! predecessor blocks: .L77002767

			.L77002771:
/* 0x4770	2026 */		call	printf	!params=  %o0	!result= 
/* 0x4774	     */		add	%i4,56,%o0
/* 0x4778	     */		ldd	[%sp+2775],%f0
/* 0x477c	     */		ba	.L900000698
/* 0x4780	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L77002771: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L900000719

			.L77002757:
/* 0x4784	1995 */		call	printf	!params=  %o0	!result= 
/* 0x4788	     */		add	%i4,-16,%o0
/* 0x478c	1996 */		add	%sp,2543,%o1
/* 0x4790	     */		call	clock_gettime	!params=  %o0 %o1	!result= 
/* 0x4794	     */		mov	3,%o0
/* 0x4798	1997 */		ldx	[%sp+2543],%o2
/* 0x479c	     */		ldx	[%sp+2575],%o0
/* 0x47a0	     */		ldx	[%sp+2583],%o1
/* 0x47a4	     */		call	timediff	!params=  %o0 %o1 %o2 %o3	!result=  %o0
/* 0x47a8	     */		ldx	[%sp+2551],%o3
/* 0x47ac	1999 */		ldsw	[%sp+2283],%o2
/* 0x47b0	1997 */		mov	%o0,%i3
/* 0x47b4	1999 */		ldx	[%sp+2647],%o0
/* 0x47b8	     */		mov	%i4,%o1
/* 0x47bc	     */		call	sprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x47c0	     */		mov	%i3,%o3
/* 0x47c4	2001 */		ldx	[%sp+2647],%g1
/* 0x47c8	     */		ldub	[%g1],%l5

! Registers live out of .L77002757: 
! g1 g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002757 .L900000207

			.L900000697:
/* 0x47cc	2001 */		brz,pn	%l5,.L900000208
/* 0x47d0	     */		add	%g1,1,%g1

! Registers live out of .L900000697: 
! g1 g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000697

			.L900000207:
/* 0x47d4	2001 */		ldub	[%g1],%o2
/* 0x47d8	     */		add	%g1,1,%g1
/* 0x47dc	     */		brnz,a,pt	%o2,.L900000697
/* 0x47e0	     */		ldub	[%g1],%l5

! Registers live out of .L900000207: 
! g1 g2 g3 o0 sp l4 l5 l6 l7 i1 i2 i3 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000207 .L900000697

			.L900000208:
/* 0x47e4	2001 */		ldx	[%sp+2647],%o5
/* 0x47e8	     */		sub	%g1,1,%l5
/* 0x47ec	     */		ldx	[%sp+2719],%o1
/* 0x47f0	     */		mov	20,%o4
/* 0x47f4	     */		ldx	[%sp+2695],%o2
/* 0x47f8	     */		mov	10,%o3
/* 0x47fc	     */		sub	%l5,%o5,%i0
/* 0x4800	     */		sra	%i0,0,%i5
/* 0x4804	     */		stx	%i5,[%sp+2223]
/* 0x4808	     */		call	XDrawImageString	!params=  %o0 %o1 %o2 %o3 %o4 %o5 %sp %sp+2223	!result= 
/* 0x480c	     */		mov	%l7,%o0
/* 0x4810	2003 */		ldx	[%sp+2543],%o5
/* 0x4814	2006 */		sethi	%hi(0xbebc000),%o1
/* 0x4818	2003 */		stx	%o5,[%sp+2575]
/* 0x481c	2004 */		ldx	[%sp+2551],%g5
/* 0x4820	2006 */		add	%o1,512,%o5
/* 0x4824	     */		cmp	%i3,%o5
/* 0x4828	     */		bcs,pn	%xcc,.L77002976
/* 0x482c	2004 */		stx	%g5,[%sp+2583]

! Registers live out of .L900000208: 
! g2 g3 o0 sp l4 l5 l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000208

			.L77003414:
/* 0x4830	1043 */		add	%i1,-2,%i1
/* 0x4834	2006 */		ldd	[%sp+2775],%f0
/* 0x4838	1043 */		st	%i1,[%sp+2311]
/* 0x483c	1042 */		add	%l4,-1,%i4
/* 0x4840	     */		st	%i4,[%sp+2307]

! Registers live out of .L77003414: 
! g2 g3 o0 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		
! 2028		      !        }
! 2030		      !        printf("click at %d %d \n", mouse_x, mouse_y);

                       
! predecessor blocks: .L77002387 .L77002389 .L77002407 .L77002429 .L77002437 .L77002439 .L77002469 .L77002471 .L77002473 .L77002475
! predecessor blocks: .L77002477 .L77003183 .L77003414 .L900000733 .L900000739

			.L77002781:
/* 0x4844	2030 */		sethi	%gdop_hix22(.L691),%o5

! Registers live out of .L77002781: 
! g2 g3 o0 o5 sp l5 l6 l7 i2 i5 fp gsr 
! f0 f1 
		                       
! predecessor blocks: .L77002765 .L77002769 .L77002771 .L77002781 .L900000212 .L900000248 .L900000252 .L900000260 .L900000268 .L900000272
! predecessor blocks: .L900000276 .L900000280 .L900000284 .L900000789

			.L900000698:
/* 0x4848	2030 */		ldx	[%sp+2399],%i4
/* 0x484c	     */		ldsw	[%sp+2307],%o1
/* 0x4850	     */		ldsw	[%sp+2311],%o2
/* 0x4854	     */		xor	%o5,%gdop_lox10(.L691),%g5
/* 0x4858	     */		std	%f0,[%sp+2775]
/* 0x485c	     */		call	printf	!params=  %o0 %o1 %o2	!result= 
/* 0x4860	     */		ldx	[%i4+%g5],%o0,%gdop(.L691)
/* 0x4864	     */		ba	.L900000696
/* 0x4868	 988 */		nop

! Registers live out of .L900000698: 
! g2 g3 o0 sp l5 l6 l7 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L900000208

			.L77002976:
/* 0x486c	   0 */		ldx	[%sp+2399],%l6
/* 0x4870	   0 */		sethi	%gdop_hix22(.L680),%i1
/* 0x4874	   0 */		xor	%i1,%gdop_lox10(.L680),%o2
/* 0x4878	   0 */		ldx	[%l6+%o2],%o0,%gdop(.L680)
/* 0x487c	2007 */		call	printf	!params=  %o0	!result= 
/* 0x4880	   0 */		sub	%o0,2139,%i4

! 2032		      !    }
! 2034		      !    XCloseDisplay(dsp);

/* 0x4884	2034 */		call	XCloseDisplay	!params=  %o0	!result= 
/* 0x4888	     */		mov	%l7,%o0

! 2036		      !    printf("\n");

/* 0x488c	2036 */		call	printf	!params=  %o0	!result= 
/* 0x4890	     */		add	%i4,-2900,%o0

! 2038		      !    /* it may seem insane to set the pointer to NULL after the
! 2039		      !     * free() but why not have belt and suspenders safety? */
! 2040		      !    free(buf);

/* 0x4894	2040 */		call	free	!params=  %o0	!result= 
/* 0x4898	     */		ldx	[%sp+2647],%o0

! 2041		      !    buf = NULL;
! 2043		      !    for ( pt = 0; pt < pthread_limit; pt++ ){

/* 0x489c	2043 */		ld	[%sp+2275],%l7
/* 0x48a0	     */		cmp	%l7,0
/* 0x48a4	     */		ble,pn	%icc,.L77002791
/* 0x48a8	     */		add	%sp,3655,%l6

! Registers live out of .L77002976: 
! g2 g3 o0 sp l6 i0 i2 fp gsr 
! 
		
! 2044		      !        free( parm[pt] );

                       
! predecessor blocks: .L77002976

			.L77003271:
/* 0x48ac	2044 */		prefetch	[%l6+256],2
/* 0x48b0	     */		prefetch	[%l6+512],2
/* 0x48b4	2043 */		mov	0,%i3
/* 0x48b8	2044 */		prefetch	[%l6+768],2
/* 0x48bc	     */		prefetch	[%l6+1024],2
/* 0x48c0	     */		prefetch	[%l6+1280],2

! Registers live out of .L77003271: 
! g2 g3 o0 sp l6 i0 i2 i3 fp gsr 
! 
		                       
! predecessor blocks: .L77003271 .L900000695

			.L900000695:
/* 0x48c4	2044 */		call	free	!params=  %o0	!result= 
/* 0x48c8	     */		ldx	[%l6],%o0
/* 0x48cc	2043 */		ld	[%sp+2279],%l7
/* 0x48d0	     */		add	%i3,1,%i3

! 2045		      !        parm[pt] = NULL;

/* 0x48d4	2045 */		stx	%g0,[%l6]
/* 0x48d8	2043 */		add	%l6,8,%l6
/* 0x48dc	     */		cmp	%i3,%l7
/* 0x48e0	     */		ble,pt	%icc,.L900000695
/* 0x48e4	2044 */		prefetch	[%l6+1280],2

! Registers live out of .L900000695: 
! g2 g3 o0 sp l6 i0 i2 i3 fp gsr 
! 
		
! 2046		      !    }
! 2048		      !    free(mandel_val);

                       
! predecessor blocks: .L77002976 .L900000695

			.L77002791:
/* 0x48e8	2048 */		call	free	!params=  %o0	!result= 
/* 0x48ec	     */		ldx	[%sp+2407],%o0

! 2049		      !    mandel_val = NULL;
! 2051		      !    free(coord_r);

/* 0x48f0	2051 */		call	free	!params=  %o0	!result= 
/* 0x48f4	     */		mov	%i2,%o0

! 2052		      !    coord_r = NULL;
! 2054		      !    free(coord_j);

/* 0x48f8	2054 */		call	free	!params=  %o0	!result= 
/* 0x48fc	     */		ldx	[%sp+2639],%o0
/* 0x4900	 442 */		return	%i7+8	! Result =  %i0
/* 0x4904	     */		mov	0,%o0
                       
! predecessor blocks: .L77002273 .L900000689

			.L900000689:
/* 0x4908	 974 */		call	free	!params=  %o0	!result= 
/* 0x490c	     */		ldx	[%i4],%o0
/* 0x4910	 975 */		stx	%g0,[%i4]
/* 0x4914	 973 */		sub	%i4,8,%i4
/* 0x4918	     */		addcc	%i2,-1,%i2
/* 0x491c	     */		bge,pt	%icc,.L900000689
/* 0x4920	 974 */		prefetch	[%i4-1536],2

! Registers live out of .L900000689: 
! g2 g3 o0 sp i0 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L900000689

			.L900000619:
/* 0x4924	 442 */		return	%i7+8	! Result =  %i0
/* 0x4928	     */		mov	1,%o0
                       
! predecessor blocks: .L77002159 .L77002161

			.L77002165:
/* 0x492c	 612 */		ldx	[%sp+2399],%i3
/* 0x4930	     */		sethi	%gdop_hix22(__iob),%i5
/* 0x4934	     */		add	%i4,2276,%o1
/* 0x4938	     */		xor	%i5,%gdop_lox10(__iob),%o3
/* 0x493c	     */		ldx	[%i3+%o3],%l3,%gdop(__iob)
/* 0x4940	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4944	     */		add	%l3,256,%o0

! Registers live out of .L77002165: 
! g2 g3 sp i0 fp gsr 
! 
		                       
! predecessor blocks: .L77002165 .L900000690

			.L77002792:
/* 0x4948	 442 */		return	%i7+8	! Result =  %i0
/* 0x494c	     */		mov	1,%o0
                       
! predecessor blocks: .L77003050

			.L77001913:
/* 0x4950	 247 */		call	___errno	!params= 	!result=  %o0
/* 0x4954	     */		nop
/* 0x4958	     */		ld	[%o0],%g5
/* 0x495c	     */		cmp	%g5,12
/* 0x4960	     */		bne,pn	%icc,.L77001917
/* 0x4964	 248 */		sethi	%gdop_hix22(__iob),%o2

! Registers live out of .L77001913: 
! g2 g3 o2 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001913

			.L77001915:
/* 0x4968	 248 */		ldx	[%sp+2399],%g5
/* 0x496c	     */		xor	%o2,%gdop_lox10(__iob),%l4
/* 0x4970	     */		sethi	%gdop_hix22(.L24),%o7
/* 0x4974	     */		sethi	%gdop_hix22(.L23),%i5
/* 0x4978	     */		xor	%o7,%gdop_lox10(.L24),%i1
/* 0x497c	     */		xor	%i5,%gdop_lox10(.L23),%o0
/* 0x4980	     */		mov	248,%o3
/* 0x4984	     */		ldx	[%g5+%l4],%l3,%gdop(__iob)
/* 0x4988	     */		ldx	[%g5+%o0],%o1,%gdop(.L23)
/* 0x498c	     */		ldx	[%g5+%i1],%o2,%gdop(.L24)
/* 0x4990	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4994	     */		add	%l3,256,%o0
/* 0x4998	     */		ba	.L900000694
/* 0x499c	 252 */		sethi	%gdop_hix22(.L27),%o1

! Registers live out of .L77001915: 
! g2 g3 o0 o1 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001913

			.L77001917:
/* 0x49a0	 250 */		ldx	[%sp+2399],%o0
/* 0x49a4	     */		sethi	%gdop_hix22(__iob),%l6
/* 0x49a8	     */		sethi	%gdop_hix22(.L24),%o4
/* 0x49ac	     */		xor	%l6,%gdop_lox10(__iob),%g4
/* 0x49b0	     */		sethi	%gdop_hix22(.L26),%l7
/* 0x49b4	     */		xor	%o4,%gdop_lox10(.L24),%l5
/* 0x49b8	     */		xor	%l7,%gdop_lox10(.L26),%g1
/* 0x49bc	     */		mov	250,%o3
/* 0x49c0	     */		ldx	[%o0+%g4],%l2,%gdop(__iob)
/* 0x49c4	     */		ldx	[%o0+%g1],%o1,%gdop(.L26)
/* 0x49c8	     */		ldx	[%o0+%l5],%o2,%gdop(.L24)
/* 0x49cc	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x49d0	     */		add	%l2,256,%o0
/* 0x49d4	 252 */		sethi	%gdop_hix22(.L27),%o1

! Registers live out of .L77001917: 
! g2 g3 o0 o1 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001915 .L77001917

			.L900000694:
/* 0x49d8	 252 */		ldx	[%sp+2399],%g4
/* 0x49dc	     */		xor	%o1,%gdop_lox10(.L27),%o5
/* 0x49e0	     */		call	perror	!params=  %o0	!result= 
/* 0x49e4	     */		ldx	[%g4+%o5],%o0,%gdop(.L27)
/* 0x49e8	 253 */		call	free	!params=  %o0	!result= 
/* 0x49ec	     */		ldx	[%sp+2407],%o0
/* 0x49f0	 255 */		call	free	!params=  %o0	!result= 
/* 0x49f4	     */		mov	%i2,%o0
/* 0x49f8	 442 */		return	%i7+8	! Result =  %i0
/* 0x49fc	     */		mov	1,%o0
                       
! predecessor blocks: .L77003057

			.L77001931:
/* 0x4a00	 308 */		call	___errno	!params= 	!result=  %o0
/* 0x4a04	     */		nop
/* 0x4a08	     */		ld	[%o0],%o3
/* 0x4a0c	     */		cmp	%o3,12
/* 0x4a10	     */		bne,pn	%icc,.L77001935
/* 0x4a14	 309 */		sethi	%gdop_hix22(__iob),%o2

! Registers live out of .L77001931: 
! g2 g3 o0 o2 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001931

			.L77001933:
/* 0x4a18	 309 */		ldx	[%sp+2399],%l5
/* 0x4a1c	     */		xor	%o2,%gdop_lox10(__iob),%l4
/* 0x4a20	     */		sethi	%gdop_hix22(.L24),%o7
/* 0x4a24	     */		sethi	%gdop_hix22(.L23),%g5
/* 0x4a28	     */		xor	%o7,%gdop_lox10(.L24),%i1
/* 0x4a2c	     */		xor	%g5,%gdop_lox10(.L23),%i5
/* 0x4a30	     */		mov	309,%o3
/* 0x4a34	     */		ldx	[%l5+%l4],%l3,%gdop(__iob)
/* 0x4a38	     */		ldx	[%l5+%i1],%o2,%gdop(.L24)
/* 0x4a3c	     */		ldx	[%l5+%i5],%o1,%gdop(.L23)
/* 0x4a40	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4a44	     */		add	%l3,256,%o0
/* 0x4a48	     */		ba	.L900000693
/* 0x4a4c	 313 */		sethi	%gdop_hix22(.L27),%l6

! Registers live out of .L77001933: 
! g2 g3 o0 sp l6 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001931

			.L77001935:
/* 0x4a50	 311 */		ldx	[%sp+2399],%l6
/* 0x4a54	     */		sethi	%gdop_hix22(__iob),%o4
/* 0x4a58	     */		sethi	%gdop_hix22(.L24),%g4
/* 0x4a5c	     */		xor	%o4,%gdop_lox10(__iob),%i3
/* 0x4a60	     */		sethi	%gdop_hix22(.L26),%l7
/* 0x4a64	     */		xor	%g4,%gdop_lox10(.L24),%l5
/* 0x4a68	     */		xor	%l7,%gdop_lox10(.L26),%g1
/* 0x4a6c	     */		mov	311,%o3
/* 0x4a70	     */		ldx	[%l6+%i3],%l2,%gdop(__iob)
/* 0x4a74	     */		ldx	[%l6+%g1],%o1,%gdop(.L26)
/* 0x4a78	     */		ldx	[%l6+%l5],%o2,%gdop(.L24)
/* 0x4a7c	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4a80	     */		add	%l2,256,%o0
/* 0x4a84	 313 */		sethi	%gdop_hix22(.L27),%l6

! Registers live out of .L77001935: 
! g2 g3 o0 sp l6 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001933 .L77001935

			.L900000693:
/* 0x4a88	 313 */		ldx	[%sp+2399],%g1
/* 0x4a8c	     */		xor	%l6,%gdop_lox10(.L27),%i4
/* 0x4a90	     */		call	perror	!params=  %o0	!result= 
/* 0x4a94	     */		ldx	[%g1+%i4],%o0,%gdop(.L27)
/* 0x4a98	 314 */		call	free	!params=  %o0	!result= 
/* 0x4a9c	     */		ldx	[%sp+2407],%o0
/* 0x4aa0	 316 */		call	free	!params=  %o0	!result= 
/* 0x4aa4	     */		mov	%i2,%o0
/* 0x4aa8	 318 */		call	free	!params=  %o0	!result= 
/* 0x4aac	     */		ldx	[%sp+2639],%o0
/* 0x4ab0	 442 */		return	%i7+8	! Result =  %i0
/* 0x4ab4	     */		mov	1,%o0
                       
! predecessor blocks: .L77001975

			.L77001977:
/* 0x4ab8	 406 */		sethi	%gdop_hix22(.L96),%g1
/* 0x4abc	     */		ldx	[%sp+2399],%o5
/* 0x4ac0	     */		xor	%g1,%gdop_lox10(.L96),%o2
/* 0x4ac4	     */		call	perror	!params=  %o0	!result= 
/* 0x4ac8	     */		ldx	[%o5+%o2],%o0,%gdop(.L96)
/* 0x4acc	     */		ba	.L900000692
/* 0x4ad0	 411 */		nop

! Registers live out of .L77001977: 
! g2 g3 sp l6 l7 i0 i1 i2 i4 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77001981 .L900000692

			.L77001985:
/* 0x4ad4	 414 */		sethi	%gdop_hix22(.L101),%i4
/* 0x4ad8	     */		sethi	%gdop_hix22(__iob),%l6
/* 0x4adc	     */		xor	%i4,%gdop_lox10(.L101),%i1
/* 0x4ae0	     */		ldx	[%sp+2399],%i4
/* 0x4ae4	     */		xor	%l6,%gdop_lox10(__iob),%i2
/* 0x4ae8	     */		ldx	[%i4+%i2],%o4,%gdop(__iob)
/* 0x4aec	     */		ldx	[%i4+%i1],%o1,%gdop(.L101)
/* 0x4af0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4af4	     */		add	%o4,256,%o0
/* 0x4af8	 415 */		sethi	%gdop_hix22(.L82),%g4
/* 0x4afc	     */		xor	%g4,%gdop_lox10(.L82),%i3
/* 0x4b00	     */		call	perror	!params=  %o0	!result= 
/* 0x4b04	     */		ldx	[%i4+%i3],%o0,%gdop(.L82)
/* 0x4b08	 442 */		return	%i7+8	! Result =  %i0
/* 0x4b0c	     */		mov	1,%o0
                       
! predecessor blocks: .L77002505

			.L77002507:
/* 0x4b10	1591 */		sethi	%gdop_hix22(.L495),%o5
/* 0x4b14	     */		ldx	[%sp+2399],%o3
/* 0x4b18	     */		xor	%o5,%gdop_lox10(.L495),%g1
/* 0x4b1c	     */		call	perror	!params=  %o0	!result= 
/* 0x4b20	     */		ldx	[%o3+%g1],%o0,%gdop(.L495)
/* 0x4b24	1592 */		ba	.L900000691
/* 0x4b28	1722 */		nop

! Registers live out of .L77002507: 
! g2 g3 o0 sp l5 l6 l7 i1 i2 i5 fp gsr 
! 
		                       
! predecessor blocks: .L77003075

			.L77002265:
/* 0x4b2c	 954 */		call	___errno	!params= 	!result=  %o0
/* 0x4b30	     */		nop
/* 0x4b34	     */		ld	[%o0],%i1
/* 0x4b38	     */		cmp	%i1,12
/* 0x4b3c	     */		bne,pn	%icc,.L77002269
/* 0x4b40	 955 */		sethi	%gdop_hix22(__iob),%o2

! Registers live out of .L77002265: 
! g2 g3 o0 o2 sp l2 l4 l5 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002265

			.L77002267:
/* 0x4b44	 955 */		ldx	[%sp+2399],%g1
/* 0x4b48	     */		xor	%o2,%gdop_lox10(__iob),%i5
/* 0x4b4c	     */		sethi	%gdop_hix22(.L24),%o1
/* 0x4b50	     */		sethi	%gdop_hix22(.L318),%i3
/* 0x4b54	     */		xor	%o1,%gdop_lox10(.L24),%i0
/* 0x4b58	     */		xor	%i3,%gdop_lox10(.L318),%l6
/* 0x4b5c	     */		mov	955,%o3
/* 0x4b60	     */		ldx	[%g1+%i5],%l7,%gdop(__iob)
/* 0x4b64	     */		ldx	[%g1+%i0],%o2,%gdop(.L24)
/* 0x4b68	     */		ldx	[%g1+%l6],%o1,%gdop(.L318)
/* 0x4b6c	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4b70	     */		add	%l7,256,%o0
/* 0x4b74	     */		ba	.L900000690
/* 0x4b78	 960 */		sethi	%gdop_hix22(.L27),%o7

! Registers live out of .L77002267: 
! g2 g3 o0 sp o7 l2 l4 l5 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002265

			.L77002269:
/* 0x4b7c	 957 */		sethi	%gdop_hix22(__iob),%o3
/* 0x4b80	     */		ldx	[%sp+2399],%o7
/* 0x4b84	     */		sethi	%gdop_hix22(.L26),%g1
/* 0x4b88	     */		sethi	%gdop_hix22(.L24),%l3
/* 0x4b8c	     */		xor	%o3,%gdop_lox10(__iob),%o5
/* 0x4b90	     */		xor	%g1,%gdop_lox10(.L26),%g4
/* 0x4b94	     */		xor	%l3,%gdop_lox10(.L24),%o4
/* 0x4b98	     */		mov	957,%o3
/* 0x4b9c	     */		ldx	[%o7+%o5],%o0,%gdop(__iob)
/* 0x4ba0	     */		ldx	[%o7+%o4],%o2,%gdop(.L24)
/* 0x4ba4	     */		ldx	[%o7+%g4],%o1,%gdop(.L26)
/* 0x4ba8	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4bac	     */		add	%o0,256,%o0
/* 0x4bb0	 960 */		sethi	%gdop_hix22(.L27),%o7

! Registers live out of .L77002269: 
! g2 g3 o0 sp o7 l2 l4 l5 i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77002267 .L77002269

			.L900000690:
/* 0x4bb4	 960 */		ldx	[%sp+2399],%l7
/* 0x4bb8	     */		xor	%o7,%gdop_lox10(.L27),%g5
/* 0x4bbc	     */		call	perror	!params=  %o0	!result= 
/* 0x4bc0	     */		ldx	[%l7+%g5],%o0,%gdop(.L27)
/* 0x4bc4	 963 */		call	free	!params=  %o0	!result= 
/* 0x4bc8	     */		ldx	[%sp+2407],%o0
/* 0x4bcc	 965 */		call	free	!params=  %o0	!result= 
/* 0x4bd0	     */		mov	%i2,%o0
/* 0x4bd4	 967 */		call	free	!params=  %o0	!result= 
/* 0x4bd8	     */		ldx	[%sp+2639],%o0
/* 0x4bdc	 972 */		cmp	%l4,0
/* 0x4be0	     */		ble,pt	%icc,.L77002792
/* 0x4be4	     */		nop

! Registers live out of .L900000690: 
! g2 g3 o0 sp l2 l4 l5 i0 fp gsr 
! 
		                       
! predecessor blocks: .L900000690

			.L77002273:
/* 0x4be8	 973 */		add	%l4,-1,%i2
/* 0x4bec	     */		add	%sp,3655,%l7
/* 0x4bf0	 972 */		stx	%l5,[%l2]
/* 0x4bf4	 973 */		sra	%i2,0,%l6
/* 0x4bf8	     */		sllx	%l6,3,%i1
/* 0x4bfc	     */		add	%i1,%l7,%i4
/* 0x4c00	 974 */		prefetch	[%i4-256],2
/* 0x4c04	     */		prefetch	[%i4-512],2
/* 0x4c08	     */		prefetch	[%i4-768],2
/* 0x4c0c	     */		prefetch	[%i4-1024],2
/* 0x4c10	     */		prefetch	[%i4-1280],2
/* 0x4c14	 973 */		ba	.L900000689
/* 0x4c18	 974 */		prefetch	[%i4-1536],2

! Registers live out of .L77002273: 
! g2 g3 o0 sp i0 i2 i4 fp gsr 
! 
		                       
! predecessor blocks: .L77002111 .L900000777

			.L77002115:
/* 0x4c1c	 505 */		ldx	[%sp+2399],%l6
/* 0x4c20	     */		sethi	%gdop_hix22(__iob),%i4
/* 0x4c24	     */		sethi	%gdop_hix22(.L187),%i1
/* 0x4c28	     */		xor	%i1,%gdop_lox10(.L187),%g5
/* 0x4c2c	     */		xor	%i4,%gdop_lox10(__iob),%i2
/* 0x4c30	     */		ldx	[%l6+%g5],%o1,%gdop(.L187)
/* 0x4c34	     */		ldx	[%l6+%i2],%o0,%gdop(__iob)
/* 0x4c38	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4c3c	     */		add	%o0,256,%o0
/* 0x4c40	 506 */		sethi	%gdop_hix22(.L82),%o1
/* 0x4c44	     */		xor	%o1,%gdop_lox10(.L82),%i5
/* 0x4c48	     */		call	perror	!params=  %o0	!result= 
/* 0x4c4c	     */		ldx	[%l6+%i5],%o0,%gdop(.L82)
/* 0x4c50	 442 */		return	%i7+8	! Result =  %i0
/* 0x4c54	     */		mov	1,%o0
                       
! predecessor blocks: .L77002085 .L77002087

			.L77002091:
/* 0x4c58	 484 */		sethi	%gdop_hix22(.L172),%l3
/* 0x4c5c	     */		sethi	%gdop_hix22(__iob),%i2
/* 0x4c60	     */		xor	%l3,%gdop_lox10(.L172),%o4
/* 0x4c64	     */		ldx	[%sp+2399],%l3
/* 0x4c68	     */		xor	%i2,%gdop_lox10(__iob),%o5
/* 0x4c6c	     */		ldx	[%l3+%o5],%l4,%gdop(__iob)
/* 0x4c70	     */		ldx	[%l3+%o4],%o1,%gdop(.L172)
/* 0x4c74	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4c78	     */		add	%l4,256,%o0
/* 0x4c7c	 485 */		sethi	%gdop_hix22(.L82),%g4
/* 0x4c80	     */		xor	%g4,%gdop_lox10(.L82),%i0
/* 0x4c84	     */		call	perror	!params=  %o0	!result= 
/* 0x4c88	     */		ldx	[%l3+%i0],%o0,%gdop(.L82)
/* 0x4c8c	 442 */		return	%i7+8	! Result =  %i0
/* 0x4c90	     */		mov	1,%o0
                       
! predecessor blocks: .L77002033 .L77002035

			.L77002039:
/* 0x4c94	 448 */		sethi	%gdop_hix22(__iob),%i5
/* 0x4c98	     */		sethi	%gdop_hix22(.L139),%g5
/* 0x4c9c	     */		xor	%i5,%gdop_lox10(__iob),%l3
/* 0x4ca0	     */		ldx	[%sp+2399],%i5
/* 0x4ca4	     */		xor	%g5,%gdop_lox10(.L139),%o1
/* 0x4ca8	     */		ldx	[%i5+%l3],%o3,%gdop(__iob)
/* 0x4cac	     */		ldx	[%i5+%o1],%o1,%gdop(.L139)
/* 0x4cb0	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4cb4	     */		add	%o3,256,%o0
/* 0x4cb8	 449 */		sethi	%gdop_hix22(.L82),%o5
/* 0x4cbc	     */		xor	%o5,%gdop_lox10(.L82),%o4
/* 0x4cc0	     */		call	perror	!params=  %o0	!result= 
/* 0x4cc4	     */		ldx	[%i5+%o4],%o0,%gdop(.L82)
/* 0x4cc8	 442 */		return	%i7+8	! Result =  %i0
/* 0x4ccc	     */		mov	1,%o0
                       
! predecessor blocks: .L77001955 .L77001957

			.L77001961:
/* 0x4cd0	 391 */		ldx	[%sp+2399],%l2
/* 0x4cd4	     */		sethi	%gdop_hix22(__iob),%g5
/* 0x4cd8	     */		sethi	%gdop_hix22(.L81),%o1
/* 0x4cdc	     */		xor	%o1,%gdop_lox10(.L81),%o3
/* 0x4ce0	     */		xor	%g5,%gdop_lox10(__iob),%i5
/* 0x4ce4	 392 */		sethi	%gdop_hix22(.L82),%l6
/* 0x4ce8	     */		xor	%l6,%gdop_lox10(.L82),%i4
/* 0x4cec	 391 */		ldx	[%l2+%o3],%o1,%gdop(.L81)
/* 0x4cf0	     */		ldx	[%l2+%i5],%o5,%gdop(__iob)
/* 0x4cf4	     */		call	fprintf	!params=  %o0 %o1	!result= 
/* 0x4cf8	     */		add	%o5,256,%o0
/* 0x4cfc	 392 */		call	perror	!params=  %o0	!result= 
/* 0x4d00	     */		ldx	[%l2+%i4],%o0,%gdop(.L82)
/* 0x4d04	 442 */		return	%i7+8	! Result =  %i0
/* 0x4d08	     */		mov	1,%o0
                       
! predecessor blocks: .L77003043

			.L77001903:
/* 0x4d0c	 232 */		call	___errno	!params= 	!result=  %o0
/* 0x4d10	     */		nop
/* 0x4d14	     */		ld	[%o0],%o2
/* 0x4d18	     */		cmp	%o2,12
/* 0x4d1c	     */		bne,pn	%icc,.L77001907
/* 0x4d20	 233 */		sethi	%gdop_hix22(__iob),%g4

! Registers live out of .L77001903: 
! g2 g3 g4 o0 sp i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001903

			.L77001905:
/* 0x4d24	 233 */		ldx	[%sp+2399],%o4
/* 0x4d28	     */		xor	%g4,%gdop_lox10(__iob),%l7
/* 0x4d2c	     */		sethi	%gdop_hix22(.L24),%l5
/* 0x4d30	     */		sethi	%gdop_hix22(.L23),%l2
/* 0x4d34	     */		xor	%l5,%gdop_lox10(.L24),%g1
/* 0x4d38	     */		xor	%l2,%gdop_lox10(.L23),%o7
/* 0x4d3c	     */		mov	233,%o3
/* 0x4d40	     */		ldx	[%o4+%l7],%l4,%gdop(__iob)
/* 0x4d44	     */		ldx	[%o4+%g1],%o2,%gdop(.L24)
/* 0x4d48	     */		ldx	[%o4+%o7],%o1,%gdop(.L23)
/* 0x4d4c	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4d50	     */		add	%l4,256,%o0
/* 0x4d54	     */		ba	.L900000688
/* 0x4d58	 237 */		sethi	%gdop_hix22(.L27),%i2

! Registers live out of .L77001905: 
! g2 g3 o0 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001903

			.L77001907:
/* 0x4d5c	 235 */		sethi	%gdop_hix22(.L24),%i0
/* 0x4d60	     */		sethi	%gdop_hix22(.L26),%o5
/* 0x4d64	     */		xor	%i0,%gdop_lox10(.L24),%o1
/* 0x4d68	     */		ldx	[%sp+2399],%i0
/* 0x4d6c	     */		sethi	%gdop_hix22(__iob),%i3
/* 0x4d70	     */		xor	%o5,%gdop_lox10(.L26),%l6
/* 0x4d74	     */		xor	%i3,%gdop_lox10(__iob),%i4
/* 0x4d78	     */		mov	235,%o3
/* 0x4d7c	 237 */		sethi	%gdop_hix22(.L27),%i2
/* 0x4d80	 235 */		ldx	[%i0+%o1],%o2,%gdop(.L24)
/* 0x4d84	     */		ldx	[%i0+%i4],%o4,%gdop(__iob)
/* 0x4d88	     */		ldx	[%i0+%l6],%o1,%gdop(.L26)
/* 0x4d8c	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4d90	     */		add	%o4,256,%o0

! Registers live out of .L77001907: 
! g2 g3 o0 sp i0 i2 fp gsr 
! 
		                       
! predecessor blocks: .L77001905 .L77001907

			.L900000688:
/* 0x4d94	 237 */		xor	%i2,%gdop_lox10(.L27),%o3
/* 0x4d98	     */		ldx	[%sp+2399],%i2
/* 0x4d9c	     */		call	perror	!params=  %o0	!result= 
/* 0x4da0	     */		ldx	[%i2+%o3],%o0,%gdop(.L27)
/* 0x4da4	 238 */		call	free	!params=  %o0	!result= 
/* 0x4da8	     */		ldx	[%sp+2407],%o0
/* 0x4dac	 442 */		return	%i7+8	! Result =  %i0
/* 0x4db0	     */		mov	1,%o0
                       
! predecessor blocks: .L77003036

			.L77001893:
/* 0x4db4	 215 */		call	___errno	!params= 	!result=  %o0
/* 0x4db8	     */		nop
/* 0x4dbc	     */		ld	[%o0],%l7
/* 0x4dc0	     */		cmp	%l7,12
/* 0x4dc4	     */		bne,pn	%icc,.L77001897
/* 0x4dc8	 216 */		sethi	%gdop_hix22(__iob),%o3

! Registers live out of .L77001893: 
! g2 g3 o0 o3 sp i0 fp gsr 
! 
		                       
! predecessor blocks: .L77001893

			.L77001895:
/* 0x4dcc	 216 */		ldx	[%sp+2399],%l4
/* 0x4dd0	     */		xor	%o3,%gdop_lox10(__iob),%o5
/* 0x4dd4	     */		sethi	%gdop_hix22(.L24),%o1
/* 0x4dd8	     */		sethi	%gdop_hix22(.L23),%o4
/* 0x4ddc	     */		xor	%o1,%gdop_lox10(.L24),%l6
/* 0x4de0	     */		xor	%o4,%gdop_lox10(.L23),%g4
/* 0x4de4	     */		mov	216,%o3
/* 0x4de8	     */		ldx	[%l4+%o5],%l5,%gdop(__iob)
/* 0x4dec	     */		ldx	[%l4+%g4],%o1,%gdop(.L23)
/* 0x4df0	     */		ldx	[%l4+%l6],%o2,%gdop(.L24)
/* 0x4df4	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4df8	     */		add	%l5,256,%o0
/* 0x4dfc	     */		ba	.L900000687
/* 0x4e00	 220 */		sethi	%gdop_hix22(.L27),%i1

! Registers live out of .L77001895: 
! g2 g3 o0 sp i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77001893

			.L77001897:
/* 0x4e04	 218 */		ldx	[%sp+2399],%i5
/* 0x4e08	     */		sethi	%gdop_hix22(__iob),%o0
/* 0x4e0c	     */		sethi	%gdop_hix22(.L24),%l3
/* 0x4e10	     */		xor	%o0,%gdop_lox10(__iob),%g5
/* 0x4e14	     */		sethi	%gdop_hix22(.L26),%i3
/* 0x4e18	     */		xor	%l3,%gdop_lox10(.L24),%i2
/* 0x4e1c	     */		xor	%i3,%gdop_lox10(.L26),%i0
/* 0x4e20	     */		mov	218,%o3
/* 0x4e24	 220 */		sethi	%gdop_hix22(.L27),%i1
/* 0x4e28	 218 */		ldx	[%i5+%g5],%i4,%gdop(__iob)
/* 0x4e2c	     */		ldx	[%i5+%i2],%o2,%gdop(.L24)
/* 0x4e30	     */		ldx	[%i5+%i0],%o1,%gdop(.L26)
/* 0x4e34	     */		call	fprintf	!params=  %o0 %o1 %o2 %o3	!result= 
/* 0x4e38	     */		add	%i4,256,%o0

! Registers live out of .L77001897: 
! g2 g3 o0 sp i0 i1 fp gsr 
! 
		                       
! predecessor blocks: .L77001895 .L77001897

			.L900000687:
/* 0x4e3c	 220 */		ldx	[%sp+2399],%l3
/* 0x4e40	     */		xor	%i1,%gdop_lox10(.L27),%i5
/* 0x4e44	     */		call	perror	!params=  %o0	!result= 
/* 0x4e48	     */		ldx	[%l3+%i5],%o0,%gdop(.L27)
/* 0x4e4c	 442 */		return	%i7+8	! Result =  %i0
/* 0x4e50	     */		mov	1,%o0
/* 0x4e54	   0 */		.type	main,#function
/* 0x4e54	   0 */		.size	main,(.-main)
/* 0x4e54	   0 */		.global	__fsr_init_value
/* 0x4e54	     */		 __fsr_init_value=1
                       

			.L900000796:

	.section	".text",#alloc,#execinstr,#progbits
                       

			.L900000830:

	.section	".annotate",#exclude,#progbits
/* 000000	   0 */		.asciz	"anotate"
/* 0x0008	   0 */		.word	6,0
/* 0x0010	   0 */		.xword	392
/* 0x0018	   0 */		.word	0,16
/* 0x0020	   0 */		.xword	(.L900000830-0x4f54)
/* 0x0028	   0 */		.xword	20308
/* 0x0030	   0 */		.word	2,32
/* 0x0038	   0 */		.xword	.L900000795
/* 0x0040	   0 */		.xword	(.L900000796-.L900000795)
/* 0x0048	   0 */		.xword	.L___const_seg_900000101
/* 0x0050	   0 */		.word	-2145808256,0
/* 0x0058	   0 */		.word	5,24
/* 0x0060	   0 */		.xword	(.L900000686+0x8)
/* 0x0068	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0070	   0 */		.xword	.L900000686
/* 0x0078	   0 */		.word	6,24
/* 0x0080	   0 */		.xword	(.L900000686+0x10)
/* 0x0088	   0 */		.xword	_GLOBAL_OFFSET_TABLE_
/* 0x0090	   0 */		.xword	.L900000686
/* 0x0098	   0 */		.word	7,24
/* 0x00a0	   0 */		.xword	.L___const_seg_900000101
/* 0x00a8	   0 */		.xword	184
/* 0x00b0	   0 */		.xword	8
/* 0x00b8	   0 */		.word	26,224
/* 0x00c0	   0 */		.xword	(.L77001947+0x74)
/* 0x00c8	   0 */		.xword	(.L77001947+0x78)
/* 0x00d0	   0 */		.xword	(.L77001947+0x7c)
/* 0x00d8	   0 */		.xword	(.L77001947+0x84)
/* 0x00e0	   0 */		.xword	(.L77002259+0x104)
/* 0x00e8	   0 */		.xword	(.L77002259+0x108)
/* 0x00f0	   0 */		.xword	(.L77002259+0x10c)
/* 0x00f8	   0 */		.xword	(.L77002259+0x114)
/* 0x0100	   0 */		.xword	(.L77002984+0x10)
/* 0x0108	   0 */		.xword	(.L77002984+0x14)
/* 0x0110	   0 */		.xword	(.L77002984+0x18)
/* 0x0118	   0 */		.xword	(.L77002984+0x20)
/* 0x0120	   0 */		.xword	(.L77002385+0xc)
/* 0x0128	   0 */		.xword	(.L77002385+0x10)
/* 0x0130	   0 */		.xword	(.L77002385+0x14)
/* 0x0138	   0 */		.xword	(.L77002385+0x1c)
/* 0x0140	   0 */		.xword	(.L77002741+0x14)
/* 0x0148	   0 */		.xword	(.L77002741+0x18)
/* 0x0150	   0 */		.xword	(.L77002741+0x20)
/* 0x0158	   0 */		.xword	(.L77002741+0x28)
/* 0x0160	   0 */		.xword	(.L77002753+0x28)
/* 0x0168	   0 */		.xword	(.L77002753+0x2c)
/* 0x0170	   0 */		.xword	(.L77002753+0x30)
/* 0x0178	   0 */		.xword	(.L77002753+0x38)
/* 0x0180	   0 */		.xword	(.L77002757+0x14)
/* 0x0188	   0 */		.xword	(.L77002757+0x18)
/* 0x0190	   0 */		.xword	(.L77002757+0x1c)
/* 0x0198	   0 */		.xword	(.L77002757+0x24)

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
	.ascii "/opt/developerstudio12.6/bin/c99 -S -Xc -xmemalign=8s -m64 -xcode=pic32 -xregs=no%appl -xlibmieee -mc -xs -xO3 -fast -fma=fused -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE='600'  xmand.c\0"
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
	.xstabs ".stab.index","/export/home/dclarke/pgm/bw/xmand; /opt/developerstudio12.6/bin/c99 -S -Xc -xmemalign=8s -m64 -xcode=pic32 -xregs=no%appl -xlibmieee -mc -xs -xO3 -fast -fma=fused -D_POSIX_PTHREAD_SEMANTICS -D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE='600'  xmand.c",52,0,0,0
	.xstabs ".stab.index","main",42,0,0,75

! End Disassembling Debug Info

! Begin Disassembling Ident
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
	.ident	"acomp: Studio 12.6 Sun C 5.15 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"iropt: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017/05/30"	! (NO SOURCE LINE)
	.ident	"cg: Studio 12.6 Compiler Common 12.6 SunOS_sparc 2017-05-30"	! (NO SOURCE LINE)
! End Disassembling Ident
