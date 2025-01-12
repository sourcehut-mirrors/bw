

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

