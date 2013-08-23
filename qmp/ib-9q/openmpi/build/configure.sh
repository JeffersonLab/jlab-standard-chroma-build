#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION openmpi`
clean_dir ${PREFIX}

MPI=/usr/mpi/gcc/openmpi-1.4.3
CC=$MPI/bin/mpicc

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS="-D_REENTRANT -O3 -march=core2 -std=c99"  --host=x86_64-linux-gnu --build=none

