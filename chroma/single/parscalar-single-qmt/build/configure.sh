#!/bin/bash

ARCH=parscalar-single
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

pushd ${CHROMADIR}/chroma
autoreconf -f
popd


CC=gcc
CXX=g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
        CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron" \
        CXXFLAGS="" --enable-testcase-runner=trivial_runner \
        --enable-sse-wilson-dslash --with-qmp=${QMP_PREFIX} --enable-cg-dwf=sse --with-gmp=/usr \
        CC=$CC CXX=$CXX \
        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran -lgmp" \
	--with-qmt=${QMTDIR}

