#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bgl`

export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

../../../gmp/configure --host=powerpc-none-none --build=none \
	CC=powerpc-bgl-blrts-gnu-gcc \
	CXX=powerpc-bgl-blrts-gno-g++ \
	AR=powerpc-bgl-blrts-gnu-ar \
	RANLIB=powerpc-bgl-blrts-gnu-ranlib \
	STRIP=powerpc-bgl-blrts-gnu-strip \
	CC_FOR_BUILD=gcc \
     --prefix=${PREFIX} \
    CFLAGS="-O2" 
