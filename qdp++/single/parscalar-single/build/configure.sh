#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --enable-parallel-arch=parscalar --with-qmp=${QMP_PREFIX} \
        --enable-sse2 --enable-largefile \
        CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops -std=c++0x" \
        CFLAGS="-fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops -std=c99" \
        CXX=g++ CC=gcc
