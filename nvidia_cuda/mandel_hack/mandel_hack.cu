/**
 * hacked at by Dennis Clarke
 * okay hacked a LOT. Then a lot more. Currently we may
 * have a problem with needing cudaDeviceSynchronize over
 * and over. Also perhaps a device reset may be a needed
 * up front. Not sure yet.
 *
 * https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__DEVICE.html
 *
 * Lets get system info and memory reports for local host
 * and then use the system clock to init the drand prng pool.
 */

#include <errno.h>
#include <inttypes.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <cuda_profiler_api.h>
#include <omp.h>

/* #define NUM_ELEMENTS 1073741824   big GV100 only as this needs 20G */
/* #define NUM_ELEMENTS 16777216 */

#define NUM_ELEMENTS 1048576
#define THREADS_PER_BLOCK 1024


/* dataset 2 */
#define BAIL_OUT 32768
#define MAGNIFY 274877906944
#define REAL_COORD -0.0157887752805699992098
#define IMAG_COORD  1.02061921088799989477
#define IMG_PIX_W 1024

/* this is the reference dataset 1 
#define BAIL_OUT 32768
#define MAGNIFY 268435456
#define REAL_COORD 0.399750960350502282381
#define IMAG_COORD 0.205251797480741515756
#define IMG_PIX_W 1024
*/

/* TODO read in the established data files */
#define VBOX_REAL_COUNT 16
#define VBOX_IMAG_COUNT 16
#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

#define DEFAULT_REAL_WIDTH 4.0
#define DEFAULT_IMAG_HEIGHT 4.0

/* IEEE754-2008 64bit coordinates */
typedef struct {
    double r, j;
} fp64_cplex;

int sysinfo(void);
uint64_t system_memory();
uint64_t timediff( struct timespec st, struct timespec en );
uint32_t cpu_mbrot( double c_r, double c_i, uint32_t bail_out );

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


/**
 * CUDA Kernel Device code
 */
__global__ void
gpu_mbrot( const double *c_r, const double *c_i,
       uint32_t *mval, int num_elements )
{

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    uint32_t height = 0;
    double zr = 0.0;
    double zi = 0.0;
    double tmp_r, tmp_i;
    double mag = 0.0;
    double temp0, temp1;

    if ( i < num_elements ) {

        while ( ( height < BAIL_OUT ) && ( mag < 4.0 ) ) {
            /* previous to the grand FMA intrinsics experiment 
            tmp_r = ( zr * zr ) - ( zi * zi );
            tmp_i = ( zr * zi ) + ( zr * zi );
            zr = tmp_r + c_r[i];
            zi = tmp_i + c_i[i];
            mag = zr * zr + zi * zi;
            */

            temp0 = -1.0 * zi * zi;
            tmp_r = __fma_rn( zr, zr, temp0);
            
            temp1 = zr * zi;
            tmp_i = __fma_rn( zr, zi, temp1);

            zr = tmp_r + c_r[i];
            zi = tmp_i + c_i[i];
 
            temp0 = zi * zi;
            mag = __fma_rn( zr, zr, temp0);

            height += 1;
        }

        mval[i] = height;

    }

}

