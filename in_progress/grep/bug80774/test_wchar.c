
/*
   See GNU GREP bug report :
   https://lists.gnu.org/archive/html/bug-grep/2026-04/msg00027.html

   This appears to be an incompatibility in OpenBSD, which mishandles 
   titlecase characters. In an en_US.UTF-8 locale OpenBSD's towupper 
   function treats the character "ǅ" (U+01C5 LATIN CAPITAL LETTER D WITH 
   SMALL LETTER Z WITH CARON) differently from GNU/Linux. If you call 
   towupper (0x01C5) on OpenBSD it returns 0x01C5, that is, it acts as if 
   this character is uppercase. However, it's titlecase, not uppercase. It 
   should uppercase to "Ǆ", i.e., to U+01C4 LATIN CAPITAL LETTER DZ WITH CARON.

   Small test code should output "towupper (0x01C5) = 0x01C4" and on
   OpenBSD it may output "towupper (0x01C5) = 0x01C".

*/

/*
 * This code should be C90 clean and therefore we may use :
 *
 *                 #define _XOPEN_SOURCE 500
 *
 * NOTE: for reasons yet unknown OpenBSD 7.8 has a fit if you try
 *       to define _XOPEN_SOURCE and be damned if I know why.
 */

#if ! defined(__OpenBSD__)
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif
#endif

#include <locale.h>
#include <wctype.h>
#include <stdio.h>
#include <stdlib.h>

int
main( int argc, char **argv )
{
    /* NOTE : wchar.h - wide-character types */
    wint_t c, w;
    char *buf;

    /* assume a trivial POSIX locale */
    buf = setlocale( LC_ALL, "POSIX" );
    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return EXIT_FAILURE;
    }

    if ( argc > 1 ) {
        printf("\nINFO : You suggest a locale of %s\n", argv[1]);
        buf = setlocale( LC_ALL, argv[1] );
        /* The return value is NULL if the request can not be done */
        if ( buf == NULL ) {
            fprintf(stderr,"FAIL : * * * locale request failed * * *\n");
            fprintf(stderr,"     : ---------------------------------\n");
            fprintf(stderr,"     : please check your available list\n");
            fprintf(stderr,"     : of supported locales:\n");
            fprintf(stderr,"     : use \"locale -a\".\n");
            return EXIT_FAILURE;
        }
        printf("     : accepted.\n");
    } else {
        printf("\nINFO : locale is set to default \"POSIX\".\n\n");
    }

    c = 0x01C5;
    w = towupper(c);

    printf("\n(U+01C5 LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON)\n\n");

    printf("towupper (0x01C5) = 0x%04X\n", (int) w);

    printf("\n\nShould output \"towupper (0x01C5) = 0x01C4\".\n");
    printf("Buggy stuff may output \"towupper (0x01C5) = 0x01C\"\n");
    printf("OpenBSD 7.8 is even more strange and reports 0x01C5\n\n");

    return EXIT_SUCCESS;

}

