#!/bin/bash

ARCH=parscalar-gigE
QDPDIR=../../..
ROOTDIR=../../../..

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

CXX=/dist/gcc-4.1.1/bin/g++
CC=/dist/gcc-4.1.1/bin/gcc

${QDPDIR}/qdp++/configure \
   --prefix=${PREFIX} \
   --with-qmp=/usr/local/qmp/mvia  \
   --enable-parallel-arch=parscalar \
   --enable-sse2 \
   --enable-largefile \
   CXXFLAGS="-O2 -finline-limit=50000 -msse -msse2 -march=pentium4" \
   CFLAGS="-O3 -msse -msse2 -march=pentium4" \
   CXX=${CXX} CC=${CC}