int main(int argc, char *argv[])
{
    struct timespec t0, t1;
    uint64_t tdelta_nsec;

    cudaError_t err = cudaSuccess;

    /* this gets passed around a lot so I make an actual
     * int variable that never changes anyways */
    int num_elements = NUM_ELEMENTS;

    /* we need to generate the coordinates */
    int sample_counter = 0;
    int vbox_r, vbox_j, sample_r, sample_j;

    /* this is a square arry of samples */
    int eff_width = IMG_PIX_W;
    int eff_height = eff_width; 

    /* the actual complex coordinate data element */
    fp64_cplex coord_cplex;

    size_t size_coord, size_height;

    double *host_r, *host_j, *device_r, *device_j;
    double centre_r, centre_j;
    double magnify = 1.0 * MAGNIFY;
    int mand_bail = BAIL_OUT;

    uint32_t *host_mval, *device_mval;

    /* if we do a CPU based check we need this var 
    uint32_t check_val;
    */

    /* dump out the data in the usual way as defined in the 
     * xmand readme.data file
     */
    time_t time_now;
    struct tm *ptm;
    struct stat status_buffer;
    size_t num_written;
    uint32_t temp32bit;
    FILE *fp;

    /* do we even have a NVidia Quadro GPU ? */
    int num_gpus = 0;

    setlocale( LC_ALL, "C" );
    int status = setenv("TZ", "GMT0", 1);
    sysinfo();

    time(&time_now);
    ptm = gmtime(&time_now);


    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime( CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return(EXIT_FAILURE);
    } else {
        /* to get a random seed value we should use the clock
         * nanosec value. There may be better ways and we 
         * could even read /dev/random to get some bytes and
         * then seed with that .. however this is cheap and 
         * easy.
         *   
         *   srand48((long int)t0.tv_nsec);
         *
         * if we want the exact same data over and over then
         *  use a constant parameter here : 
         *
         *  srand48(((long int)123456789));
         *
         */
         srand48((long int)t0.tv_nsec);
    }

    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if ( num_gpus < 1 ) {
        printf("INFO : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }

    /* we may as well do a cudaDeviceReset ( void ) 
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    */
    err = cudaDeviceReset();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }

    /* display CPU and GPU configuration */
    printf("INFO : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("INFO : number of CUDA devices:\t%d\n", num_gpus);

    for (int i = 0; i < num_gpus; i++) {
        cudaDeviceProp dprop;
        cudaGetDeviceProperties(&dprop, i);
        printf("     :    %d: %s\n", i, dprop.name);
    }

    /* Under normal circumstances where we are not doing any sort
     * of a magnify then the region of interest on the complex 
     * plane is just ( -2, -2 ) to ( 2, 2 ).  Thus the width and
     * height of the entire region of interest is 4 units.
     */
    double view_width = 4.0 / magnify;
    double offset_width = view_width / 2.0;

    size_coord = num_elements * sizeof(double);
    size_height = num_elements * sizeof(uint32_t);

    printf("INFO : firing off %i cuda core code chunks\n",
                                                         num_elements);

    printf("     : mem size of double data array is %ld bytes\n",
                                                          size_coord );

    printf("     : mem size of uint32_t height array is %ld bytes\n",
                                                         size_height );

    host_r = (double *)malloc(size_coord);
    host_j = (double *)malloc(size_coord);
    host_mval = (uint32_t *)calloc(num_elements,sizeof(uint32_t));

    if ( ( host_r == NULL )
            || ( host_j == NULL )
            || ( host_mval == NULL ) ) {
        fprintf(stderr, "FAIL : memory allocate\n");
        exit(EXIT_FAILURE);
    }

    centre_r = REAL_COORD;
    centre_j = IMAG_COORD;

    clock_gettime( CLOCK_REALTIME, &t0 );

    /**********************************************
     * TODO : read the data files
     * check for a filename in argv[1] and then
     * just read in the coordinate data as well
     * as the expected mandelbrot result.
     **********************************************/

    /* we can always resort to the drand48 stuff 
    for (int i = 0; i < num_elements; ++i) {

        host_r[i] = centre_r - offset_width
                          + ((int)( drand48() * IMG_PIX_W ))
                              * view_width/((double)IMG_PIX_W);

        host_j[i] = centre_j - offset_width
                          + ((int)( drand48() * IMG_PIX_W ))
                              * view_width/((double)IMG_PIX_W);
    }
    */

    sample_counter = 0;
    for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ ) {
        for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_r++ ) {
            for ( sample_j = 0; sample_j < VBOX_SAMPLE_IMAG; sample_j++ ) {
                for ( sample_r = 0; sample_r < VBOX_SAMPLE_REAL; sample_r++ ) {

                    fp_vbox(vbox_r, vbox_j, sample_r, sample_j,
                            eff_width, eff_height, &coord_cplex);

                    fp_translate(coord_cplex.r, coord_cplex.j,
                            magnify, centre_r, centre_j, &coord_cplex);

                    host_r[array_offset(vbox_r, vbox_j, sample_r, sample_j)]=coord_cplex.r;
                    host_j[array_offset(vbox_r, vbox_j, sample_r, sample_j)]=coord_cplex.j;

                    sample_counter += 1;

                }
            }
        }
    }

    printf("\n-----------------------------------------------------------\n");

    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : %i coord loaded %" PRIu64 " nsecs\n", sample_counter, tdelta_nsec);

    clock_gettime( CLOCK_REALTIME, &t0 );
    device_r = NULL;
    if (cudaMalloc((void **)&device_r, size_coord) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA fail allocate real array\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMalloc device_r %" PRIu64 " nsecs\n",
                                                         tdelta_nsec);


    clock_gettime( CLOCK_REALTIME, &t0 );
    device_j = NULL;
    if (cudaMalloc((void **)&device_j, size_coord) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA fail allocate imaginary array\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMalloc device_j %" PRIu64 " nsecs\n",
                                                          tdelta_nsec);

    /*
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    */

    clock_gettime( CLOCK_REALTIME, &t0 );
    device_mval = NULL;
    if (cudaMalloc((void **)&device_mval, size_height) != cudaSuccess){
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA fail allocate height array\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMalloc device_mval %" PRIu64 " nsecs\n",
                                                          tdelta_nsec);


    /*
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    */

    /* Copy the host input arrays in host memory
     * to the device memory */
    clock_gettime( CLOCK_REALTIME, &t0 );
    /* possible stuff that can happen with cudaMemcpy()
     *
     *   cudaErrorInvalidValue
     *   cudaErrorInvalidDevicePointer
     *   cudaErrorInvalidMemcpyDirection
     */
    err = cudaMemcpy(device_r,host_r,size_coord,cudaMemcpyHostToDevice);
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed memcopy host to device\n");
        fprintf(stderr, "FAIL : error ");

        if ( err == cudaErrorInvalidValue ) {
            fprintf(stderr, "cudaErrorInvalidValue\n");
        } else if ( err == cudaErrorInvalidDevicePointer ) {
            fprintf(stderr, "cudaErrorInvalidDevicePointer\n");
        } else if ( err == cudaErrorInvalidMemcpyDirection ) {
            fprintf(stderr, "cudaErrorInvalidMemcpyDirection\n");
        } else {
            fprintf(stderr, "what the absolute fuck?\n");
            fprintf(stderr, "err = %0x\n", err );
        }
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of real data from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMemcpy() %" PRIu64 "nsecs\n", tdelta_nsec);

    /*
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    */

    clock_gettime( CLOCK_REALTIME, &t0 );

    err = cudaMemcpy(device_j,host_j,size_coord,cudaMemcpyHostToDevice);
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed memcopy host to device\n");
        fprintf(stderr, "FAIL : error ");

        if ( err == cudaErrorInvalidValue ) {
            fprintf(stderr, "cudaErrorInvalidValue\n");
        } else if ( err == cudaErrorInvalidDevicePointer ) {
            fprintf(stderr, "cudaErrorInvalidDevicePointer\n");
        } else if ( err == cudaErrorInvalidMemcpyDirection ) {
            fprintf(stderr, "cudaErrorInvalidMemcpyDirection\n");
        } else {
            fprintf(stderr, "what the absolute fuck?\n");
            fprintf(stderr, "err = %0x\n", err );
        }
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of imaginary data from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMemcpy() %" PRIu64 " nsecs\n", tdelta_nsec);


    /* fire off the cuda "kernel" code blocks */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid = ( num_elements + threadsPerBlock - 1 )
                        / threadsPerBlock;

    printf("INFO : CUDA kernel launch with %d blocks of %d threads\n",
                                       blocksPerGrid, threadsPerBlock);

    /*
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    */

    clock_gettime( CLOCK_REALTIME, &t0 );

    /* the NVidia CUDA code format is a bit special */
    gpu_mbrot<<<blocksPerGrid, threadsPerBlock>>>( device_r, device_j, device_mval, num_elements );

    err = cudaGetLastError();
    if ( err != cudaSuccess ) {
        fprintf(stderr, "FAIL : CUDA failed\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        fprintf(stderr, "FAIL : err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    printf("INFO : done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : gpu_mbrot time delta %" PRIu64 " nsecs\n", tdelta_nsec);


    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }

    /* Copy the device result memory to the host result memory */
    clock_gettime( CLOCK_REALTIME, &t0 );

    err = cudaMemcpy(host_mval, device_mval, size_height, cudaMemcpyDeviceToHost);
    if ( err != cudaSuccess) {
        fprintf(stderr, "DBUG : at %d in %s\n", __LINE__, __FILE__);
        fprintf(stderr, "FAIL : CUDA fail copy result to host\n");
        fprintf(stderr, "FAIL : error ");

        if ( err == cudaErrorInvalidValue ) {
            fprintf(stderr, "cudaErrorInvalidValue\n");
        } else if ( err == cudaErrorInvalidDevicePointer ) {
            fprintf(stderr, "cudaErrorInvalidDevicePointer\n");
        } else if ( err == cudaErrorInvalidMemcpyDirection ) {
            fprintf(stderr, "cudaErrorInvalidMemcpyDirection\n");
        } else {
            fprintf(stderr, "what the absolute fuck?\n");
            fprintf(stderr, "err = %0x\n", err );
        }
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy result from device to host done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : copy device result done %" PRIu64 " nsecs\n",
                                                          tdelta_nsec);
    /*
    fprintf( stderr,"DBUG : at %d in %s\n", __LINE__, __FILE__);
    err = cudaDeviceSynchronize();
    if ( err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceSynchronize()\n");
        fprintf(stderr, "err = %0x\n", err );
        exit(EXIT_FAILURE);
    }
    */

    /* Free device memory */
    err = cudaFree(device_r);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : free memory on device for real\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    err = cudaFree(device_j);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : free memory on device for imaginary\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    err = cudaFree(device_mval);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : free memory on device for mbrot value\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    /***************************************************************
     * Verify the data with CPU and fma() calls
     ***************************************************************
    clock_gettime( CLOCK_REALTIME, &t0 );
    int error_count = 0;
    uint32_t delta_error_sum = 0;
    for (int i = 0; i < num_elements; ++i)
    {

        check_val = cpu_mbrot( host_r[i], host_j[i], (uint32_t)mand_bail );

        if ( host_mval[i] != check_val ) {

            printf("%-9i    :     ( %-+20.14e , %-+20.14e ) == %-6i",
                               i, host_r[i], host_j[i], host_mval[i] );
            printf("    ERROR %-6i    DELTA = ", check_val);

            if ( host_mval[i] < check_val ){
                delta_error_sum += check_val - host_mval[i];
                printf("%i\n", check_val - host_mval[i]);
            } else {
                delta_error_sum += host_mval[i] - check_val;
                printf("%i\n", host_mval[i] - check_val);
            }
            error_count += 1;
        }
    }
    printf("     : Total error count = %i\n", error_count);
    if ( error_count > 0 ) {
        printf("     : Total delta error = %i\n", delta_error_sum);
        printf("     : Mean error = %10.6f\n",
                           (float)(delta_error_sum) / error_count);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : data check done %" PRIu64 " nsecs\n", tdelta_nsec);
    */






    /**********************************************************/
    /* print out something */


    printf("\n     : mand_bail = %i\n", mand_bail );
    printf("     : translate = ( %-+28.20e , %-+28.20e )\n", centre_r, centre_j );
    printf("     :   magnify = %-+20.12e\n\n", magnify );


    printf("     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n", host_r[array_offset(0,0,0,0)]);
    printf("     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n", host_j[array_offset(0,0,0,0)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(0,0,0,0)]);


    printf("     : r[ 7][ 7][63][63] = %-+32.26e\n", host_r[array_offset(7,7,63,63)]);
    printf("     : j[ 7][ 7][63][63] = %-+32.26e\n", host_j[array_offset(7,7,63,63)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(7,7,63,63)]);


    printf("     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n", host_r[array_offset(8,8,0,0)]);
    printf("     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n", host_j[array_offset(8,8,0,0)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(8,8,0,0)]);


    printf("     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n", host_r[array_offset(8,8,1,0)]);
    printf("     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n", host_j[array_offset(8,8,1,0)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(8,8,1,0)]);


    printf("     : r[ 8][ 8][32][32] = %-+32.26e\n", host_r[array_offset(8,8,32,32)]);
    printf("     : j[ 8][ 8][32][32] = %-+32.26e\n", host_j[array_offset(8,8,32,32)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(8,8,32,32)]);


    printf("     : r[ 3][12][44][21] = %-+32.26e\n", host_r[array_offset(3,12,44,21)]);
    printf("     : j[ 3][12][44][21] = %-+32.26e\n", host_j[array_offset(3,12,44,21)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(3,12,44,21)]);


    printf("     : r[15][15][63][63] = %-+32.26e\n", host_r[array_offset(15,15,63,63)]);
    printf("     : j[15][15][63][63] = %-+32.26e\n", host_j[array_offset(15,15,63,63)]);
    printf("     :       mand_height = %9i\n",       host_mval[array_offset(15,15,63,63)]);


    char timestamp[32];
    char *timestamp_filename;
    timestamp_filename = (char *)calloc(_POSIX_PATH_MAX,sizeof(unsigned char));

    char *err_status;
    char *tmpdir = getenv("TMPDIR");
    size_t filename_len = strftime(timestamp, 32, "%Y%m%d%H%M%S", ptm);
    err_status = strcat(timestamp_filename, tmpdir);
    err_status = strcat(timestamp_filename, "/");
    err_status = strcat(timestamp_filename, timestamp);
    status = stat(timestamp_filename, &status_buffer);

    if ( status == 0 ) {
        fprintf (stderr,"FAIL : file %s can not be created.\n",timestamp_filename);
    } else {
        errno = 0;
        fp = fopen(timestamp_filename, "wb");
        if ( fp == NULL ) {
            perror("FAIL fopen of filename");
        } else {
            /* finally we know we have a file */
            fprintf (stderr,"INFO : file %s dump begins.\n",timestamp_filename);

            /* header data is done separately */
            num_written = fwrite(&num_elements, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t num_elements num_written = %lu\n",
                        sizeof(uint32_t), num_written);
            printf("     : num_elements = %8i\n",num_elements);

            num_written = fwrite(&mand_bail, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t mand_bail    num_written = %lu\n",
                    sizeof(uint32_t), num_written);
            printf("     : mand_bail = %8i\n",mand_bail);

            num_written = fwrite(&magnify, sizeof(double), 1, fp);
            printf("     : %2lu byte double magnify        num_written = %lu\n",
                    sizeof(double), num_written);
            printf("     :        magnify = %-+32.26e\n", magnify);

            num_written = fwrite(&centre_r, sizeof(double), 1, fp);
            printf("DBUG : %2lu byte double centre_r num_written = %lu\n",
                    sizeof(double), num_written);
            printf("     : centre_r = %-+32.26e\n",centre_r);

            num_written = fwrite(&centre_j, sizeof(double), 1, fp);
            printf("     : %2lu byte double centre_j num_written = %lu\n",
                    sizeof(double), num_written);
            printf("     : centre_j = %-+32.26e\n",centre_j);

            /* append the VBOX and SAMPLE structure data */
            temp32bit = VBOX_REAL_COUNT;
            num_written = fwrite(&temp32bit, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t VBOX_REAL_COUNT num_written = %lu\n",
                    sizeof(uint32_t), num_written);
            printf("     : VBOX_REAL_COUNT = %8i\n",VBOX_REAL_COUNT);

            temp32bit = VBOX_IMAG_COUNT;
            num_written = fwrite(&temp32bit, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t VBOX_REAL_COUNT num_written = %lu\n",
                    sizeof(uint32_t), num_written);
            printf("     : VBOX_IMAG_COUNT = %8i\n",VBOX_IMAG_COUNT);


            temp32bit = VBOX_SAMPLE_REAL;
            num_written = fwrite(&temp32bit, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t VBOX_SAMPLE_REAL num_written = %lu\n",
                    sizeof(uint32_t), num_written);
            printf("     : VBOX_SAMPLE_REAL = %8i\n",VBOX_SAMPLE_REAL);

            temp32bit = VBOX_SAMPLE_IMAG;
            num_written = fwrite(&temp32bit, sizeof(uint32_t), 1, fp);
            printf("     : %2lu byte uint32_t VBOX_SAMPLE_IMAG num_written = %lu\n",
                    sizeof(uint32_t), num_written);
            printf("     : VBOX_SAMPLE_IMAG = %8i\n",VBOX_SAMPLE_IMAG);

            sample_counter = 0;
            for ( vbox_j = 0; vbox_j < VBOX_IMAG_COUNT; vbox_j++ ) {
                for ( vbox_r = 0; vbox_r < VBOX_REAL_COUNT; vbox_r++ ) {
                    for ( sample_j = 0; sample_j < VBOX_SAMPLE_IMAG; sample_j++ ) {
                        for ( sample_r = 0; sample_r < VBOX_SAMPLE_REAL; sample_r++ ) {

                            num_written = fwrite(&host_r[array_offset(vbox_r,vbox_j,sample_r,sample_j)], sizeof(double), 1, fp);
                            num_written = fwrite(&host_j[array_offset(vbox_r,vbox_j,sample_r,sample_j)], sizeof(double), 1, fp);
                            num_written = fwrite(&host_mval[array_offset(vbox_r,vbox_j,sample_r,sample_j)], sizeof(uint32_t), 1, fp);

                            sample_counter += 1;

                        }
                    }
                }
            }
            fclose(fp);
            fprintf (stderr,"INFO : file %s closed.\n",timestamp_filename);
        }
    }
    free(timestamp_filename);

    fprintf (stderr,"INFO : dumped %i records\n", sample_counter);



    /* Free host memory */
    free(host_r);
    free(host_j);
    free(host_mval);

    printf("INFO : host memory free and we are done\n");
    cudaProfilerStop();
    return EXIT_SUCCESS;

}

uint64_t timediff( struct timespec st, struct timespec en )
{
    /* return the delta time as a 64-bit positive number of
     * nanoseconds.  Regardless of the time direction between
     * start and end we always get a positive result. */

    struct timespec temp;
    uint64_t s, n;

    if ( ( en.tv_nsec - st.tv_nsec ) < 0 ) {
        /* make a full second adjustment to tv_sec */
        temp.tv_sec = en.tv_sec - st.tv_sec - 1;
        /* we have to add a full second to temp.tv_nsec */
        temp.tv_nsec = 1000000000 + en.tv_nsec - st.tv_nsec;
    } else {
        temp.tv_sec = en.tv_sec - st.tv_sec;
        temp.tv_nsec = en.tv_nsec - st.tv_nsec;
    }
    s = (uint64_t) temp.tv_sec;
    n = (uint64_t) temp.tv_nsec;
    return ( s * (uint64_t)1000000000 + n );
}

uint64_t system_memory()
{
    /* should return the amount of memory available in bytes */
    long en;
    uint64_t pages, page_size;

    en = sysconf(_SC_PHYS_PAGES);
    if ( en < 0 ){
        perror("sysconf(_SC_PHYS_PAGES) : ");
        exit(EXIT_FAILURE);
    }
    pages = (uint64_t) en;

    page_size = (uint64_t)sysconf(_SC_PAGE_SIZE);
    return ( pages * page_size );
}

int sysinfo(void) {

    struct utsname uname_data;

    uint64_t sysmem = system_memory();
    uint64_t pagesize = (uint64_t)sysconf(_SC_PAGESIZE);

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ( "-------------------------------" );
        printf ( "------------------------------\n" );
        printf ( "        system name = %s\n", uname_data.sysname );
        printf ( "          node name = %s\n", uname_data.nodename );
        printf ( "            release = %s\n", uname_data.release );
        printf ( "            version = %s\n", uname_data.version );
        printf ( "            machine = %s\n", uname_data.machine );
        printf ( "          page size = %" PRIu64 "\n", pagesize );
        printf ( "       avail memory = %" PRIu64 "\n", sysmem );
        printf ( "                    = %" PRIu64 " kB\n", sysmem/1024 );
        printf ( "                    = %" PRIu64 " MB\n", sysmem/1048576 );
        /*
         *  this doesn't really work for memory size near GB boundaries
         *
         *  if ( sysmem > ( 1024 * 1048576 ) ) {
         *      printf ( "                    = %" PRIu64 " GB\n",
         *              sysmem/( 1024 * 1048576 ) );
         *  }
        */
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    return ( EXIT_SUCCESS );

}

uint32_t cpu_mbrot( double c_r, double c_i, uint32_t bail_out )
{
    /* point c belongs to the Mandelbrot set if and only if
     * the magnitude of the f(c) <= 2.0 */
    uint32_t height = 0;
    double zr = 0.0;
    double zi = 0.0;
    double tmp_r, tmp_i;
    double mag = 0.0;

    double temp0, temp1;

    while ( ( height < bail_out ) && ( mag < 4.0 ) ) {

        /*     tmp_r = ( zr * zr ) - ( zi * zi );     */
        temp0 = -1.0 * zi * zi;
        tmp_r = fma( zr, zr, temp0);

        /*     tmp_i = ( zr * zi ) + ( zr * zi );     */
        temp1 = zr * zi;
        tmp_i = fma( zr, zi, temp1);


        zr = tmp_r + c_r;
        zi = tmp_i + c_i;

        /* mag = zr * zr + zi * zi; */
        temp0 = zi * zi;
        mag = fma ( zr, zr, temp0);

        mag = zr * zr + zi * zi;

        height += 1;
    }

    return height;

}

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64_cplex *cplex)
{

    /* try to reduce the number of floating point operations */
    int numerator = 2 * Vr * VBOX_SAMPLE_REAL + 2 * Sr - real_range + 1;
    cplex->r = numerator / ( 1.0 * real_range );

    numerator = 2 * Vj * VBOX_SAMPLE_IMAG + 2 * Sj - imag_range + 1;
    cplex->j = numerator / ( 1.0 * imag_range );

}

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64_cplex *cplex)
{

    /* given some normalized coordinates ( r, j ) within our plot
     * region we may easily translate to the centre ( t_r, t_j )
     * with a given magnification. */
    cplex->r = t_r + r * DEFAULT_REAL_WIDTH / ( 2.0 * magnify );
    cplex->j = t_j + j * DEFAULT_IMAG_HEIGHT / ( 2.0 * magnify );

}

int array_offset(int Vr, int Vj, int Sr, int Sj) {

    return   Vr * VBOX_SAMPLE_REAL + Sr

           + Vj * VBOX_REAL_COUNT
                * VBOX_SAMPLE_REAL
                * VBOX_SAMPLE_IMAG

           + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;

}

int array_index(uint32_t Vr, uint32_t Vj,
                uint32_t Sr, uint32_t Sj,
                uint32_t vbox_real_count,
                uint32_t vbox_sample_real,
                uint32_t vbox_sample_imag )
{

    int part1 = (int)Vr * (int)vbox_sample_real;

    int part2 = (int)Vj * (int)vbox_real_count
                        * (int)vbox_sample_real
                        * (int)vbox_sample_imag;

    int part3 = (int)Sj * (int)vbox_real_count
                        * (int)vbox_sample_real;

    /*
    int result =  Vr * vbox_sample_real + Sr

                + Vj * vbox_real_count
                     * vbox_sample_real
                     * vbox_sample_imag

                + Sj * vbox_real_count * vbox_sample_real;
    */

    int result = part1 + (int)Sr + part2 + part3;

    return result;

}

