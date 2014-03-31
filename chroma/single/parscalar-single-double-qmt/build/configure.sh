#!/bin/bash

ARCH=parscalar-single-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

CC=gcc
CXX=g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-qmt`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
        CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron" \
        CXXFLAGS="" --enable-testcase-runner=trivial_runner \
        --enable-sse-wilson-dslash --with-qmp=${QMP_PREFIX} --enable-cg-dwf=sse --with-gmp=/usr \
        CC=gcc CXX=g++ \
        LIBS="-lgmp" \
	--with-qmt=${QMT_PREFIX} \
	--enable-ssed-clover

#        --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"


