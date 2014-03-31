#!/bin/bash

ARCH=scalar-7n
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-omp`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-omp`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-g -O3 -fopenmp -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron" \
	CXXFLAGS="" \
        --enable-sse-wilson-dslash --enable-openmp --with-gmp=/usr CC=gcc CXX=g++



