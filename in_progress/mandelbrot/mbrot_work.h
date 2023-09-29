
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
#include "file_mbrot.h"

int sysinfo(int verbose);
int parse_double(const char *str, double **dbl );
int parse_pthread_limit(const char *str, int *pthread_limit);
int check_path(void);
int file_stat_err(int file_errno);

/* params to a POSIX thread */
typedef struct {

    /* the real and imaginary index [ r, j ] in the work region */
    uint32_t  vbox_r, vbox_j;

    /* all the values computed in that region [ r, j ] */
    m_data *dat;

     /* status is imply a 0 or 1 to indicate done */
    int       status;

} thread_parm_t;

