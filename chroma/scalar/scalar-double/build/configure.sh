#!/bin/bash

ARCH=scalar-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

CC=gcc
CXX=g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CFLAGS="-O3 -msse -msse2 -march=nocona" CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash  --with-gmp=/usr CC=${CC} CXX=${CXX}
