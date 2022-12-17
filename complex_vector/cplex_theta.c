
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

#include <math.h>
#include "v.h"

/* return the polar coordinate angle of op1 */
double cplex_theta( cplex_type *op1 )
{

    /* we need to check for zero here as that may
     * cause confusion */
    if ( ( fabs(op1->i) == 0.0 ) && ( fabs(op1->r) == 0.0 ) ) {
        /* we define the theta as zero */
        return 0.0;
    }

    return atan2( op1->i, op1->r );

}

