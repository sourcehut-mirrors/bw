
#include <inttypes.h>
#include <time.h>

#ifndef __mand_h__
#define __mand_h__

/* #define NUM_ELEMENTS 1073741824   big GV100 only as this needs 20G */
/* #define NUM_ELEMENTS 16777216     good for the 4096 x 4096 sample space */

#define NUM_ELEMENTS 1048576
#define THREADS_PER_BLOCK 1024
#define IMG_PIX_W 1024

/* data that made an IBM POWER9 server grind for over 1939.24 secs
 * 16777216 8589934592 -1.99998588122252840549 -0.0000000000236468622460961341858
 *
 * However, thanks to Matthew Wilson we were able to run the same
 * test on an IBM POWER10 server where we saw 1597.227 secs.
 * 
 * NOTE: what follows is just a strange test set. No idea yet.
 * This test is very strange as there are wildly different computation
 * times from the same hardware : 
 *  32768 268435456 0.399750960350502282381 0.205251797480741515756 
#define BAIL_OUT 16777216
#define MAGNIFY 8589934592
#define REAL_COORD -1.99998588122252840549
#define IMAG_COORD -0.0000000000236468622460961341858

 */

#define BAIL_OUT 262144
#define MAGNIFY 8796093022208
#define REAL_COORD -0.717535637107084123265
#define IMAG_COORD -0.284673221274577503692

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

