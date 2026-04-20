
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

   Comment from Dennis Clarke : time and date output in requested locale
*/

/*
 * This code should be C90 clean and therefore we may use :
 *
 *                 #define _XOPEN_SOURCE 500
 *
 * NOTE: for reasons yet unknown OpenBSD 7.8 has a fit if you try
 *       to define _XOPEN_SOURCE and I do not know why.
 */

#if ! defined(__OpenBSD__)
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif
#endif

#include <errno.h>
#include <locale.h>
#include <wctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

int
main( int argc, char **argv )
{
    /* NOTE : wchar.h - wide-character types */
    wint_t c, w;
    char *buf, time_string[256];

    struct timespec tn_now;
    struct tm *tm_now;
    time_t now;
    int err_clock;
    size_t j;
    clockid_t clock_flag;

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
        printf("\nINFO : locale is set to default \"POSIX\".\n");
        /* assume a trivial POSIX locale */
        buf = setlocale( LC_ALL, "POSIX" );
        if ( buf == NULL ) {
            fprintf (stderr,"FAIL : setlocale fail\n");
            return EXIT_FAILURE;
        }
    }

    /* output the date and time in the requested locale */

    clock_flag = CLOCK_REALTIME;
    err_clock = clock_gettime(clock_flag, &tn_now);
    if ( err_clock != 0 ) {
        if ( errno == EINVAL ) {
            /* CLOCK_REALTIME shall always be implemented if
             * the clock_gettime() function exists. */
            fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : clock_gettime() fails\n");
        return EXIT_FAILURE;
    }

    now = tn_now.tv_sec;
    tm_now = localtime(&now);

    j = strftime( time_string, 256,
                  "%Y %m %d %A %a %B %b day=%j dow=%u week=%V\n       at %H:%M:%S %z",
                  tm_now);

    printf("\nINFO : date and time in this locale is %i bytes\n", j);
    printf("     : %s\n\n", time_string);

    c = 0x01C5;
    w = towupper(c);

    printf("\n(U+01C5 LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON)\n\n");

    printf("towupper (0x01C5) = 0x%04X\n", (int) w);

    printf("\n\nShould output \"towupper (0x01C5) = 0x01C4\".\n");

    return EXIT_SUCCESS;

}

