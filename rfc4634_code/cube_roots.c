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

    double frac, cuberoot = 0.0;
    long double frac_ld, cuberoot_ld = 0.0L;
    int j = 0;
    int k = 0;

    /* prime numbers to use */
    int p[80] = {   2,   3,   5,   7,  11,  13,  17,  19,  23,  29,
                   31,  37,  41,  43,  47,  53,  59,  61,  67,  71,
                   73,  79,  83,  89,  97, 101, 103, 107, 109, 113,
                  127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
                  179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
                  233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
                  283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
                  373, 379, 383, 389, 397, 401, 409, 419, 421, 431 };

    /* this is clunky but gets the job done.
     *
     * our reference list of hex prime fractions as described
     * in the comments above. */
    char **hpf = (char *[]) {
             "428A2F98D728AE22", "7137449123EF65CD", "B5C0FBCFEC4D3B2F",
             "E9B5DBA58189DBBC", "3956C25BF348B538", "59F111F1B605D019",
             "923F82A4AF194F9B", "AB1C5ED5DA6D8118", "D807AA98A3030242",
             "12835B0145706FBE", "243185BE4EE4B28C", "550C7DC3D5FFB4E2",
             "72BE5D74F27B896F", "80DEB1FE3B1696B1", "9BDC06A725C71235",
             "C19BF174CF692694", "E49B69C19EF14AD2", "EFBE4786384F25E3",
             "0FC19DC68B8CD5B5", "240CA1CC77AC9C65", "2DE92C6F592B0275",
             "4A7484AA6EA6E483", "5CB0A9DCBD41FBD4", "76F988DA831153B5",
             "983E5152EE66DFAB", "A831C66D2DB43210", "B00327C898FB213F",
             "BF597FC7BEEF0EE4", "C6E00BF33DA88FC2", "D5A79147930AA725",
             "06CA6351E003826F", "142929670A0E6E70", "27B70A8546D22FFC",
             "2E1B21385C26C926", "4D2C6DFC5AC42AED", "53380D139D95B3DF",
             "650A73548BAF63DE", "766A0ABB3C77B2A8", "81C2C92E47EDAEE6",
             "92722C851482353B", "A2BFE8A14CF10364", "A81A664BBC423001",
             "C24B8B70D0F89791", "C76C51A30654BE30", "D192E819D6EF5218",
             "D69906245565A910", "F40E35855771202A", "106AA07032BBD1B8",
             "19A4C116B8D2D0C8", "1E376C085141AB53", "2748774CDF8EEB99",
             "34B0BCB5E19B48A8", "391C0CB3C5C95A63", "4ED8AA4AE3418ACB",
             "5B9CCA4F7763E373", "682E6FF3D6B2B8A3", "748F82EE5DEFB2FC",
             "78A5636F43172F60", "84C87814A1F0AB72", "8CC702081A6439EC",
             "90BEFFFA23631E28", "A4506CEBDE82BDE9", "BEF9A3F7B2C67915",
             "C67178F2E372532B", "CA273ECEEA26619C", "D186B8C721C0C207",
             "EADA7DD6CDE0EB1E", "F57D4F7FEE6ED178", "06F067AA72176FBA",
             "0A637DC5A2C898A6", "113F9804BEF90DAE", "1B710B35131C471B",
             "28DB77F523047D84", "32CAAB7B40C72493", "3C9EBE0A15C9BEBC",
             "431D67C49C100D4C", "4CC5D4BECB3E42B6", "597F299CFC657E2A",
             "5FCB6FAB3AD6FAEC", "6C44198C4A475817" };

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

    printf ("\nExpect this to fail terribly as we lose precision\n");
    printf ("---------------- 64-bit double type ---------------\n");
    printf ("    p    64-bit cube root                Reference Hex       Computed Hex\n");
    printf ("-------------------------------------------------------------------------\n");
    for ( j=0; j<8; j++ ) {
        cuberoot = exp(log((double)p[j])/3.0);
        printf ("  %3i    %-28.20e    %s    ", p[j], cuberoot, hpf[j]);
        frac = ( cuberoot - floor(cuberoot) ) * 16.0;
        /* printf ("\n\n            frac = %-28.20e\n\n", frac); */
        for ( k=0; k<16; k++ ) {
            /* printf ("\n\n            %i        %i\n",k,(int)frac); */
            printf ("%1X", (int)frac);
            frac = frac - floor(frac);
            frac = frac * 16.0;
        }
        printf ("\n");
    }

    printf ("\nIf you are on x86 hardware this may not work.\n");
    printf ("---------------- 128-bit double type? -------------\n");
    printf ("    p    128-bit cube root                           Reference Hex       Computed Hex\n");
    printf ("-----------------------------------------------------------------------------------------\n");
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
    for ( j=0; j<8; j++ ) {
        cuberoot_ld = expl(logl((long double)p[j])/3.0L);
        printf ("  %3i    %-40.32Le    %s    ", p[j], cuberoot_ld,hpf[j]);

        frac_ld = ( cuberoot_ld - floorl(cuberoot_ld) ) * 16.0L;
        for ( k=0; k<16; k++ ) {
            printf ("%1X", (int)frac_ld);
            frac_ld = frac_ld - floorl(frac_ld);
            frac_ld = frac_ld * 16.0L;
        }
        printf ("\n");
    }

    return EXIT_SUCCESS;

}

