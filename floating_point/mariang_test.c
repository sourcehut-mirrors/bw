
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <fenv.h>
#include <float.h>

int main(int argc, char *argv[]){

    int fp_round_mode, fpe_raised;

#ifdef FLT_EVAL_METHOD
    printf ( "INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

    fp_round_mode = fegetround();
    printf("INFO : fp rounding mode is ");
    switch(fp_round_mode){
        case FE_TONEAREST:
            printf("FE_TONEAREST\n");
            break;
        case FE_TOWARDZERO:
            printf("FE_TOWARDZERO\n");
            break;
        case FE_UPWARD:
            printf("FE_UPWARD\n");
            break;
        case FE_DOWNWARD:
            printf("FE_DOWNWARD\n");
            break;
        default:
            printf("bloody unknown!\n");
            break;
        }

    feclearexcept(FE_ALL_EXCEPT);

    printf ("-----------------------------------\n\n");
    printf ("Let's look at the number 5^11 / 10^12\n\n");

    double numerator = 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0 * 5.0;

    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if(fpe_raised & FE_INEXACT) printf(" FE_INEXACT");
        if(fpe_raised & FE_DIVBYZERO) printf(" FE_DIVBYZERO");
        if(fpe_raised & FE_UNDERFLOW) printf(" FE_UNDERFLOW");
        if(fpe_raised & FE_OVERFLOW) printf(" FE_OVERFLOW");
        if(fpe_raised & FE_INVALID) printf(" FE_INVALID");
        printf("\n");
    } else {
        printf("INFO : no floating point exception\n");
        printf("     : 5^11 computed precisely.\n");
    }

    printf("DATA : 5 ^ 11 = %-+24.18e\n\n", numerator);

    feclearexcept(FE_ALL_EXCEPT);
    double fraction = numerator / 1000000000000.0;

    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if(fpe_raised & FE_INEXACT) printf(" FE_INEXACT");
        if(fpe_raised & FE_DIVBYZERO) printf(" FE_DIVBYZERO");
        if(fpe_raised & FE_UNDERFLOW) printf(" FE_UNDERFLOW");
        if(fpe_raised & FE_OVERFLOW) printf(" FE_OVERFLOW");
        if(fpe_raised & FE_INVALID) printf(" FE_INVALID");
        printf("\n");
    }

    printf("DATA : ( 5^11 )/( 10^12 ) = %-+40.34e\n", fraction);

    printf("\n\n  and now for something totally different\n\n");

    feclearexcept(FE_ALL_EXCEPT);
    double weird = 1024.0 + fraction;
    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if(fpe_raised & FE_INEXACT) printf(" FE_INEXACT");
        if(fpe_raised & FE_DIVBYZERO) printf(" FE_DIVBYZERO");
        if(fpe_raised & FE_UNDERFLOW) printf(" FE_UNDERFLOW");
        if(fpe_raised & FE_OVERFLOW) printf(" FE_OVERFLOW");
        if(fpe_raised & FE_INVALID) printf(" FE_INVALID");
        printf("\n");
    }
    printf("     : 1024 + ( 5^11 )/( 10^12 ) = %-+40.34e\n", weird);

/***** I will clean up this comment later however the essential 
 * data looks like so : 

      0x4090 0x0000 0x0ccc 0xcccd
        409 <-- sign bit and exponent bits

           0   0000   0ccc   cccd

                       1100 1100 1100 1100 1100 1100 1100 1100 ..... goes on forever

         1.0000 0000 0000 0000 0000 0000 1100 1100 1100 1100 1100 1100 1101 <--- round up in ULP

Previously we have ( 5^11 ) / ( 10^12 ) which was also a never ending
binary expression : 0x3f09 0x9999 0x9999 0x999a  <--- round up in ULP

*/

    return EXIT_SUCCESS;

}

