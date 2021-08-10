
/*
 * c_out.c  Kick out a line of numbers to stdout
 * Copyright (C) Dennis Clarke 2021
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
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

/* there should be no reason to need this anymore 
 *   #define __STDC_FORMAT_MACROS
 */
#include <inttypes.h>

#include "collatz.h"

/* note that it would be evil to call this cout */
int c_out(collatz_type *cdat) 
{

    printf ("%12" PRIu64 "   %8" PRIu64,
               cdat->c0, cdat->path_len);

    /* we may have the weird situation where the starting number
     * cdat->c0 is the largest number ever */
    if ( cdat->c0 > cdat->path_height ) {
        cdat->height_location = 0;
    }

    printf("    %6" PRIu64 "    %16" PRIu64,
            cdat->height_location, cdat->path_height);


    printf("   %8" PRIu64 "\n", cdat->upwards_count);

    return EXIT_SUCCESS;

}

