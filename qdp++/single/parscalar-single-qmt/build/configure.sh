#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-qmt`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --enable-parallel-arch=parscalar --with-qmp=${QMP_PREFIX} \
        --enable-sse2 --enable-largefile --with-qmt=${QMT_PREFIX}  \
        CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
        CFLAGS="-std=c99 -fargument-noalias-global -O3 -march=opteron -funroll-all-loops -fpeel-loops" \
        CXX=g++ CC=gcc
