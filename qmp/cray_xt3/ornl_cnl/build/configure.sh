#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION`
clean_dir ${PREFIX}

module unload PrgEnv-pgi
module load PrgEnv-gnu
module unload gcc/3.2.3
module load gcc/3.3.3

../../../qmp/configure --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux \
    --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="" \
    --with-qmp-comms-ldflags="" \
    --with-qmp-comms-libs="" \
    --prefix=${PREFIX} \
    CC="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/cc" \
    CFLAGS="-O2" 
