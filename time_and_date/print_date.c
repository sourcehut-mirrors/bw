
/*
 * print_date.c  pretty print a date
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

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

size_t print_date( int day, int month, int year )
{

    /* lets make the assumption that the date is already
     * checked to be valid */

    /*
     *  size_t strftime(char *s, size_t max, const char *format,
     *                 const struct tm *tm);
     *
     * DESCRIPTION
     * The  strftime() function formats the broken-down time tm
     * according to the format specification format and places the
     * result in the character array s of size max.
     *   The broken-down time structure tm is defined in <time.h>.
     *
     * struct tm {
     *  int     tm_sec;         * seconds after the minute [0-60]
     *  int     tm_min;         * minutes after the hour [0-59]
     *  int     tm_hour;        * hours since midnight [0-23]
     *  int     tm_mday;        * day of the month [1-31]
     *  int     tm_mon;         * months since January [0-11]
     *  int     tm_year;        * years since 1900
     *  int     tm_wday;        * days since Sunday [0-6]
     *  int     tm_yday;        * days since January 1 [0-365]
     *  int     tm_isdst;       * Daylight Savings Time flag
     *  long    tm_gmtoff;      * offset from UTC in seconds
     *  char    *tm_zone;       * timezone abbreviation
     * };
     */

    size_t n;
    char buffer[128] = "";

    struct tm *e_time = calloc( (size_t) 1, sizeof(struct tm) );

    (*e_time).tm_year = year - 1900;
    e_time->tm_mon = month - 1;
    e_time->tm_mday = day;
    e_time->tm_isdst = -1;

    mktime(e_time);

    n = strftime( buffer, (size_t) 128, "+%Y %m %d %A %a %B %b dn=%j wd=%u wn=%V", e_time);

    printf ( "%s\n", buffer );

    free(e_time);

    return n;

}

