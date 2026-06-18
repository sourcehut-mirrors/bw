
/*
 * comb.c  : I don't recall this at all but it looks C90
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

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif

#include <stdio.h>
#include <unistd.h>

/* Prints out a combination like {1, 2} */
void    printc(int comb[], int k) 
{
    printf("{ ");
    int    i;
    for (i = 0; i < k; ++i)
        printf("%2d ", comb[i] + 1);
    printf(" }\n");
}


/*
    next_comb(int comb[], int k, int n)
        Generates the next combination of n elements as k after comb

    comb => the previous combination ( use (0, 1, 2, ..., k) for first)
    k => the size of the subsets to generate
    n => the size of the original set

    Returns: 1 if a valid combination was found
        0, otherwise
*/
int    next_comb(int comb[], int k, int n) 
{
    int    i = k -1;
    ++comb[i];

    while ((i > 0) && (comb[i] >= n - k + 1 + i)) {
        --i;
        ++comb[i];
    }

    if (comb[0] > n - k) /* Combination (n-k, n-k+1, ..., n) reached */
        return 0; /* No more combinations can be generated */

    /* comb now looks like (..., x, n, n, n, ..., n).
        Turn it into (..., x, x + 1, x + 2, ...) */
    for (i = i + 1; i < k; ++i)
        comb[i] = comb[i - 1] + 1;

    return 1;
}


int    main(int argc, char *argv[]) 
{
    int    n = 9; /* The size of the set; for {1, 2, 3, 4} it's 4 */
    int    k = 6; /* The size of the subsets; for {1, 2}, {1, 3}, ... it's 2 */
    int    comb[16]; /* comb[i] is the index of the i-th element in the
                combination */

    /* Setup comb for the initial combination */
    int    i;
    for (i = 0; i < k; ++i)
        comb[i] = i;

    /* Print the first combination */
    printc(comb, k);

    /* Generate and print all the other combinations */
    while (next_comb(comb, k, n))
        printc(comb, k);

    return 0;
}


