#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION xt3`

../../../gmp/configure --host=x86_64-unknown-linux --build=x86_64-suse-linux \
	CC="cc" \
	CXX="CC" \
	CC_FOR_BUILD=gcc \
     --prefix=${PREFIX} \
     --disable-shared \
    CFLAGS="-O2 -msse -msse2 -march=opteron" 
