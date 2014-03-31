#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-7n`
clean_dir ${PREFIX}

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 \
	CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
	CFLAGS="-fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops" \
	CXX=g++ CC=gcc