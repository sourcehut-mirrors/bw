
#ifndef __mand_h__
#include "mand.h"
#endif

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64_cplex *cplex)
{

    /* given some normalized coordinates ( r, j ) within our plot
     * region we may easily translate to the centre ( t_r, t_j )
     * with a given magnification. */
    cplex->r = t_r + r * DEFAULT_REAL_WIDTH / ( 2.0 * magnify );
    cplex->j = t_j + j * DEFAULT_IMAG_HEIGHT / ( 2.0 * magnify );

}


