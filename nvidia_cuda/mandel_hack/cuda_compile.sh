#!/bin/bash

unset ADDR2LINE
unset AR
unset AS
unset CC
unset CXX
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

if [ -d /usr/local/cuda-11.8 ]; then
    CUDA_HOME=/usr/local/cuda-11.8
    export CUDA_HOME
    PATH=/usr/local/cuda-11.8/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/schily/bin
    export PATH
fi

NVCC=`(command -v nvcc)` ; export NVCC
if [ ! -x ${NVCC} ]; then
    /usr/bin/printf "FAIL : the NVidia compiler not found\n"
    return 1
fi

rm -f mandel_hack.o mandel_hack > /dev/null 2>&1


/usr/bin/printf "\n\n------- attempt to compile mandel_hack.cu\n"

${NVCC} -ccbin /usr/bin/g++-10 -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-c -o mandel_hack.o mandel_hack.cu

if [ ! -f mandel_hack.o ]; then
    /usr/bin/printf "\nFAIL ---- compile failed\n"
    exit 42
fi

${NVCC} -ccbin /usr/bin/g++-10 -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-o mandel_hack mandel_hack.o -lgomp

if [ -f mandel_hack ]; then

    /usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

    ls -lapb mandel_hack*

    sleep 5 

    NVPROF=`( command -v nvprof )`; export NVPROF

    ${NVPROF} ./mandel_hack

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi

# rm -f mandel_hack mandel_hack.o > /dev/null 2>&1 
/usr/bin/printf "\n\n\n * * * object file and binary file remain in place * * *\n\n"

