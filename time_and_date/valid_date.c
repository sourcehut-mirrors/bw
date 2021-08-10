/*
 * valid_date.c  Does what it says on the tin. Checks if the date
 *               provided actually exists.
 *
 * Copyright 2020 Dennis Clarke
 *
 * To the extent possible under law, the authors have waived
 * all copyright and related or neighboring rights to this file.
 * This work is published from: United States, Canada.
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

int valid_date ( int day, int month, int year )
{

    /* just create a trivial array of the usual days
     * in a month. */
    int days_in_month[12] = { 31, 28, 31, 30, 31, 30,
                              31, 31, 30, 31, 30, 31 };

    /* check for bad data */
    if ( ( day < 1 ) || ( day > 31 ) )
        return ( -1 );

    if ( ( month < 1 ) || ( month > 12 ) )
        return ( -1 );

    if ( ( year < 1800 ) || ( year > 2038 ) )
        return ( -1 );


    /* Any year that is evenly divisible by 4 is a leap year
     *
     * However, there is still a small error that must be 
     * accounted for. To eliminate this error, the Gregorian
     * calendar stipulates that a year that is evenly divisible
     * by 100 (for example, 1900) is a leap year only if it
     * is also evenly divisible by 400.
     *
     * However we only care to check if the month is February
     *
     * -------------------------------------------------------
     * A note from someone in the classroom :
     * Here is a fancy way which may work to detect a leap year :
     * (mon%1 ? (mon < 7 ? 31 , 30) , (mon >= 7 ? 30 , 31))
     *
     * However, this is not at all obvious or clear to anyone at
     * first glance.
     */

    if ( month == 2 )
        if (    ( ( year%4 == 0 ) && ( ( year%100 ) > 0 ) )
             || ( year%400 == 0 ) )
            days_in_month[1] = 29;

    /* we may still have bad data for February */
    if ( day > days_in_month[month-1] )
        return ( 0 );

    /* If we arrive here then we have a valid date */
    return ( 1 );

}

