
#ifndef __mand_h__
#include "mand.h"
#endif

int array_offset(int Vr, int Vj, int Sr, int Sj) {

    return   Vr * VBOX_SAMPLE_REAL + Sr

           + Vj * VBOX_REAL_COUNT
                * VBOX_SAMPLE_REAL
                * VBOX_SAMPLE_IMAG

           + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;

}


