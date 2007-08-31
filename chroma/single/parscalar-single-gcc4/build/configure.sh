#!/bin/bash

ARCH=parscalar-single-gcc4
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single-gcc4`
CC=gcc
CXX=g++

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CC=${CC} CXX=${CXX} CFLAGS="-O3 -msse -msse2 -march=opteron" CXXFLAGS="" --enable-sse-wilson-dslash  --enable-cg-dwf=sse  --with-gmp=/usr  --with-qmp=${QMP_PREFIX}
