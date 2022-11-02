
/* in theory this forces long double precision for floating point */
/*  However I have seen no evidence it does anything */
#pragma STDC FENV_ACCESS ON
#define FLT_EVAL_METHOD 0
#define __FLT_EVAL_METHOD__ 0
#define __GLIBC_FLT_EVAL_METHOD 0

#define LOOP_MAX 36

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <signal.h>
#include <fenv.h>
#include <math.h>
#include <errno.h>

void report_round(void);
void fe_trap(int sig);
int foo (int bar);

int main (int argc, char *argv[]) {

    float test_a, test_b, test_res;
    double u, v, w, w0, w1, w2, w3;
    int i, loop_count, fpe, errsv;
    int debug_flag = 0;

    report_round();

#ifdef FLT_EVAL_METHOD
    fprintf(stderr,"INFO: FLT_EVAL_METHOD defined.\n");
    fprintf(stderr,"    : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

    /*
    printf("sizeof( float) = %zu  sizeof( float_t) = %zu\n", sizeof(float),sizeof(float_t));
    printf("sizeof(double) = %zu  sizeof(double_t) = %zu\n", sizeof(double),sizeof(double_t));
    printf("\n\n");
    */

    printf("\nExample by Jean-Michel Muller:\n");
    printf("     u[0] =  2\n");
    printf("     u[1] = -4\n");
    printf("  u_[n+1] = 111 - 1130 / u_[n]");
    printf(" + 3000 / ( u[n] * u[n-1] )\n");

    /* check if a loop count parameter was on the command line */
    if (argc>1){
        loop_count = (int)strtol(argv[1], (char **)NULL, 10);
        if (loop_count>LOOP_MAX){
            loop_count = LOOP_MAX;
            printf("WARN : limit of %i loops.\n", LOOP_MAX);
        }
    } else {
        printf("loop_count ?? = ");
        scanf("%d",&loop_count);
    }
    printf("\nINFO : shall calculate to u[%02i]\n", loop_count);

    /* check if a debug parameter was on the command line */
    debug_flag = 0;
    if (argc>2){
        debug_flag = abs( (int)strtol(argv[2], (char **)NULL, 10) );
        if ( debug_flag > 0 ){
            printf("INFO : debug option enabled.\n\n");
            errno = 0;
            signal(SIGFPE, fe_trap);

            errno = 0;
            if ( feclearexcept(FE_ALL_EXCEPT) != 0 ){
                errsv = errno;
                fprintf(stderr, "FAIL : %i : %s\n", errsv, strerror(errsv) );
                fprintf(stderr, "FAIL : feclearexcept(FE_ALL_EXCEPT) fails.\n");
                return EXIT_FAILURE;
            }
        }
    }




    /* throw a FE exception trap */
    test_a = 42.0;
    test_b = 0.0;
    test_res = test_a / test_b;
    /*****************************/



    u = 2.0;
    printf("u[00] = %+.21e\n", u);
    v = -4.0;
    printf("u[01] = %+.21e\n", v);
    for (i = 2; i <= loop_count; i++) {
        /* division */
        if ( debug_flag > 0 ) errno = 1;
        w0 = -1130.0 / v;
        fpe = fetestexcept(FE_ALL_EXCEPT);
        if (( debug_flag > 0 ) && (fpe!=0)){
            printf("INFO : Exception raised was");
            if(fpe & FE_INEXACT) printf(" FE_INEXACT");
            if(fpe & FE_DIVBYZERO) printf(" FE_DIVBYZERO");
            if(fpe & FE_UNDERFLOW) printf(" FE_UNDERFLOW");
            if(fpe & FE_OVERFLOW) printf(" FE_OVERFLOW");
            if(fpe & FE_INVALID) printf(" FE_INVALID");
            feclearexcept(FE_ALL_EXCEPT);
            errno = 0;
            printf("\n");
        }

        /* addition */
        w1 = w0 + 111.0;

        /* multiplication */
        w2 = v * u;

        /* division again */
        w3 = 3000.0 / w2;

        /* addition and final result */
        w = w1 + w3;

        /*
         * w = 111.0 - 1130.0/v + 3000.0/(v*u);
         */

        u = v;
        v = w;

        printf("u[%02i] = ", i);
        printf("%+.21e\n", w);
    }

    return EXIT_SUCCESS;

}

void report_round()
{
    int rnd_alg;
    int status;

#ifndef __STDC_IEC_559__
    fprintf(stderr,"WARN: __STDC_IEC_559__ not defined.\n");
    fprintf(stderr,"    : IEEE 754 not fully supported.\n");
#endif

    rnd_alg = fegetround();
    printf("Current Floating Point rounding mode is ");
    switch(rnd_alg)
    {
        case FE_TONEAREST:
            printf("FE_TONEAREST ");
            break;
        case FE_DOWNWARD:
            printf("FE_DOWNWARD  ");
            break;
        case FE_UPWARD:
            printf("FE_UPWARD    ");
            break;
        case FE_TOWARDZERO:
            printf("FE_TOWARDZERO");
            break;
        default:
            printf("default");
    }
    printf(" = %i\n",rnd_alg);

    /* note from the man page : RETURN VALUES
     * The fesetround() function returns 0 on success and
     * non-zero otherwise;
     * however, the present implementation always succeeds.
     */

    if (rnd_alg!=FE_TONEAREST) {
        status = fesetround(FE_TONEAREST);
        if ( status != 0 ) {
            fprintf(stderr,"WARN : fesetround() may have failed\n");
        }
        fprintf(stderr,"INFO: FP round mode is now FE_TONEAREST\n");
    }

}

void fe_trap(int sig) {
    fprintf(stderr,"FAIL : Floating Point Exception\n");
    exit(EXIT_FAILURE);
}

int foo (int bar) {

    float foo = 1.100f; /* the suffix letter f means this is a float */
    float epsilon = 1.0E-7f; /* this is _about_ 0.000001 */
    int fpe; /* this is a flag */
    int j;

    /* clear all possible floating point exceptions */
    feclearexcept(FE_ALL_EXCEPT);
    if (fesetround(FE_TONEAREST)!=0){
        fprintf(stderr,"ERROR : can not set floating point rounding!\n");
        return EXIT_FAILURE;
    }

    printf("starting value of foo = %8.7e\n", (double)foo );
    /* bin_printf((uint8_t*)&foo, (size_t)sizeof(foo));  */
    for ( j=0; fabsf(foo)>epsilon; j++ ){
        /* do a trivial subtraction */
        foo = foo - 0.10f;
        /* did we just toss an exception? */
        fpe = fetestexcept(FE_ALL_EXCEPT);
        if (fpe!=0){
            printf("INFO : Exception raised was");
            if(fpe & FE_INEXACT) printf(" FE_INEXACT");
            if(fpe & FE_DIVBYZERO) printf(" FE_DIVBYZERO");
            if(fpe & FE_UNDERFLOW) printf(" FE_UNDERFLOW");
            if(fpe & FE_OVERFLOW) printf(" FE_OVERFLOW");
            if(fpe & FE_INVALID) printf(" FE_INVALID");
            printf("\n");
        }
        printf("foo = %8.7e\n", (double)foo );
        /* bin_printf((uint8_t*)&foo, (size_t)sizeof(foo)); */
        feclearexcept(FE_ALL_EXCEPT);
    }
    printf("\nfinal value of foo = %8.7e\n", (double)foo );
    /* bin_printf((uint8_t*)&foo, (size_t)sizeof(foo)); */
    return EXIT_SUCCESS;

}

