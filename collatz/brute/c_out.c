
/*
 * c_out.c  Kick out a line of numbers to stdout
 * ------------------------------------------------------------------
 * Copyright (C) Dennis Clarke 2019
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
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
#include <inttypes.h>
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

    printf ("%12" PRIu64 "   %8i",
               cdat->c0, cdat->path_len);

    /* we may have the weird situation where the starting number
     * cdat->c0 is the largest number ever */
    if ( cdat->c0 > cdat->path_height ) {
        cdat->height_location = 0;
    }

    printf("    %6" PRIu64 "    %12" PRIu64,
            cdat->height_location, cdat->path_height);


    /* track hailstones */
    printf("   %8i\n", cdat->upwards_count);

    return EXIT_SUCCESS;

}

