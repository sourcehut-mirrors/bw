#!/bin/bash

PATH=/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/cuda-11.4/bin:/opt/schily/bin

if [ -d /usr/local/cuda-11.4 ]; then
    CUDA_HOME=/usr/local/cuda-11.4
    export CUDA_HOME
    PATH=/usr/local/cuda-11.4/bin:$PATH
    export PATH
fi

NVCC=`(command -v nvcc)` ; export NVCC

rm -f mandel_hack.o mandel_hack > /dev/null 2>&1

${NVCC} -ccbin g++ -I../include -m64 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -c -o mandel_hack.o mandel_hack.cu

${NVCC} -ccbin g++ -m64 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_61,code=sm_61 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_75,code=sm_75 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -o mandel_hack mandel_hack.o -lgomp

/usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./mandel_hack

