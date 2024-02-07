#!/bin/bash

unset ADDR2LINE
unset AR
unset AS
unset CC
unset CXX
unset CFLAGS
unset CPPFLAGS
unset ELFEDIT
unset LD
unset NM
unset OBJCOPY
unset OBJDUMP
unset RANLIB
unset READELF
unset SIZE
unset STRINGS
unset STRIP


PATH=/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

if [ -d /usr/local/cuda-12.3 ]; then
    if [ -x /usr/local/cuda-12.3/bin/nvcc ]; then
        NVCC=/usr/local/cuda-12.3/bin/nvcc
        export NVCC
        CUDA_HOME=/usr/local/cuda-12.3
        export CUDA_HOME
        PATH=/usr/local/cuda-12.3/bin:/usr/bin:/bin:/usr/sbin:/sbin
        export PATH
    else
        /usr/bin/printf "FAIL : the NVidia compiler not found\n"
        return 42
    fi
else
    if [ -d /usr/local/cuda-11.8 ]; then
        if [ -x /usr/local/cuda-11.8/bin/nvcc ]; then
            NVCC=/usr/local/cuda-11.8/bin/nvcc
            export NVCC
            CUDA_HOME=/usr/local/cuda-11.8
            export CUDA_HOME
            PATH=/usr/local/cuda-11.8/bin:/usr/bin:/bin:/usr/sbin:/sbin
            export PATH
        else
            /usr/bin/printf "FAIL : the NVidia compiler 11.8 not found\n"
            return 42
        fi
    fi
fi

rm -f dev_info dev_info.o > /dev/null 2>&1

# for device compute level stuff be sure to check
# the more or less up to date list at
# https://developer.nvidia.com/cuda-gpus
# lines to rip out for now 
#
# -gencode arch=compute_37,code=sm_37
# -gencode arch=compute_50,code=sm_50
# -gencode arch=compute_52,code=sm_52
# -gencode arch=compute_61,code=sm_61
# -gencode arch=compute_70,code=sm_70
# -gencode arch=compute_75,code=sm_75
#
#
#------------------------------------------------------------
#    W A R N I N G    :    NVIDIA will not support the K6000
#                          with any driver after 470.223.02
#
#       Therefore compute_35 is gone gone gone ...
#------------------------------------------------------------


if [ -x /usr/bin/g++-11 ]; then
    CXX=/usr/bin/g++-11
    export CXX
else
    /usr/bin/printf "FAIL : We need GCC 11 for some obscure reason.\n"
    return 42
fi

${NVCC} -ccbin ${CXX} -I../include -m64 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
-lnppi_static -lculibos -c -o dev_info.o dev_info.cpp

${NVCC} -ccbin ${CXX} -m64 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets -o dev_info dev_info.o

/usr/bin/printf "\n------- NVidia profiler to run also. In five secs.\n\n"

sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./dev_info

