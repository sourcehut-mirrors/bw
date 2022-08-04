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

rm -f dev_info dev_info.o > /dev/null 2>&1

${NVCC} -ccbin g++ -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets -lnppi_static -lculibos -c -o dev_info.o dev_info.cpp

${NVCC} -ccbin g++ -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets -o dev_info dev_info.o

/usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

ls -lapb dev_info*

sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./dev_info

