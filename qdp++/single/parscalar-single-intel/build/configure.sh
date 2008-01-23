#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-intel`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}-intel`

CC=/opt/intel/cce/10.0.023/bin/icc
CXX=/opt/intel/cce/10.0.023/bin/icpc

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/cc/9.1.043/lib

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} \
   --enable-parallel-arch=parscalar \
   CXXFLAGS="-O2 -finline-limit=50000  -fargument-noalias-global -march=pentium4" \
   CFLAGS="-O2 -march=pentium4" \
   LIBS="" \
   CXX=${CXX} CC=${CC}
