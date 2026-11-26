
/*
 * mpfr_kam_test.c use gmp and mpfr for a quick run at the classic
 *                 Chirikov standard map
 *
 * see http://scholarpedia.org/article/Chirikov_standard_map
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2026 Dennis Clarke
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
#define _XOPEN_SOURCE 600
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <mpfr.h>
#include <errno.h>
#include <unistd.h>
#include <locale.h>

#include <gmp.h>
#include <mpfr.h>

#include "tdiff.h"

#define VERBOSE 1

int sysinfo(int verbose);
int mpfr_check_flags(int mpfr_status, int debug_flag );
int gmp_mpfr_ver(int *status, int *mpfr_flags);

/*
 * mpfr_kam_test.c : Arbitrary-precision Chirikov-Taylor standard map
 *                   tangent-orbit & Greene residue benchmark for MPFR 4.2.2.
 *
 * Map (mod 2*pi):
 *   p_{k+1} = p_k + K * sin(x_k)
 *   x_{k+1} = x_k + p_{k+1}
 *
 * Tangent Jacobian M_k:
 *   [ 1 + K*cos(x_k)   1 ]
 *   [     K*cos(x_k)   1 ]
 *
 * Greene's residue for a reversible periodic orbit of period Q:
 *   R = (2 - Tr(M_Q)) / 4   (approaches R* ~ 0.2500888... at K = K_c)
 */

