#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-9q`
clean_dir ${PREFIX}

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 \
	CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++11" \
	CFLAGS="-fargument-noalias-global -O3 -march=core2 -funroll-all-loops -fpeel-loops -std=gnu99" \
	CXX=g++ CC=gcc
