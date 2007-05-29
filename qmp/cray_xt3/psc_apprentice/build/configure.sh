#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION`_finst
clean_dir ${PREFIX}

module unload PrgEnv-pgi
module load PrgEnv-gnu
module load gcc-catamount/3.3

../../../qmp/configure --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux \
    --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="-I/opt/xt-mpt/${XTOS_VERSION}/mpich2-64/GP2/include -I/opt/acml/3.0/gnu64/include -I/opt/xt-libsci/${XTOS_VERSION}/gnu/include -I/opt/xt-mpt/${XTOS_VERSION}/include" \
    --with-qmp-comms-ldflags="-finstrument-functions -L/opt/xt-mpt/${XTOS_VERSION}/mpich2-64/GP2/lib -L/opt/acml/3.0/gnu64/lib -L/opt/xt-libsci/${XTOS_VERSION}/gnu/cnos64/lib -L/opt/xt-mpt/${XTOS_VERSION}/sma/lib" \
    --with-qmp-comms-libs=" -lacml -lg2c -lsci -lmpich" \
     --prefix=${PREFIX} \
    CC="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-gcc" \
    CFLAGS="-O2 -finstrument-functions" 
