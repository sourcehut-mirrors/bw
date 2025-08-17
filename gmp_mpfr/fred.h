
/* fred.h  Demonstrate libgmp and libmpfr version reports as well
 *         as a computation of pi and Eulers number e with the
 *         provided mpfr function calls. Compute arctan(1) and
 *         then multiply by 4 with the mpfr functions calls.
 *         Check for correct results where reasonable.
 *
 *         Just for fun. There is a nifty little computation
 *         that was written about by Fred Gruenberger way back
 *         in 1984 and it has always been fun to see what very
 *         limited systems do with it. At the moment the old
 *         bc and dc utilities seem to have a real fit with it.
 *
 *         JOURNAL ARTICLE : COMPUTER RECREATIONS
 *
 *         Title : "How to handle numbers with thousands of
 *                  digits, and why one might want to."
 *
 *         Author : Fred Gruenberger
 *
 *         Scientific American : Vol. 250, No. 4 (April 1984),
 *                               pp. 19-27 (13 pages)
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
 *
 * ------------------------------------------------------------------
 * The above text is the "MIT License" which is a permissive free
 * software license originating at the Massachusetts Institute of
 * Technology (MIT) somewhere around 1987 maybe. Who knows? Feel
 * free to read the file README_MIT_LICENSE
 * ------------------------------------------------------------------
 */

/*******************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *  An XSI-conforming application should ensure that the feature
 *  test macro _XOPEN_SOURCE is defined with the value 600 before
 *  inclusion of any header. This is needed to enable the
 *  functionality described in The _POSIX_C_SOURCE Feature Test
 *  Macro and in addition to enable the XSI extension.
 *******************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#define VERBOSE 1
#define MPFR_VERSION_ERROR 999

int sysinfo(int verbose);
int gmp_mpfr_ver(int *status, int *mpfr_flags);
int endian(void);

