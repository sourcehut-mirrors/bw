
/*
 * rump.c  A brief and naive look at the old problem proposed by Rump
 *         in 1988. 
 *
 *    see S.M. Rump, Algorithms for verified inclusions: theory and
 *        practice. In "Reliability in Computing, Perspectives in
 *        Computing", pages 109 - 126, 1988.
 *
 *        A. Cuyt, B. Verdonk, S. Becuwe, and P. Kuterna. 
 *        A remarkable example of catestrophic cancellation unraveled.
 *        "Computing", vol 66: pages 309 - 320, 2001.
 *
 *        E. Loh and G. W. Walster. Rump's example revisited.
 *        "Reliable Computing", vol 8(3), pages 245 - 248, 2002
 *
 *        T. Ogita, S. M. Rump, and S. Oishi.  Accurate sum and dot
 *        product. SIAM Journal on Scientific Computing, vol 26(6),
 *        pages 1955 - 1988, 2005.
 *
 * Simply stated one may compute :
 *
 *        f( a, b ) = 333.75 * b^6
 *
 *                  + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
 *
 *                  + 5.5 * b^8
 *
 *                  + a / ( 2 * b )  where a=77617 and b=33096.
 *               
 * All the coefficients and exponents are perfect binary numbers. The
 * decimal number 333.75 is 101001101.11 in binary. However on an IBM
 * System 370 mainframe the results obtained by Rump were : 
 *
 *       single-precision   1.172603 
 *       double-precision   1.1726039400531
 *       extended-precision 1.172603940053178
 *
 * The correct result is close to -0.8273960599... with a very great
 * many digits required for the actual result. Possibly infinite.
 *
 * -------------------------------------------------------------------
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
#define _XOPEN_SOURCE 600

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <fenv.h>
#pragma STDC FENV_ACCESS ON
#pragma STDC FP_CONTRACT ON
#include <float.h>

long double fp( long double a, long double b);

int main(int argc, char **argv)
{

    /* See page 13 of "The Handbook of Floating Point Arithmetic", 2nd Ed.
     *
     * The actual result should be :
     *
     * $ bc -l
     * scale=48
     * a = 77617
     * b = 33096
     * f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *         + 5.5 * b^8 + ( a / ( 2 * b ) )
     * 
     * -0.827396059946821368141165095479816291999033115785
     * 
     * We will most likely see some other result from IEEE-754 2008 
     * floating point math. 
     *
     * One may attempt the computation with ye olde UNIX dc where the
     * intermediate values may be :
     *
     * e$ echo '48k 333.75  33096 6^ * pq' | dc
     * 438605750846393161930703831040.00
     * 
     * e$ echo '48k 77617 2^  11  77617 2^ * 33096 2^ *  33096 6^
     * >                - 121 33096 4^ * - 2 - * pq' | dc
     * -7917111779274712207494296632228773890
     * 
     * e$ echo '48k 5.5  33096 8^ * pq' | dc
     * 7917111340668961361101134701524942848.0
     * 
     * e$ echo '48k 77617  2 33096 * / pq' | dc
     * 1.172603940053178631858834904520183708000966884215
     * 
     * 
     * e$ echo '48k 438605750846393161930703831040.00
     * >           _7917111779274712207494296632228773890
     * >            7917111340668961361101134701524942848.0
     * >            1.172603940053178631858834904520183708000966884215
     * >      + + + pq' | dc 
     * -.827396059946821368141165095479816291999033115785
     *
     * Seems to work well.
     * 
     */

    long double a, b, f, tmp[12];
    int fp_status, fp_round_mode, fpe_raised;

