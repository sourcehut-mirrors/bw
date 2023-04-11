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
    exit 42
fi

NVPROF=`( command -v nvprof )`; export NVPROF
if [ ! -x ${NVPROF} ]; then
    /usr/bin/printf "FAIL : We need the NVidia profiler nvprof\n"
    exit 42
fi

rm -f vaddf vaddf.o > /dev/null 2>&1

# Beware of the FMA disable options
# nvcc -ccbin g++ -I../include -m64 -gencode arch=compute_35,code=sm_35
# -Wno-deprecated-gpu-targets --ftz=false --prec-div=true
# --prec-sqrt=true -fmad=false -c -o vaddf.o vaddf.cu 

CXX=`(command -v g++-10 )`; export CXX
if [ ! -x ${CXX} ]; then
    /usr/bin/printf "FAIL : You need GCC ver 10.x for this\n"
    exit 42
fi

/usr/bin/printf "\n\n------- attempt to compile vaddf.cu\n"

${NVCC} -ccbin ${CXX}  -I../include -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vaddf.o vaddf.cu

if [ ! -f vaddf.o ]; then
    /usr/bin/printf "\nFAIL ---- compile failed\n"
    exit 42
fi

${NVCC} -ccbin ${CXX}  -m64 \
-gencode arch=compute_35,code=sm_35 \
-gencode arch=compute_37,code=sm_37 \
-gencode arch=compute_50,code=sm_50 \
-gencode arch=compute_52,code=sm_52 \
-gencode arch=compute_60,code=sm_60 \
-gencode arch=compute_61,code=sm_61 \
-gencode arch=compute_70,code=sm_70 \
-gencode arch=compute_75,code=sm_75 \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-o vaddf vaddf.o -lgomp

if [ -f vaddf ]; then

    /usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

    ls -lapb vaddf*

    sleep 5 

    ${NVPROF} ./vaddf

else
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi


/usr/bin/printf "\n\n------- attempt to compile vaddd.cu\n"

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
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o vaddd.o vaddd.cu

if [ ! -f vaddd.o ]; then
    /usr/bin/printf "\nFAIL ---- compile failed\n"
    exit 42
fi

# nvcc -ccbin g++ -m64 -gencode arch=compute_35,code=sm_35 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=
# true -fmad=false -o vaddd vaddd.o -lgomp 

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
--ftz=false --prec-div=true --prec-sqrt=true \
-o vaddd vaddd.o -lgomp

if [ -f vaddd ]; then

    /usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

    ls -lapb vaddd*

    sleep 5 

    ${NVPROF} ./vaddd

else
    rm -f vaddf vaddf.o > /dev/null 2>&1
    /usr/bin/printf "\n------- NO Binary Produced\n\n"
fi


rm -f vaddd vaddd.o vaddf vaddf.o > /dev/null 2>&1 


