
/*
 * fib.c  Each job in the queue will result in a really nasty fibonacci
 *        computation. The code below is pure C99 and yes those digraphs
 *        are allowed. Merely an example that they are respected.
 *
 *        This is baloney work that really results in not much other than
 *        magic smoke churning inside a computer.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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
%:define _XOPEN_SOURCE 600

%:include <stdint.h>

uint64_t fib(volatile uint8_t n) <%
    /* This is pure ugly horrific and beautiful in its
     * terrible performance where even a very fast computer
     * will be in deep trouble with any n > 50 and in fact
     * only n=47 is the largest that we have tested.
     * Good luck and you have been warned.
     *
     * Special note : the 64 bit integer limit will be f(92)
     * 
     * per bc -l we see 
     *
     * scale=32
     * l(7540113804746346429)/l(2)
     * 62.70929200657311058603354483992664
     *
     * So that is just under 2^63 and good luck.
     *
     */
    if ( n == 0 ) <%
        return 0;
    } else if ( n == 1 ) <%
        return 1;
    %> else {
        return ( fib( n - 1 ) + fib( n - 2 ) );
    %>
%>

