#!/bin/bash

PATH=/usr/local/cuda-11.4/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

if [ -d /usr/local/cuda-11.4 ]; then
    CUDA_HOME=/usr/local/cuda-11.4
    export CUDA_HOME
fi

NVCC=`(command -v nvcc)` ; export NVCC
if [ ! -x ${NVCC} ]; then
    /usr/bin/printf "FAIL : the NVidia compiler not found\n"
    return 1
fi

OPENSSL=`( command -v openssl )`; export OPENSSL

rm -f vmult.o vmult > /dev/null 2>&1

${NVCC} -ccbin g++ -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -c -o vmultd.o vmultd.cu

${NVCC} -ccbin g++ -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -o vmultd vmultd.o -lgomp

/usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

ls -lapb vmult*

${OPENSSL} dgst -sha512 -r vmultd.cu | cut -c1-128
${OPENSSL} dgst -sha512 -r ../include/dat.h | cut -c1-128
sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./vmultd

