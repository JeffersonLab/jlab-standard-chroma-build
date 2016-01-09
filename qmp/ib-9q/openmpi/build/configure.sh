#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION openmpi`
clean_dir ${PREFIX}


MPI=/usr/mpi/gcc/openmpi-1.4.3
CC=$MPI/bin/mpicc
export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$PATH

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS="-D_REENTRANT -O2 -march=core2 -std=gnu99"  --host=x86_64-linux-gnu --build=none

