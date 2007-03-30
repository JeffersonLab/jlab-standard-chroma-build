#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION xt3`

module unload PrgEnv-pgi
module load PrgEnv-gnu
module unload gcc/3.2.3
module load gcc-catamount/3.3

../../../gmp/configure --host=x86_64-unknown-linux --build=x86_64-suse-linux \
	CC="cc -target=catamount" \
	CXX="CC -target=catamount" \
	CC_FOR_BUILD=gcc \
     --prefix=${PREFIX} \
     --disable-shared \
    CFLAGS="-O2" 
