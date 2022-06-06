#!/bin/bash

PATH=/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin

if [ -d /usr/local/cuda-11.4 ]; then
    CUDA_HOME=/usr/local/cuda-11.4
    export CUDA_HOME
    PATH=/usr/local/cuda-11.4/bin:$PATH
    export PATH
fi

NVCC=`(command -v nvcc)` ; export NVCC
if [ ! -x ${NVCC} ]; then
    /usr/bin/printf "FAIL : the NVidia compiler not found\n"
    return 1
fi

rm -f mandel_hack.o mandel_hack > /dev/null 2>&1

# Note the documentation from Nvidia is somewhat inconsistent on
# how to achieve correct IEEE754 compliance. The below seems to
# work just fine. Thus far. Until NVidia makes a breaking change.
#
# From the NVidia CUDA docs :
#
#    --ftz {true|false} (-ftz)
#    Control single-precision denormals support.
#        --ftz=true flushes denormal values to zero
#        --ftz=false preserves denormal values.
#    The default is false. Note that --use_fast_math
#    implies --ftz=true.
#
#    ------------------------------------------------------
#
#    --prec-div {true|false} (-prec-div)
#    This option controls single-precision floating-point
#    division and reciprocals.
#
#    --prec-div=true enables the IEEE round-to-nearest mode
#    --prec-div=false enables the fast approximation mode.
#    * * * Note the use of the word approximate * * *
#
#    --use_fast_math implies --prec-div=false.
#
#    ------------------------------------------------------
#
#    --prec-sqrt {true|false} (-prec-sqrt)
#
#    This option controls single-precision floating-point
#    square root.
#
#    --prec-sqrt=true enables the IEEE round-to-nearest mode
#    --prec-sqrt=false enables the fast approximation mode.
#    * * * Note the use of the word approximate * * *
#
#    --use_fast_math implies --prec-sqrt=false.
#
#    The default is true and nvcc enables the IEEE mode.
#
#    ------------------------------------------------------
#
# The Fused Multiply-Add (FMA)  
#
#    In 2008 the IEEE 754 standard was revised to include
#    the fused multiply-add operation (FMA). It is therefore
#    prudent to use this option for a slight increase in
#    performance with no loss in precision. However one must
#    be careful to also use FMA operations with any CPU based
#    computations or there will be a comparison error.
#
#    --fmad {true|false} (-fmad)
#
#    This option enables (disables) the contraction of floating
#    point multiplies and adds/subtracts into floating point
#    multiply-add operations (FMAD, FFMA, or DFMA).
#
#    --use_fast_math implies --fmad=true.
#    By default this option is set to true.
#
#    ------------------------------------------------------
#
# Note that the fused multiply add feature may be of value but
# for testing I disable it. Sometimes.
${NVCC} -ccbin g++ -I../include -m64 \
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
--fmad=true \
-c -o mandel_hack.o mandel_hack.cu

${NVCC} -ccbin g++ -m64 \
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
--fmad=true \
-o mandel_hack mandel_hack.o -lgomp

/usr/bin/printf "\n------- code will run in five seconds .. or stop me!\n\n"

sleep 5 

NVPROF=`( command -v nvprof )`; export NVPROF

${NVPROF} ./mandel_hack

