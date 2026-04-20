
#define _XOPEN_SOURCE 500
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <locale.h>

int
main (int argc, char **argv)
{

    struct timespec tn_now;
    struct tm *tm_now;
    time_t now, then;
    int err_clock, j;
    clockid_t clock_flag;
    char *buf, buffer[256];

    buf = setlocale( LC_ALL, "POSIX" );
    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale POSIX fail\n");
        return EXIT_FAILURE;
    }

    clock_flag = CLOCK_REALTIME;
    err_clock = clock_gettime(clock_flag, &tn_now);
    if ( err_clock != 0 ) {
        if ( errno == EINVAL ) {
            /* Not very likely to ever happen as CLOCK_REALTIME
             * shall always be implemented if the clock_gettime()
             * function exists. */
            fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
            fprintf(stderr,"     : your system is bork bork bork\n");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : bizarre error. good luck.\n");
        return EXIT_FAILURE;
    }

    now = tn_now.tv_sec;
    tm_now = localtime(&now);

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

    /* we may not need 
     *   int setenv(const char *envname, const char *envval,
     *              int overwrite);
     */

    j = strftime( buffer, 256,
                  "%Y %m %d %A %a %B %b day=%j dow=%u week=%V\n       at %H:%M:%S %z",
                  tm_now);

    printf("\nINFO : time now\n     : %s\n", buffer);

    return 42;

}

