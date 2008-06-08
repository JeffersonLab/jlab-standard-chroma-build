#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib`

TOOLS=/share/home/00496/tg457586


../../../gmp/configure --host=x86_64-unknown-linux --build=x86_64-suse-linux \
	CC="mpicc -cc=$TOOLS/install/gcc-4.2.3/bin/gcc" \
	CXX="mpiCC -CC=$TOOLS/install/gcc-4.2.3/bin/g++" \
	CC_FOR_BUILD="gcc" \
     --prefix=${PREFIX} \
     --disable-shared \
    CFLAGS="-O3 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=opteron"   CXXFLAGS="-03  -funroll-all-loops -fpeel-loops -ftree-vectorize -march=opteron "

