
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
 * -std=iso9899:199409 -pedantic-errors in order to ensure compliance
 * with ISO IEC 9899:1999 C spec. 
 *
 * Code cleanup and transition to comb as a pointer to type ( int * ) 
 * array by Dennis Clarke dclarke@blastwave.org  28 Dec 2012 
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* WARNING : If the caller provides a NULL pointer then
 * we return a valid char pointer to 8 bytes of memory
 * which shall be nothing more than a nul string.
 *
 * It is the responsibility of the caller to deal with a
 * free() of their pointer. We do not own it but we will
 * ensure it is not a NULL.
 */
char *strtrim( char *str ) {
    /* Given a string pointer, toss out all
     * leading and trailing whitespace. 
     */
    size_t  len;
    char    *frontp;
    char    *temp = NULL;

    /* Are we given NULL ? */
    if ( str == NULL ) {
        str = malloc( (size_t) 8 );
        if ( str == NULL ) /* ENOMEM ?? */
            exit ( EXIT_FAILURE );  /* really we should dump core and halt */
        str[0] = '\0'; /* return something useful */
        return str;
    }

    /* we were given nothing. */
    if ( str[0] == '\0' )
        return str;

    /* Bail out on the condition that this is only one byte
     * AND it is a whitespace.
     *
     * Another simple condition is that we are given a single
     * byte string.  If it is not whitespace just bail out.
     */
    len = strlen(str);
    if ( len == 1 ) {
        if isspace(str[0]) str[0] = '\0';
        return str;
    }

    frontp = str - 1; /* will need to pre-increment this */
    temp = str + len;

    /* Move the front and back pointers to address
     * of the first non-whitespace characters from
     * each end. Note that frontp gets pre-incremented
     * which is fine given its definition as (str - 1)
     */
    while ( isspace(*(++frontp)) ); /* n.b: frontp = str - 1 */
    while ( isspace(*(--temp)) && ( temp != frontp ) );

    /* clean up in case we removed all characters */
    if ( ( str + len - 1 ) != temp )
        *(temp + 1) = '\0';
    else
        if ( ( frontp != str ) && ( temp == frontp ) )
            *str = '\0';

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

