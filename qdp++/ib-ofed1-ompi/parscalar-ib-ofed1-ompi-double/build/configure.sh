#!/bin/bash

ARCH=ib-ofed1-ompi
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

${QDPDIR}/qdp++/configure \
   --prefix=${PREFIX} \
   --with-qmp=${QMP_PREFIX} \
   --enable-parallel-arch=parscalar \
   --enable-sse2 \
   --enable-largefile \
   --enable-precision=double \
   --disable-qmp-route \
   --enable-slow-route \
   CXXFLAGS="-O2 -finline-limit=50000 -msse -msse2" \
   CFLAGS="-O3 -msse -msse2 -std=c99" \
   CXX=${CXX} CC=${CC}
