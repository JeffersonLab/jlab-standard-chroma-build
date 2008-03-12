#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-7n`
clean_dir ${PREFIX}


../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="mpicc -cc=$HOME/gnu/bin/gcc" CFLAGS="-O3 -march=opteron " --host=x86_64-linux-gnu --build=none
