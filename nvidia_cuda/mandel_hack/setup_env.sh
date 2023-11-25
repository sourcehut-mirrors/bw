#!/bin/sh
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

CUDA_HOME=/usr/local/cuda-11.8
export CUDA_HOME
PATH=/usr/local/cuda-11.8/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/schily/bin
export PATH

NVCC=`(command -v nvcc)` ; export NVCC

