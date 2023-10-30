
objects = main.o array_index.o cpu_mbrot.o fp_vbox.o \
		sm_cores.o array_offset.o fp_translate.o \
		timediff.o


all: $(objects)
	nvcc -x cu  -gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true $(objects) -o mandelbrot

%.o: %.cpp
	nvcc -x cu \
	-gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true -I. -I../include -dc $< -o $@

clean:
		rm -f *.o mandelbrot

