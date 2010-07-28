#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION openmpi`
clean_dir ${PREFIX}


CC=mpicc

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="${CC}" CFLAGS="-D_REENTRANT -O3 -march=core2"  --host=x86_64-linux-gnu --build=none

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

