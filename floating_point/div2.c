
/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <locale.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <time.h>

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

int sysinfo(int verbose);
uint64_t system_memory(void);

int main ( int argc, char **argv)
{

    register uint32_t k;
    uint64_t tdelta_nsec0, tdelta_nsec1;
    struct timespec t0, t1;
    register double foo;
    register double some_num = 123456789012345.0;

    setlocale( LC_ALL, "C" );
    sysinfo(1);

    if ( clock_gettime( CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return(EXIT_FAILURE);
    }

    foo = 0.0;
    for ( k = 0; k<1000000; k++ ) {
        foo = (some_num + ((double)k)) / 2.0;
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec0 = timediff( t0, t1);
    printf("     : time delta %" PRIu64 " nsecs\n", tdelta_nsec0);
    printf(" foo div result =  %-+16.12e\n", foo);

    foo = 0.0;
    for ( k = 0; k<1000000; k++ ) {
        foo = (some_num + ((double)k)) * 0.5;
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec1 = timediff( t1, t0);
    printf("     : time delta %" PRIu64 " nsecs\n", tdelta_nsec1);
    printf("foo mult result =  %-+16.12e\n", foo);
    if ( tdelta_nsec0 < tdelta_nsec1 ) {
        printf("     : div2\n");
    } else {
        printf("     : mult 0.5\n");
    }

    return EXIT_SUCCESS;

}

