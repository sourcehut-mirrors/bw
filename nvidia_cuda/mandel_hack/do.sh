#!/bin/sh
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o array_index.o array_index.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o array_offset.o array_offset.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o cpu_mbrot.o cpu_mbrot.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o fp_translate.o fp_translate.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o fp_vbox.o fp_vbox.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o sm_cores.o sm_cores.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -c -o timediff.o timediff.c
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -I. -c -o gpu_mbrot.o gpu_mbrot.cu
nvcc -gencode arch=compute_35,code=sm_35 -gencode arch=compute_60,code=sm_60 -Wno-deprecated-gpu-targets --ftz=false --prec-div=true --prec-sqrt=true --fmad=true -I. -I../include  -c -o  main.o main.cu 
