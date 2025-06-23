
/*
 * linear_inter.c Another variation on linear interprolation between
 *                input colour values.
 * Copyright Dennis M. Clarke 2019
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
#include <stdint.h>
#include <unistd.h>
#include <inttypes.h>

#include "mandelbrot.h"

unsigned long linear_inter( uint8_t  in_val,
                            uint32_t low_col, uint32_t high_col,
                            uint8_t  low_val, uint8_t upper_val)
{
    /* in_val is some number that should fall between
     *        the low_val and upper_val. If not then
     *        just assume low_val or upper_val as
     *        needed.
     *
     * low_col is the actual RGB value at the low end
     *         of the scale
     *
     * high_col is the RGB colour at the high end of the
     *           scale
     *
     * low_val and upper_val are the possible range values
     *          for the in_val
     *
     * How to do a linear interpolation between two 32-bit colour
     * values?  We need a smooth function :
     *
     *    uint32_t cpixel =    ( uint8_t   red_val << 16 )
     *                       + ( uint8_t green_val << 8 )
     *                       +   uint8_t  blue_val
     */

    uint16_t red, green, blue;
    int red_direction = 1;
    int green_direction = 1;
    int blue_direction = 1;
    int lower_red, upper_red;
    int lower_green, upper_green;
    int lower_blue, upper_blue;
    unsigned long cpixel;

    if (    ( high_col & (uint32_t)0xff0000 )
         <= (  low_col & (uint32_t)0xff0000 ) ) {

        lower_red = (uint16_t)( ( high_col & (uint32_t)0xff0000 ) >> 16 );
        upper_red = (uint16_t)( (  low_col & (uint32_t)0xff0000 ) >> 16 );
        /* the red color decreases as the input index increases */
        red_direction = 0;

    } else {

        upper_red = (uint16_t)( ( high_col & (uint32_t)0xff0000 ) >> 16 );
        lower_red = (uint16_t)( (  low_col & (uint32_t)0xff0000 ) >> 16 );

    }

    if (    ( high_col & (uint32_t)0x00ff00 )
         <= (  low_col & (uint32_t)0x00ff00 ) ) {

        lower_green = (uint16_t)( ( high_col & (uint32_t)0x00ff00 ) >> 8 );
        upper_green = (uint16_t)( (  low_col & (uint32_t)0x00ff00 ) >> 8 );
        /* the green color decreases as the input index increases */
        green_direction = 0;

    } else {

        upper_green = (uint16_t)( ( high_col & (uint32_t)0x00ff00 ) >> 8 );
        lower_green = (uint16_t)( (  low_col & (uint32_t)0x00ff00 ) >> 8 );

    }

    if (    ( high_col & (uint32_t)0x0000ff )
         <= (  low_col & (uint32_t)0x0000ff ) ) {

        lower_blue = (uint16_t)( high_col & (uint32_t)0x0000ff );
        upper_blue = (uint16_t)(  low_col & (uint32_t)0x0000ff );
        /* the blue color decreases as the input index increases */
        blue_direction = 0;

    } else {

        upper_blue = (uint16_t)( high_col & (uint32_t)0x0000ff );
        lower_blue = (uint16_t)(  low_col & (uint32_t)0x0000ff );

    }

    if ( red_direction ) {
        red = (uint16_t)( lower_red
                 + ( upper_red - lower_red )
                   * ( in_val - low_val ) / ( upper_val - low_val ) );
    } else {
        red = (uint16_t)( upper_red
                - ( upper_red - lower_red )
                   * ( in_val - low_val ) / ( upper_val - low_val ) );
    }

    if ( green_direction ) {
        green = (uint16_t)( lower_green
                 + ( upper_green - lower_green )
                    * ( in_val - low_val ) / ( upper_val - low_val ) );
    } else {
        green = (uint16_t)( upper_green
                - ( upper_green - lower_green )
                   * ( in_val - low_val ) / ( upper_val - low_val ) );
    }

    if ( blue_direction ) {
        blue = (uint16_t)( lower_blue
                 + ( upper_blue - lower_blue )
                    * ( in_val - low_val ) / ( upper_val - low_val ) );
    } else {
        blue = (uint16_t)( upper_blue
                - ( upper_blue - lower_blue )
                   * ( in_val - low_val ) / ( upper_val - low_val ) );
    }

    cpixel = (unsigned long)  ( (uint32_t)red   << 16 ) 
                            | ( (uint32_t)green <<  8 ) 
                            |   (uint32_t)blue;

    return cpixel;

}

