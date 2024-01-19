
#include <inttypes.h>
#include <time.h>

#ifndef __mand_h__
#define __mand_h__

/* #define NUM_ELEMENTS 1073741824   big GV100 only as this needs 20G */
/* #define NUM_ELEMENTS 16777216     good for the 4096 x 4096 sample space */

#define NUM_ELEMENTS 1048576
#define THREADS_PER_BLOCK 1024
#define IMG_PIX_W 1024

/* something extreme
 *      : r_trn   = -1.99998588122252840548753738e+00
 *      : j_trn   = -2.36468622460961341857910156e-11
 *      : x_prime = -1.99998588122684850532095879e+00
 *      : y_prime = -2.16004991671070456504821777e-11
 *      : bailout = 16777216
 *      : magnify = 8.589934592000e+09
 *
 * even on a very fast machine this takes a long time
 * [mand] =  5391890426271 nsec   5.391890e+03 sec

    mand_bail = 32768
    translate = ( -1.57887752805699992098e-02  , +1.02061921088799989477e+00  )
      magnify = +2.748779069440e+11 

 */

#define BAIL_OUT 32768
#define MAGNIFY 274877906944
#define REAL_COORD -0.0157887752805699992098
#define IMAG_COORD +1.02061921088799989477


/* TODO read in the established data files */
#define VBOX_REAL_COUNT 16
#define VBOX_IMAG_COUNT 16
#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

#define DEFAULT_REAL_WIDTH 4.0
#define DEFAULT_IMAG_HEIGHT 4.0

/* IEEE754-2008 64bit complex coordinates */
typedef struct {
    double r, j;
} fp64_cplex;

int ConvertSMVer2Cores(int major, int minor);
uint64_t timediff( struct timespec st, struct timespec en );
uint32_t cpu_mbrot( double c_r, double c_i, uint32_t bail_out );

__global__ void gpu_mbrot( const double *c_r, const double *c_i, uint32_t *mval, int num_elements );

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64_cplex *cplex);

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64_cplex *cplex);

/* two diff flavours of the same thing */
int array_offset(int Vr, int Vj, int Sr, int Sj);

int array_index(uint32_t Vr, uint32_t Vj,
                uint32_t Sr, uint32_t Sj,
                uint32_t vbox_real_count,
                uint32_t vbox_sample_real,
                uint32_t vbox_sample_imag );


#endif

