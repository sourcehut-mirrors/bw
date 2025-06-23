
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdint.h>
#include <time.h>
#include <X11/Xlib.h>

/* The sysinfo() code has its own little error state
 * value.  Otherwise it returns 1 for little endian
 * machines or a value 0 for big endian machines */
#define SYSINFO_FAIL 127

/* At the moment the main plot graphics context is a 1024
 * pixel square with a 10 pixel border and then another 10 pixels
 * where nothing is plotted. Therefore 1024 + 10 + 10 = 1044.
 */
#define WIN_WIDTH 1044
#define WIN_HEIGHT 1044

/* How many little sample boxes are there within the plot
 * region?  We start with a 16x16 grid of these vbox
 * square sample sets. */
#define VBOX_REAL_COUNT 16
#define VBOX_IMAG_COUNT 16

/* How many samples are there within a given vbox? */
#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

/* At the moment we have threads that compute mandelbrot values
 * along horizontal real axi lines within a given vbox. Since the
 * vbox dimensions ( see above ) are 64x64 pixels then we really
 * are limited to 64 threads.
 */
#define MAX_THREADS 64

/* The default width and height of the plot region within the complex
 * plane. If the magnify factor is 1 then the plot region will be
 * for values from -2 to +2 on both the real and imaginary axi.
 */
#define DEFAULT_REAL_WIDTH 4.0
#define DEFAULT_IMAG_HEIGHT 4.0

/* If a user provides no input parameters then we shall assume that
 * the mandelbrot computation will bail out after 4096 loops. Also
 * the plot region is as described above and centered on the origin
 * of the complex plane. Since the magnify factor will be 1.0 then
 * we will have the region for values from -2 to +2 on both the real
 * and imaginary axi.
 */
#define DEFAULT_BAILOUT 4096
#define DEFAULT_MAGNIFY 1.0
#define DEFAULT_REAL_CENTRE 0.0
#define DEFAULT_IMAG_CENTRE 0.0

/* If there is a comparison between 64-bit floating point values
 * then we need some sort of a minimal epsilon value. Not very
 * useful with large values but the entire mandelbrot set resides
 * within the domain [-2, +2] and thus we are safe using this
 * epsilon value.
 */
#define EPSILON 1.0e-12

/* This is needed for sysinfo() call and maybe a decent flag
 * for other places also. Maybe.
 */
#define VERBOSE 1
int sysinfo(int verbose);

/* These two little functions will reverse the order of bytes
 * inside a four byte or eight byte datatype. This allows data
 * from a big endian machine to be written out to a file with
 * the same byte order as the more popular little endian systems.
 */
uint64_t swap_eight(uint64_t x);
uint32_t swap_four(uint32_t x);

/* For the moment we get X11 graphical regions on the display
 * that are nasty buggers we can not move and can not run away
 * from. Easy to create but a pain to live with. For the moment
 * we shall deal with easy to create and use. Sad but true.
 */
Window create_borderless_topwin(Display *dsp,
                         unsigned int width, unsigned int height,
                         int x, int y,
                         unsigned long bg_color);

GC create_gc(Display *dsp, Window win);

int X_error_handler(Display *dsp, XErrorEvent *errevt);

/* trivial 64-bit nanosec value returned between two timestamps */
uint64_t timediff( struct timespec st, struct timespec en );

/* sort of a hacky linear interpolation between color values */
unsigned long linear_inter( uint8_t  in_val,
                            uint32_t low_col, uint32_t high_col,
                            uint8_t  low_val, uint8_t upper_val);

unsigned long mandle_col( uint8_t height );

uint32_t mbrot( double c_r, double c_i, uint32_t bail_out );
uint32_t mbrot_fma( double c_r, double c_i, uint32_t bail_out );

int array_offset(int Vr, int Vj, int Sr, int Sj);

void *mbrot_vbox_pthread(void *recv_parm);

/* struct to pass params to dispatched thread */
typedef struct {
    double r_translate, i_translate, magnify;
    double obs_real, obs_imag;
    double *coord_r, *coord_j;
    uint32_t *mandel_val;
    uint64_t ret_val;
    int vbox_r, vbox_j;
    int eff_width, eff_height;
    int vbox_w, vbox_h;
    uint32_t bail_out;
    int t_num;
    int t_total;
} thread_parm;

/* IEEE754-2008 64bit coordinates */
typedef struct {
    double r, j;
} fp64_cplex;

void fp_region(int real, int imag,
               int real_range, int imag_range,
               fp64_cplex *locate);

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64_cplex *cplex);

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64_cplex *cplex);

