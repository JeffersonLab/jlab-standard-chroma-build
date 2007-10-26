#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-7n`
clean_dir ${PREFIX}


export MPICH_HOME=/usr/local/mvapich-0.9.9
CC=${MPICH_HOME}/bin/mpicc

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC=${CC} CFLAGS="-O3 -march=opteron"
