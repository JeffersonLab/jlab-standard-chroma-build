#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION ib`

../../../gmp/configure --host=x86_64-unknown-linux --build=x86_64-suse-linux \
	CC="$HOME/gnu/bin/gcc" \
	CXX="$HOME/gnu/bin/g++" \
	CC_FOR_BUILD="$HOME/gnu/bin/gcc" \
     --prefix=${PREFIX} \
     --disable-shared \
    CFLAGS="-O3" 
