#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-7n`
clean_dir ${PREFIX}

#export MPICH_HOME=/usr/local/mvapich-0.9.9
export MPICH_HOME=/usr/local/ofed1.2/mpi/gcc/mvapich-0.9.9
../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags=" -I${MPICH_HOME}/include -DUSE_STDARG -DHAVE_STDLIB_H=1 -DHAVE_STRING=1 -DHAVE_UNISTD_H=1 -DHAVE_STDARG_H=1 -DUSE_STDARG=1 -DMALLOC_RET_VOID=1" \
    --with-qmp-comms-ldflags="-Wl,-rpath-link -Wl,/usr/local/ofed1.2/mpi/gcc/mvapich-0.9.9/lib/shared -L/usr/local/ofed1.2/mpi/gcc/mvapich-0.9.9/lib/shared -L/usr/local/ofed1.2/mpi/gcc/mvapich-0.9.9/lib  -L/usr/local/ofed1.2/lib64" --with-qmp-comms-libs="-lmpich -libverbs -libumad -libcommon -lpthread -Wall -lpthread -lrt" CFLAGS="-O2" CC=gcc34
