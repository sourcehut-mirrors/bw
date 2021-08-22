/*
 * cube_roots.c  RFC-4634 section 5.2 states : 
 * SHA-384 and SHA-512 use the same sequence of eighty constant 64-bit
 * words, K0, K1, ... K79.  These words represent the first sixty-four
 * bits of the fractional parts of the cube roots of the first eighty
 * prime numbers.  In hex, these constant words are as follows (from
 * left to right):
 *
 * 428a2f98d728ae22 7137449123ef65cd b5c0fbcfec4d3b2f e9b5dba58189dbbc
 * 3956c25bf348b538 59f111f1b605d019 923f82a4af194f9b ab1c5ed5da6d8118
 * d807aa98a3030242 12835b0145706fbe 243185be4ee4b28c 550c7dc3d5ffb4e2
 * 72be5d74f27b896f 80deb1fe3b1696b1 9bdc06a725c71235 c19bf174cf692694
 * e49b69c19ef14ad2 efbe4786384f25e3 0fc19dc68b8cd5b5 240ca1cc77ac9c65
 * 2de92c6f592b0275 4a7484aa6ea6e483 5cb0a9dcbd41fbd4 76f988da831153b5
 * 983e5152ee66dfab a831c66d2db43210 b00327c898fb213f bf597fc7beef0ee4
 * c6e00bf33da88fc2 d5a79147930aa725 06ca6351e003826f 142929670a0e6e70
 * 27b70a8546d22ffc 2e1b21385c26c926 4d2c6dfc5ac42aed 53380d139d95b3df
 * 650a73548baf63de 766a0abb3c77b2a8 81c2c92e47edaee6 92722c851482353b
 * a2bfe8a14cf10364 a81a664bbc423001 c24b8b70d0f89791 c76c51a30654be30
 * d192e819d6ef5218 d69906245565a910 f40e35855771202a 106aa07032bbd1b8
 * 19a4c116b8d2d0c8 1e376c085141ab53 2748774cdf8eeb99 34b0bcb5e19b48a8
 * 391c0cb3c5c95a63 4ed8aa4ae3418acb 5b9cca4f7763e373 682e6ff3d6b2b8a3
 * 748f82ee5defb2fc 78a5636f43172f60 84c87814a1f0ab72 8cc702081a6439ec
 * 90befffa23631e28 a4506cebde82bde9 bef9a3f7b2c67915 c67178f2e372532b
 * ca273eceea26619c d186b8c721c0c207 eada7dd6cde0eb1e f57d4f7fee6ed178
 * 06f067aa72176fba 0a637dc5a2c898a6 113f9804bef90dae 1b710b35131c471b
 * 28db77f523047d84 32caab7b40c72493 3c9ebe0a15c9bebc 431d67c49c100d4c
 * 4cc5d4becb3e42b6 597f299cfc657e2a 5fcb6fab3ad6faec 6c44198c4a475817
 *
 * This is a hack attempt to generate those from floating point data.
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

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <math.h>

int main(int argc, char *argv[]) 
{

    double cuberoot = 0.0;
    long double cuberoot_ld = 0.0L;
    int j = 0;

    /* prime numbers to use */
    int p[80] = {   2,   3,   5,   7,  11,  13,  17,  19,  23,  29,
                   31,  37,  41,  43,  47,  53,  59,  61,  67,  71,
                   73,  79,  83,  89,  97, 101, 103, 107, 109, 113,
                  127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
                  179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
                  233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
                  283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
                  373, 379, 383, 389, 397, 401, 409, 419, 421, 431 };

    char *buf = setlocale ( LC_ALL, "POSIX" );
    if ( buf == NULL ) {
       fprintf (stderr,"FAIL : setlocale fail\n");
       return EXIT_FAILURE;
    }

    /* Why the 64-bit double precision data type fails.
     * -----------------------------------------------------------------
     *
     * note that with gdb we can examine the memory for the double
     * precision cube root of 2 : 
     *
     * (gdb) print cuberoot
     * $1 = 1.2599210498948732
     * (gdb) print &cuberoot
     * $2 = (double *) 0x7fffffffe7a8
     * (gdb) x/8xb 0x7fffffffe7a8
     * 0x7fffffffe7a8: 0x8b 0x72 0x8d 0xf9 0xa2 0x28 0xf4 0x3f
     *
     * However we see RFC-4634 section 5.2 states that 428a2f98d728ae22
     * is the fractional part of the cube root of 2.
     *
     * Clearly we will never get the bits we need from a 64-bit double
     * precision data type. Even worse, there are only 53 data bits in
     * IEEE-754(2008) double precision type.
     *
     */

    printf ("\n---------------- 64-bit double type ---------------\n");
    for ( j=0; j<80; j++ ) {
        cuberoot = exp(log((double)p[j])/3.0);
        printf ("  %3i    %-28.20e\n", p[j], cuberoot);
    }

    printf ("---------------------------------------------------\n");
    /* note that Intel and AMD64 x86 hardware can not handle
     * the IEEE-754(2008) floating point standard. We are lucky
     * if we get 80 bits from that trash. Use gdb to confirm
     * that a large chunk of the long double data type is just
     * empty zero bits that mean nothing and provide nothing.
     * To be as clear as possible the 80-bit x86 "extended"
     * precision data type in not in the IEEE-754 standard at
     * all. We just can not expect to get reasonable bits out
     * of memory on x86 style hardware. Just give up and get
     * a decent risc machine that can do IEEE-754 floating
     * point in the correct 128-bit datatype.
     */
    for ( j=0; j<80; j++ ) {
        cuberoot_ld = expl(logl((long double)p[j])/3.0L);
        printf ("  %3i    %-40.32Le\n", p[j], cuberoot_ld);
    }

    return EXIT_SUCCESS;

}

