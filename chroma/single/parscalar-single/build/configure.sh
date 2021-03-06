#!/bin/bash

ARCH=parscalar-single
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp

pushd ${CHROMADIR}/chroma
autoreconf -f
popd

CC=gcc
CXX=g++

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single`

GMP=/dist/gmp-6.0.0

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
        CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
        CXXFLAGS="" --enable-testcase-runner=trivial_runner \
        --enable-sse-wilson-dslash --with-qmp=${QMP_PREFIX} --enable-cg-dwf=sse --with-gmp=$GMP \
        CC=$CC CXX=$CXX \
        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran $GMP/lib/libgmp.a"

