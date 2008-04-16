#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION parscalar-bgp-double`
clean_dir ${PREFIX}

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`
QMP=`make_prefix ../../../../qmp/PREFIX ../../../../qmp/VERSION bgp`

#
# Hack until we have with-qmp as standard
#
#



QMPSCRIPT=${QMP}/bin/qmp-config
DSLASH_CXXFLAGS=`${QMPSCRIPT} --cflags`
DSLASH_LDFLAGS=`${QMPSCRIPT} --ldflags`
DSLASH_LIBS=`${QMPSCRIPT} --libs`

 ../../../bagel_wilson_dslash/configure --prefix=${PREFIX} \
    --enable-target-cpu=bgl \
    --enable-comms=qmp \
    --enable-allocator=memalign \
    --enable-precision=double \
    --enable-swoa \
    --with-bagel=${BAGEL}  \
    --with-qmp=${QMP} \
    --host=powerpc-bgp-linux \
    --build=none \
    CXXFLAGS="-fpermissive" \
    CXX="/bgsys/drivers/ppcfloor/comm/bin/mpicxx" \
    CC="/bgsys/drivers/ppcfloor/comm/bin/mpicc" \
    AS="/bgsys/drivers/ppcfloor/comm/bin/gcc"
