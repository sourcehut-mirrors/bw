
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

#include <time.h>
#include <X11/Xlib.h>

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

#define EPSILON 1.0e-12
#define VERBOSE 1

uint64_t rot8(uint64_t x);
uint32_t rot4(uint32_t x);

Window create_borderless_topwin(Display *dsp,
                         unsigned int width, unsigned int height,
                         int x, int y,
                         unsigned long bg_color);

GC create_gc(Display *dsp, Window win);

int X_error_handler(Display *dsp, XErrorEvent *errevt);

uint64_t timediff( struct timespec st, struct timespec en );

int sysinfo(int verbose);

unsigned long mandle_col( uint8_t height );

uint32_t mbrot( double c_r, double c_i, uint32_t bail_out );

int array_offset(int Vr, int Vj, int Sr, int Sj);

void *mbrot_vbox_pthread(void *recv_parm);

/* struct to pass params to dispatched thread */
typedef struct {
    double r_translate, i_translate, magnify;
    double obs_real, obs_imag;
    uint32_t (*v)[16][16][64][64];
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
} fp64;

void fp_region(int real, int imag,
               int real_range, int imag_range,
               fp64 *locate);

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64 *cplex);

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64 *cplex);

