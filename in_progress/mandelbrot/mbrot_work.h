
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

#include <stdint.h>

/* struct to pass params to a POSIX thread */
typedef struct {

    /* TODO we should mutex lock */

    /* the real and imaginary index into the work region */
    uint32_t  vbox_r, vbox_j;

    /* this is a pointer to and array of all the values
     * computed in that region [ r, j ] */
    uint32_t  *m_val;

    /* these are pointers to the array of all real and
     * imaginary coordinates in that region [ r, j ] */
    double    *coord_r, *coord_j; 

     /* status is imply a 0 or 1 to indicate done */
    int       status;

} thread_parm_t;