#ifdef FLT_EVAL_METHOD
    printf ( "INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

    fp_round_mode = fegetround();
    /* printf("DBUG : fp_round_mode = 0x%08x\n", fp_round_mode ); */
    printf("     : fp rounding mode is ");
    switch(fp_round_mode){
        case FE_TONEAREST:
            printf("FE_TONEAREST\n");
            break;
        case FE_TOWARDZERO:
            printf("FE_TOWARDZERO\n");
            break;
        case FE_UPWARD:
            printf("FE_UPWARD\n");
            break;
        case FE_DOWNWARD:
            printf("FE_DOWNWARD\n");
            break;
        default:
            printf("unknown!\n");
            break;
    }

    fp_status = fesetround( FE_TONEAREST );
    assert( fp_status == 0 );

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    a = 77617.0L;
    b = 33096.0L;

    /* fp func test */
    printf( "\nINFO : fp test = %-+32.26Le\n\n", fp( a, b) );
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
    }
    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");


    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    f = 333.75L * powl(b, 6.0L)
                + powl(a, 2.0L)
                   * ( 11.0L * powl(a, 2.0L) * powl(b, 2.0L)
                           - powl(b, 6.0L)
                           - 121.0L * powl(b, 4.0L) - 2.0L )
               + 5.5L * powl(b, 8.0L)
               + (a / (2.0L * b ) );

    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
    }

    printf( "\n     : f = %-+32.26e\n\n", f );
    printf( "INFO : f = -0.827396059946821368141165095 ?\n\n");

    printf( "\n----------- start over slowly -----------\n\n");


    printf("     : clear all floating point exception flags\n");
    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");


    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    tmp[0] = 333.75L * b * b * b * b * b * b;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[0] = 333.75L * b * b * b * b * b * b\n");
    printf("     : tmp[0] = %-+42.36Le\n", tmp[0]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^..tmp[0]..^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) )
     *
     */

    tmp[2] = 11.0L * a * a;

    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[2] = 11.0 * a * a\n");
    printf("     : tmp[2] = %-+42.36Le\n", tmp[2]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");


    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^.. tmp[0].^           ^.tmp[2]
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    tmp[3] = tmp[2] * b * b;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[3] = tmp[2] * b * b\n");
    printf("     : tmp[3] = %-+42.36Le\n", tmp[3]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");


    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^             ^.. tmp[3]...^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) )
     *
     */

    tmp[4] = b * b * b * b * b * b;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[4] = b * b * b * b * b * b\n");
    printf("     : tmp[4] = %-+42.36Le\n", tmp[4]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");


    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^             ^.. tmp[3] ..^   tmp[4]
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    tmp[5] = 121.0L * b * b * b * b;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[5] = 121.0 * b * b * b * b\n");
    printf("     : tmp[5] = %-+42.36Le\n", tmp[5]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4        - 2 )
     *    ^ tmp[0] ^             ^.. tmp[3] ..^   tmp[4]  ^.. tmp[5]^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    tmp[1] = tmp[3] - tmp[4] - tmp[5] - 2.0L;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[1] = tmp[3] - tmp[4] - tmp[5] - 2\n");
    printf("     : tmp[1] = %-+42.36Le\n", tmp[1]);

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^             ^............. tmp[1] .............^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */

    tmp[6] = tmp[1] * a * a;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[6] = tmp[1] * a * a\n");
    printf("     : tmp[6] = %-+44.38Le\n", tmp[6]);
    printf("     : correct=  -7917111779274712207494296608131179134\n");


    printf("WARN : this is a labour of lost bits from here on ...\n\n");

    /* everything from here on is just not going to work even
     * with a 128 bit floating point data type on the right
     * sort of hardware.  We need more bits of precision! */

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^     ^............... tmp[6] ...................^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) ) */


    tmp[7] = 5.5L * b * b * b * b * b * b * b * b;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[7] = 5.5L * b * b * b * b * b * b * b * b\n");
    printf("     : tmp[7] = %-+42.36Le\n", tmp[7]);

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^     ^............... tmp[6] ...................^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) )
     *        ^ tmp[7]^
     *
     *
     */

    /* lets check if powl can do b^8 perfectly *
    tmp[7] = powl( b, 8.0 );
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[7] = powl( b, 8.0 )\n");


    printf("INFO : how borked is powl( b, 8.0 )?\n");
    printf("     : tmp[6] = %-+42.36Le\n", tmp[6]);
    printf("     : tmp[7] = %-+42.36Le\n", tmp[7]);
    if ( ( tmp[6] - tmp[7] ) == 0.0L )
        printf("DBUG : well gee tmp[6] equals tmp[7]\n");
    */

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    tmp[8] = a / ( 2.0L * b );
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[8] = a / ( 2.0L * b )\n");
    printf("     : tmp[8] = %-+42.36Le\n", tmp[8]);

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^     ^............... tmp[6] ...................^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) )
     *        ^ tmp[7]^    ^... tmp[8]...^
     *
     */

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    tmp[9] = tmp[7] + tmp[8];
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[9] = tmp[7] + tmp[8]\n");
    printf("     : tmp[9] = %-+42.36Le\n", tmp[9]);

    /* f= 333.75 * b^6 + a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 )
     *    ^ tmp[0] ^     ^............... tmp[6] ...................^
     *
     *
     *      + 5.5 * b^8 + ( a / ( 2 * b ) )
     *        ^ ....... tmp[9] ..........^
     *
     */


    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }
    printf("\n");

    tmp[10] = tmp[0] + tmp[6] + tmp[9];
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ) {
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
        if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
            printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
        } else {
            printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
            return EXIT_FAILURE;
        }
    } else {
        printf("     : precise result\n");
    }
    printf("     : done tmp[10] = tmp[0] + tmp[6] + tmp[9]\n");
    printf("     : tmp[10] = %-+42.36Le\n", tmp[10]);


    return EXIT_SUCCESS;

}

/* this looks like a cool attempt to squeeze some 
 * precision out of the dark matter of the universe
 * but really ya just can not do that. Sorry. */
long double fp( long double a, long double b)
{
    long double big_num;

    big_num = 333.75L * powl(b, 6.0L)

               + powl(a, 2.0L)
                   * ( 11.0L * powl(a, 2.0L) * powl(b, 2.0L)
                           - powl(b, 6.0L)
                           - 121.0L * powl(b, 4.0L) - 2.0L )

               + 5.5L * powl(b, 8.0L)

               + (a / (2.0L * b ) );

    return big_num;

}

