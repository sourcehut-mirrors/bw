
/*
 * xmand.c draw the mandelbrot set with libX11 calls and POSIX threads
 *
 *     WARNING : this entire mess is a big long hack thrown
 *               together while streaming on twitch
 *
 * Copyright (C) Dennis Clarke 2019
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

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

#include <X11/Xlib.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sched.h>
#include <time.h>
#include <math.h>
#include <fenv.h>
/* #pragma STDC FENV_ACCESS ON */

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

#include <locale.h>
#include <unistd.h>
#include <math.h>
#include <errno.h>

#include <pthread.h>

#include "mandelbrot.h"

#define EPSILON 1.0e-12
#define VERBOSE 1

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

int index(int Vbox_r, int Vbox_j, int Sr, int Sj);

/* local defs where 1044 pixels is more or less full screen
 * and 660 pixels square fits into a neat 720p res OBS setup */
#define WIN_WIDTH 1044
#define WIN_HEIGHT 1044

/* how many little sample boxes are there within the plot
 * region?  We start with a 16x16 grid of these vbox
 * square sample sets. */
#define VBOX_REAL_COUNT 16
#define VBOX_IMAG_COUNT 16

/* how many sample spots are there within a given vbox? */
#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

/* lets live with the crazy notion that we may have a bonkers
 * AMD ThreadRipper in our lives someday and just say sure we
 * can dispatch 256 threads at once. Someday. In dreams. */
#define NUM_THREADS 256

void *mbrot_vbox_pthread(void *recv_parm);

