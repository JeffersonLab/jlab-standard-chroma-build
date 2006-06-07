#! /bin/bash
. ../../../../functions.sh

PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgl-double`

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`

clean_dir ${PREFIX}

export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

../../../bagel_qdp/configure --prefix=${PREFIX} \
    --enable-target-cpu=bgl \
    --enable-precision=double \
    --with-bagel=${BAGEL} \
    --host=powerpc-bgl-blrts-gnu \
    CFLAGS="-O2" \
    CXXFLAGS="-O2" \
    ASFLAGS="" \
    LIBS="" \
    CXX="powerpc-bgl-blrts-gnu-g++"

