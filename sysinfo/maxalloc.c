
/*
 * maxalloc.c allocate and time memory chunks being wiped with memset
 * Copyright (C) Dennis Clarke 2019
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

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
#include <stdarg.h>
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <time.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <fenv.h>
#include <unistd.h>

#define SYSINFO_FAIL 127
#define VERBOSE 1
int sysinfo(int verbose);
uint64_t timediff( struct timespec st, struct timespec en );

int main( int argc, char *argv[] ) {

    size_t max = 0;
    size_t num_bytes, mem_alloc_size, mem_delta_size;
    int bytes_formatted;
    char *buffer;
    struct timespec start_time, end_time, tn;
    char time_buffer[32] = "";
    int64_t t0_s, t0_ns, t1_s, t1_ns, t_tmp_s, t_tmp_ns;
    /* for reasons the LLVM/Clang people seem to only know
     * it gets its panties in a twist over these two */
    t1_s = 0;
    t1_ns = 0;

    int64_t this_delta, t_delta_sanity, total_ns = 0;

    setlocale( LC_ALL, "C" );
    sysinfo(VERBOSE);

    if ( clock_gettime( CLOCK_REALTIME, &start_time ) > -1 ) {
        bytes_formatted = sprintf ( time_buffer,
                                    "%10lu.%-9lu",
                                    start_time.tv_sec,
                                    start_time.tv_nsec );

        if ( bytes_formatted > 0 ) {
            printf ( "START %s\n", time_buffer );
        } else {
            fprintf(stderr,"FAIL : you seem to not have clock_gettime().\n");
            return EXIT_FAILURE;
        }
    }
    t0_s = (int64_t)start_time.tv_sec;
    t0_ns = (int64_t)start_time.tv_nsec;

    if ( argc == 4 ) {
        max = (size_t)strtol(argv[1], (char **)NULL, 10);
        mem_alloc_size = (size_t)strtol(argv[2], (char **)NULL, 10);
        mem_delta_size = (size_t)strtol(argv[3], (char **)NULL, 10);

        /* TODO ensure we are getting 32 data points 
        if ( ( max / mem_delta_size ) < 32 ) {
            fprintf(stderr, "FAIL : lets allocate some reasonable amount!\n");
            return EXIT_FAILURE;
        }
        */

        printf ( " NOTE : will try to allocate %lu bytes of memory.\n", max );
        printf ( "      : we will use an init allocation of %lu bytes.\n", mem_alloc_size );
        printf ( "      : with a delta memory allocation of %lu bytes.\n", mem_delta_size );

    } else {

        fprintf (stderr, "FAIL : enter memsize total and allocation\n" );
        fprintf (stderr, "     : init size and allocation delta.\n" );
        return EXIT_FAILURE;

    }

    if ( ( max > 0 ) && ( max < 8 ) ) { 
        printf ( "WARNING : You must at least use 8 MB of memory!\n" );
        printf ( "        : quitting .. no harm done.\n" );
    } else {
        num_bytes = mem_alloc_size;
        while (((buffer=malloc(num_bytes)) != NULL ) 
                             && 
               (( num_bytes<max ) || ( max==0 )) )
        {

            /* We now flip the bits around in the memory buffer.
             *
             * Mildly related side note here is that there does
             * exist a method to "securely" wipe out a data region.
             * At the very least it is an algorithm that defense
             * contractors must use : 
             *
             *   The NCSC-TG-025 algorithm for overwriting meets the DoD
             *   5200.28-M (ADP Security Manual) Eraser Procedures
             *   specification.
             *   The NIST Guidelines for Media Sanitization
             *   (NIST SP 800-88) also reference this algorithm.
             *
             * Here we are only setting the region to all zero bits
             * and then the pattern 10101010 followed by the inversion
             * of that pattern to 01010101 then one bits 11111111 and
             * finally back to all zero bits. Thus the bit set sequence
             * is thus : 
             *
             *     pass 0 : 0000 0000
             *     pass 1 : 1010 1010
             *     pass 2 : 0101 0101
             *     pass 3 : 1111 1111
             *     pass 4 : 0000 0000
             */
            memset( buffer, 0x00, num_bytes );
            memset( buffer, 0xaa, num_bytes );
            memset( buffer, 0x55, num_bytes );
            memset( buffer, 0xff, num_bytes );
            memset( buffer, 0x00, num_bytes );

            num_bytes+=mem_delta_size;

            if ( ( num_bytes % ( 8 * 1048576 ) ) == 0 ) {

                printf( "      : %p   %6i MB", buffer, (num_bytes/1048576) );

                /* Get the REALTIME_CLOCK time */
                clock_gettime( CLOCK_REALTIME, &tn );
                bytes_formatted = sprintf ( time_buffer,
                                                "%10lu.%-9lu",
                                                tn.tv_sec, tn.tv_nsec );

                if ( bytes_formatted > 0 ) {
                    printf ( "    %s", time_buffer );
                    t1_s = (int64_t)tn.tv_sec;
                    t1_ns = (int64_t)tn.tv_nsec;

                    if ( ( t1_ns - t0_ns ) < 0 ) {
                        /* make a full second adjustment */
                        t_tmp_s = t1_s - t0_s - 1;
                        /* add a full second to t_tmp */
                        t_tmp_ns = 1000000000 + t1_ns - t0_ns;
                    } else {
                        t_tmp_s = t1_s - t0_s;
                        t_tmp_ns = t1_ns - t0_ns;
                    }

                    this_delta = ( t_tmp_s * (int64_t)1000000000 + t_tmp_ns );
                    printf ("    %" PRId64 "\n", this_delta ); 
                    total_ns += this_delta;

                }

                t0_s = t1_s;
                t0_ns = t1_ns;

            }

            free ( buffer );
            buffer = NULL;

            /* This was suggested as a time gap to allow
             * the kernel and memory allocator a moment
             * to gather its wits and sort out where the
             * next chunk or slab or whatever .. goes */
            (void)usleep((useconds_t)250000);

        }

        if ( ( buffer == NULL ) && ( ( num_bytes < max ) || ( max == 0 ) )  ) { 
            printf ( " NOTE : malloc returned NULL.\n" );
            printf ( "      : Most likely there is no more free memory.\n" );
        }

        printf( "FINAL : Allocated %lu bytes\n", num_bytes);

    }

    clock_gettime( CLOCK_REALTIME, &end_time );
    bytes_formatted = sprintf ( time_buffer,
                                    "%10lu.%-9lu",
                                    end_time.tv_sec,
                                    end_time.tv_nsec );

    printf ("END   %s\n", time_buffer );
    t_delta_sanity = timediff( start_time, end_time );
    printf ("DELTA %" PRId64 "\n", t_delta_sanity );
    printf ("TOTAL %" PRId64 "\n", total_ns );

    return EXIT_SUCCESS;

}

