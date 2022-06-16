
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

uint64_t rot8(uint64_t x);
uint32_t rot4(uint32_t x);

/* struct to pass params to dispatched thread */
typedef struct {
    double r_translate, i_translate, magnify;
    double obs_x_width, obs_y_height;
    uint32_t (*v)[16][16][64][64];
    uint64_t ret_val;
    int vbox_x, vbox_y;
    int eff_width, eff_height;
    int vbox_w, vbox_h;
    uint32_t bail_out;
    int t_num;
    int t_total;
} thread_parm;

