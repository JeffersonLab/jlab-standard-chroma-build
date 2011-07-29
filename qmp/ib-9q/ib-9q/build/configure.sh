#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-9q`
clean_dir ${PREFIX}

MPI="/usr/mpi/gcc/mvapich2-1.6"
CC="$MPI/bin/mpicc" 

#CC="$MPI/bin/mpicc -cc=gcc" 
#CC="$MPI/bin/mpicc" 
#CC=gcc
#CFLAGS="-I/usr/local/mvapich-1.1/include"

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS="-O3 -D_REENTRANT -march=core2" 

#LDFLAGS="-L/usr/local/mvapich-1.1/lib" LIBS="-lmpich -lpmpich -lpthread"

#/usr/mpi/gcc/mvapich-1.1.0/lib
#libampe.a
#libfmpich.a
#liblmpe.a
#libmpe.a
#libmpe_nompi.a
#libmpich.a
#libmpichf90.a
#libmpichf90nc.a
#libmpichfarg.a
#libmpichfsup.a
#libpmpich.a
#libpmpich++.a
#libtmpe.a

