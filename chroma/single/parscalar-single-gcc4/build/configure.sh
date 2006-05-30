#!/bin/bash

ARCH=parscalar-single-gcc4
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CC=gcc4 CFLAGS="-O2 -msse -msse2 -march=pentium4" CXX=g++4 CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash  --enable-sse-dwf-cg --with-gmp=/usr 
