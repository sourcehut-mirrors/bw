

/*
 * pr_mpfr_quiet.c Pollard Rho Algorithm with arbitrary precision.
 *                 Less verbose output here unless you ask for it.
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
#include "mpfr.h"

int mpfr_check_flags( int mpfr_status, int debug_flag )
{
    /* some mpfr call resulted in a mpfr_status value
     * so lets check the flags and determine if the
     * status should be cleared to zero or not */

    int mpfr_underflow_flag, mpfr_overflow_flag, mpfr_divby0_flag,
        mpfr_nanflag_flag, mpfr_inexflag_flag, mpfr_erangeflag_flag;

    mpfr_underflow_flag = mpfr_underflow_p();
    if ( mpfr_underflow_flag != 0 ){
        if ( debug_flag ) printf ("INFO : mpfr_underflow_flag is set.\n" );
        /* treat underflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_overflow_flag = mpfr_overflow_p();
    if ( mpfr_overflow_flag != 0 ){
        if ( debug_flag ) printf ("INFO : mpfr_overflow_flag is set.\n" );
        /* treat overflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_divby0_flag = mpfr_divby0_p();
    if ( mpfr_divby0_flag != 0 ){
        if ( debug_flag ) printf ("INFO : mpfr_divby0_flag is set.\n" );
        /* divide by zero is definately an error */
        mpfr_status = -1;
    }

    mpfr_nanflag_flag = mpfr_nanflag_p();
    if ( mpfr_nanflag_flag != 0 ){
        if ( debug_flag ) printf ("INFO : mpfr_nanflag_flag is set.\n" );
        /* a NaN may not be an error condition */
        mpfr_status = 0;
    }

    mpfr_inexflag_flag = mpfr_inexflag_p();
    if ( mpfr_inexflag_flag != 0 ){
        /* a computation was not exact */
        if (debug_flag) fprintf (stderr,"WARN : mpfr_inexflag_flag is set.\n");
        mpfr_status = -1;
    }

    mpfr_erangeflag_flag = mpfr_erangeflag_p();
    if ( mpfr_erangeflag_flag != 0 ){
        if ( debug_flag ) printf ("INFO : mpfr_erangeflag_flag is set.\n" );
        /* treat a range error as a valid error */
        mpfr_status = -1;
    }

    return mpfr_status;

}

