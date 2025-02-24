
/* quad_fma.c Written in an attempt to get a compiler to utter
 *            the required xsmaddqp opcode. Seems to only happen
 *            with gcc and an option -O2 for reasons obscure.
 *
 *            Written by Matthew Wilson, 2023
 */


/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

_Float128 do_fmaq(_Float128 a, _Float128 b, _Float128 c) {
        return a+b*c;
}

