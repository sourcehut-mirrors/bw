
/*
 * rw.c An implementation of the Rabinowitz and Wagon spigot
 *      algorithm to output digits of pi. See pdf in this dir.
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


/* The Computer Language Benchmarks Game
 * https://salsa.debian.org/benchmarksgame-team/benchmarksgame/
 *
 * Contributed by Mr Ledrug
 */

/* /usr/bin/gcc -pipe -Wall -O3 -fomit-frame-pointer
 *      -march=native pidigits.gcc-1-1.c
 *      -o pidigits.gcc_run -lgmp
 */

#include <gmp.h>
#include <stdio.h>
#include <stdlib.h>

mpz_t tmp1, tmp2, acc, den, num;
typedef unsigned int        ui;

ui extract_digit(ui nth) {
    /* joggling between tmp1 and tmp2, so GMP won't have
     * to use temp buffers */
    mpz_mul_ui(tmp1, num, nth);
    mpz_add(tmp2, tmp1, acc);
    mpz_tdiv_q(tmp1, tmp2, den);

    return mpz_get_ui(tmp1);
}

void eliminate_digit(ui d) {
    mpz_submul_ui(acc, den, d);
    mpz_mul_ui(acc, acc, 10);
    mpz_mul_ui(num, num, 10);
}

void next_term(ui k) {
    ui k2 = k * 2U + 1U;

    mpz_addmul_ui(acc, num, 2U);
    mpz_mul_ui(acc, acc, k2);
    mpz_mul_ui(den, den, k2);
    mpz_mul_ui(num, num, k);
}

int main(int argc, char **argv) {
    ui d, k, i;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : enter a number of digits\n");
        return EXIT_FAILURE;
    }

    int n = atoi(argv[1]);

    mpz_init(tmp1);
    mpz_init(tmp2);

    mpz_init_set_ui(acc, 0);
    mpz_init_set_ui(den, 1);
    mpz_init_set_ui(num, 1);

    for (i = k = 0; i < n;) {
        next_term(++k);

        if (mpz_cmp(num, acc) > 0)
            continue;

        d = extract_digit(3);

        if (d != extract_digit(4))
            continue;

        putchar('0' + d);
        ++i;
        /*   if (++i % 10 == 0)
         *    printf("\t:%u\n", i);  */
        eliminate_digit(d);
    }

    return EXIT_SUCCESS;

}

