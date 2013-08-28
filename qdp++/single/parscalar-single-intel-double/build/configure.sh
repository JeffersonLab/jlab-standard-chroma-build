#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-intel`-double
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}-intel`

CC=icc
CXX=icpc

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/cc/9.1.043/lib

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} \
   --enable-precision=double \
   --enable-parallel-arch=parscalar \
   --enable-sse2 --enable-sse3  \
   --enable-openmp \
   CXXFLAGS="-openmp -O2 -finline-limit=50000  -fargument-noalias-global -xhost -std=c++0x" \
   CFLAGS="-openmp -O2 -xhost -std=gnu99" \
   LIBS="" \
   CXX=${CXX} CC=${CC}
