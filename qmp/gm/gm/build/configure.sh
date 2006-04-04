#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION mpich-gm-1.2.5`
clean_dir ${PREFIX}

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="-I/usr/local/mpich-gm-1.2.5/include" \
    --with-qmp-comms-ldflags="-L/usr/local/mpich-gm-1.2.5/lib -L/usr/local/gm-1.6.4/lib" \
    --with-qmp-comms-libs="-lmpich -lgm -lpthread" CFLAGS="-O2"