int
main(int argc, char **argv)
{

    int j, fib_idx, mpfr_ver_status;

    unsigned long f_prev = 1, f_curr = 1, f_next;
    unsigned long P = f_prev;
    unsigned long Q = f_curr;
    unsigned long step;

    long candidate_int;

    /* this is a lot of default bits */
    mpfr_prec_t actual_prec, prec = 2048;

    size_t mpfr_precision_size = 0;
    int mpfr_flags = 0;
    int gmp_mpfr_ver_ret = 0;

    mpfr_t K, x, p, two_pi, s, c, kc;
    mpfr_t m00, m01, m10, m11, n00, n01, n10, n11, tmp, residue;

    /* We may or may not have CLOCK_MONOTONIC implemented and thus
     * we test for what does exist and set a clockid_t type. */
    clockid_t clock_flag;

    struct timespec tn_begin, tn_0, tn_1, tn_end;
    tdiff_type delta_time;
    int err_clock;

    sysinfo(VERBOSE);

    setlocale(LC_ALL, "C");

    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_begin);
    if ( err_clock != 0 ) {
        fprintf(stderr,"FAIL : ");
        if ( errno == ENOSYS ) {
            fprintf(stderr,"clock_gettime() not supported\n");
            return EXIT_FAILURE;
        }

        if ( errno == EINVAL ) {
            fprintf(stderr,"CLOCK_MONOTONIC not known\n");
            errno = 0;
            clock_flag = CLOCK_REALTIME;
            err_clock = clock_gettime(clock_flag, &tn_begin);

            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : your system is bork bork bork\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    gmp_mpfr_ver_ret = gmp_mpfr_ver(&mpfr_ver_status, &mpfr_flags);

    /* TODO : interpret the mpfr_ver_status and flags
    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n", mpfr_flags);
    printf("     :                   mpfr_ver_status = %02x\n", mpfr_ver_status);
    printf("     :                  gmp_mpfr_ver_ret = %02x\n\n", gmp_mpfr_ver_ret);
    */

    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n", mpfr_flags);
    printf("     : gmp_mpfr_ver_ret = %0x\n\n", gmp_mpfr_ver_ret);

    mpfr_precision_size = sizeof(mpfr_prec_t);

    /* If the gmp_mpfr_ver_ret differs from mpfr_precision_size then
     * we likely have a problem somewhere.  Good luck. */
    if ( gmp_mpfr_ver_ret != ( (int) mpfr_precision_size ) ) {
        fprintf(stderr,"FAIL : gmp_mpfr_ver_ret != mpfr_precision_size\n");
        return EXIT_FAILURE;
    }

    /* note that we have prec = 2048 initialized above */
    errno = 0;
    candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : bit precision not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }
    if ( ( candidate_int < 64 ) || ( candidate_int > 1048576 ) ){
        fprintf(stderr,"WARN : bit precision is unreasonable\n");
        fprintf(stderr,"     : we shall assume 2048 and proceed.\n");
        prec = 2048;
    } else {
        printf("INFO : bit precision will be %li\n", candidate_int);
        prec = candidate_int;
    }
    printf("INFO : request is %li bits of precision.\n\n", (long)prec );
    /* set the default mpfr precision */
    mpfr_set_default_prec(prec);
    /* verify that the default precision is as requested */
    actual_prec = mpfr_get_default_prec();
    printf("INFO : the actual_prec is %lu\n", (long)actual_prec );
    if ( (long)prec != (long)actual_prec ) {
        fprintf(stderr,"FAIL : the precision request failed\n");
        return EXIT_FAILURE;
    }

    printf("    : %ld bits (~%ld decimal digits)\n",
           (long)prec, (long)(prec * 0.30103));

    /* TODO : fix this later */
    fib_idx      = (argc > 2) ? (int)strtol(argv[2], NULL, 10) : 24;

    /* Compute Fibonacci convergent P / Q -> (sqrt(5) - 1) / 2 */
    f_prev = 1;
    f_curr = 1;

    /* only you can stop the abuse of i as an iteration var! */
    for (j = 2; j <= fib_idx; j++) {
        f_next = f_prev + f_curr;
        f_prev = f_curr;
        f_curr = f_next;
    }

    P = f_prev;
    Q = f_curr;

    printf("Fibonacci convergent F_%d / F_%d = %lu / %lu\n",
           fib_idx - 1, fib_idx, P, Q);

    mpfr_inits2(prec, K, x, p, two_pi, s, c, kc,
                m00, m01, m10, m11, n00, n01, n10, n11, tmp, residue,
                (mpfr_ptr)0);

    /* Greene's critical parameter K_c ~ 0.97163540631208... */
    mpfr_set_str(K, "0.97163540631208", 10, MPFR_RNDN);

    /* two_pi = 2 * pi */
    mpfr_const_pi(two_pi, MPFR_RNDN);
    mpfr_mul_ui(two_pi, two_pi, 2, MPFR_RNDN);

    /* Dominant symmetry line x_0 = 0, initial momentum p_0 = 2*pi*(P/Q) */
    mpfr_set_zero(x, 1);
    mpfr_mul_ui(p, two_pi, P, MPFR_RNDN);
    mpfr_div_ui(p, p, Q, MPFR_RNDN);

    /* Initialize cumulative tangent Jacobian M = I */
    mpfr_set_ui(m00, 1, MPFR_RNDN);
    mpfr_set_ui(m01, 0, MPFR_RNDN);
    mpfr_set_ui(m10, 0, MPFR_RNDN);
    mpfr_set_ui(m11, 1, MPFR_RNDN);

    for (step = 0; step < Q; step++) {
        mpfr_sin_cos(s, c, x, MPFR_RNDN);

        /* Tangent matrix update: M_new = J(x) * M, with kc = K * cos(x) */
        mpfr_mul(kc, K, c, MPFR_RNDN);

        /* n00 = (1 + kc)*m00 + m10 = kc*m00 + m00 + m10 */
        mpfr_fma(n00, kc, m00, m00, MPFR_RNDN);
        mpfr_add(n00, n00, m10, MPFR_RNDN);

        /* n01 = (1 + kc)*m01 + m11 = kc*m01 + m01 + m11 */
        mpfr_fma(n01, kc, m01, m01, MPFR_RNDN);
        mpfr_add(n01, n01, m11, MPFR_RNDN);

        /* n10 = kc*m00 + m10 */
        mpfr_fma(n10, kc, m00, m10, MPFR_RNDN);

        /* n11 = kc*m01 + m11 where we love FMA ! */
        mpfr_fma(n11, kc, m01, m11, MPFR_RNDN);

        mpfr_set(m00, n00, MPFR_RNDN);
        mpfr_set(m01, n01, MPFR_RNDN);
        mpfr_set(m10, n10, MPFR_RNDN);
        mpfr_set(m11, n11, MPFR_RNDN);

        /* Standard map step: p = p + K*sin(x), x = (x + p) mod 2*pi */
        mpfr_fma(p, K, s, p, MPFR_RNDN);
        mpfr_add(x, x, p, MPFR_RNDN);
        mpfr_fmod(x, x, two_pi, MPFR_RNDN);
    }

    /* Residue R = (2 - (m00 + m11)) / 4 */
    mpfr_add(tmp, m00, m11, MPFR_RNDN);
    mpfr_ui_sub(residue, 2, tmp, MPFR_RNDN);
    mpfr_div_ui(residue, residue, 4, MPFR_RNDN);

    /* we have already checked for errors on clock_gettime
     * so no need really to check err_clock here */
    err_clock = clock_gettime(clock_flag, &tn_1);

    err_clock = tdiff( &delta_time, tn_begin, tn_1);

    mpfr_printf("Trace(M_Q)  : %.36Rf\n", tmp);
    mpfr_printf("Residue R_Q : %.36Rf\n", residue);

    printf("TIME : %10ld    %9ld secs (%.2f steps/sec)\n",
           delta_time.sec, delta_time.nsec,
           (double)Q / delta_time.delta);

    mpfr_clears(K, x, p, two_pi, s, c, kc,
                m00, m01, m10, m11, n00, n01, n10, n11, tmp, residue,
                (mpfr_ptr)0);

    mpfr_free_cache();

    return EXIT_SUCCESS;

}

