
CUDA_HOME = /usr/local/cuda-12.3

objects = main.o array_offset.o cpu_mbrot.o \
		fp_translate.o fp_vbox.o sm_cores.o \
		timediff.o gpu_mbrot.o


all: $(objects)
	/usr/local/cuda-12.3/bin/nvcc -ccbin /usr/bin/g++-12 \
	-gencode arch=compute_50,code=sm_50 \
	-gencode arch=compute_60,code=sm_60 \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true $(objects) -o mbrot -lgomp

%.o: %.cu
	/usr/local/cuda-12.3/bin/nvcc -x cu -ccbin /usr/bin/g++-12 \
	-gencode arch=compute_50,code=sm_50 \
	-gencode arch=compute_60,code=sm_60 \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true -I. -I../include -dc $< -o $@

clean:
		rm -f *.o mbrot

