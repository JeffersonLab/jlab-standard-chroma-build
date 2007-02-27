#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-sse2 --enable-largefile --enable-parallel-arch=parscalar CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000 -msse2 -march=pentium4" CFLAGS=" -fargument-noalias-global -O2 -msse2" 
