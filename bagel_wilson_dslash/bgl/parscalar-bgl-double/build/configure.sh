#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION parscalar-bgl-double`
clean_dir ${PREFIX}

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`
QMP=`make_prefix ../../../../qmp/PREFIX ../../../../qmp/VERSION bgl`

#
# Hack until we have with-qmp as standard
#
#


export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

QMPSCRIPT=${QMP}/bin/qmp-config
DSLASH_CXXFLAGS=`${QMPSCRIPT} --cflags`
DSLASH_LDFLAGS=`${QMPSCRIPT} --ldflags`
DSLASH_LIBS=`${QMPSCRIPT} --libs`

 ../../../bagel_wilson_dslash/configure --prefix=${PREFIX} \
    --enable-target-cpu=bgl \
    --enable-comms=qmp \
    --enable-allocator=malloc \
    --enable-precision=double \
    --with-bagel=${BAGEL}  \
    --with-qmp=${QMP} \
    --host=powerpg-bgl-blrts-gnu \
    CXX="powerpc-bgl-blrts-gnu-g++" \
    CC="powerpc-bgl-blrts-gnu-gcc" \
    AS="powerpc-bgl-blrts-gnu-gcc"
