
/*
 * Sadly this is duplicated all over the place and
 * poorly documented. However there are comments in
 * other places that look like : 
 *
 *   index = Vbox_r x VBOX_SAMPLE_REAL + Sr
 *
 *         + Vbox_j x VBOX_REAL_COUNT
 *                  x VBOX_SAMPLE_REAL
 *                  x VBOX_SAMPLE_IMAG
 *
 *         + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL
 *
 */

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

