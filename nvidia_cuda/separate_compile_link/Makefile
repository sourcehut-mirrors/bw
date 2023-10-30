
objects = main.o particle.o v3.o

all: $(objects)
	nvcc -gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true $(objects) -o app

%.o: %.cpp
	nvcc -x cu \
	-gencode arch=compute_35,code=sm_35 \
	-gencode arch=compute_60,code=sm_60 \
	-Wno-deprecated-gpu-targets \
	--ftz=false --prec-div=true --prec-sqrt=true \
	--fmad=true -I. -dc $< -o $@

clean:
		rm -f *.o app