int main(int argc, char*argv[])
{
    pthread_t tid[NUM_THREADS]; /* array of thread IDs */
    /* our display and window and graphics context */
    Display *dsp;
    Window win, win2, win3;
    GC gc, gc2, gc3;
    Colormap screen_colormap;
    XEvent event;
    Font type_font;

    /* a very few colours */
    XColor red, green, blue, yellow, cyan, magenta;
    XColor cornflowerblue, royal_blue, very_dark_grey;
    XColor oldlace, mandlebrot;

    /* pre-loaded 8-bit color map */
    unsigned long lsd_trippy[256];

    /* We have a whole new method of dealing with color for
     * the mandlebrot and thus we need some intermediate vars */
    double t_param, t_param_exponent, gamma, hue, rotation;
    double shift, gamma_factor;
    uint8_t red_bits, green_bits, blue_bits;
    double red_level, green_level, blue_level;

    /* we can swap back and forth on the colour method with
     * a trivial flag */
    int colour_method_flag = 0;
    int invert_me_dammit = 0;

    /* we need a double click on replot to trigger */
    int replot_flag = 0;

    /* we need a double click on the file dumper also */
    int dumper_flag = 0;

    /* please see https://arxiv.org/abs/1108.5083
     * A colour scheme for the display of astronomical intensity images
     * D. A. Green 25 Aug 2011 (v1), revised 30 Aug 2011
     *
     * I describe a colour scheme that is appropriate for the screen
     * display of intensity images. This -- unlike many currently
     * available schemes -- is designed to be monotonically increasing
     * in terms of its perceived brightness.
     */

    /* setup mouse x and y */
    int mouse_x = -1, mouse_y = -1;
    int invert_mouse_x, invert_mouse_y;
    int mouse_x_raw, mouse_y_raw;

    /* these next five are just mouse button counters where the
     * roll_up and roll_dn are mouse wheel events */
    int button = 0;
    int left_count, mid_count, right_count, roll_up, roll_dn;
    left_count = 0;
    mid_count = 0;
    right_count = 0;
    roll_up = 0;
    roll_dn = 0;

    uint64_t t_delta;

    struct timespec t0, t1, now_time;
    struct timespec vbox_t0, vbox_t1;
    struct timespec soln_t0, soln_t1;

    /* lets assume the user will specify some number of
     * threads to dispatch at once. For now we will hard
     * code a silly limit */
    int pthread_limit = 1;

    /* some primordial vars */
    int disp_width, disp_height;
    unsigned int width, height;
    int conn_num, screen_num, depth;
    int j, k, p, q, pt, offset_x, offset_y;
    int lx, ly, ux, uy;
    int gc2_x, gc2_y;
    int eff_width, eff_height, vbox_w, vbox_h;
    double obs_x_width, obs_y_height;
    double sub_pixel_real, sub_pixel_imag;
    double pixel_real_width, pixel_imag_height;
    double magnify, real_translate, imag_translate;

    /* ensure these are initialized */
    double x_prime = -8.0;
    double y_prime = -8.0;

    /* use the vbox lower left coords as reference */
    int vbox_ll_x, vbox_ll_y;

    /* we need to track when a vbox has been computed
     * as well as displayed via libX11. For now we just
     * don't want to recompute the same region over and
     * over and over. */
    int vbox_flag[VBOX_REAL_COUNT][VBOX_IMAG_COUNT];
    /* Also we finally have use for the little box grid that we
     * lay out and thus we will need the box coordinates */
    int vbox_x, vbox_y;

    uint32_t mandel_val[VBOX_REAL_COUNT][VBOX_IMAG_COUNT][VBOX_SAMPLE_REAL][VBOX_SAMPLE_IMAG];
    memset(&mandel_val, 0x00, (size_t)(VBOX_SAMPLE_REAL*VBOX_SAMPLE_IMAG*VBOX_REAL_COUNT*VBOX_IMAG_COUNT)* sizeof(uint32_t));

    /* The actual complex coordinates are stored in 
     * two large arrays. coord_r will be all the real
     * values whereas coord_j shall hold the imaginary
     * component of any given sample point.
     *
     * The plot surface is also the sample set and it consists
     * of VBOX_REAL_COUNT*VBOX_IMAG_COUNT smaller "vbox" regions
     * with a total of VBOX_SAMPLE_REAL*VBOX_SAMPLE_IMAG samples
     * each.
     *
     * If we use the default numbers : 
     *
     *     VBOX_REAL_COUNT = 16
     *     VBOX_IMAG_COUNT = 16
     *     VBOX_SAMPLE_REAL = 64
     *     VBOX_SAMPLE_IMAG = 64
     *
     * then we easily see we have a 16x16 grid of sample set vbox
     * regions with 64x64 samples each. To index into the memory
     * arrays created below we need a small bit of math to find
     * the correct sample point.  For a sample [Sr,Sj] within a
     * vbox [Vbox_r,Vbox_j] we may index thus :
     *
     *                         
     *              index = Vbox_r * VBOX_SAMPLE_REAL + Sr
     *
     *                    + Vbox_j * VBOX_REAL_COUNT
     *                             * VBOX_SAMPLE_REAL
     *                             * VBOX_SAMPLE_IMAG
     *
     *                    + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;
     *
     * Please see test code index_check.c where this has been
     * verified.
     */
    double *coord_r = calloc(VBOX_SAMPLE_REAL*VBOX_SAMPLE_IMAG*VBOX_REAL_COUNT*VBOX_IMAG_COUNT, sizeof(double));
    if ( coord_r == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        /* NOTE : it is very nasty to bail out this way
         *        but why bother to continue ?
         */
        return EXIT_FAILURE;
    }

    double coord_j[VBOX_REAL_COUNT][VBOX_IMAG_COUNT][VBOX_SAMPLE_REAL][VBOX_SAMPLE_IMAG];
    memset(&coord_j, 0x00, (size_t)(VBOX_SAMPLE_REAL*VBOX_SAMPLE_IMAG*VBOX_REAL_COUNT*VBOX_IMAG_COUNT)* sizeof(double));

    /* pre-fill the lsd trippy color map */
    for ( k=0; k<256; k++ ) {
        lsd_trippy[k] = mandle_col((uint8_t)k);
    }

    int candidate_int = 0;
    long long unsigned int candidate_magnify = 0;

    /* the janky slider for magnify shall be a trivial
     * position that gets mapped to a binary logarithmic
     * scale from 2^(-10) to 2^(10) and thus we need
     * no more than 21 possible values. The initial
     * value shall be 2^0 == 1 as a factor and that
     * must map to positive 10 on the scale. */
    uint8_t magnify_jank_in, magnify_jank = 10;
    double magnify_factor = 1.0;

    /* the janky slider for bail_out will be nearly
     * identical to the magnify except that we will
     * trap for stupid bail_out values */
    uint8_t bail_out_jank_in, bail_out_jank = 10;
    double bail_out_factor = 1.0;

    double candidate_double = 0.0;
    int fpe_raised = 0;
    uint32_t mand_height, mand_bail;

    int mand_x_pix, mand_y_pix;

    /* These are the initial and normalized mouse fp64 values
     * from within the viewport. */
    double win_x, win_y;

    /* small general purpose char buffer */
    char *buf = calloc((size_t)128,sizeof(unsigned char));

    char *disp_name = NULL;

    setlocale( LC_ALL, "C" );

    /* Get the REALTIME_CLOCK time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {
        /* call srand48() with the sub-second time data */
        srand48( (long) now_time.tv_nsec );
    }
    sysinfo(VERBOSE);

    /* these two calls are silly and not of much value other than
     * to determine the speed of the clock_gettime() call. Which
     * we don't care much about as it had better be a microsecond. */
    clock_gettime(CLOCK_REALTIME, &soln_t0 );
    clock_gettime(CLOCK_REALTIME, &soln_t1 );
    t_delta = timediff( soln_t0, soln_t1 );
    /* this t_delta is a baseline offset value that we seem to ignore
     * anyways. */
    printf("INFO : baseline tdelta = %14" PRIu64 " nsec\n", t_delta);

    errno = 0;
    if ( ( argc < 6 ) && ( argc > 1 ) ) {
        fprintf(stderr,"FAIL : insufficient arguments provided\n");
        fprintf(stderr,"     : usage %s bail_out_integer \\\n",argv[0]);
        fprintf(stderr,"     :          magnify_integer \\\n");
        fprintf(stderr,"     :          double_real \\\n");
        fprintf(stderr,"     :          double_imaginary\\\n");
        fprintf(stderr,"     :          pthread_count\n");
        fprintf(stderr,"     : quitting.\n");
        return EXIT_FAILURE;
    } else if ( argc >= 6 ) {
        /* TODO someday maybe
         * check if the first char in argv[1] is a letter 'p' and then
         * assume the remaining digits represent a power of 2 */

        errno = 0;
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : bail_out_integer not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < 256 ) || ( candidate_int > 134217728 ) ){
            fprintf(stderr,"WARN : mandlebrot bail out is unreasonable\n");
            fprintf(stderr,"     : we shall assume 4096 and proceed.\n");
            mand_bail = (uint32_t)4096;
        } else {
            mand_bail = (uint32_t)candidate_int;
        }

        errno = 0;
        if ( sscanf( argv[2], "%lld", &candidate_magnify ) == 0 ) {
            fprintf(stderr,"INFO : magnify not understood as long long int\n");
            if ( errno != 0 ) perror("dBUG ");

            /* note that we failed to process argv[2] as a unsigned long long
             * wherein we should have more than 32bits available. We may now
             * fall back to a trivial int type which should be only 32bits */
            errno = 0;
            candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
            if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
                fprintf(stderr,"FAIL : magnify_integer not understood\n");
                perror("     ");
                return EXIT_FAILURE;
            }
            if ( ( candidate_int < 1 ) || ( candidate_int > ( 1<<30 ) ) ){
                fprintf(stderr,"WARN : magnify_integer is unreasonable\n");
                fprintf(stderr,"     : we shall assume 1 and proceed.\n");
                magnify = 1.0;
            } else {
                magnify = (double)candidate_int;
            }
        } else {
            fprintf(stderr,"INFO : magnify accepted as long long int\n");
            magnify = (double)candidate_magnify;
        }

        errno = 0;
        feclearexcept(FE_ALL_EXCEPT);
        candidate_double = strtod(argv[3], (char **)NULL);
        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
        if (fpe_raised!=0){
            printf("INFO : FP Exception raised is");
            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
            printf("\n");
        }
        if ( fpe_raised & FE_INEXACT ) {
            printf("real : Perfectly safe to ignore FE_INEXACT\n");
        }
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : double real coordinate not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
            fprintf(stderr,"FAIL : double real coordinate is not normal\n");
            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
            return EXIT_FAILURE;
        }
        feclearexcept(FE_ALL_EXCEPT);
        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
            fprintf(stderr,"WARN : double real coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
            fprintf(stderr,"     : we shall assume zero.\n");
            real_translate = 0.0;
        } else {
            real_translate = candidate_double;
        }

        errno = 0;
        feclearexcept(FE_ALL_EXCEPT);
        candidate_double = strtod(argv[4], (char **)NULL);
        fpe_raised = fetestexcept(FE_ALL_EXCEPT);
        if (fpe_raised!=0){
            printf("INFO : FP Exception raised is");
            if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
            if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
            if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
            if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
            if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
            printf("\n");
        }
        if ( fpe_raised & FE_INEXACT ) {
            printf("imag : Perfectly safe to ignore FE_INEXACT\n");
        }
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : double imaginary coordinate not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
            fprintf(stderr,"FAIL : double imaginary coordinate is not normal\n");
            fprintf(stderr,"     : looks like %-+18.12e\n", candidate_double);
            return EXIT_FAILURE;
        }
        feclearexcept(FE_ALL_EXCEPT);
        if ( ( candidate_double < -2.0 ) || ( candidate_double > 2.0 ) ){
            fprintf(stderr,"WARN : double imaginary coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", candidate_double );
            fprintf(stderr,"     : we shall assume zero.\n");
            imag_translate = 0.0;
        } else {
            imag_translate = candidate_double;
        }

        candidate_int = (int)strtol(argv[5], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : pthread_limit not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < 1 ) || ( candidate_int > 64 ) ){
            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
            pthread_limit = 1;
        } else {

            if ( candidate_int > 1 ) {

                /* snazzy little bit shifting and counting follows
                 * where this is not at all efficient but is sort of
                 * fun */

                k = 0; /* number of '1' bits in candidate_int */
                j = candidate_int;
                p = 0; /* bit position being tested */
                while (j) {
                    if ( j & 1 ) { /* test the LSB position */
                        k += 1;    /* count the '1' bit */
                    }
                    j = j >> 1;    /* shift left */
                    p += 1;        /* keep track of the bit position */
                }
                if ( k > 1 ) {
                    fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
                    fprintf(stderr,"     : power of two. We shall assume\n");
                    pthread_limit = 1 << ( p - 1 );
                    fprintf(stderr,"     : %i POSIX thread(s).\n", pthread_limit);
                } else {
                    pthread_limit = candidate_int;
                }

            } else {
                pthread_limit = 1;
            }
        }

    } else {
        fprintf(stderr,"WARN : No arguments received thus we have\n");
        fprintf(stderr,"     : some hard coded values ... enjoy.\n");
        mand_bail = 4096;
        magnify = 1.0;
        real_translate = 0.0;
        imag_translate = 0.0;
    }

    printf("\n    mand_bail = %i\n", mand_bail);
    printf("pthread_limit = %i\n", pthread_limit);

    printf("    translate = ( %-+18.14e , %-+18.14e )\n",
                                      real_translate, imag_translate );

    printf("      magnify = %-+18.12e\n\n", magnify );

    /* TODO allow adjustment of these values */
    gamma = 2.5;
    hue = 1.8;
    rotation = 5.0;
    shift = 1.0;
    t_param_exponent = 1.8;

    /* TODO perhaps use the terms real and imaginary for the
     * data axi and not just x and y. However x and y are nice
     * and short */
    obs_x_width = 4.0 / magnify;
    obs_y_height = 4.0 / magnify;

    /* ensure we start with clear vbox flags */
    memset(&vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_IMAG_COUNT)*sizeof(int));

    width = WIN_WIDTH;
    height = WIN_HEIGHT;
    printf("\n X11 : ");
    printf("default width=%4i height=%4i\n", width, height);

    XSetErrorHandler(X_error_handler);

    /* should work with a null display name */
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
        fprintf(stderr, "%s: no X server?? '%s'\n",
            argv[0], disp_name);
        return EXIT_FAILURE;
    }
    conn_num = XConnectionNumber(dsp);
    printf("     : connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("     : screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp,screen_num);
    printf("     : default depth is %i\n", depth);

    /* really we need to get a list of the available fonts and then
     * use one that should work in the correct size
     */
    type_font = XLoadFont(dsp, "lucidasanstypewriter-10");

    disp_width = DisplayWidth(dsp, screen_num);
    disp_height = DisplayHeight(dsp, screen_num);

    printf("     : display seems to be %i wide and %i high.\n",
                                   disp_width, disp_height);

    if ( ( disp_width < (int)width )
         ||
         ( disp_height < (int)height ) ) {
        fprintf(stderr, "ERROR: screen is too small\n\n");
        return EXIT_FAILURE;
    }

    /* hard coded screen offset */
    offset_x = 20;
    offset_y = 20;

    printf("     : offset x=%i y=%i\n", offset_x, offset_y);

    /* Our primary plotting window has a pale grey background
     * but for debugging mouse locations then it may be nice
     * to use Rebecca Purple 0x663399 */
    unsigned long gc_bg = 0x0f0f0f;
    win = create_borderless_topwin(dsp, width, height,
                                        offset_x, offset_y,
                                        gc_bg);
    gc = create_gc(dsp, win);

    /* create a smaller darker window to the right */
    unsigned long gc2_bg = 0x040004;
    win2 = create_borderless_topwin(dsp, 400, 330, 1070, 740, gc2_bg );
    gc2 = create_gc(dsp, win2);
    XSetBackground(dsp, gc2, gc2_bg);

    /* create another small window below that */
    unsigned long gc3_bg = 0x000810;
    win3 = create_borderless_topwin(dsp, 440, 330, 1470, 740, gc3_bg );
    gc3 = create_gc(dsp, win2);
    XSetBackground(dsp, gc3, gc3_bg);

    XSync(dsp, False);

    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "red", &red, &red) == 0) {
        fprintf(stderr, "XAllocNamedColor - no red color?\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "green", &green, &green) == 0) {
        fprintf(stderr, "XAllocNamedColor - red works but green no??\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "blue", &blue, &blue) == 0) {
        fprintf(stderr, "XAllocNamedColor - red and green okay but blue??\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "yellow", &yellow, &yellow) == 0) {
        fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");
        return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "cyan", &cyan, &cyan) == 0) {
        fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");
        return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "magenta", &magenta, &magenta) == 0) {
        fprintf(stderr, "XAllocNamedColor - magenta bork bork!\n");
        return EXIT_FAILURE;
    }

    /* cornflowerblue is #6495ED */
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "cornflowerblue",
                         &cornflowerblue, &cornflowerblue) == 0) {
        fprintf(stderr, "XAllocNamedColor - cornflowerblue fails.\n");
        return EXIT_FAILURE;
    }

    /* request Royal Blue which should be #4169E1 however we
     * will get whatever the hardware can map closest to the
     * request */
    royal_blue.flags= DoRed | DoGreen | DoBlue;
    royal_blue.red = 0x4100;
    royal_blue.green = 0x6900;
    royal_blue.blue = 0xe100;
    if ( XAllocColor(dsp, screen_colormap, &royal_blue) == 0 ) {
        fprintf(stderr, "XAllocColor - royal_blue fails.\n");
        return EXIT_FAILURE;
    }

    /* possible idea for a progress bar to show that a file
     * is being dumped */
    oldlace.flags= DoRed | DoGreen | DoBlue;
    oldlace.red = 0xfd00;
    oldlace.green = 0xf500;
    oldlace.blue = 0xe600;
    if ( XAllocColor(dsp, screen_colormap, &oldlace) == 0 ) {
        fprintf(stderr, "XAllocColor - oldlace fails.\n");
        return EXIT_FAILURE;
    }

    /* We need an inner grid which in our main plot window
     * which should be a subtle very very dark grey.
     * Here we manually define the rgb components using 16bit
     * values and then create the new color */
    very_dark_grey.flags= DoRed | DoGreen | DoBlue;
    very_dark_grey.red = 0x1f00;
    very_dark_grey.green = 0x1f00;
    very_dark_grey.blue = 0x1f00;
    if ( XAllocColor(dsp, screen_colormap, &very_dark_grey) == 0 ) {
        fprintf(stderr, "XAllocColor - very_dark_grey fails.\n");
        return EXIT_FAILURE;
    }

    /* this is a hack color data value that we will abuse later
     * inside the main mandlebrot computation loop. Colors to
     * be determined via a smooth function brought to you by
     * Patrick Scheibe. */
    mandlebrot.flags= DoRed | DoGreen | DoBlue;
    /* some dummy values */
    mandlebrot.green = 0x0000;
    mandlebrot.blue  = 0x0000;
    mandlebrot.red   = 0xff00;

    if ( XAllocColor(dsp, screen_colormap, &mandlebrot) == 0 ) {
        fprintf(stderr, "XAllocColor - gee .. mandlebrot fail.\n");
        return EXIT_FAILURE;
    }

    /* main plot window yellow pixel at each corner 5 pixels indent */
    XSetForeground(dsp, gc, yellow.pixel);
    XDrawPoint(dsp, win, gc, 5, 5);
    XDrawPoint(dsp, win, gc, 5, (int)height - 5);
    XDrawPoint(dsp, win, gc, (int)width - 5, 5);
    XDrawPoint(dsp, win, gc, (int)width - 5, (int)height - 5);

    XSetLineAttributes(dsp, gc2, 1, LineSolid,
                                    CapButt,
                                    JoinMiter);

    /* janky magnify slider container */
    XSetForeground(dsp, gc2, yellow.pixel);
    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);

    /* janky bail_out slider container */
    XSetForeground(dsp, gc2, WhitePixel(dsp, screen_num));
    XDrawRectangle(dsp, win2, gc2, 215, 60, 176, 12);

    /* draw a blue box inside the second window */
    XSetForeground(dsp, gc2, blue.pixel);
    XDrawRectangle(dsp, win2, gc2, 5, 5, 390, 320);
    XSetForeground(dsp, gc2, cyan.pixel);

    /* a little window to plot the vbox data into with a 3x3 grid
     * for each pixel we sample.  This shall be the 64x64 actual
     * vbox region with room to plot each of the 3x3 samples and
     * we also need room for the one pixel borders.
     *
     * Note : please see the defined VBOX_SAMPLE_REAL and
     *        VBOX_SAMPLE_IMAG values
     */
    XDrawRectangle(dsp, win2, gc2, 10, 10, 202, 202);
    XSetForeground(dsp, gc2, red.pixel);

    /* draw a blue box inside the third window */
    XSetForeground(dsp, gc3, blue.pixel);
    XSetLineAttributes(dsp, gc3, 1, LineSolid,
                                    CapButt,
                                    JoinMiter);

    XDrawRectangle(dsp, win3, gc3, 5, 5, 430, 320);

    /* set our graph box inside by OFFSET pixels
     *
     * reuse the offset_foo vars from above as we do not
     * need them for window location anymore. So we can
     * use them as interior offset distances for our plot.
     *
     * TODO : maybe make these a unique name and not just
     * redefine the values we used earlier. Maybe. */
    offset_x = 10;
    offset_y = 10;

    /* upper left point */
    ux = offset_x;
    uy = offset_y;

    /* lower right point */
    lx = (int)width - offset_x;
    ly = (int)height - offset_y;

    /* therefore we have effective box width and height */
    eff_width = lx - ux;
    eff_height = ly - uy;

    printf("     : eff_width = %5i    eff_height = %5i\n\n",
                           eff_width, eff_height);
    printf("--------------------------------------------\n");

    XSetLineAttributes(dsp, gc, 1, LineSolid,
                                   CapButt,
                                   JoinMiter);

    XSetForeground(dsp, gc, WhitePixel(dsp, screen_num));
    XSetForeground(dsp, gc2, green.pixel);
    XSetFont(dsp, gc2, type_font);
    XSetFont(dsp, gc3, type_font);

    /* big dumb red box for the REPLOT button */
    XSetForeground(dsp, gc2, red.pixel);
    XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
    sprintf(buf,"REPLOT");
    XDrawImageString( dsp, win2, gc2, 332, 207, buf, (int)strlen(buf));

    /* create a file dump button */
    XSetForeground(dsp, gc2, magenta.pixel);
    XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
    sprintf(buf,"DUMPER");
    XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));

    /****************************************************************
     * NOTE : see VBOX_REAL_COUNT and VBOX_IMAG_COUNT
     *
     * The viewport is made up of a neat grid of 16 x 16 little box
     * areas and we can lay down a lightly colored dashed lines to
     * indicate where they are. We may as well refer to these little
     * boxes as view box regions. Starting from the lower left at
     * vbox [0] [0] upwards to the upper most right corner which
     * we can call vbox [15] [15].
     *
     * Each of these vbox elements has a height and width in the
     * on screen pixels of :
     *
     *     vbox_w = eff_width/VBOX_REAL_COUNT
     *
     *     vbox_h = eff_height/VBOX_IMAG_COUNT
     *
     * A given vbox has VBOX_SAMPLE_REAL * VBOX_SAMPLE_IMAGE points
     * of interest with a real width of sample_w and an imaginary
     * or complex height of sample_h.
     ****************************************************************/
    vbox_w = eff_width/VBOX_REAL_COUNT;
    vbox_h = eff_height/VBOX_IMAG_COUNT;

    double vbox_real_width = obs_x_width / ( 1.0 * VBOX_REAL_COUNT );
    double vbox_imag_height = obs_y_height / ( 1.0 * VBOX_IMAG_COUNT );
    double sample_real_width = vbox_real_width / ( 1.0 * VBOX_SAMPLE_REAL );
    double sample_imag_height = vbox_imag_height / ( 1.0 * VBOX_SAMPLE_IMAG );
    double half_sample_offset_real = sample_real_width / 2.0;
    double half_sample_offset_imag = sample_imag_height / 2.0;

    /* horizontal tic marks */
    for ( j=offset_x + vbox_w; j<lx; j+=vbox_w ){
        XDrawLine(dsp, win, gc, j, 8, j, 12);
        XDrawLine(dsp, win, gc, j, (int)height - 8, j, (int)height - 12);
    }
    XFlush(dsp);

    /* vertical minor tic marks at every 16th of the interior viewport
     * drawing area */
    for ( j = offset_y + vbox_h; j < ly; j += vbox_h ){
        XDrawLine(dsp, win, gc, 8, j, 12, j);
        XDrawLine(dsp, win, gc, (int)width - 8, j, (int)width - 12, j);
    }
    XFlush(dsp);

    /* now we use the very dark grey color we created */
    XSetForeground(dsp,gc,very_dark_grey.pixel);

    /* draw the vertical lines */
    for ( j= offset_x + vbox_w; j<lx; j+=vbox_w ){
        XDrawLine(dsp, win, gc, j, 13, j, (int)height - 13);
    }

    /* draw the horizontal lines */
    for ( j = offset_y + vbox_h; j<ly; j+=vbox_h ){
        XDrawLine(dsp, win, gc, 13, j, (int)width - 13, j);
    }

    /* gc3 green text as default */
    XSetForeground(dsp, gc3, green.pixel);

    /* royal blue border around the main viewport */
    XSetForeground(dsp, gc, royal_blue.pixel);
    XDrawLine(dsp, win, gc, 11, 11, (int)width - 11, 11);
    XDrawLine(dsp, win, gc, (int)width - 11, 11, (int)width - 11, (int)height - 10);
    XDrawLine(dsp, win, gc, (int)width - 10, (int)height - 10, 10, (int)height - 10);
    XDrawLine(dsp, win, gc, 10, (int)height - 10, 10, 11);

    XFlush(dsp);

    /* TODO : at the moment the only events we are trapping are
     * the mouse buttons but in the future we will want to redraw
     * and re-expose the window if there other event types */

    XGrabPointer(dsp, win, False, ButtonPressMask, GrabModeAsync,
                           GrabModeAsync, None, None, CurrentTime);

    XSelectInput(dsp, win, ButtonPressMask);

    /* some initial time data before anyone clicks anything */
    clock_gettime(CLOCK_REALTIME, &t0 );
    clock_gettime(CLOCK_REALTIME, &t1 );
    t_delta = timediff( t0, t1 );
    /* this t_delta is a baseline offset value wherein we at least
     * know how long the clock_gettime takes. Mostly. */

    sprintf(buf,"[0000] tdelta = %14" PRIu64 " nsec", t_delta);
    XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));

    /* TODO WTF ??
     * plot some points on the grid that we created
    XSetForeground(dsp, gc, yellow.pixel);
    XDrawPoint(dsp, win, gc, 5, 5);
    */

    /* TODO
     * someday we are going to provide zoom controls and colour edit
     * controls and need to bounce way back up here and setup a
     * whole new plot globally. For now we are going to get our threads
     * setup. */
    thread_parm *parm[NUM_THREADS];
    errno = 0;

    for ( pt = 0; pt < pthread_limit; pt++ ){
        parm[pt] = calloc( (size_t) 1, (size_t) sizeof(thread_parm) );
        /* ERRORS
         *  The malloc(), calloc(), and realloc() functions will fail
         *  if:
         *
         *  ENOMEM    The physical limits of the system are exceeded by
         *            size bytes of memory which cannot be allocated.
         *
         *  EAGAIN    There is not enough memory available to allocate
         *            size bytes of memory; but the application could
         *            try again later.
         *
         * TODO put in a clean bail out procedure wherein we free up
         * and thread structures that were already calloc'd
         */
        if ( parm[pt] == NULL ) {
            if ( errno == ENOMEM ) {
                fprintf(stderr,"FAIL : calloc says ENOMEM\n");
                fprintf(stderr,"     : so best buy some more.\n");
                perror("     ");
                return EXIT_FAILURE;
            }
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
            perror("FAIL ");
            return EXIT_FAILURE;
        }
    }

    /* TODO at some point check for why we are fetching the x and y
     * values over and over and over inside the switch-case */
    while(1){

        XNextEvent(dsp,&event);
        /* in the future this will not be wise
         * if we track mouse drags */
        mouse_x=event.xbutton.x;
        mouse_y=event.xbutton.y;

        switch(event.type){
            case ButtonPress:
                switch(event.xbutton.button){
                    case Button1: /* left mouse button */
                        button=Button1;
                        left_count += 1;
                        break;

                    case Button2: /* middle mouse scroll button */
                        button=Button2;
                        mid_count += 1;
                        break;

                    case Button3: /* right mouse button */
                        button=Button3;
                        right_count += 1;
                        break;

                    case Button4: /* mouse scroll wheel up */
                        button=Button4;
                        roll_up += 1;
                        break;

                    case Button5: /* mouse scroll wheel down */
                        button=Button5;
                        roll_dn += 1;
                        break;

                    default:
                        break;
                }
            break;
        default:
            break;
        }

        mouse_x_raw = mouse_x;
        mouse_y_raw = mouse_y;
        XSetForeground(dsp, gc3, red.pixel);
        sprintf(buf,"raw  [ %-4i , %-4i ]", mouse_x_raw, mouse_y_raw);
        fprintf(stderr,"%s\n", buf);
        XDrawImageString( dsp, win3, gc3, 10, 40, buf, (int)strlen(buf));

        /* classic FiggleFratz jank adjustment of one or two pixels
         * however on 24 Sept 2020 we see that the arrow tip of the 
         * mouse cursor seems to be off by a slight amount. Thus we
         * may need to fraggle figgle smush these numbers a little */
        mouse_x = mouse_x - 1;
        mouse_y = mouse_y - 2;

        /* check left mouse button first */
        if ( button == Button1 ){
            /* are we inside the main plot region? */
            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
                 && ( mouse_x < ( eff_width + offset_x ) )
                 && ( mouse_y < ( eff_height + offset_y ) ) ) {

                /* we are inside the primary window plotting region
                 * so lets try to create floating point values for
                 * the coordinates selected. We start with just a
                 * normalized value from zero to one. */

                win_x = ( 1.0 * ( mouse_x - offset_x ) ) / eff_width;
                win_y = ( 1.0 * ( eff_height - mouse_y + offset_y ) ) / eff_height;

                /* lets try to invert the y axis */
                invert_mouse_x = mouse_x - offset_x;
                invert_mouse_y = eff_height - mouse_y + offset_y;
                sprintf(buf,"inv  [ %4i , %4i ]  ", invert_mouse_x, invert_mouse_y );
                fprintf(stderr,"%s\n", buf);

                XSetForeground(dsp, gc2, green.pixel);
                XDrawImageString( dsp, win2, gc2, 10, 230, buf, (int)strlen(buf));

                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )", win_x, win_y );
                fprintf(stderr,"%s\n", buf);
                XDrawImageString( dsp, win2, gc2, 10, 250, buf, (int)strlen(buf));

                /* a more useful value is the vbox[] coordinates for
                 * each of the 16x16 grid we previously laid out */
                vbox_x = ( mouse_x - offset_x ) / vbox_w;
                vbox_y = ( eff_height - mouse_y + offset_y ) / vbox_h;
                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_x, vbox_y );
                fprintf(stderr,"%s\n", buf);
                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf));

                /* Offset the floating point values such that the
                 * center point shall be ( 0.0, 0.0 ) */
                win_x = win_x * 2.0 - 1.0;
                win_y = win_y * 2.0 - 1.0;

                XSetForeground(dsp, gc2, cornflowerblue.pixel);
                sprintf(buf,"f+64( %-+10.8e , %-+10.8e )", win_x, win_y );
                fprintf(stderr,"%s\n", buf);
                XDrawImageString( dsp, win2, gc2, 10, 290, buf, (int)strlen(buf));

                /* At this moment we have normalized values for a
                 * location within the observation viewport. We can
                 * scale those values by half of the viewport width
                 * and height to get actual x_prime and y_prime
                 * values.
                 *
                 * All of the above allows us to compute a starting
                 * point on the observation plane
                 */

                x_prime = obs_x_width * win_x / 2.0;
                y_prime = obs_y_height * win_y / 2.0;

                /* apply the translation on the complex plane */
                x_prime = x_prime + real_translate;
                y_prime = y_prime + imag_translate;
                fprintf(stderr,"c = ( %-+22.16e, %-+22.16e )\n", x_prime, y_prime );
                XSetForeground(dsp, gc3, red.pixel);
                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime );
                XDrawImageString( dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));
                XSetForeground(dsp, gc3, green.pixel);
                sprintf(buf,"bailout = %-8i with a pthread_limit = %-3i", mand_bail, pthread_limit);
                XDrawImageString( dsp, win3, gc3, 10, 100, buf, (int)strlen(buf));
                sprintf(buf,"magnify = %-12.10e", magnify);
                XDrawImageString( dsp, win3, gc3, 10, 120, buf, (int)strlen(buf));
                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, imag_translate);
                XDrawImageString( dsp, win3, gc3, 10, 140, buf, (int)strlen(buf));

                /* what is the real and imaginary axi pixel width which
                 * gets used by the physical screen ? */
                pixel_real_width = obs_x_width / (double)eff_width;
                sprintf(buf,"pixel_real_w = %-+16.12e",pixel_real_width);
                fprintf(stderr,"%s\n", buf);
                XDrawImageString( dsp, win3, gc3, 10, 180, buf, (int)strlen(buf));
                pixel_imag_height = obs_y_height / (double)eff_height;
                sprintf(buf,"pixel_imag_h = %-+16.12e",pixel_imag_height);
                fprintf(stderr,"%s\n", buf);
                XDrawImageString( dsp, win3, gc3, 10, 200, buf, (int)strlen(buf));
                XSetForeground(dsp, gc3, cyan.pixel);

                /* time the computation before we dispatch a thread */
                clock_gettime(CLOCK_REALTIME, &soln_t0 );

                /* TODO : perhaps accept another CLI argv flag to determine
                 *        if we always do the computation here or not.
                 *        That is to say, do we always recompute the data in
                 *        a selected vbox regardless if we have already done
                 *        the whole process before, either globally or with
                 *        a single left mouse click. 
                 *
                 * The key issue here is should we redo the computation if the
                 * data already exists in the vbox? It is quite normal to paint
                 * the entire screen first and thus every vbox_flag[][] will be
                 * set to 1 as already computed. Therefore doing a dispatch of
                 * a pile of threads to redo the computation serves no purpose
                 * other then to grind the gears and get a timing report.
                 *
                 * Therefore we may use the strange conditional here of 
                 *     ( 1 || ( vbox_flag[vbox_x][vbox_y] == 0 ) )
                 * which will forever be true. Thus we grind the gears and do
                 * the thread dispatch every time. */
                if ( vbox_flag[vbox_x][vbox_y] == 0 ) {
                    for ( pt = 0; pt < pthread_limit; pt++ ) {
                        parm[pt]->t_num = pt;
                        parm[pt]->t_total = pthread_limit;
                        parm[pt]->r_translate = real_translate;
                        parm[pt]->i_translate = imag_translate;
                        parm[pt]->obs_x_width = obs_x_width;
                        parm[pt]->obs_y_height = obs_y_height;
                        parm[pt]->vbox_x = vbox_x;
                        parm[pt]->vbox_y = vbox_y;
                        parm[pt]->eff_width = eff_width;
                        parm[pt]->eff_height = eff_height;
                        parm[pt]->vbox_w = vbox_w;
                        parm[pt]->vbox_h = vbox_h;
                        parm[pt]->bail_out = mand_bail;
                        parm[pt]->v = &mandel_val;
                        parm[pt]->ret_val = 0;

                        pthread_create( &tid[pt], NULL, mbrot_vbox_pthread, (void *)parm[pt] );
                        /* TODO at some point maybe check the pthread_create err status
                         *
                         * The pthread_create() function can return any of the following errors:
                         *
                         * [ENOMEM]  The system lacked the necessary resources to create
                         *           another thread.
                         *
                         * [EAGAIN]  The system-imposed limit on the total number of
                         *           threads in a process [PTHREAD_THREADS_MAX] would be
                         *           exceeded.
                         *
                         * [EAGAIN]  The RACCT_NTHR limit would be exceeded; see racct(2).
                         *
                         * [EPERM]   The caller does not have permission to set the
                         *           scheduling parameters or scheduling policy.
                         *
                         * [EINVAL]  A value specified by attr is invalid.
                         *
                         * [EDEADLK] The CPU set specified by attr would prevent the thread
                         *           from running on any CPU.
                         *
                         * [EFAULT]  The stack base specified by attr is invalid, or the
                         *           kernel was unable to put required initial data on the
                         *           stack.
                         */
                    }
                    /* join them .. thank you and yes this is a blocking
                     * situation. Nothing happens while we await the threads. */
                    for ( pt = 0; pt < pthread_limit; pt++ ) {
                        pthread_join( tid[pt], NULL );
                        printf("PTHRD: join %i done\n", pt);
                    }
                    vbox_flag[vbox_x][vbox_y] = 1;
                }
                clock_gettime(CLOCK_REALTIME, &soln_t1 );

                t_delta = timediff( soln_t0, soln_t1 );
                sprintf(buf,"[join] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((double)t_delta)/1.0e9);
                fprintf(stderr,"%s\n",buf);
                XSetForeground(dsp, gc3, magenta.pixel);
                XDrawImageString( dsp, win3, gc3, 10, 270, buf, (int)strlen(buf));

                for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix++ ) {
                    vbox_ll_y = vbox_y * vbox_h + mand_y_pix;
                    for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x_pix++ ) {
                        vbox_ll_x = vbox_x * vbox_w + mand_x_pix;

                        win_x = ( ( ( 1.0 * vbox_ll_x ) / eff_width ) * 2.0 - 1.0 ) + 0.0;
                        win_y = ( -1.0 * ( ( ( 1.0 * ( eff_height - vbox_ll_y ) ) / eff_height ) * 2.0 - 1.0 ) ) + 0.0;

                        x_prime = obs_x_width * win_x / 2.0;
                        y_prime = obs_y_height * win_y / 2.0;

                        x_prime = x_prime + real_translate;
                        y_prime = y_prime + imag_translate;

                        mand_height = mandel_val[vbox_x][vbox_y][mand_x_pix][mand_y_pix];

                        if ( mand_height == mand_bail ) {
                            XSetForeground(dsp, gc, (unsigned long)0 );
                        } else {
                            mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand_height & 0xff) ];
                            XSetForeground(dsp, gc, mandlebrot.pixel);
                        }

                        XDrawPoint(dsp, win, gc,
                                   vbox_ll_x + offset_x,
                                   ( eff_height - vbox_ll_y + offset_y ) );

                        /* A few manual offsets of ( 16, 13 ) pixels to centre the
                         * plot data into a subwindow of gc2 */

                        gc2_x = 16 + ( 3 * mand_x_pix );
                        gc2_y = 13 + ( 192 - ( 3 * mand_y_pix ) );

                        /* walk around the samples clock wise and begin with
                         * offset the real coord by one third of pixel width */
                        for ( p = 0; p < 3; p++ ) {
                            for ( q = 0; q < 3; q++ ) {

                                sub_pixel_real = x_prime + ( p - 1 ) * pixel_real_width / 3.0;
                                sub_pixel_imag = y_prime + ( q - 1 ) * pixel_imag_height / -3.0;

                                mand_height = mbrot(sub_pixel_real, sub_pixel_imag, mand_bail);

                                if ( mand_height == mand_bail ) {
                                    XSetForeground(dsp, gc2, (unsigned long)0 );
                                } else {
                                    mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand_height & 0xff) ];
                                    XSetForeground(dsp, gc2, mandlebrot.pixel);
                                }

                                XDrawPoint( dsp, win2, gc2, gc2_x + p, gc2_y + q );

                            }
                        }
                        /* TODO we have the opportunity here to average the result
                         * of the above 3x3 sub-pixel computation. Then plot some 
                         * resultant average into the main window. 
                         *
                         * However unless we always do sub-pixel sample computation
                         * the result of a given vbox will be something strange that
                         * looks like none of its neighbours. 
                         */
                    }
                }

                clock_gettime(CLOCK_REALTIME, &soln_t0 );

                t_delta = timediff( soln_t1, soln_t0 );
                sprintf(buf,"[plot] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((double)t_delta)/1.0e9);
                fprintf(stderr,"%s\n",buf);
                XSetForeground(dsp, gc3, green.pixel);
                XDrawImageString( dsp, win3, gc3, 10, 290, buf, (int)strlen(buf));

            } else {

                /* TODO here we implement the FiggleFratz "jank" slider
                 * idea for input controls to modify essential
                 * parameters */

                /* are we inside the top jank slider for magnify ? */
                if (   ( mouse_x_raw > 1268 ) && ( mouse_y_raw > 733 )
                    && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < 742 ) ) {

                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter);
                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);

                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter);
                    /*
                    XSetForeground(dsp, gc2, yellow.pixel);
                    XDrawRectangle(dsp, win2, gc2, 215, 10, 176, 12);
                    */

                    /* horizontal midline */
                    XSetForeground(dsp, gc2, green.pixel);
                    XDrawLine(dsp, win2, gc2, 218, 16, 388, 16);

                    /* The slider shall have 21 possible positions where
                     * they map to the values -10 upwards to positive 10.
                     * These values in turn are used to select a factor
                     * to modify the magnify value from 2^(-10) upwards
                     * to 2^10 == 1024 which would be a reasonable upper
                     * limit given the whole plotting surface is 1024^2.
                     *
                     * We did start with an initial value of 10 which maps
                     * to the centre position at the zero spot.
                     *
                     * Let's draw the 21 possible locations on the scale.
                     */
                    XSetForeground(dsp, gc2, cyan.pixel);
                    for ( j = 0; j<21; j++ ) {
                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13,
                                                  5 + 218 + 8 * j, 20 );
                    }
                    /* what is the current magnify_jank value ? */
                    XSetForeground(dsp, gc2, red.pixel);
                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * magnify_jank, 13,
                                           5 + 218 + 8 * magnify_jank, 20 );

                    /* we know from direct tests that the centre line
                     * is at 1354 raw mouse X and every tick mark left
                     * or right with be 8 pixels away. */
                    magnify_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 ) / 8);

                    XDrawLine(dsp, win2, gc2,
                                           4 + 218 + 8 * magnify_jank_in, 13,
                                           4 + 218 + 8 * magnify_jank_in, 20 );

                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * magnify_jank_in, 13,
                                           5 + 218 + 8 * magnify_jank_in, 20 );

                    XDrawLine(dsp, win2, gc2,
                                           6 + 218 + 8 * magnify_jank_in, 13,
                                           6 + 218 + 8 * magnify_jank_in, 20 );

                    XSetForeground(dsp, gc2, magenta.pixel);
                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * magnify_jank, 13,
                                           5 + 218 + 8 * magnify_jank, 20 );

                    magnify_factor = pow ( 2.0, magnify_jank_in - 10 );

                    XSetForeground(dsp, gc2, cornflowerblue.pixel);
                    sprintf(buf,"f(%-+2i) = %-9.5e  ",
                                                 magnify_jank_in - 10,
                                                 magnify_factor );

                    XDrawImageString( dsp, win2, gc2, 215, 40, buf, (int)strlen(buf));

                    magnify_jank = magnify_jank_in;

                    XFlush(dsp);

                } else if ( ( mouse_x_raw > 1268 ) && ( mouse_y_raw > ( 733 + 50 ) )
                         && ( mouse_x_raw < 1440 ) && ( mouse_y_raw < ( 742 + 50 ) ) ) {

                    /* we should be inside the janky bail_out control */
                    XSetLineAttributes(dsp, gc2, 8, LineSolid, CapButt, JoinMiter);
                    XSetForeground(dsp, gc2, BlackPixel(dsp, screen_num) );
                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);

                    XSetLineAttributes(dsp, gc2, 1, LineSolid, CapButt, JoinMiter);

                    /* yellow horizontal midline */
                    XSetForeground(dsp, gc2, yellow.pixel);
                    XDrawLine(dsp, win2, gc2, 218, 16 + 50, 388, 16 + 50);

                    XSetForeground(dsp, gc2, cyan.pixel);
                    for ( j = 0; j<21; j++ ) {
                        XDrawLine(dsp, win2, gc2, 5 + 218 + 8 * j, 13 + 50,
                                                  5 + 218 + 8 * j, 20 + 50 );
                    }
                    /* what is the current bail_out_jank value ? */
                    XSetForeground(dsp, gc2, red.pixel);
                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
                                           5 + 218 + 8 * bail_out_jank, 20 + 50 );

                    /* same as above where we did tests to locate the centre
                     * and then hack along from there.  */
                    bail_out_jank_in = (uint8_t)( ( ( mouse_x_raw - 1350 ) + 80 ) / 8);

                    XDrawLine(dsp, win2, gc2,
                                           4 + 218 + 8 * bail_out_jank_in, 13 + 50,
                                           4 + 218 + 8 * bail_out_jank_in, 20 + 50 );

                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * bail_out_jank_in, 13 + 50,
                                           5 + 218 + 8 * bail_out_jank_in, 20 + 50 );

                    XDrawLine(dsp, win2, gc2,
                                           6 + 218 + 8 * bail_out_jank_in, 13 + 50,
                                           6 + 218 + 8 * bail_out_jank_in, 20 + 50 );

                    XSetForeground(dsp, gc2, magenta.pixel);
                    XDrawLine(dsp, win2, gc2,
                                           5 + 218 + 8 * bail_out_jank, 13 + 50,
                                           5 + 218 + 8 * bail_out_jank, 20 + 50 );

                    bail_out_factor = pow ( 2.0, bail_out_jank_in - 10 );
                    /* perform a test to ensure that the bail_out never falls
                     * below 256 */
                    if ( ( (double)mand_bail * bail_out_factor ) < 256.0 ) {

                        bail_out_factor = 1.0;
                        XSetForeground(dsp, gc2, red.pixel);
                        sprintf(buf,"  factor set to 1  ");
                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
                                          buf, (int)strlen(buf));

                        /* force the bail_out jank to mid-point wherein
                         * the bail_out_factor is 2^0 == 1 of course */
                        bail_out_jank = 10;

                    } else {

                        XSetForeground(dsp, gc2, green.pixel);
                        sprintf(buf,"f(%-+2i) = %-9.5e  ",
                                                 bail_out_jank_in - 10,
                                                 bail_out_factor );

                        XDrawImageString( dsp, win2, gc2, 215, 40 + 50,
                                          buf, (int)strlen(buf));

                        bail_out_jank = bail_out_jank_in;

                    }

                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 915 )
                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 932 )
                             && ( ( x_prime + 8.0 ) > EPSILON )
                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {

                    /* The above is a janky EPSILON check which verifies
                     * the mouse location is inside the REPLOT button
                     * window area.
                     *
                     * Also verify x_prime and y_prime are NOT the initial
                     *     impossible values ( -8.0, -8.0 )
                     */

                    if ( replot_flag == 0 ) {
                        /* we need that button to be double clicked so
                         * at this time we flip the button to yellow warning status */
                        XSetForeground(dsp, gc2, yellow.pixel);
                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
                        sprintf(buf,">REPLOT<");
                        XDrawImageString( dsp, win2, gc2, 324, 207, buf, (int)strlen(buf));
                        replot_flag = 1;

                    } else {
                        /* we are confirmed. Switch the replot button back to
                         * red and actually replot
                         *
                         * however we need to adjust the magnify as well as
                         * other factors
                         *
                         * So now we have bail_out_jank and we need to trap for
                         * strange values.
                         */
                        XSetForeground(dsp, gc2, red.pixel);
                        XDrawRectangle(dsp, win2, gc2, 320, 192, 72, 20);
                        sprintf(buf," REPLOT ");
                        XDrawImageString(dsp, win2, gc2, 324, 207, buf, (int)strlen(buf));
                        replot_flag = 0;
                        /* we now need to figure out what minimal stuff we can do to
                         * actually get a replot at the selected center and with
                         * the magnify_factor * whatever the current magnify is */

                        mouse_x = 512;   /* try to be dead center */
                        mouse_y = 518;   /* after a hokey adjustment */

                        mand_bail = (uint32_t)((double)mand_bail * bail_out_factor);
                        fprintf(stderr,"INFO : mand_bail changed to %" PRIu32 "\n", mand_bail);

                        magnify *= magnify_factor;
                        fprintf(stderr,"INFO : magnify changed to %-+16.10e\n", magnify);
                        obs_x_width = 4.0 / magnify;
                        obs_y_height = 4.0 / magnify;

                        colour_method_flag = 1;
                        invert_me_dammit = 0;

                        button = Button2;

                        /* trigger a recalc and thus flush vbox_flag to zero */
                        memset( &vbox_flag, 0x00, (size_t)(VBOX_REAL_COUNT*VBOX_IMAG_COUNT)*sizeof(int));

                        real_translate = x_prime;
                        imag_translate = y_prime;
                        fprintf(stderr,"INFO : c = %-+16.12e, %-+16.12e  ", x_prime, y_prime);

                        goto replot;

                    }

                } else if (     ( mouse_x_raw > 1372 ) && ( mouse_y_raw > 885 )
                             && ( mouse_x_raw < 1442 ) && ( mouse_y_raw < 903 )
                             && ( ( x_prime + 8.0 ) > EPSILON )
                             && ( ( y_prime + 8.0 ) > EPSILON ) ) {

                    /* The above is a janky EPSILON check which verifies
                     * the mouse location is inside the DUMPER button
                     * window area.
                     *
                     * Also verify x_prime and y_prime are NOT the initial
                     *     impossible values ( -8.0, -8.0 )
                     */

                    if ( dumper_flag == 0 ) {
                        /* we need that button to be double clicked so
                         * at this time we flip the button to cornflowerblue */
                        XSetForeground(dsp, gc2, cornflowerblue.pixel);
                        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
                        sprintf(buf,">DUMPER<");
                        XDrawImageString( dsp, win2, gc2, 324, 177, buf, (int)strlen(buf));
                        dumper_flag = 1;
                        fprintf(stderr,"INFO : dumper_flag = 1\n");

                    } else {
                        /* we are confirmed. Switch the dumper button back to
                         * magenta and create a new data file in the users TMPDIR
                         */

                        XSetForeground(dsp, gc2, magenta.pixel);
                        XDrawRectangle(dsp, win2, gc2, 320, 162, 72, 20);
                        sprintf(buf,"DUMPER");
                        XDrawImageString(dsp, win2, gc2, 332, 177, buf, (int)strlen(buf));

                        /* TODO dump file data */
                        dumper_flag = 0;
                        fprintf(stderr,"INFO : dumper_flag = 0\n");

                    }
                }
            }

        } else if ( button == Button2 ) {

replot:
            if (    ( mouse_x >=  offset_x ) && ( mouse_y >= offset_y )
                 && ( mouse_x < ( eff_width + offset_x ) )
                 && ( mouse_y < ( eff_height + offset_y ) ) ) {

                /* we are inside the primary window plotting region */
                win_x = ( 1.0 * ( mouse_x - offset_x ) ) / eff_width;
                win_y = ( 1.0 * ( eff_height - mouse_y + offset_y ) ) / eff_height;

                printf("DBUG : button 2 pressed\n");
                printf("     : win_x = %-+26.20e\n", win_x );
                printf("     : win_y = %-+26.20e\n", win_y );

                /* invert the y axis */
                invert_mouse_x = mouse_x - offset_x;
                invert_mouse_y = eff_height - mouse_y + offset_y;
                sprintf(buf,"inv  [ %4i , %4i ]  ", invert_mouse_x, invert_mouse_y );
                printf("     : invert_mouse_x = %4i\n", invert_mouse_x);
                printf("     : invert_mouse_y = %4i\n", invert_mouse_y);

                XSetForeground(dsp, gc2, green.pixel);
                XDrawImageString( dsp, win2, gc2, 10, 230, buf, (int)strlen(buf));

                sprintf(buf,"fp64( %-10.8e , %-10.8e )", win_x, win_y );
                XDrawImageString( dsp, win2, gc2, 10, 250, buf, (int)strlen(buf));

                /* vbox[] coordinates for the 16x16 grid */
                vbox_x = ( mouse_x - offset_x ) / vbox_w;
                vbox_y = ( eff_height - mouse_y + offset_y ) / vbox_h;
                sprintf(buf,"vbox  [ %03i , %03i ]", vbox_x, vbox_y );
                printf("     : %s\n");
                XDrawImageString( dsp, win2, gc2, 10, 270, buf, (int)strlen(buf));

                /* Offset the floating point values such that the
                 * center point shall be ( 0.0, 0.0 ) */
                win_x = win_x * 2.0 - 1.0;
                win_y = win_y * 2.0 - 1.0;
                printf("DBUG : after offset\n");
                printf("     : win_x = %-+26.20e\n", win_x );
                printf("     : win_y = %-+26.20e\n", win_y );

                XSetForeground(dsp, gc2, cornflowerblue.pixel);
                sprintf(buf,"fp64( %-+10.8e , %-+10.8e )  ", win_x, win_y );
                XDrawImageString( dsp, win2, gc2, 10, 290, buf, (int)strlen(buf));

                x_prime = obs_x_width * win_x / 2.0;
                y_prime = obs_y_height * win_y / 2.0;

                printf("     : x_prime = %-+26.20e\n", x_prime );
                printf("     : y_prime = %-+26.20e\n", y_prime );

                /* translation */
                x_prime = x_prime + real_translate;
                y_prime = y_prime + imag_translate;
                printf("DBUG : after translation\n");
                printf("     : r_trn   = %-+26.20e\n", real_translate );
                printf("     : j_trn   = %-+26.20e\n", imag_translate );
                printf("     : x_prime = %-+26.20e\n", x_prime );
                printf("     : y_prime = %-+26.20e\n", y_prime );

                XSetForeground(dsp, gc3, red.pixel);
                sprintf(buf," select = %-+16.12e, %-+16.12e  ", x_prime, y_prime );

                XDrawImageString( dsp, win3, gc3, 10, 80, buf, (int)strlen(buf));
                XSetForeground(dsp, gc3, green.pixel);
                sprintf(buf,"bailout = %-8i          ", mand_bail);
                printf("     : %s\n", buf);
                XDrawImageString( dsp, win3, gc3, 10, 100, buf, (int)strlen(buf));
                sprintf(buf,"magnify = %-12.10e", magnify);
                printf("     : magnify = %-18.12e\n", magnify);
                XDrawImageString( dsp, win3, gc3, 10, 120, buf, (int)strlen(buf));
                sprintf(buf," centre = %-+16.12e, %-+16.12e  ", real_translate, imag_translate);
                printf("     : centre = %-+26.20e, %-+26.20e\n", real_translate, imag_translate);
                XDrawImageString( dsp, win3, gc3, 10, 140, buf, (int)strlen(buf));
                XSetForeground(dsp, gc3, cyan.pixel);

                clock_gettime(CLOCK_REALTIME, &soln_t0 );

                if ( colour_method_flag == 1 ) {
                    colour_method_flag = 0;
                } else {
                    colour_method_flag = 1;
                    if ( invert_me_dammit == 0 ) {
                        invert_me_dammit = 1;
                    } else {
                        invert_me_dammit = 0;
                    }
                }

                /* here we loop over the vbox coords */
                for ( vbox_y = 0; vbox_y < VBOX_IMAG_COUNT; vbox_y++ ) {
                    for ( vbox_x = 0; vbox_x < VBOX_REAL_COUNT; vbox_x++ ) {
                        /* TODO please fix this */
                        if ( 1 ) {  /* vbox_flag[vbox_x][vbox_y] == 0 */
                            clock_gettime(CLOCK_REALTIME, &vbox_t0 );
                            for ( mand_y_pix = 0; mand_y_pix < vbox_h; mand_y_pix++ ) {
                                vbox_ll_y = vbox_y * vbox_h + mand_y_pix;
                                for ( mand_x_pix = 0; mand_x_pix < vbox_w; mand_x_pix++ ) {
                                    vbox_ll_x = vbox_x * vbox_w + mand_x_pix;

                                    /* The double precision floating point value
                                     * of ( win_x, win_y ) represents the position
                                     * within the plotting region with the lower
                                     * left most corner being ( -1, -1 ) and the
                                     * upper right corner is ( +1, +1 )
                                     */
                                    win_x = ( ( ( 1.0 * vbox_ll_x )
                                                / eff_width ) * 2.0 - 1.0 ) + 0.0;

                                    win_y = ( -1.0 *
                                              ( (
                                                   ( 1.0 * ( eff_height - vbox_ll_y ) ) / eff_height
                                                ) * 2.0 - 1.0
                                              ) ) + 0.0;

                                    /* note that the observable x width is just our
                                     * defined 4.0 / magnify and thus if we assume a
                                     * trivial magnify of 1 then the point on the
                                     * complex plane for (x_prime,y_prime) will simply
                                     * be the lower left corner of our default complex
                                     * plane bounded by ( -2, -2j ) in the lower left
                                     * corner and ( 2, 2j ) in the upper right corner.
                                     */
                                    x_prime = obs_x_width * win_x / 2.0;
                                    y_prime = obs_y_height * win_y / 2.0;

                                    /* we then translate the entire complex plane by our
                                     * selected centre position.
                                     */
                                    x_prime = x_prime + real_translate;
                                    y_prime = y_prime + imag_translate;

                                    /* we need a trivial adjustment to ( x_prime, y_prime ) to
                                     * account for the offset into the centre of a square
                                     * sample.
                                     */

                                    x_prime = x_prime + half_sample_offset_real;
                                    y_prime = y_prime + half_sample_offset_imag;

                                    if ( vbox_flag[vbox_x][vbox_y] == 1 ) {
                                        mand_height = mandel_val[vbox_x][vbox_y][mand_x_pix][mand_y_pix];
                                    } else {
                                        /* In the past we abused the stack with a trivial
                                         * and massive array. Now we shall index into heap
                                         * as described in index_check.c */
                                        *(coord_r + index(vbox_x,vbox_y,mand_x_pix,mand_y_pix)) = x_prime;

                                        /* coord_r[vbox_x][vbox_y][mand_x_pix][mand_y_pix] = x_prime; */
                                        coord_j[vbox_x][vbox_y][mand_x_pix][mand_y_pix] = y_prime;

                                        /* the actual mandelbrot computation for (x_prime, y_prime) */
                                        mand_height = mbrot(x_prime, y_prime, mand_bail);
                                        mandel_val[vbox_x][vbox_y][mand_x_pix][mand_y_pix] = mand_height;
                                    }

                                    if ( colour_method_flag == 1 ) {

                                        if ( invert_me_dammit == 0 ) {
                                            t_param = pow( ( (double)mand_height / (double)mand_bail ), t_param_exponent);
                                        } else {
                                            t_param = pow( 1.0 - ( (double)mand_height / (double)mand_bail ), t_param_exponent);
                                        }

                                        gamma_factor = pow( t_param, gamma );

                                        red_level  =  gamma_factor + ( hue * gamma_factor * ( 1.0 - gamma_factor )
                                                        * ( -0.14861 * cos( 2.0 * M_PI * ( shift/3.0 + rotation * t_param ) )
                                                        + 1.78277 * sin( 2.0 * M_PI * ( shift/3.0 + rotation * t_param ))))/2.0;

                                        green_level = gamma_factor + ( hue * gamma_factor * ( 1.0 - gamma_factor )
                                                        * ( -0.29227 * cos( 2.0 * M_PI * ( shift/3.0 + rotation * t_param ) )
                                                        - 0.90649 * sin( 2.0 * M_PI * ( shift/3.0 + rotation * t_param ))))/2.0;

                                        blue_level  = gamma_factor + ( hue * gamma_factor * ( 1.0 - gamma_factor)
                                                        * (1.97294 * cos( 2.0 * M_PI * (shift/3.0 + rotation * t_param ))))/2.0;

                                        red_bits     = (uint8_t) ( 255.0 * ( red_level > 1.0 ? 1.0 :
                                                                           ( red_level < 0.0 ? 0.0 : red_level ) ) );

                                        green_bits   = (uint8_t) ( 255.0 * ( green_level > 1.0 ? 1.0 :
                                                                           ( green_level < 0.0 ? 0.0 : green_level ) ) );

                                        blue_bits    = (uint8_t) ( 255.0 * ( blue_level > 1.0 ? 1.0 :
                                                                           ( blue_level < 0.0 ? 0.0 : blue_level ) ) );


                                        mandlebrot.pixel = (unsigned long)( ( red_bits<<16 ) + ( green_bits<<8 ) + blue_bits );

                                        XSetForeground(dsp, gc, mandlebrot.pixel);

                                    } else {

                                        if ( mand_height == mand_bail ) {
                                            XSetForeground(dsp, gc, (unsigned long)0 );
                                        } else {
                                            mandlebrot.pixel = lsd_trippy[ (uint8_t)(mand_height & 0xff) ];
                                            XSetForeground(dsp, gc, mandlebrot.pixel);
                                        }
                                    }

                                    XDrawPoint(dsp, win, gc, vbox_ll_x + offset_x, ( eff_height - vbox_ll_y + offset_y ) );

                                }
                            }
                            vbox_flag[vbox_x][vbox_y] = 1;
                            clock_gettime(CLOCK_REALTIME, &vbox_t1 );
                            t_delta = timediff( vbox_t0, vbox_t1);
                            sprintf(buf,"[vbox] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((double)t_delta)/1.0e9);
                            XSetForeground(dsp, gc3, yellow.pixel);
                            XDrawImageString( dsp, win3, gc3, 10, 310, buf, (int)strlen(buf));
                        }
                    } /* vbox_x for */
                } /* vbox_y for */

                /* reset the mand_bail adjustment parameters */
                bail_out_factor = 1.0;
                bail_out_jank = 10;
            } /* inside main plot area check */

            XSetForeground(dsp, gc, yellow.pixel);
            clock_gettime(CLOCK_REALTIME, &soln_t1 );
            t_delta = timediff( soln_t0, soln_t1 );
            sprintf(buf,"[mand] = %14" PRIu64 " nsec   %08.6e sec", t_delta, ((double)t_delta)/1.0e9);
            fprintf(stderr,"%s\n\n",buf);
            XSetForeground(dsp, gc2, red.pixel);
            XDrawImageString( dsp, win2, gc2, 10, 310, buf, (int)strlen(buf));

            printf("\nraw data values -------------------------------------------------------\n");

            printf("     : r[ 0][ 0][ 0][ 0] = %-+26.20e\n", *(coord_r + index(0,0,0,0)));
            printf("     : j[ 0][ 0][ 0][ 0] = %-+26.20e\n", coord_j[0][0][0][0]);
            printf("     :       mand_height = %9i\n",    mandel_val[0][0][0][0] );

            printf("     : r[ 7][ 7][63][63] = %-+26.20e\n", *(coord_r + index(7,7,63,63)));
            printf("     : j[ 7][ 7][63][63] = %-+26.20e\n", coord_j[ 7][ 7][63][63]);
            printf("     :       mand_height = %9i\n",    mandel_val[ 7][ 7][63][63] );

            printf("     : r[ 8][ 8][ 0][ 0] = %-+26.20e\n", *(coord_r + index(8,8,0,0)));
            printf("     : j[ 8][ 8][ 0][ 0] = %-+26.20e\n", coord_j[8][8][0][0]);
            printf("     :       mand_height = %9i\n",    mandel_val[8][8][0][0] );

            printf("     : r[ 8][ 8][ 1][ 0] = %-+26.20e\n", *(coord_r + index(8,8,1,0)));
            printf("     : j[ 8][ 8][ 1][ 0] = %-+26.20e\n", coord_j[8][8][1][0]);
            printf("     :       mand_height = %9i\n",    mandel_val[8][8][1][0] );

            printf("     : r[ 8][ 8][32][32] = %-+26.20e\n", *(coord_r + index(8,8,32,32)));
            printf("     : j[ 8][ 8][32][32] = %-+26.20e\n", coord_j[8][8][32][32]);
            printf("     :       mand_height = %9i\n",    mandel_val[8][8][32][32] );

            printf("     : r[ 3][12][44][21] = %-+26.20e\n", *(coord_r + index(3,12,44,21)));
            printf("     : j[ 3][12][44][21] = %-+26.20e\n", coord_j[3][12][44][21]);
            printf("     :       mand_height = %9i\n",    mandel_val[3][12][44][21]);

            printf("     : r[15][15][63][63] = %-+26.20e\n", *(coord_r + index(15,15,63,63)));
            printf("     : j[15][15][63][63] = %-+26.20e\n", coord_j[15][15][63][63]);
            printf("     :       mand_height = %9i\n",    mandel_val[15][15][63][63]);

            printf("--------------------------- full plot done -----------------------------\n");
            
        } else if ( button == Button3 ) {

            printf("right click\n");
            clock_gettime(CLOCK_REALTIME, &t1 );
            t_delta = timediff( t0, t1 );

            sprintf(buf,"[%04i] tdelta = %14" PRIu64 " nsec", right_count, t_delta);

            XDrawImageString( dsp, win3, gc3, 10, 20, buf, (int)strlen(buf));

            t0.tv_sec = t1.tv_sec;
            t0.tv_nsec = t1.tv_nsec;
            /* If a 200ms right double click anywhere then quit */
            if ( t_delta < 200000000 ) {
                printf("\n\n");
                /* If we allocate memory for any purpose whatsoever
                 * then we had better free() it. */
                break;
            }

        } else if ( button == Button4 ) {

            /* TODO note that a mouse wheel event being used here to
             * track observation plane position will result in all
             * data being redrawn. */
            printf("roll up\n");

        } else if ( button == Button5 ) {

            printf("roll down\n");

        } else {

            printf("\n ??? unknown button ???\n");

        }

        printf("click at %d %d \n", mouse_x, mouse_y);

    }

    XCloseDisplay(dsp);

    printf("\n");

    /* it may seem insane to set the pointer to NULL after the
     * free() but why not have belt and suspenders safety? */
    free(buf);
    buf = NULL;
    for ( pt = 0; pt < pthread_limit; pt++ ){
        free( parm[pt] );
        parm[pt] = NULL;
    }

    free(coord_r);
    coord_r = NULL;

    return EXIT_SUCCESS;
}

int index(int Vbox_r, int Vbox_j, int Sr, int Sj) {

    return Vbox_r * VBOX_SAMPLE_REAL + Sr

           + Vbox_j * VBOX_REAL_COUNT
                    * VBOX_SAMPLE_REAL
                    * VBOX_SAMPLE_IMAG
      
           + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;

}

