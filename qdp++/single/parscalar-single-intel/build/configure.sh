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
CXX=/opt/intel/cc/9.1.043/bin/icpc

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/cc/9.1.043/lib
${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar CXX=${CXX} CC=${CC} CXXFLAGS="-O2 -finline-limit=50000  -fargument-noalias-global -march=pentium4" CC=${CC} CFLAGS="-O2 -march=pentium4" LIBS=""
