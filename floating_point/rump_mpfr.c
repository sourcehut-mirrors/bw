

/*
 * rump_mpfr.c A look at the Rump(1988) problem with arbitrary precision
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

#include <errno.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#include <string.h>
#include <strings.h>
#include <locale.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

#define PREC 113 /* lowest reasonable precision */
#define VERBOSE 1

int mpfr_check_flags(int status, int debug_flag);

int sysinfo(int VERBOSE);

int main(int argc, char **argv)
{

    long bit_prec = PREC;
    long delta_bit_prec; /* used to increase precision if needed */
    char *endptr, *str;

    setlocale( LC_ALL, "C" );
    sysinfo(VERBOSE);

    mpfr_t t0, t1, t2, t3, t4, t5, t6;

    /* wide mpfr_t variables if needed */
    mpfr_wt tw0, tw1, tw2, tw3, tw4, tw5, tw6;

    delta_bit_prec = 32;

    mpfr_set_default_prec((mpfr_prec_t)bit_prec);
    mpfr_inits2( prec, t0, t1, t2, t3, t4, t5, t6, (mpfr_ptr*) 0 );
    /* we may not need these .. in yer dreams 
    mpfr_inits2( prec, tw0, tw1, tw2, tw3, tw4, tw5, tw6, (mpfr_ptr*) 0 );
    */














    return EXIT_SUCCESS;

}


