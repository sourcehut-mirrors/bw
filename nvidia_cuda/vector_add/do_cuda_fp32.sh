#!/bin/bash
# this is updated for CUDA 12.9
# July 2026
#

IFS='   
'

\unalias -a

unset ADDR2LINE
unset AR
unset AS
unset CC
unset CXX
unset CFLAGS
unset CPPFLAGS
unset ELFEDIT
unset LD
unset LD_RUNPATH
unset LD_LIBRARY_PATH
unset NM
unset OBJCOPY
unset OBJDUMP
unset RANLIB
unset READELF
unset SIZE
unset STRINGS
unset STRIP

if [ ! -d /usr/local/cuda-12.9/bin ]; then
    /usr/bin/printf "\nFAIL : /usr/local/cuda-12.9/bin not found\n"
    return 42
fi

PATH=/usr/local/cuda-12.9/bin:/usr/local/bin:/usr/local/sbin:/opt/bw/bin:/opt/bw/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/schily/bin
export PATH

if [ -L /bin ]; then
    if [ -x /usr/bin/more ]; then
        LESS_IS_MORE=1 ; export LESS_IS_MORE
        PAGER=/usr/bin/more
        export PAGER
        MANPAGER=/usr/bin/more
        export MANPAGER
    else
        if [ -x /usr/bin/less ]; then
            PAGER=/usr/bin/less
            export PAGER
            unset MANPAGER
        else
            /usr/bin/printf "\nFAIL : no possible pager more or less\n"
            exit 1
        fi
    fi
else
    if [ -x /bin/more ]; then
        PAGER=/bin/more
        export PAGER
        MANPAGER=/bin/more
        export MANPAGER
        LESS_IS_MORE=1 ; export LESS_IS_MORE
    else
        if [ -x /bin/less ]; then
            PAGER=/bin/less
            export PAGER
            unset MANPAGER
        else
            unset MANPAGER
            unset PAGER
        fi
    fi
fi

TZ=GMT0
export TZ

LANG=en_US.UTF-8
export LANG

LC_TIME=C
export LC_TIME

rm -f vaddf vaddf.o sysinfo.o endian.o tdiff.o > /dev/null 2>&1

CUDA_HOME=/usr/local/cuda-12.9
export CUDA_HOME

# We must/should/may? not use a compiler past GCC 15.x

if [ -x /usr/bin/x86_64-linux-gnu-g++-12 ]; then
    CXX=/usr/bin/x86_64-linux-gnu-g++-12
    export CXX
else
    if [ -x /usr/bin/x86_64-linux-gnu-g++-13 ]; then
        CXX=/usr/bin/x86_64-linux-gnu-g++-13
        export CXX
    else
        if [ -x /usr/bin/x86_64-linux-gnu-g++-14 ]; then
            CXX=/usr/bin/x86_64-linux-gnu-g++-14
            export CXX
        else
            /usr/bin/printf "\nFAIL : no valid C++ compiler version found\n"
            /usr/bin/printf "     : NVidia CUDA is very picky about this.\n"
            return 42
        fi
    fi
fi

if [ -x /usr/local/cuda-12.9/bin/nvcc ]; then
    NVCC=/usr/local/cuda-12.9/bin/nvcc
    export NVCC
else
    /usr/bin/printf "\nFAIL : NVidia CUDA Compiler not found\n"
    /usr/bin/printf "     : should be at /usr/local/cuda-12.9/bin/nvcc\n"
    return 42
fi

if [ ! -d /usr/local/cuda-12.9/include ]; then
    /usr/bin/printf "\nFAIL : NVidia CUDA include directory not found\n"
    /usr/bin/printf "     : should be at /usr/local/cuda-12.9/include\n"
    return 42
fi


cp -p ../../time_and_date/tdiff.c ./tdiff.cu
cp -p ../../sysinfo/sysinfo.c     ./sysinfo.cu
cp -p ../../sysinfo/endian.c      ./endian.cu


# the old old K620 *may* work at compute level 5.0
${NVCC} -x cu -ccbin ${CXX} \
-I ../include -I /usr/local/cuda-12.9/include \
-I/usr/local/cuda-12.9/targets/x86_64-linux/include \
-I../../time_and_date \
-Wno-deprecated-gpu-targets \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-c -o tdiff.o tdiff.cu

if [ -f tdiff.o ]; then
    /usr/bin/printf "INFO : tdiff.o done\n"
fi


${NVCC} -x cu -ccbin ${CXX} \
-I ../include -I /usr/local/cuda-12.9/include \
-I/usr/local/cuda-12.9/targets/x86_64-linux/include \
-I../../sysinfo \
-Wno-deprecated-gpu-targets \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-c -o endian.o endian.cu

if [ -f endian.o ]; then
    /usr/bin/printf "INFO : endian.o done\n"
fi

# NOTE: declared but never used vars can be noisey
#       use -diag-suppress 177
${NVCC} -x cu -ccbin ${CXX} \
-I ../include -I /usr/local/cuda-12.9/include \
-I/usr/local/cuda-12.9/targets/x86_64-linux/include \
-I../../sysinfo \
-diag-suppress 177 \
-Wno-deprecated-gpu-targets \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-c -o sysinfo.o sysinfo.cu

if [ -f sysinfo.o ]; then
    /usr/bin/printf "INFO : sysinfo.o done\n"
fi

${NVCC} -x cu -ccbin ${CXX} \
-I ../include -I /usr/local/cuda-12.9/include \
-I/usr/local/cuda-12.9/targets/x86_64-linux/include \
-I../../sysinfo -I../../time_and_date \
-diag-suppress 177 \
-Wno-deprecated-gpu-targets \
-gencode arch=compute_60,code=sm_60 \
--ftz=false --prec-div=true --prec-sqrt=true --fmad=true \
-c -o vaddf.o vaddf.cu

if [ -f vaddf.o ]; then
    /usr/bin/printf "INFO : vaddf.o done\n"
fi

${NVCC} -ccbin ${CXX} \
-Wno-deprecated-gpu-targets \
-gencode arch=compute_60,code=sm_60 \
-o vaddf vaddf.o endian.o tdiff.o sysinfo.o -lgomp

if [ -x vaddf ]; then
    /usr/bin/printf "INFO : vaddf ready to run. Maybe. Good luck.\n"
fi

rm -f sysinfo.cu endian.cu tdiff.cu *.o

