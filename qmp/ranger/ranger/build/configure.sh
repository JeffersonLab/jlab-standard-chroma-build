#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-7n`
clean_dir ${PREFIX}

TOOLS=/share/home/00496/tg457586

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI --with-qmp-comms-cflags="" --with-qmp-comms-ldflags="" --with-qmp-comms-libs="" CC="mpicc -cc=$TOOLS/install/gcc-4.2.3/bin/gcc" CFLAGS="-O3 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=opteron" --host=x86_64-linux-gnu --build=none
