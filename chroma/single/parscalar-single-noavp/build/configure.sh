#!/bin/bash

ARCH=parscalar-single
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-noavp`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
  CFLAGS="-O2 -msse -msse2 -march=pentium4" \
  CXXFLAGS="" LIBS="-lgmp" \
  --enable-sse-wilson-dslash  --with-gmp=/usr  --enable-testcase-runner=trivial_runner \
  CC=${CC} CXX=${CXX}
