/*
 * valid_date.c  Does what it says on the tin. Checks if the date
 *               provided actually exists.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 1999 Dennis Clarke
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

#define _XOPEN_SOURCE 500

int valid_date ( int day, int month, int year )
{

    /* just create a trivial array of the usual days
     * in a month. */
    int days_in_month[12] = { 31, 28, 31, 30, 31, 30,
                              31, 31, 30, 31, 30, 31 };

    /* check for bad data */
    if ( ( day < 1 ) || ( day > 31 ) ) {
        return ( -1 );
    }

    if ( ( month < 1 ) || ( month > 12 ) ) {
        return ( -1 );
    }

    if ( ( year < 1752 ) || ( year > 2038 ) ) {
        return ( -1 );
    }

    /* Any year that is evenly divisible by 4 is a leap year
     *
     * However, there is still a small error that must be 
     * accounted for. To eliminate this error, the Gregorian
     * calendar stipulates that a year that is evenly divisible
     * by 100 (for example, 1900) is a leap year only if it
     * is also evenly divisible by 400.
     */

    if ( month == 2 ) {
        if (    ( ( year%4 == 0 ) && ( ( year%100 ) > 0 ) )
             || ( year%400 == 0 ) ) {

            /* leap year */
            days_in_month[1] = 29;

        }
    }

    /* we may still have bad data for February */
    if ( day > days_in_month[month-1] ) {
        /* I really do not recall how this can happen */
        return 0;
    }

    /* For the sake of being really pedantic there exists
     * a strange and historically correct month of September
     * in the year 1752 : 
     *
     *                   September 1752
     *                 S  M Tu  W Th  F  S
     *                    1  2 14 15 16 17
     *                18 19 20 21 22 23 24
     *                25 26 27 28 29 30
     */
    if ( ( year == 1752 ) && ( month == 9 )
           && ( day > 2 ) && ( day < 14 ) ) {
        return 0;
    }

    /* If we arrive here then we have a valid date */
    return 1;

}

