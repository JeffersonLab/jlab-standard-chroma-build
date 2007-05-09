#!/bin/bash

ARCH=ib-7n
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000 -msse -msse2 -march=opteron"  CFLAGS="-fargument-noalias-global -O2 -msse -msse2 -march=opteron"  CXX=g++34 CC=gcc34 --enable-precision=double
