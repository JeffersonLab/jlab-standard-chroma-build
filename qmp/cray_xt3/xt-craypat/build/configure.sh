#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION xt-pat`
clean_dir ${PREFIX}

pushd ../../../qmp ; aclocal; automake; autoconf; popd

../../../qmp/configure --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux \
    --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="" \
    --with-qmp-comms-ldflags="" \
    --with-qmp-comms-libs="" \
     --prefix=${PREFIX} \
    CC="cc" \
    CFLAGS="-O3 -D_REENTRANT  -march=barcelona" 
