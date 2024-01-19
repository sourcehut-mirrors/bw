#!/bin/sh

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

PATH=/usr/local/cuda-11.8/bin:/usr/local/bin:/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/schily/bin
export PATH

CUDA_HOME=/usr/local/cuda-11.8
export CUDA_HOME

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o array_offset.o array_offset.cu

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o cpu_mbrot.o cpu_mbrot.cu

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o fp_translate.o fp_translate.cu

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o fp_vbox.o fp_vbox.cu

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o sm_cores.o sm_cores.cu

nvcc -v -ccbin /usr/bin/g++-11 -x cu -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o timediff.o ../../time_and_date/timediff.c

nvcc -v -ccbin /usr/bin/g++-11 -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -I. -c -o gpu_mbrot.o gpu_mbrot.cu

nvcc -v -ccbin /usr/bin/g++-11 -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -I. -I../include  -c -o  main.o main.cu 

exit 42

nvcc -v -ccbin /usr/bin/g++-11 -m64 -gencode arch=compute_60,code=sm_60 --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -o do_me_gpu main.o gpu_mbrot.o array_index.o cpu_mbrot.o fp_vbox.o timediff.o array_offset.o fp_translate.o sm_cores.o -lgomp
