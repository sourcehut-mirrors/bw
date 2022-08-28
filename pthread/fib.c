
/*
 * fib.c  Each job in the queue will result in a really nasty fibonacci
 *        computation. The code below is pure C99 and yes those digraphs
 *        are allowed. Merely an example that they are respected.
 *        This is baloney work that really results in not much other than
 *        magic smoke churning inside a computer.
 *
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
%:define _XOPEN_SOURCE 600

%:include <stdint.h>

uint64_t fib(volatile uint8_t n) <%
    /* This is pure ugly horrific and beautiful in its
     * terrible performance where even a very fast computer
     * will be in deep trouble with any n > 50 and in fact
     * only n=47 is the largest that we have tested.
     * Good luck and you have been warned. */
    if ( n == 0 ) <%
        return 0;
    } else if ( n == 1 ) <%
        return 1;
    %> else {
        return ( fib( n - 1 ) + fib( n - 2 ) );
    %>
%>
