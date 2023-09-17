#!/bin/bash

PATH=/usr/local/cuda-11.8/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

if [ -d /usr/local/cuda-11.8 ]; then
    CUDA_HOME=/usr/local/cuda-11.8
    export CUDA_HOME
fi

NVCC=`(command -v nvcc)`
export NVCC
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
# -gencode arch=compute_37,code=sm_37
# -gencode arch=compute_50,code=sm_50
# -gencode arch=compute_52,code=sm_52
# -gencode arch=compute_61,code=sm_61
# -gencode arch=compute_70,code=sm_70
# -gencode arch=compute_75,code=sm_75
#
${NVCC} -ccbin /usr/bin/g++-10 -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vmultf.o vmultf.cu

if [ ! -f vmultf.o ]; then
    /usr/bin/printf "\nFAIL ---- compile failed\n"
    exit 42
fi


${NVCC} -ccbin /usr/bin/g++-10 -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vmultf vmultf.o -lgomp

if [ -f vmultf ]; then

    /usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

    ls -lapb vmultf*

    sleep 5 

    NVPROF=`( command -v nvprof )`; export NVPROF

    ${NVPROF} ./vmultf

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi

/usr/bin/printf "\n\n------- attempt to compile vmultd.cu\n"

${NVCC} -ccbin /usr/bin/g++-10 -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vmultd.o vmultd.cu

if [ ! -f vmultd.o ]; then
    /usr/bin/printf "\nFAIL ---- compile failed\n"
    exit 42
fi


${NVCC} -ccbin /usr/bin/g++-10 -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vmultd vmultd.o -lgomp

if [ -f vmultd ]; then

    /usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

    ls -lapb vmultd*

    sleep 5 

    NVPROF=`( command -v nvprof )`; export NVPROF

    ${NVPROF} ./vmultd

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi

rm -f vmultd.o vmultd vmultf.o vmultf > /dev/null 2>&1


