
/*
 * c90_big_int.c  test with a very large integer and strict C90.
 * Copyright (C) Dennis Clarke 2022
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

#include <errno.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <limits.h>
#include <inttypes.h>

int
main(int argc, char **argv)
{

    size_t   j;
    uint64_t big_int0 = 0xFFFFFFFAFAFAFAFE;
    uint64_t big_int1 = 0xFFFFFFFE00000001;
    uint64_t big_int2, candidate;

    fprintf(stdout,"big_int0 = %" PRIu64 "\n", big_int0);
    fprintf(stdout,"big_int1 = %" PRIu64 "\n", big_int1);

    if ( argc > 1 ) {

        for ( j = 1; j < (size_t)argc; j++ ) {
            errno = 0;

            /* Note that 64 bit systems will have __LP64__ defined
             * and thus __ULONG_MAX is defined to be the very large
             * 64bit value 0xffffffffffffffff and then also that
             * becomes the upper limit for unsigned long type. The
             * 32bit systems will have __ULONG_MAX as 0xffffffffUL
             */
            candidate = (uint64_t)strtoul(argv[j], (char **)NULL, 16);

            if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
                fprintf(stderr,"FAIL : hex integer not understood\n");
                perror("     ");
                return EXIT_FAILURE;
            } else {
                big_int2 = candidate;
            }

            printf("int[%i] = %" PRIu64 " = %" PRIx64 "\n",
                                  j, big_int2, big_int2);

        }

    }
        
    return EXIT_SUCCESS;

}

