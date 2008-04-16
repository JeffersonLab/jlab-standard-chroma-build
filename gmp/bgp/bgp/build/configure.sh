#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgp`

export PATH=/bgsys/drivers/ppcfloor/gnu-linux/bin:$PATH

../../../gmp/configure --host=powerpc-gnu-linux --build=none \
	CC=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-gcc \
	CXX=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-g++ \
	AR=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-ar \
	RANLIB=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-ranlib \
	STRIP=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-strip \
	CC_FOR_BUILD=gcc \
     --prefix=${PREFIX} \
    CFLAGS="-O2" 
