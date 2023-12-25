
/*********************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that
 *    the feature test macro _XOPEN_SOURCE is defined
 *    with the value 600 before inclusion of any header.
 *    This is needed to enable the functionality described
 *    in The _POSIX_C_SOURCE Feature Test Macro and in
 *    addition to enable the XSI extension.
 *
 *********************************************************/

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

unsigned long fib(register unsigned int n) <%
    /* This is pure ugly horrific and beautiful in its
     * terrible performance where even a very fast computer
     * will be in deep trouble with any n > 50 and in fact
     * only n=47 is the largest that we have tested.
     * Good luck and you have been warned. */
    if ( n == 0 ) <%
        return 0;
    %> else if ( n == 1 ) <%
        return 1;
    %> else <%
        return ( fib( n - 1 ) + fib( n - 2 ) );
    %>
%>

