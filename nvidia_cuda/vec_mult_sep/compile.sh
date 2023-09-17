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

rm -f vmultd.o vmultd timediff.o > /dev/null 2>&1

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

/usr/bin/gcc-10 -std=iso9899:1999 -m64 -O0 -g \
-D_LARGEFILE64_SOURCE -D_XOPEN_SOURCE=600 \
-c -o timediff.o ../../time_and_date/timediff.c

${NVCC} -ccbin /usr/bin/g++-10 -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_60,code=sm_60 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vmultd vmultd.o timediff.o -lgomp

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


