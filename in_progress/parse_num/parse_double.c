
/* parse_double.c  process an input string into a reasonable double
 *                 floating point value and return a flag status
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

#define __STDC_FORMAT_MACROS
#include <errno.h>
#include <fenv.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int parse_double(const char *str, double **dbl )
{

    /* sanity checks */
    if (( str == NULL ) || ( dbl == NULL )) {
        return EXIT_FAILURE;
    }

    if ( strlen(str) == 0 ) {
        return EXIT_FAILURE;
    }

    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);
    double candidate_double = strtod(str, (char **)NULL);
    int fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ){
        /* FP Exception raised */
        if ( fpe_raised & FE_INEXACT ) {
            fprintf(stderr,"WARN : FE_INEXACT exception raised.\n");
        }
    }

    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : double real value not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }

    if ( !isnormal(candidate_double) ) {
        fprintf(stderr,"FAIL : double real coordinate is not normal\n");
        return EXIT_FAILURE;
    }
    feclearexcept(FE_ALL_EXCEPT);

    **dbl = candidate_double;

    return EXIT_SUCCESS;

}

