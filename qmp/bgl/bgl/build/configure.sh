#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgl`
clean_dir ${PREFIX}

export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

../../../qmp/configure --host=powerpc-bgl-blrts-gnu --build=none \
    --with-qmp-comms-type=MPI \
    --with-qmp-comms-cflags="-I/bgl/BlueLight/ppcfloor/bglsys/include" \
    --with-qmp-comms-ldflags="-L/bgl/BlueLight/ppcfloor/bglsys/lib" \
    --with-qmp-comms-libs="-lmpich.rts -lmsglayer.rts -ldevices.rts -lrts.rts -ldevices.rts -lrts.rts" \
     --enable-bgl \
     --prefix=${PREFIX} \
    CFLAGS="-O2" 
