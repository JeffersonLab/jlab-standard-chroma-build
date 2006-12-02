#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-intel`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}-intel`
CC=/opt/intel/cc/9.1.043/bin/icc

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse2 CXX=${CC} CXXFLAGS="-O2 -fast -finline-functions -fno-fnalias -fargument-noalias-global -ftemplate-depth-1000 -msse2 -march=pentium4" CC=${CC} CFLAGS="-O2" LIBS="-static"
