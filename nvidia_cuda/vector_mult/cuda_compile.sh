#!/bin/bash

PATH=/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/cuda-11.4/bin:/opt/schily/bin

NVCC=`(command -v nvcc)` ; export NVCC

rm -f vmult.o vmult > /dev/null 2>&1

${NVCC} -ccbin g++ -I../include -m64 -gencode arch=compute_35,code=sm_35 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -c -o vmultd.o vmultd.cu 

${NVCC} -ccbin g++ -m64 -gencode arch=compute_35,code=sm_35 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true -fmad=false -o vmultd vmultd.o -lgomp

/usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

ls -lapb vmult*

sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./vmultd

