
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
#include <time.h>
#include <unistd.h>

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

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

 * also yes it did take me some time to get that to fit in
 * a width of 72 columns or less.
 */

#define BANKROLL 2000
/* When do we walk away from the roulette table?
 * If there is a loss or gain by X amount. */
#define WALKAWAY 500
#define BET      5

double genrand(void);

#define VERBOSE 1
int sysinfo(int verbose);

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

int main (int argc, char **argv) { 

    uint64_t colour_mask, colour_flag;
    uint64_t one = 1;

    struct timespec time_start, time_end, time_now;
    uint64_t total_time;
    char *c_time_string = NULL;
    int drand48_flag = 0;

    uint32_t bankroll = BANKROLL;
    uint32_t bankroll_start = bankroll;
    uint32_t criteria = WALKAWAY;
    uint32_t bet = BET;

    uint32_t n_even, n_odd, n_red, n_black, n_zero;
    uint32_t iteration_count, i;
    uint32_t slot;
    /* FILE   *fp;   maybe use /dev/random someday */
    double rval;

    /* maximum times a player will stand around like an idiot
     * and watch the roulette wheel spin for them */
    uint32_t max_spin;

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    /* The ball[] array is a record of the number of times that the
     * roulette wheel ball lands on a given number with ball[0]
     * being the single 0 and ball[1] being the double 00. Therefore
     * we have thirty eight possible places the ball can land. */
    uint32_t ball[38];

    /* This next array lets us know what colour the ball had landed
     * on top of.  A zero indicates black and a one indicates red
     * colour. The zero and double zero are usually green. This array
     * starts at the number one and goes up to thirty six.
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
     * A 1 represents red and 0 for black however it would be
     * perhaps obscure to mess around with bit masks just to 
     * determine the colour the ball lands on. It would work of
     * course and perhaps something like this :
     *
     *     bit_flag = (uint64_t)0x0AA956AA55h;
     *     colour = bit_flag & ( 1 << ( slot_number - 1 ) );
     *
     * That would only make sense for slot_number from 1 to 36.
     * However the bit pattern is in reverse order. The bit3 is
     * not representing the colour of slot 3 which is red. Bit3
     * is in the least most four bits and they should be colour
     * data for the numbers 33 upwards to 36. We need to reverse
     * the bit order : 
     *
     * hex   A    A    5    5    6    A    9    5    5
     *    1010 1010 0101 0101 0110 1010 1001 0101 0101
     *    ^                    ^        ^            ^
     *    |                    |        |            bit0
     *    |                    |        bit11        slot1
     *    |                    bit18    slot12
     *    bit35                slot19
     *    slot36
     *
     * Above we see that bit35 will represent the red 36 and
     * bit18 is for red 19. This makes for a trivial bit mask
     * thus :
     *
     *     bit_flag = (uint64_t)0x0AA556A955h
     *     colour = bit_flag & ( 1 << ( slot_number - 1 ) );
     *
     * The question on the table ( pun intended ) would be
     * why do such a thing?  Just for fun I guess.
     */

    static uint64_t bit_flag = 0x0aa556a955;

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
        if ( ( ( errno == ERANGE ) &&
                   ( ( max_spin_l == LONG_MAX ) 
                     ||
                     ( max_spin_l == LONG_MIN ) ) 
             ) || ( ( errno != 0 ) && ( max_spin_l == 0 ) ) ) {
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

        if ( ( max_spin_l > 255 ) || ( max_spin_l < 10 ) ){
            printf("WARN : try a reasonable number.\n");
            goto assume_max;
        }
        max_spin = (uint32_t)max_spin_l;

    } else {
assume_max:
        max_spin = 100;
        printf("We shall assume max_spin = 100\n");
        printf("--------------------------------------------------\n");
        printf("Usage : %s max_spin PRNG\n", argv[0]);
        printf("      : where max_spin<=100 and PRNG = 0|1\n");
        printf("--------------------------------------------------\n");
    }

    printf("\n-----------------------------------------\n");
    printf("      :    Bank roll = %5i\n", bankroll);
    printf("      :          bet = %5i\n", bet);
    printf("      : walk away at = %5i\n", criteria);
    printf("      :     Max Spin = %5i\n\n", max_spin);

    /*
       This is a simple experiment with a fixed betting pattern where we
       cover off 36 crazy numbers on the table.

       See the readme to understand how bonkers this is.

       In fact, it is stupid to think that roulette can ever be played
       with such a fashion as to win. Ever. Period. Regardless of what
       some casino may tell you.

       We may use a software PRNG genrand() or we may use srand48/drand48
       where the user can choose with a trivial option on the command line.

       At some point in the future we may even read from /dev/random however
       I do not know how portable that is. For example this would fail on
       an old old Sun SPARCStation 20 :

       if ( ( fp = fopen( "/dev/random", "r" ) ) == NULL ) {
           fprintf ( stderr, "%s: can't read read from /dev/random \n", argv[0] );
           fprintf ( stderr, "%s: ABORTING\n", argv[0] );
           perror ( (char *)NULL );
           return ( EXIT_FAILURE );
       }
     */

    /* get the timenow and use the nanoseconds data as a seed
     * for the srand48/drand48 PRNG */
    if ( clock_gettime(CLOCK_REALTIME, &time_now) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    /* if the user wants to use drand48 as the PRNG then they may
     * simply append a parameter on the command line. Any damn thing
     * as the third parameter will work. */
    if ( argc > 2 ) {
        drand48_flag=1;
        c_time_string = ctime(&time_now.tv_sec);
        printf("INFO : current time is %s", c_time_string);
        /* call srand48() with the sub-second time data */
        srand48((long)time_now.tv_nsec);
        printf("INFO : srand48() seed done.\n\n");
    }

    /* zero the ball counts */
    for ( i = 0; i < 38; ++i ) {
        ball[i] = 0;
    }

    iteration_count = 0;
    n_odd = 0;
    n_even = 0;
    n_red = 0;
    n_black = 0;
    n_zero = 0;

    if ( clock_gettime(CLOCK_REALTIME, &time_start) == -1 ) {
        /* We could not get the clock. Bail out.
         * However no way could this happen given that we already
         * asked for the time earlier. Whatever. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    for ( i = 0; i < max_spin; ++i ) {
           
        /* no matter what we do we bet 36 chips */
        if ( ( ( (int)bankroll - (int)bet*36 ) > 0 )
            &&
             ( (int)bankroll > ( (int)bankroll_start - (int)criteria ) )
                 ) {
        
            bankroll = bankroll - 36 * bet;

            iteration_count += 1;
    
            /* Do we use the M. Matsumoto TT800 genrand() Mersenne Twister
             * or drand48?
             *
             * Only the drand48_flag knows for sure. */
            rval = drand48_flag ? drand48() : genrand();
            printf("%-04i   %11.8f", iteration_count, rval);
            slot = (uint32_t)(rval * 38.0);
            printf(" rval = %2i", slot);
    
            ball[slot] += 1;
    
            /* so long as we didn't end up on a 0 or 00 then
             * we must be even or odd as well as red or black */
            if ( slot > 1 ) { 
                /* adjust the slot value for a reasonable number
                 * the is not a 0 or 00 */
                slot = slot - 1;
                printf("  --> slot %2i", slot);
                if (slot%2) {
                    n_odd += 1;
                    printf("  odd ");
                } else {
                    n_even += 1; 
                    printf(" even ");
                }
    
                /* black or red ? */
                colour_mask = one<<(slot-1);
                colour_flag = bit_flag&colour_mask;
    
                if ( colour_flag > 0 ) {
                    n_red += 1;
                    printf("    red");

                    /* player gets a split 17:1 and may pull back their
                     * split bet chip */
                    bankroll = bankroll + bet + 17 * bet;

                } else {
                    n_black += 1;
                    printf("  black");

                    /* player gets a split 17:1 and a straight 35:1
                     * and also the player may pull back their straight
                     * bet chip and also the split bet chip */
                    bankroll = bankroll + 2 * bet + 52 * bet;
                }
    
            } else {
                /* The ball landed on a 0 or 00 */
                n_zero += 1;
                if (slot) {
                    printf("  --> slot 00");
                } else {
                    printf("  --> slot  0");
                }
                printf("        green");
            }
            printf("    bank %4i\n", bankroll);

        } else {
            /* very likely we have a loss beyond the criteria */
            printf("BANKROLL is now %i\n", bankroll);
            goto bail_out;
        }

        if  ((int)bankroll > ( (int)bankroll_start + (int)criteria )){
            printf("BANKROLL is now %i\n", bankroll);
            goto bail_out;
        }
    }

bail_out:

    if ( clock_gettime(CLOCK_REALTIME, &time_end) == -1 ) {
        /* this should never happen. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    /* print out the number of times the ball landed on each number */
    printf ( "\n\nIterations = %5i\n", iteration_count );
    printf ( "     0 = %5i     %11.8f\n", ball[0],
             ( 1.0 * ball[0] / ( 1.0 * iteration_count ) ) );
    printf ( "    00 = %5i     %11.8f\n", ball[1],
             ( 1.0 * ball[1] / ( 1.0 * iteration_count ) ) );

    for ( i = 2; i < 38; ++i ) {
        printf ( "    %2i = %5i     %11.8f\n",  ( i - 1 ), ball[i],
             ( 1.0 * ball[i] / ( 1.0 * iteration_count ) ) );
    }

    /* how many zeros ? */
    printf ( "\n zeros = %5i     %11.8f\n", n_zero,
          ( 1.0 * n_zero / ( 1.0 * iteration_count ) ) );

    /* what was the distribution of even and odds ? */
    printf ( "   odd = %5i     %11.8f\n", n_odd, 
             ( 1.0 * n_odd  / ( 1.0 * iteration_count ) ) );
    printf ( "  even = %5i     %11.8f\n", n_even, 
             ( 1.0 * n_even / ( 1.0 * iteration_count ) ) );

    /* what was the distribution of red and black ? */
    printf ( "\n   red = %5i     %11.8f\n", n_red, 
             ( 1.0 * n_red   / ( 1.0 * iteration_count ) ) );
    printf ( " black = %5i     %11.8f\n", n_black, 
             ( 1.0 * n_black / ( 1.0 * iteration_count ) ) );


    total_time = timediff( time_start, time_end );
    printf ( "\n Total time = %" PRIu64 " nsec =  %11.8f secs\n",
                 total_time, ( 1.0 * total_time )/1.0E9);

    printf("\n-----------------------------------------\n");
    printf("      :    Bank roll = %5i\n", bankroll);

    return EXIT_SUCCESS;

}

