
/*
 * gcd_mpfr.c  Trivial GCD with MPFR
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <mpfr.h>

int gcd_mpfr(mpfr_t *a_in, mpfr_t *b_in, mpfr_t *g_in)
{
    int inex, loop = 0;
    mpfr_t rem_m, a, b, g; /* remainder */
    mpfr_inits(rem_m, a, b, g, (mpfr_ptr) NULL);
    inex = mpfr_set(a, *a_in, MPFR_RNDN);
    inex = mpfr_set(b, *b_in, MPFR_RNDN);
    inex = mpfr_set(g, *g_in, MPFR_RNDN);
    while ( mpfr_zero_p(b) == 0 ) {
        inex = mpfr_fmod(rem_m, a, b, MPFR_RNDN);
        inex = mpfr_set(a, b, MPFR_RNDN);
        inex = mpfr_set(b, rem_m, MPFR_RNDN);
    }
    inex = mpfr_set(*g_in, a, MPFR_RNDN);
    mpfr_clears (rem_m, a, b, g, (mpfr_ptr) 0);
    return EXIT_SUCCESS;
}

