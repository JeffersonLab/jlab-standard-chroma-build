#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`

gcc --version

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=parscalar --with-qmp=${QMP_PREFIX} \
        --enable-sse2 --enable-largefile \
        CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++11" \
        CFLAGS="-fargument-noalias-global -O3 -march=core2 -funroll-all-loops -fpeel-loops -std=gnu99" \
        CXX=g++ CC=gcc
