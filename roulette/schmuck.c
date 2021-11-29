
/*
 * schmuck.c Simulate the gambling schmuck described in the readme
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

#include <errno.h>
#include <locale.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stddef.h>

/* Note : the american style double zero wheel has numbers 
 *        arranged thus : 
 *         0 28  9 26 30 11  7 20 32 17  5 22 34 15  3 24 36 13  1
 *        00 27 10 25 29 12  8 19 31 18  6 21 33 16  4 23 35 14  2
 *
 * The layout generally looks like this : 

    -------------------------------------------------------------+
   / |    |    |    |    |    |    |    |    |    |    |    |    |
  /  | 3r | 6b | 9r | 12r| 15b| 18r| 21r| 24b| 27r| 30r| 33b| 36r|
 /   |    |    |    |    |    |    |    |    |    |    |    |    |
+ 00 +----+----+----+----+----+----+----+----+----+----+----+----+
|    |    |    |    |    |    |    |    |    |    |    |    |    |
+----+ 2b | 5r | 8b | 11b| 14r| 17b| 20b| 23r| 26b| 29b| 32r| 35b|
|    |    |    |    |    |    |    |    |    |    |    |    |    |
+  0 +----+----+----+----+----+----+----+----+----+----+----+----+
 \   |    |    |    |    |    |    |    |    |    |    |    |    |
  \  | 1r | 4b | 7r | 10b| 13b| 16r| 19r| 22b| 25r| 28b| 31b| 34r|
   \ |    |    |    |    |    |    |    |    |    |    |    |    |
    -------------------------------------------------------------+

 */

#define BANKROLL 2000
#define WALK     1000
#define BET      5

double genrand();

#define VERBOSE 1
int sysinfo(int verbose);

