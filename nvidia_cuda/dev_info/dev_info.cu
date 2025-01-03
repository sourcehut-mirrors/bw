
/* NVIDIA Performance Primitives (NPP) 
 *
 * https://docs.nvidia.com/cuda/npp/group__image__fourier__transforms.html
 *
 * may be useful to try :
 *  g++ foo.c  -lnppi_static -lculibos -lcudart_static -lpthread -ldl 
 *   -I <cuda-toolkit-path>/include -L <cuda-toolkit-path>/lib64 -o foo
 *
 *   This was hacked together by Dennis Clarke with reference material
 *   here there and everywhere. It is still not complete and no one
 *   is happy with the code format.
 *
 *   Lines are too darn long.
 *
 */

#include <memory>
#include <iostream>
#include <npp.h>

#include <cuda_runtime.h>
#include <helper_cuda.h>

int main(int argc, char **argv)
{
    int dev;
    int dev_count = 0;
    int driver_ver = 0;
    int runtime_ver = 0;

    const char *compute_mode_type_string[] =
        {
            "Default (multiple host threads can use ::cudaSetDevice() with device simultaneously)",
            "Exclusive (only one host thread in one process is able to use ::cudaSetDevice() with this device)",
            "Prohibited (no host thread can use ::cudaSetDevice() with this device)",
            "Exclusive Process (many threads in one process is able to use ::cudaSetDevice() with this device)",
            "Unknown",
            NULL
        };

    cudaError_t cuda_err_status;
    cudaDeviceProp dev_prop;

    printf("\n *** CUDA Device Query (Runtime API) ***\n");

    #ifdef CUDART_VERSION
        printf("INFO : CUDART_VERSION defined as %d\n", CUDART_VERSION);
        if ( CUDART_VERSION < 9020 ){
            /* old CUDA runtime detected.
             * Bail out. getCudaAttribute not defined. */
            fprintf(stderr,"FAIL : CUDART_VERSION too old\n");
            fprintf(stderr,"     : need at least 9020\n");
            return ( EXIT_FAILURE );
        }
        printf("INFO : we may be using CUDART static linking\n");
    #else
        fprintf(stderr,"FAIL : CUDART_VERSION is not defined?\n");
        return ( EXIT_FAILURE );
    #endif

    #ifdef NPP_VERSION_MAJOR
        printf("INFO : NPP_VERSION_MAJOR defined as %d\n",
                                                    NPP_VERSION_MAJOR);
        #ifdef NPP_VERSION_MINOR
            fprintf(stderr,"INFO : NPP_VERSION_MINOR");
            fprintf(stderr," defined as %d\n", NPP_VERSION_MINOR);
            /* do a quick check for the npp ver
            */
            if ( ( (NPP_VERSION_MAJOR << 12) 
                 + (NPP_VERSION_MINOR << 4) ) >= 0x6000 ){
                fprintf(stderr,"     : (NPP_VERSION_MAJOR << 12)");
                fprintf(stderr," + (NPP_VERSION_MINOR << 4)");
                fprintf(stderr," >= 0x6000\n");
            }
        #endif
        fprintf(stderr,"     : signal and image processing");
        fprintf(stderr," functions are available.\n");
    #else
        printf("INFO : NPP_VERSION_MAJOR is not defined.\n");
    #endif

    cuda_err_status = cudaGetDeviceCount(&dev_count);
    if (cuda_err_status != cudaSuccess) {
        fprintf(stderr,"FAIL : cudaGetDeviceCount %d\n-> %s\n",
                           (int)cuda_err_status,
                           cudaGetErrorString(cuda_err_status));

        return EXIT_FAILURE;
    }

    /* returns 0 if there are no CUDA capable devices */
    if (dev_count == 0) {
        fprintf(stderr,"WARN : no CUDA device found.\n");
        return EXIT_FAILURE;
    } else {
        printf("INFO : Detected %d CUDA Capable device(s)\n", dev_count);
    }

    /*****************************************************************
     *
     *  Pulled this directly out of the man page and we may as well
     *  dig into the struct for all its worth.
     *
     *         H O W E V E R    T H E    D O C S    A R E    C R A P
     *
     *
     *  __cudart_builtin__ cudaError_t cudaGetDeviceProperties
     *                       (struct cudaDeviceProp * prop,
     *                       int device)
     *
     *  Returns:
     *      cudaSuccess, cudaErrorInvalidDevice
     *
     *  if cudaSuccess then *prop contains the properties
     *  of device dev.
     *
     *  Some of the above may even be true.
     *
     *  For further entertainment we can check for managedMemory?
     *
     * these next two things seems to be of no value unless we
     * are running on Windows ?

          char cudaDeviceProp::luid[8] [inherited]

          8-byte locally unique identifier.
          Value is undefined on TCC and non-Windows platforms

          unsigned int cudaDeviceProp::luidDeviceNodeMask [inherited]

          LUID device node mask.
          Value is undefined on TCC and non-Windows platforms


cudaUUID_t cudaDeviceProp::uuid [inherited]

    16-byte unique identifier


     *
     ****************************************************************/

    for (dev = 0; dev < dev_count; ++dev) {
        char buff[256];

        cudaSetDevice(dev);
        cudaGetDeviceProperties(&dev_prop, dev);

        printf("INFO : dev number %d: name = \"%s\"\n",
                                                   dev, dev_prop.name);

        cudaDriverGetVersion(&driver_ver);
        cudaRuntimeGetVersion(&runtime_ver);

        printf("     : CUDA Driver Version    %d.%d\n",
                                 driver_ver/1000, (driver_ver%100)/10);

        printf("     : CUDA Runtime Version   %d.%d\n",
                               runtime_ver/1000, (runtime_ver%100)/10);

        printf("     : CUDA Capability Major/Minor version %d.%d\n",
                                       dev_prop.major, dev_prop.minor);




        /* these are barely documented */
        printf("     : managedMemory claims %i\n", dev_prop.managedMemory );

        printf("     : ECCEnabled claims %i\n", dev_prop.ECCEnabled );

        printf("     : canMapHostMemory claims %i\n", dev_prop.canMapHostMemory );


        printf("     : accessPolicyMaxWindowSize = %i\n", dev_prop.accessPolicyMaxWindowSize );
        printf("     : asyncEngineCount = %i\n", dev_prop.asyncEngineCount );
        printf("     : canMapHostMemory = %i\n", dev_prop.canMapHostMemory );
        printf("     : canUseHostPointerForRegisteredMem = %i\n", dev_prop.canUseHostPointerForRegisteredMem );
        printf("     : clockRate = %i\n", dev_prop.clockRate );
        printf("     : computeMode = %i\n", dev_prop.computeMode );
        printf("     : computePreemptionSupported = %i\n", dev_prop.computePreemptionSupported );
        printf("     : concurrentKernels = %i\n", dev_prop.concurrentKernels );
        printf("     : concurrentManagedAccess = %i\n", dev_prop.concurrentManagedAccess );
        printf("     : cooperativeLaunch = %i\n", dev_prop.cooperativeLaunch );
        printf("     : cooperativeMultiDeviceLaunch = %i\n", dev_prop.cooperativeMultiDeviceLaunch );
        printf("     : deviceOverlap = %i\n", dev_prop.deviceOverlap );
        printf("     : directManagedMemAccessFromHost = %i\n", dev_prop.directManagedMemAccessFromHost );
        printf("     : ECCEnabled = %i\n", dev_prop.ECCEnabled );
        printf("     : globalL1CacheSupported = %i\n", dev_prop.globalL1CacheSupported );
        printf("     : hostNativeAtomicSupported = %i\n", dev_prop.hostNativeAtomicSupported );
        printf("     : integrated = %i\n", dev_prop.integrated );
        printf("     : isMultiGpuBoard = %i\n", dev_prop.isMultiGpuBoard );
        printf("     : kernelExecTimeoutEnabled = %i\n", dev_prop.kernelExecTimeoutEnabled );
        printf("     : l2CacheSize = %i\n", dev_prop.l2CacheSize );
        printf("     : localL1CacheSupported = %i\n", dev_prop.localL1CacheSupported );
        printf("     : major = %i\n", dev_prop.major );
        printf("     : managedMemory = %i\n", dev_prop.managedMemory );
        printf("     : maxBlocksPerMultiProcessor = %i\n", dev_prop.maxBlocksPerMultiProcessor );

        printf("     : maxGridSize[0] = %i\n", dev_prop.maxGridSize[0] );
        printf("     : maxGridSize[1] = %i\n", dev_prop.maxGridSize[1] );
        printf("     : maxGridSize[2] = %i\n", dev_prop.maxGridSize[2] );

        printf("     : maxSurface1D = %i\n", dev_prop.maxSurface1D );
        printf("     : maxSurface1DLayered[0] = %i\n", dev_prop.maxSurface1DLayered[0] );
        printf("     : maxSurface1DLayered[1] = %i\n", dev_prop.maxSurface1DLayered[1] );

        printf("     : maxSurface2D[0] = %i\n", dev_prop.maxSurface2D[0] );
        printf("     : maxSurface2D[1] = %i\n", dev_prop.maxSurface2D[1] );

        printf("     : maxSurface2DLayered[0] = %i\n", dev_prop.maxSurface2DLayered[0] );
        printf("     : maxSurface2DLayered[1] = %i\n", dev_prop.maxSurface2DLayered[1] );
        printf("     : maxSurface2DLayered[2] = %i\n", dev_prop.maxSurface2DLayered[2] );

        printf("     : maxSurface3D[0] = %i\n", dev_prop.maxSurface3D[0] );
        printf("     : maxSurface3D[1] = %i\n", dev_prop.maxSurface3D[1] );
        printf("     : maxSurface3D[2] = %i\n", dev_prop.maxSurface3D[2] );

        printf("     : maxSurfaceCubemap = %i\n", dev_prop.maxSurfaceCubemap );
        printf("     : maxSurfaceCubemapLayered[0] = %i\n", dev_prop.maxSurfaceCubemapLayered[0] );
        printf("     : maxSurfaceCubemapLayered[1] = %i\n", dev_prop.maxSurfaceCubemapLayered[1] );

        printf("     : maxTexture1D = %i\n", dev_prop.maxTexture1D );
        printf("     : maxTexture1DLayered[0] = %i\n", dev_prop.maxTexture1DLayered[0] );
        printf("     : maxTexture1DLayered[1] = %i\n", dev_prop.maxTexture1DLayered[1] );

        printf("     : maxTexture1DLinear = %i\n", dev_prop.maxTexture1DLinear );
        printf("     : maxTexture1DMipmap = %i\n", dev_prop.maxTexture1DMipmap );

        printf("     : maxTexture2D[0] = %i\n", dev_prop.maxTexture2D[0] );
        printf("     : maxTexture2D[1] = %i\n", dev_prop.maxTexture2D[1] );

        printf("     : maxTexture2DGather[0] = %i\n", dev_prop.maxTexture2DGather[0] );
        printf("     : maxTexture2DGather[1] = %i\n", dev_prop.maxTexture2DGather[1] );

        printf("     : maxTexture2DLayered[0] = %i\n", dev_prop.maxTexture2DLayered[0] );
        printf("     : maxTexture2DLayered[1] = %i\n", dev_prop.maxTexture2DLayered[1] );
        printf("     : maxTexture2DLayered[2] = %i\n", dev_prop.maxTexture2DLayered[2] );

        printf("     : maxTexture2DLinear[0] = %i\n", dev_prop.maxTexture2DLinear[0] );
        printf("     : maxTexture2DLinear[1] = %i\n", dev_prop.maxTexture2DLinear[1] );
        printf("     : maxTexture2DLinear[2] = %i\n", dev_prop.maxTexture2DLinear[2] );

        printf("     : maxTexture2DMipmap[0] = %i\n", dev_prop.maxTexture2DMipmap[0] );
        printf("     : maxTexture2DMipmap[1] = %i\n", dev_prop.maxTexture2DMipmap[1] );

        printf("     : maxTexture3D[0] = %i\n", dev_prop.maxTexture3D[0] );
        printf("     : maxTexture3D[1] = %i\n", dev_prop.maxTexture3D[1] );
        printf("     : maxTexture3D[2] = %i\n", dev_prop.maxTexture3D[2] );

        printf("     : maxTexture3DAlt[0] = %i\n", dev_prop.maxTexture3DAlt[0] );
        printf("     : maxTexture3DAlt[1] = %i\n", dev_prop.maxTexture3DAlt[1] );
        printf("     : maxTexture3DAlt[2] = %i\n", dev_prop.maxTexture3DAlt[2] );

        printf("     : maxTextureCubemap = %i\n", dev_prop.maxTextureCubemap );

        printf("     : maxTextureCubemapLayered[0] = %i\n", dev_prop.maxTextureCubemapLayered[0] );
        printf("     : maxTextureCubemapLayered[1] = %i\n", dev_prop.maxTextureCubemapLayered[1] );

        printf("     : maxThreadsDim[0] = %i\n", dev_prop.maxThreadsDim[0] );
        printf("     : maxThreadsDim[1] = %i\n", dev_prop.maxThreadsDim[1] );
        printf("     : maxThreadsDim[2] = %i\n", dev_prop.maxThreadsDim[2] );

        printf("     : maxThreadsPerBlock = %i\n", dev_prop.maxThreadsPerBlock );
        printf("     : maxThreadsPerMultiProcessor = %i\n", dev_prop.maxThreadsPerMultiProcessor );
        printf("     : memoryBusWidth = %i\n", dev_prop.memoryBusWidth );
        printf("     : memoryClockRate = %i\n", dev_prop.memoryClockRate );
        printf("     : minor = %i\n", dev_prop.minor );
        printf("     : multiGpuBoardGroupID = %i\n", dev_prop.multiGpuBoardGroupID );
        printf("     : multiProcessorCount = %i\n", dev_prop.multiProcessorCount );
        printf("     : pageableMemoryAccess = %i\n", dev_prop.pageableMemoryAccess );
        printf("     : pageableMemoryAccessUsesHostPageTables = %i\n", dev_prop.pageableMemoryAccessUsesHostPageTables );
        printf("     : pciBusID = %i\n", dev_prop.pciBusID );
        printf("     : pciDeviceID = %i\n", dev_prop.pciDeviceID );
        printf("     : pciDomainID = %i\n", dev_prop.pciDomainID );
        printf("     : persistingL2CacheMaxSize = %i\n", dev_prop.persistingL2CacheMaxSize );
        printf("     : regsPerBlock = %i\n", dev_prop.regsPerBlock );
        printf("     : regsPerMultiprocessor = %i\n", dev_prop.regsPerMultiprocessor );
        printf("     : singleToDoublePrecisionPerfRatio = %i\n", dev_prop.singleToDoublePrecisionPerfRatio );
        printf("     : streamPrioritiesSupported = %i\n", dev_prop.streamPrioritiesSupported );
        printf("     : tccDriver = %i\n", dev_prop.tccDriver );
        printf("     : unifiedAddressing = %i\n", dev_prop.unifiedAddressing );
        printf("     : warpSize = %i\n", dev_prop.warpSize );


        printf("     : Total global memory: %llu bytes\n",
                         (unsigned long long) dev_prop.totalGlobalMem);

        printf("     : constant memory: %llu bytes\n",
                                               dev_prop.totalConstMem);

        printf("     : multiprocessor count = %i\n",
                                         dev_prop.multiProcessorCount);

        printf("     : CUDA cores per multiprocessor = %d\n",
                  _ConvertSMVer2Cores(dev_prop.major, dev_prop.minor));

        printf("     : total CUDA cores = %d\n",
                  ( _ConvertSMVer2Cores(dev_prop.major, dev_prop.minor)
                    * dev_prop.multiProcessorCount ) );

        printf("     : GPU max graphics clock rate: %i kHz\n",
                                                  dev_prop.clockRate );

        printf("     : Memory Clock rate: %i khz\n",
                                    dev_prop.memoryClockRate );

        printf("     : Memory Bus Width: %i-bit\n",
                                              dev_prop.memoryBusWidth);

        if (dev_prop.l2CacheSize){
            printf("     : L2 Cache Size: %i bytes\n",
                                                 dev_prop.l2CacheSize);
        }

        printf("     : Maximum Texture Dimension Size (x,y,z)\n");
        printf("     :     1D=(%d)\n", dev_prop.maxTexture1D );

        printf("     :     2D=(%d, %d)\n",
                                             dev_prop.maxTexture2D[0],
                                             dev_prop.maxTexture2D[1]);

        printf("     :     3D=(%d, %d, %d)\n",
                                             dev_prop.maxTexture3D[0],
                                             dev_prop.maxTexture3D[1],
                                             dev_prop.maxTexture3D[2]);

        printf("     : Maximum Layered 1D Texture Size\n");
        printf("           (num) layers  1D=(%d), %d layers\n",
                                       dev_prop.maxTexture1DLayered[0],
                                      dev_prop.maxTexture1DLayered[1]);

        printf("     : Maximum Layered 2D Texture Size\n");
        printf("           (num) layers  2D=(%d, %d), %d layers\n",
                                       dev_prop.maxTexture2DLayered[0],
                                       dev_prop.maxTexture2DLayered[1],
                                      dev_prop.maxTexture2DLayered[2]);

        printf("     : shared memory per Multiprocessor: %lu bytes\n",
                                           dev_prop.sharedMemPerMultiprocessor);

        printf("     : shared memory per block: %lu bytes\n",
                                           dev_prop.sharedMemPerBlock);

        printf("     : shared memory per block Optin : %lu bytes\n",
                                           dev_prop.sharedMemPerBlockOptin);

        printf("     : registers available per block: %d\n",
                                                dev_prop.regsPerBlock);

        printf("     : warp size: %d\n", dev_prop.warpSize);

        printf("     : max num threads per multiprocessor: %d\n",
                                 dev_prop.maxThreadsPerMultiProcessor);

        printf("     : max numb of threads per block: %d\n",
                                          dev_prop.maxThreadsPerBlock);

        printf("     : reserved shared mem per block: %llu\n",
                                          dev_prop.reservedSharedMemPerBlock);

        printf("     : max dimension size of a thread block (x,y,z)");
        printf(" = (%d, %d, %d)\n", dev_prop.maxThreadsDim[0],
                                    dev_prop.maxThreadsDim[1],
                                    dev_prop.maxThreadsDim[2]);

        printf("     : max dimension size of a grid (x,y,z):");
        printf(" = (%d, %d, %d)\n", dev_prop.maxGridSize[0],
                                    dev_prop.maxGridSize[1],
                                    dev_prop.maxGridSize[2]);

        printf("     : max memory pitch = %lu bytes\n",
                                                    dev_prop.memPitch);

        printf("     : texture alignment = %lu bytes\n",
                                            dev_prop.textureAlignment);

        printf("     : texture pitch alignment = %llu bytes\n",
                                            dev_prop.texturePitchAlignment);

        printf("     : concurrent copy ability = %s\n",
                              (dev_prop.deviceOverlap ? "Yes" : "No"));

        printf("     : concurrent kernel exec with %d engine(s)\n",
                                            dev_prop.asyncEngineCount);


        printf("     : run time limit on kernels = %s\n",
                     dev_prop.kernelExecTimeoutEnabled ? "Yes" : "No");

        printf("     : integrated GPU sharing Host memory = %s\n",
                                   dev_prop.integrated ? "Yes" : "No");

        printf("     : host page-locked memory mapping = %s\n",
                             dev_prop.canMapHostMemory ? "Yes" : "No");

        printf("     : alignment requirement for Surfaces = %s\n",
                             dev_prop.surfaceAlignment ? "Yes" : "No");

        printf("     : device has ECC support = %s\n",
                         dev_prop.ECCEnabled ? "Enabled" : "Disabled");

        printf("     : supports Unified Addressing (UVA) = %s\n",
                            dev_prop.unifiedAddressing ? "Yes" : "No");

        printf("     : supports Cooperative Kernel Launch = %s\n",
                            dev_prop.cooperativeLaunch ? "Yes" : "No");

        printf("     : supports MultiDevice Co-op Kernel Launch = %s\n",
                 dev_prop.cooperativeMultiDeviceLaunch ? "Yes" : "No");

        printf("     : device PCI Domain ID, bus ID, location ID\n");
        printf("         id = %d , bus id = %d , location = %d\n",
                                                  dev_prop.pciDomainID,
                                                  dev_prop.pciBusID,
                                                  dev_prop.pciDeviceID);

        printf("     : compute mode:\n");
        printf("           < %s >\n",
                        compute_mode_type_string[dev_prop.computeMode]);

    }

    /* If there are 2 or more GPUs, query to determine
     * whether RDMA is supported */
    if (dev_count >= 2) {
        cudaDeviceProp prop[64];
        /* find the first two GPUs that can support P2P */
        int gpuid[64];
        int gpu_p2p_count = 0;

        for (int i=0; i < dev_count; i++) {
            checkCudaErrors(cudaGetDeviceProperties(&prop[i], i));

            /* boards based on Fermi or later can support P2P */
            if ((prop[i].major >= 2)) {
                /* array of P2P capable GPUs */
                gpuid[gpu_p2p_count++] = i;
            }
        }

        /* Show all the combinations of support P2P GPUs */
        int can_access_peer;

        if (gpu_p2p_count >= 2) {
            for (int i = 0; i < gpu_p2p_count; i++) {
                for (int j = 0; j < gpu_p2p_count; j++) {
                    if (gpuid[i] == gpuid[j]) {
                        continue;
                    }

                    checkCudaErrors(cudaDeviceCanAccessPeer(&can_access_peer,
                                                             gpuid[i],
                                                             gpuid[j]));

                    printf("> Peer access from %s (GPU%d) -> %s (GPU%d) : %s\n",
                                 prop[gpuid[i]].name,
                                 gpuid[i],
                                 prop[gpuid[j]].name,
                                 gpuid[j] ,
                                 can_access_peer ? "Yes" : "No");

                }
            }
        }
    }

    /* csv masterlog info
     * exe and CUDA driver name */
    printf("\ndeviceQuery, CUDA Driver = CUDART");
    char cTemp[16];
    /* driver version */
    printf(", CUDA Driver Version = %d.%d", driver_ver/1000, (driver_ver%100)/10);
    /* runtime version */
    printf(", CUDA Runtime Version = %d.%d", runtime_ver/1000, (runtime_ver%100)/10);
    /* device count */
    printf(", NumDevs = %d\n", dev_count);

    printf("Result = PASS\n");

    return EXIT_SUCCESS;

}

