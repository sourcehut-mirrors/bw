
/*
 * strtrim.c remove leading and trailing whitespace from a string
 *
 * Copyright (C) Dennis Clarke 2012
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

#define _XOPEN_SOURCE 500

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* WARNING : If the caller provides a NULL pointer then
 * we return a NULL pointer.
 *
 * 20 Jul 2022 marsen says
 *   "garbage in, garbage out". If the caller passes NULL either fail
 *   (like strlen, strdup, strcpy do) or return NULL again.
 *
 *
 *    It may be far more sane to return a pointer to a new string
 *    in memory and not ever modify the callers string pointer.
 */
char *strtrim( const char *str ) {
    /* Given a string pointer, toss out all
     * leading and trailing whitespace. Return
     * a new pointer to memory allocated on the
     * heap.  */
    size_t  len;
    char    *frontp;
    char    *r0 = NULL;
    char    *r1 = NULL;

    /* Are we given NULL ?  */
    if ( str == NULL ) {
        return str;
    }

    /* TODO : check if the len is something insane. Perhaps
     * define a MAX_LENGTH somewhere. */
    len = strlen(str);
    r0 = strdup(str);

    /* Is the input string just a nul byte? */
    if ( r[0] == '\0' ) {
        return r0;
    }

    /* A simple condition is that we are given a single
     * byte string. If it is whitespace just bail out.
     * This saves us from doing pointer games later on.
     */
    if ( len == 1 ) {
        if (isspace(r[0])) {
            r[0] = '\0';
        }
        return r0;
    }

    frontp = r0 - 1;
    r1 = r0 + len;

    /* Move the front and back pointers to address
     * of the first non-whitespace characters from
     * each end. Note that frontp gets pre-incremented
     * which is fine given its definition as (r0 - 1)
     */
    while ( isspace(*(++frontp)) );
    while ( isspace(*(--r1)) && ( r1 != frontp ) );

    /* clean up in case we removed all characters */
    if ( ( r0 + len - 1 ) != r1 ) {
        *(r1 + 1) = '\0';
    } else {
        if ( ( frontp != r0 ) && ( r0 == frontp ) ) {
            *r0 = '\0';
        }
    }

    /* now let's start over from the front of the
     * first non-whitespace char and move one char
     * at a time to the front of the input buffer
     */
    temp = str;  /* the front of the input buffer */
    if ( frontp != str ) {
        while ( *frontp )
            *temp++ = *frontp++;
        *temp = '\0';
    }

    return str;

}

