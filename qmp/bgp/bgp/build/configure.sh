#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgp`
clean_dir ${PREFIX}


../../../qmp/configure --host=powerpc-bgp-linux --build=none \
    --with-qmp-comms-type=MPI \
    --enable-bgp \
    --prefix=${PREFIX} \
    CFLAGS="-O2" \
    CC="/bgsys/drivers/ppcfloor/comm/bin/mpicc"
