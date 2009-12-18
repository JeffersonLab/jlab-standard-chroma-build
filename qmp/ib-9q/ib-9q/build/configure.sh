#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-9q`
clean_dir ${PREFIX}


CC="/usr/mpi/gcc/mvapich-1.1.0/bin/mpicc -cc=gcc" 
CXX="/usr/mpi/gcc/mvapich-1.1.0/bin/mpiCC" 

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS=" -O3 -march=core2" LDFLAGS="-L/usr/mpi/gcc/mvapich-1.1.0/lib" LDFLAGS="-static"
