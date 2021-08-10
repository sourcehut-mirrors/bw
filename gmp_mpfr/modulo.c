
/* modulo.c  Demonstrate modulo integer computation with a check for
 *           correct result. 
 *
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

#include <errno.h>
#include <inttypes.h>
#include <locale.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include <gmp.h>

int sysinfo(int verbose);

int main(int argc, char *argv[])
{

    setlocale( LC_ALL, "C" );
    sysinfo(1);

    printf("GMP  library version : %d.%d.%d\n\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    mpz_t t;
    mpz_init(t);
    mpz_t tt;
    mpz_init(tt);
    mpz_t ttt;
    mpz_init(ttt);

    mpz_t result_check, expected_result;
    mpz_init(result_check);
    mpz_init(expected_result);

    mpz_set_str( tt,
"25975415027868818028037643145183730078267964363630309107863975221668725232906664910091356673487591948237515304861352649057814029879720636142810833722202669061030484458925649047021859875730105532595466846094449735851132072400310565642", 10);

    mpz_set_str(t, "6864797660130609714981900799081393217269435300143305409394463459185543183397655394245057746333217197532963996371363321113864768612440380340372808892707005449", 10);

    mpz_mod(ttt, tt, t);

    printf("tt = ");
    gmp_printf("%Zd", tt);
    printf("\n");

    printf("t = ");
    gmp_printf("%Zd", t);
    printf("\n");

    printf("ttt = ");
    gmp_printf("%Zd", ttt);
    printf("\n");


    mpz_set_str(expected_result,
            "5247183143879283565064056089869553515440215252945038779070795247972433237341511292686962488915110675351673985513318500576097977116134885013371639187873069514", 10);


    mpz_sub(result_check, expected_result, ttt);
    printf("\n check the diff on the expected result = ");
    gmp_printf("%Zd",result_check);
    printf("\n");


    mpz_clear(t);
    mpz_clear(tt);
    mpz_clear(ttt);

    mpz_clear(expected_result);
    mpz_clear(result_check);

    return EXIT_SUCCESS;

}

