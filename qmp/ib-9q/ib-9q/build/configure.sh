#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-9q`
clean_dir ${PREFIX}

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

MPI="/usr/mpi/gcc/mvapich2-1.8/"
CC="$MPI/bin/mpicc" 

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS="-O2 -D_REENTRANT -march=core2 -std=gnu99" 
