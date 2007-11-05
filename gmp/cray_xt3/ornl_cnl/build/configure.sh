#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION xt-cnl`

../../../gmp/configure --host=x86_64-unknown-linux --build=x86_64-suse-linux \
	CC="cc" \
	CXX="CC" \
	CFLAGS="-O3 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=opteron -mtune=opteron" \
	CXXFLAGS="-O3 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=p[teron -mtune=opteron" \
	CC_FOR_BUILD=gcc \
     --prefix=${PREFIX} \
     --disable-shared
