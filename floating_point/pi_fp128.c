
/*
 * pi_fp128.c  Demonstrate that some architectures can not process
 *             the standard IEEE754-2008 data types.
 *
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
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{

    long double foobar = 3.14159265358979323846264338327950288419716939937510L;

    printf("the sizeof(foobar) is %i bytes\n", sizeof(long double) );

    printf("\nfoobar is this  3.14159265358979323846264338");
    printf("327950288419716939937510.....\n\n");

    printf("foobar could be %42.38Le\n\n", foobar);

    /* note hex representation of foobar is 
     *   0x4000 0x921f 0xb544 0x42d1 0x8469 0x898c 0xc517 0x01b8 */

    printf("foobar is at address %p\n\n", &foobar);
    for ( int j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&foobar)[j] );

    printf("\n" );

    return EXIT_SUCCESS;

}

