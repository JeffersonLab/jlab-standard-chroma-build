#!/bin/bash

ARCH=scalar-7n
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CFLAGS="-O2 -msse -msse2 -march=opteron -m64" CXXFLAGS="-march=opteron -m64" LIBS="-lgmp" --enable-sse-wilson-dslash --with-gmp=/usr CC=gcc34 CXX=g++34 

