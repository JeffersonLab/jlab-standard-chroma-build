#!/bin/bash

ARCH=parscalar-single
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CC=${CC} CFLAGS="-O3 -msse -msse2 -march=pentium4" CXX=${CXX} CXXFLAGS="" --enable-sse-wilson-dslash  --enable-cg-dwf=sse --with-gmp=/usr --with-qmp=${QMP_PREFIX}
