
CUDA_HOME = /usr/local/cuda-11.8

objects = main.o array_offset.o cpu_mbrot.o \
		fp_translate.o fp_vbox.o sm_cores.o \
		timediff.o gpu_mbrot.o


all: $(objects)
	nvcc -ccbin /usr/bin/g++-11 -m64 \
	-gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true $(objects) -o mbrot -lgomp

%.o: %.cu
	nvcc -x cu -ccbin /usr/bin/g++-11 -m64 \
	-gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true -I. -I../include -dc $< -o $@

clean:
		rm -f *.o mbrot

