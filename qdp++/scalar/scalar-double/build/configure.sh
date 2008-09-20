#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-double`
clean_dir ${PREFIX}

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 --enable-db-lite \
	CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
	CFLAGS="-fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops" \
	CXX=g++ CC=gcc \
        --enable-precision=double
