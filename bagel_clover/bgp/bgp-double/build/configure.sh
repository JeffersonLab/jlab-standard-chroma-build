#! /bin/bash
. ../../../../functions.sh

PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgp-double`

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`

clean_dir ${PREFIX}


../../../bagel_clover/configure --prefix=${PREFIX} \
    --enable-target-cpu=bgl \
    --enable-precision=double \
    --with-bagel=${BAGEL} \
    --host=powerpc-bgl-blrts-gnu \
    --build=none \
    CFLAGS="-O2" \
    CXXFLAGS="-O2" \
    ASFLAGS="" \
    LIBS="" \
    CXX="/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-g++" \
    CC="/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-gcc" \
    AS="/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-gcc"
