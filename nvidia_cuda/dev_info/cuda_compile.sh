#!/bin/bash

unset ADDR2LINE
unset AR
unset AS
unset CC
unset CXX
unset CFLAGS
unset CPPFLAGS
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

ADDR2LINE=/usr/local/bin/addr2line
export ADDR2LINE

AR=/usr/local/bin/ar
export AR

AS=/usr/local/bin/as
export AS

ELFEDIT=/usr/local/bin/elfedit
export ELFEDIT

GPROF=/usr/local/bin/gprof
export GPROF

LD=/usr/local/bin/ld
export LD

NM=/usr/local/bin/nm
export NM

OBJCOPY=/usr/local/bin/objcopy
export OBJCOPY

OBJDUMP=/usr/local/bin/objdump
export OBJDUMP

RANLIB=/usr/local/bin/ranlib
export RANLIB

READELF=/usr/local/bin/readelf
export READELF

SIZE=/usr/local/bin/size
export SIZE

STRINGS=/usr/local/bin/strings
export STRINGS

STRIP=/usr/local/bin/strip
export STRIP

PATH=/usr/local/cuda-13.1/bin:/usr/local/gcc15/bin:/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

rm -f dev_info dev_info.o > /dev/null 2>&1

CUDA_HOME=/usr/local/cuda-13.1
export CUDA_HOME

CXX=/usr/local/gcc15/bin/g++
export CXX

LANG=en_US.UTF-8
export LANG

LC_TIME=C
export LC_TIME

NVCC=/usr/local/cuda-13.1/bin/nvcc
export NVCC

${NVCC} -x cu -ccbin ${CXX} \
-I ../include -I /usr/local/cuda-13.1/include \
-I /usr/local/cuda-13.1/targets/x86_64-linux/include \
-allow-unsupported-compiler \
-Wno-deprecated-gpu-targets \
--ftz=false --prec-div=true --prec-sqrt=true \
-c -o dev_info.o dev_info.cu


if [ ! -f dev_info.o ]; then
    /usr/bin/printf "\n bork bork bork \n"
    exit 42
fi


${NVCC} -ccbin ${CXX} -allow-unsupported-compiler \
-Wno-deprecated-gpu-targets \
-o dev_info dev_info.o


#NVPROF=`( command -v nvprof )`; export NVPROF
#
#${NVPROF} ./dev_info
#
