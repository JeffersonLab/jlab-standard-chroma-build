#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-double`
clean_dir ${PREFIX}

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 \
	CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
	CFLAGS="-std=c99 -fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops" \
	CXX=g++ CC=gcc \
        --enable-precision=double
