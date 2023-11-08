
#include <stdio.h>

int ConvertSMVer2Cores(int major, int minor) {   
    int index = 0;

    /* Defines for GPU Architecture types
     * (using the SM version to determine
     * the number of cores per SM */
    typedef struct {
        /* 0xMm hex number where
         *     M = SM Major version
         *     m = SM minor version
         */
        int SM;
        int Cores;
    } sSMtoCores;
    
    sSMtoCores nGpuArchCoresPerSM[] = {
        { 0x30, 192}, /* Kepler  (SM 3.0) GK10x */
        { 0x32, 192}, /* Kepler  (SM 3.2) GK10x */
        { 0x35, 192}, /* Kepler  (SM 3.5) GK11x */
        { 0x37, 192}, /* Kepler  (SM 3.7) GK21x */
        { 0x50, 128}, /* Maxwell (SM 5.0) GM10x */
        { 0x52, 128}, /* Maxwell (SM 5.2) GM20x */
        { 0x53, 128}, /* Maxwell (SM 5.3) GM20x */
        { 0x60, 64 }, /* Pascal  (SM 6.0) GP100 */
        { 0x61, 128}, /* Pascal  (SM 6.1) GP10x */
        { 0x62, 128}, /* Pascal  (SM 6.2) GP10x */
        { 0x70, 64 }, /* Volta   (SM 7.0) GV100 */
        {   -1, -1 }
    };
    
    while (nGpuArchCoresPerSM[index].SM != -1) {
        if (nGpuArchCoresPerSM[index].SM == ((major << 4) + minor)) {
            return nGpuArchCoresPerSM[index].Cores;
        }
        index++;
    }
    
    /* if we can not find the values then we may
     * default to the previous one to run properly */
    printf("MapSMtoCores for SM %d.%d is undefined.", major, minor);
    printf("  Default to use %d Cores/SM\n", nGpuArchCoresPerSM[index-1].Cores);

    return nGpuArchCoresPerSM[index-1].Cores;

}

