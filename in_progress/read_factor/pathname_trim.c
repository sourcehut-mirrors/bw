
/* pathname_trim.c  Walk through a string of simple ASCII chars and
 *                  remove internal duplicate forward slash chars
 *                  with the objective to return a reasonable UNIX
 *                  file pathname. May also be a directory. Therefore
 *                  a leading or trailing slash will be preserved.
 *
 *                  WARNING: no attempt is made to deal with UTF-8
 *                            chars nor strange sequences of dots
 *                            such as ".." or "..." or "  .. ... ".
 *                            Sometimes a bad pathname is just bad.
 *
 * Copyright (C) Dennis Clarke 2006
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
 * Compile with c99 or with gcc and CFLAGS to include options 
 * -std=iso9899:1999 -pedantic -pedantic-errors in order to
 * ensure compliance with ISO IEC 9899:1999 spec. 
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "read_f.h"

char *pathname_trim( char *str ) {

    /* Given a string pointer, toss out all leading whitespace,
     * duplicate forward slash chars, and trailing whitespace. 
     * The end result shall have no more than one internal forward
     * slash char in any one place and also a terminating NUL char.
     * If nothing but whitespace or a NULL is received then a single
     * byte NUL char string shall be returned.
     *
     * It is the responsibility of the caller to free memory.
     */

    size_t  len;
    char    *frontp;
    char    *temp = NULL;

    /* Are we given NULL ? */
    if ( str == NULL ) {
        /* the calloc() ensures we get a NUL string */
        str = calloc(8,sizeof(char));
        if ( str == NULL ) {
            /* major problem ENOMEM or worse?
             * If you can not get 8 bytes on the heap then
             * you have far far bigger problems. */
            exit ( EXIT_FAILURE );
        }
        return str;
    }

    /* we were given nothing. */
    if ( str[0] == '\0' ) {
        return str;
    }

    /* If the input string is only one byte long then it
     * pretty much must be "/" or "." and not much else
     * makes a lot of sense as a pathname. However it may
     * be a single char filename? Regardless we need to
     * check if the one byte we have is just whitespace.
     *
     * Another simple condition is that we are given a single
     * byte string. If it is not whitespace just bail out.
     */
    len = strlen(str);
    if ( len == 1 ) {
        /* check if this single byte is whitespace */
        if ( isspace(str[0]) ) {
            /* yes it is nothing  but whitespace so we
             * return a single byte NUL string */
            str[0] = '\0';
        }
        return str;
    }

    /* a pointer to the front of the string and later
     * we will need to pre-increment this */
    frontp = str - 1;

    temp = str + len;

    /* Move the front and back pointers to address
     * of the first non-whitespace characters from
     * each end. Note that frontp gets pre-incremented
     * which is fine given its definition as (str - 1)
     */
    while ( isspace(*(++frontp)) );

    /* now walk backwards from the end of the string
     * where we do not collide with the front */
    while ( isspace(*(--temp)) && ( temp != frontp ) );

    /* clean up in case we removed all characters */
    if ( ( str + len - 1 ) != temp ) {
            *(temp + 1) = '\0';
    } else {
        if ( ( frontp != str ) && ( temp == frontp ) ) {
            *str = '\0';
        }
    }

    /* now let's start over from the front of the 
     * first non-whitespace char and move one char 
     * at a time to the front of the input buffer
     * if we hit an ASCII 0x2f forward slash char
     * we skip over any duplicate 0x2f until we hit
     * a non-whitespace char.
     */
    temp = str;  /* the front of the input buffer */

    /* the string must be longer than 4 chars to have 
     * internal forward slash chars like "a//b" and we
     * need to check this regardless if frontp is 
     * at the same address as str or not. 
     */

    if ( ( frontp != str ) || ( strlen(frontp) > 3 ) ) {
        while ( *frontp ) {
            if ( (*(char*)frontp != 0x2f ) )
                *temp++ = *frontp++;
            else {
                *temp++ = *frontp++;
                /* skip over repeated forward slash chars */
                while (*(char*)frontp == 0x2f) frontp++;
            }
        }
        /* terminate the string here */
        *temp = '\0';

    }

    return str;

}

