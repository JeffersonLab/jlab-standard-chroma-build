#!/bin/bash

ARCH=parscalar-ib-7n
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-noavp`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
  CFLAGS="-O2 -msse -msse2 -march=opteron" \
  CXXFLAGS="-march=opteron" \
  LIBS="-lgmp" \
  --enable-sse-wilson-dslash --with-gmp=/usr \
  --enable-testcase-runner=6n_mpirun_rsh \
  CXX=g++  CC=gcc
