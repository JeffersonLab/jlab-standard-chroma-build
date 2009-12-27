#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-9q`
clean_dir ${PREFIX}

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 \
	CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops" \
	CFLAGS="-fargument-noalias-global -O3 -march=core2 -funroll-all-loops -fpeel-loops" \
	CXX=g++ CC=gcc
