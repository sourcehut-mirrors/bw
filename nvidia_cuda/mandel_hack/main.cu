
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

#ifndef __mand_h__
#include "mand.h"
#endif

__host__ int main(int argc, char *argv[])
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

    /* Scheiße select hack */
    int scheisse_select;

    setlocale( LC_ALL, "C" );
    int status = setenv("TZ", "GMT0", 1);

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

    /* display CPU and GPU configuration */
    printf("INFO : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("INFO : number of CUDA devices:\t%d\n", num_gpus);

    cudaDeviceProp dprop;
    for (int i = 0; i < num_gpus; i++) {

        err = cudaSetDevice(i);
        /* possible err values are
         *  cudaSuccess, cudaErrorInvalidDevice, cudaErrorSetOnActiveProcess */
        if ( err != cudaSuccess ) {
            if ( err == cudaErrorInvalidDevice ) {
                printf("FAIL : cudaErrorInvalidDevice on cudaSetDevice\n");
            } else if ( err == cudaErrorSetOnActiveProcess ) {
                printf("FAIL : cudaErrorSetOnActiveProcess on cudaSetDevice\n");
            } else {
                printf("FAIL : cuda magic? good luck!\n");
            }
            return EXIT_FAILURE;
        }

        err = cudaDeviceReset();
        if ( err != cudaSuccess) {
            fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
            fprintf(stderr, "err = %0x\n", err );
            return EXIT_FAILURE;
        }

        cudaGetDeviceProperties(&dprop, i);

        printf("     :    %d: %s\n", i, dprop.name);

        printf("     :        %12" PRIu64 " totalGlobalMem\n", dprop.totalGlobalMem);

        printf("     :             %6i clockRate\n", dprop.clockRate);

        printf("     :                %4i memoryBusWidth\n", dprop.memoryBusWidth);

        printf("     :                %4i multiProcessorCount\n", dprop.multiProcessorCount);

        printf("     :                %4i maxThreadsPerMultiProcessor\n", dprop.maxThreadsPerMultiProcessor);

        printf("     :               %5i cores\n",
                _ConvertSMVer2Cores(dprop.major, dprop.minor) * dprop.multiProcessorCount);

    }

    /***********************************************************
     *
     *            W A R N I N G    F O R C E    S E L E C T
     *
     *  The NVidia drivers need to be hacked a bit in order to
     *  compile for any very recent Linux kernel. This is well
     *  documented at : 
     *
     *  https://gist.github.com/joanbm/dfe8dc59af1c83e2530a1376b77be8ba
     *
     *  The question remains, does that actually work ?
     *
     *  This is a load test on two very different GPU hardware
     *  class units.  The old Keplar and the newer Pascal.
     *
     *  Device 0 seems to be the GP100 unit.
     *  Device 1 is the old Keplar K6000.
     **********************************************************/

    scheisse_select = 1;
    if ( argc > 1 ) scheisse_select = atoi(argv[1]);

    err = cudaSetDevice(scheisse_select);

    /* possible err values are
     *  cudaSuccess, cudaErrorInvalidDevice, cudaErrorSetOnActiveProcess */
    if ( err != cudaSuccess ) {
        if ( err == cudaErrorInvalidDevice ) {
            printf("FAIL : cudaErrorInvalidDevice on cudaSetDevice\n");
        } else if ( err == cudaErrorSetOnActiveProcess ) {
            printf("FAIL : cudaErrorSetOnActiveProcess on cudaSetDevice\n");
        } else {
            printf("FAIL : cuda magic? good luck!\n");
        }
        return EXIT_FAILURE;
     }

     err = cudaDeviceReset();
     if ( err != cudaSuccess) {
         fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
         fprintf(stderr, "err = %0x\n", err );
         return EXIT_FAILURE;
     }

    cudaGetDeviceProperties(&dprop, scheisse_select);

    printf("WARN : FORCE SELECT the device 0\n");
    printf("     :    %d: %s\n", 0, dprop.name);

    printf("     :        %12" PRIu64 " totalGlobalMem\n", dprop.totalGlobalMem);
    printf("\n");
    printf("INFO : %s device is selected\n\n", dprop.name);


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
     *
     *                         W A R N I N G
     *
     * The decent NVidia Quadro GPU will be orders of magnitude
     * faster than any CPU that I have seen. This section may
     * drag its ass for ten minutes. Possibly a whole lot more.
     * Be careful.
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

    fprintf (stderr,"DBUG : err_status = \"%s\"\n", err_status);
    fprintf (stderr,"INFO : dumped %i records\n", sample_counter);


    /* Free host memory */
    free(host_r);
    free(host_j);
    free(host_mval);

    printf("INFO : host memory free and we are done\n");
    cudaProfilerStop();
    return EXIT_SUCCESS;

}

