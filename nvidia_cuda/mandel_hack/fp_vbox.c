
#ifndef __mand_h__
#include "mand.h"
#endif

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64_cplex *cplex)
{

    /* try to reduce the number of floating point operations */
    int numerator = 2 * Vr * VBOX_SAMPLE_REAL + 2 * Sr - real_range + 1;
    cplex->r = numerator / ( 1.0 * real_range );

    numerator = 2 * Vj * VBOX_SAMPLE_IMAG + 2 * Sj - imag_range + 1;
    cplex->j = numerator / ( 1.0 * imag_range );

}


