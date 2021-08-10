
/* mpfr_check_flags.c  helper routine to aid in checking libmpfr flags
 * Copyright (C) Dennis Clarke 2020
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

/*******************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *  An XSI-conforming application should ensure that the feature
 *  test macro _XOPEN_SOURCE is defined with the value 600 before
 *  inclusion of any header. This is needed to enable the
 *  functionality described in The _POSIX_C_SOURCE Feature Test
 *  Macro and in addition to enable the XSI extension.
 *******************************************************************/
#define _XOPEN_SOURCE 600

#include <gmp.h>
#include <mpfr.h>
#include <stdio.h>

int mpfr_check_flags( int mpfr_status, int debug_flag )
{
    /* some mpfr call resulted in a mpfr_status value
     * so lets check the flags and determine if the
     * status should be cleared to zero or not */

    int mpfr_underflow_flag, mpfr_overflow_flag, mpfr_divby0_flag,
        mpfr_nanflag_flag, mpfr_inexflag_flag, mpfr_erangeflag_flag;

    mpfr_underflow_flag = mpfr_underflow_p();
    if ( mpfr_underflow_flag != 0 ){
        printf ("INFO : mpfr_underflow_flag is set.\n" );
        /* treat underflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_overflow_flag = mpfr_overflow_p();
    if ( mpfr_overflow_flag != 0 ){
        printf ("INFO : mpfr_overflow_flag is set.\n" );
        /* treat overflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_divby0_flag = mpfr_divby0_p();
    if ( mpfr_divby0_flag != 0 ){
        printf ("INFO : mpfr_divby0_flag is set.\n" );
        /* divide by zero is definately an error */
        mpfr_status = -1;
    }

    mpfr_nanflag_flag = mpfr_nanflag_p();
    if ( mpfr_nanflag_flag != 0 ){
        printf ("INFO : mpfr_nanflag_flag is set.\n" );
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
        printf ("INFO : mpfr_erangeflag_flag is set.\n" );
        /* treat a range error as a valid error */
        mpfr_status = -1;
    }

    return mpfr_status;

}

