#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib-ofed1-ompi`
clean_dir ${PREFIX}

export OPENMPI_HOME=/usr/local/openmpi-1.1.1

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags=" -I${OPENMPI_HOME}/include -I${OPENMPI_HOME}/include/openmpi -O2 -pthread" \
    --with-qmp-comms-ldflags="-L${OPENMPI_HOME}/lib -L/usr/local/ofed/lib -L/usr/local/ofed/lib/infiniband" \
    --with-qmp-comms-libs="-lmpi -lorte -lopal -libverbs -lrt -ldl -Wl,--export-dynamic -lnsl -lutil -lm -lpthread -ldl" CFLAGS="-O2"
