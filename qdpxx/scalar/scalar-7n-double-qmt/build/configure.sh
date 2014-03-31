#!/bin/bash

# QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

QMTDIR=${ROOTDIR}/qmt
QDPDIR=${ROOTDIR}/qdpxx
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-7n-double-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`
clean_dir ${PREFIX}

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 --enable-precision=double --with-qmt=${QMT_PREFIX} \
	CXXFLAGS="-g -fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
	CFLAGS="-g -fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops" \
	CXX=g++ CC=gcc