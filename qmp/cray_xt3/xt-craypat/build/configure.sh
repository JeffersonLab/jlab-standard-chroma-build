#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION xt-pat`
clean_dir ${PREFIX}

../../../qmp/configure --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux \
    --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="" \
    --with-qmp-comms-ldflags="" \
    --with-qmp-comms-libs="" \
     --prefix=${PREFIX} \
    CC="cc" \
    CFLAGS="-g -O3 -msse -msse2 -march=barcelona" 