int main (int argc, char **argv) { 

    setlocale( LC_ALL, "C" );
    sysinfo(VERBOSE);

    /* The ball[] array is a record of the number of times that the 
     * roulette wheel ball lands on a given number with ball[0] being
     * the single 0 and ball[1] being the double 00.  Therefore we
     * have thirty eight possible places the ball can land.
     */
    uint32_t ball[38];

    /* This next array lets us know what colour the ball 
     * had landed on top of.  A zero indicates black and a one
     * indicates red colour.  The zero and double zero are 
     * usually green in colour and we don't need to worry about
     * them unless we land on them of course.  This array starts
     * at the number one and goes up to thirty six.
     *
     * The table seems to be laid out in a simple X pattern made
     * of red coloured squares within a three by three box of
     * numbers and this pattern is repeated four times. That would
     * result in too many red squares because each three by three
     * pattern has five reds and four blacks.  Thus the numbers
     * ten and twenty eight are both made black to even out the
     * distribution.
     *
     * We may represent the colour data with 0x0aa956aa55h in a
     * single 64-bit uint_t datatype. The bit pattern is :
     *
     *    1010 1010 1001 0101 0110 1010 1010 0101 0101
     *
     * A 1 represents red and 0 for black.
     */
    static uint8_t colour_data[36] = { 
            1,       0,       1, 
            0,       1,       0,
            1,       0,       1,

            0,       0,       1, 
            0,       1,       0,
            1,       0,       1,

            1,       0,       1, 
            0,       1,       0,
            1,       0,       1,

            0,       0,       1, 
            0,       1,       0,
            1,       0,       1
    };

    uint32_t bankroll = BANKROLL;
    uint32_t bankroll_start = bankroll;
    uint32_t profit_limit = WALK;
    uint32_t bet = BET;

    uint32_t n_even, n_odd, n_red, n_black, n_zero, colour_flag;
    uint32_t iteration_count, i, j, k;
    /* FILE   *fp;   maybe use /dev/random someday */
    double rval;

    /* some hard coded nutty number */
    uint32_t max_spin;

    /* check if a max_spin parameter was on the command line */
    if ( argc > 1 ) {

        char *str, *endptr;
        /* note that doing a conversion to a long really will
         * cause issues with a 32-bit uint32_t value. So we
         * need an intermediate. Also the errno may not work
         * at all. */
        str = argv[1];
        long max_spin_l = strtol(str, &endptr, 10);
        errno = 0;
        if ( ( (errno == ERANGE) &&
                   ( (max_spin_l == LONG_MAX) || (max_spin_l == LONG_MIN) ) 
             ) || (errno != 0 && max_spin_l == 0) ) {
            perror("FAIL : strtol could not parse spin max");
            goto assume_max;
        }

        if (endptr == str) {
            fprintf(stderr, "No valid spin max seen.\n");
            goto assume_max;
        }

        if (*endptr != '\0'){ /* Not necessarily an error... */
            fprintf(stderr,"INFO : Further characters after");
            fprintf(stderr," spin max ignored : %s\n", endptr);
        }

        if ((max_spin_l>255)||(max_spin_l<10)){
            printf("WARN : try a reasonable number.\n");
            goto assume_max;
        }
        max_spin = (uint32_t)max_spin_l;

    } else {
assume_max:
        max_spin = 100;
        printf("We shall assume max_spin = 100\n");
    }

    /* TODO remove this */
    max_spin = 1000;

    printf("\n-----------------------------------------\n");
    printf("      :    Bank roll = %5i\n", bankroll);
    printf("      :          bet = %5i\n", bet);
    printf("      : profit limit = %5i\n", profit_limit);
    printf("      :     Max Spin = %5i\n\n", max_spin);

    /*
       This is a simple experiment with a fixed betting pattern where we
       cover off 35 crazy numbers on the table.

       See the readme to understand how bonkers this is.

       We will use a software PRNG genrand() which is repeatable for now.

       if ( ( fp = fopen( "/dev/random", "r" ) ) == NULL ) {
           fprintf ( stderr, "%s: can't read read from /dev/random \n", argv[0] );
           fprintf ( stderr, "%s: ABORTING\n", argv[0] );
           perror ( (char *)NULL );
           return ( EXIT_FAILURE );
       }
     */

    /* zero the ball counts */
    for ( i = 0; i < 38; ++i )
        ball[i] = 0;

    iteration_count = 0;
    n_odd = 0;
    n_even = 0;
    n_red = 0;
    n_black = 0;
    n_zero = 0;

    for ( i = 0; i < max_spin; ++i ) {

        iteration_count += 1;

        /* do not use /dev/random 
         *    j = getc(fp);
         *    printf ( "     %5i is 0x%02xh = %3i", i, j, j );
         *    rval = ( (double) j / (double) 256.0 );
         */

        /* get rval from M. Matsumoto TT800 in genrand() */
        rval = genrand();
        printf("%-04i   %11.8f", iteration_count, rval);
        k = (int)(rval * 38.0);
        printf("    k = %2i", k);

        ball[k] += 1;

        /* so long as we didn't end up on a 0 or 00 then
         * we must be even or odd as well as red or black 
         */
        if ( k > 1 ) { /* values 0 and 1 represent the zeros */
            /* adjust the k value for a reasonable number
             * the is not a 0 or 00 */
            k = k-1;
            printf("  --> slot %2i", k);
            if (k%2) {
                n_odd += 1;
                printf("  odd ");
            } else {
                n_even += 1; 
                printf(" even ");
            }

            /* black or red ? */
            if ( colour_data[k-1] > 0 ) {
                n_red += 1;
                printf("    red");
            } else {
                n_black += 1;
                printf("  black");
            }

        } else {
            /* the ball landed on a 0 or 00 */
            n_zero += 1;
            if (k) {
                printf("  --> slot 00");
            } else {
                printf("  --> slot  0");
            }
            printf("        green");
        }
        printf("\n");

        /* TODO perform the schmuck betting results */
    }

    /* print out the number of times the ball landed on each number */
    printf ( "\n\nIterations = %5i\n", iteration_count );
    printf ( "     0 = %5i     %11.8f\n", ball[0],
             ( (float) 1.0 * ball[0] / ( (float) 1.0 * iteration_count ) ) );
    printf ( "    00 = %5i     %11.8f\n", ball[1],
             ( (float) 1.0 * ball[1] / ( (float) 1.0 * iteration_count ) ) );
    for ( i = 2; i < 38; ++i )
        printf ( "    %2i = %5i     %11.8f\n",  ( i - 1 ), ball[i],
             ( (float) 1.0 * ball[i] / ( (float) 1.0 * iteration_count ) ) );

    /* what was the distribution of even and odds ? */
    printf ( "\n   odd = %5i     %11.8f\n", n_odd, 
             ( (float) 1.0 * n_odd   / ( (float) 1.0 * iteration_count ) ) );
    printf ( "  even = %5i     %11.8f\n", n_even, 
             ( (float) 1.0 * n_even  / ( (float) 1.0 * iteration_count ) ) );

    /* what was the distribution of red and black ? */
    printf ( "\n   red = %5i     %11.8f\n", n_red, 
             ( (float) 1.0 * n_red   / ( (float) 1.0 * iteration_count ) ) );
    printf ( " black = %5i     %11.8f\n", n_black, 
             ( (float) 1.0 * n_black / ( (float) 1.0 * iteration_count ) ) );


    return EXIT_SUCCESS;

}

