#!/bin/bash

# QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh

QMTDIR=${ROOTDIR}/qmt
QDPDIR=${ROOTDIR}/qdpxx
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-9q-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`
clean_dir ${PREFIX}

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 --with-qmt=${QMT_PREFIX} \
	CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops" \
	CFLAGS="-O3 -fargument-noalias-global -O3 -march=core2 -funroll-all-loops -fpeel-loops -std=c99" \
	CXX=g++ CC=gcc
