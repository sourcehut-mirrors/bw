
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
  uint32_t  vbox_r, vbox_j, *m_val;
  double *coord_r, coord_j; 
  int status;  /* simply a 0 or 1 to indicate done */
} thread_parm_t;

