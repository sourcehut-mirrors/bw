#!/bin/bash

PATH=/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

if [ -d /usr/local/cuda-11.8 ]; then
    CUDA_HOME=/usr/local/cuda-11.8
    export CUDA_HOME
    NVCC=/usr/local/cuda-11.8/bin/nvcc
    export NVCC
    NVPROF=/usr/local/cuda-11.8/bin/nvprof
    export NVPROF
    PATH=/usr/local/cuda-11.8:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
    export PATH
fi

if [ -d /usr/local/cuda-12.3 ]; then
    CUDA_HOME=/usr/local/cuda-11.8
    export CUDA_HOME
    NVCC=/usr/local/cuda-12.3/bin/nvcc
    export NVCC
    NVPROF=/usr/local/cuda-12.3/bin/nvprof
    export NVPROF
    PATH=/usr/local/cuda-12.3:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
    export PATH
fi

if [ ! -x $NVCC ]; then
    /usr/bin/printf "FAIL : the NVidia compiler not found\n"
    return 1
fi

rm -f vmultd.o vmultd vmultf.o vmultf > /dev/null 2>&1

/usr/bin/printf "\n\n------- attempt to compile vmultf.cu\n"


# for device compute level stuff be sure to check
# the more or less up to date list at
# https://developer.nvidia.com/cuda-gpus
# lines to rip out for now 
#
# Really old K6000 needs 3.5 and that was dropped
# entirely in CUDA 12.3 and upwards.
#
# Use option -Wno-deprecated-gpu-targets if needed.
#
# -gencode arch=compute_50,code=sm_50
# -gencode arch=compute_52,code=sm_52
# -gencode arch=compute_61,code=sm_61
# -gencode arch=compute_70,code=sm_70
# -gencode arch=compute_75,code=sm_75
#
# Also we need to use either GCC 10 or GCC 11 at most.

if [ -x /usr/bin/g++-10 ]; then
    CXX=/usr/bin/g++-10
    export CXX
fi

if [ -x /usr/bin/g++-11 ]; then
    CXX=/usr/bin/g++-11
    export CXX
fi

${NVCC} -ccbin ${CXX} -I../include \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vmultf.o vmultf.cu

if [ ! -f vmultf.o ]; then
    /usr/bin/printf "\nFAIL ---- vmultf compile failed\n"
    exit 42
fi


${NVCC} -ccbin ${CXX} \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vmultf vmultf.o -lgomp

if [ -f vmultf ]; then

    /usr/bin/printf "\n------- code will run in five seconds ..\n\n"

    ls -lapb vmultf*

    sleep 5 

    if [ ! -x $NVPROF ]; then
        /usr/bin/printf "WARN : NVidia profiler not found\n"
        ./vmultf
    else
        ${NVPROF} ./vmultf
    fi

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi

/usr/bin/printf "\n----------------------------------------------\n"
sleep 5
/usr/bin/printf "\n\n        attempt to compile vmultd.cu\n"


${NVCC} -ccbin ${CXX} -I../include \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vmultd.o vmultd.cu

if [ ! -f vmultd.o ]; then
    /usr/bin/printf "\nFAIL ---- vmultd compile failed\n"
    exit 42
fi


${NVCC} -ccbin ${CXX} \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vmultd vmultd.o -lgomp

if [ -f vmultd ]; then

    /usr/bin/printf "\n------- code will run in five seconds ..\n\n"

    ls -lapb vmultd*

    sleep 5 

    if [ ! -x $NVPROF ]; then
        /usr/bin/printf "WARN : NVidia profiler not found\n"
        ./vmultd
    else
        ${NVPROF} ./vmultd
    fi

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi

rm -f vmultd.o vmultd vmultf.o vmultf > /dev/null 2>&1


