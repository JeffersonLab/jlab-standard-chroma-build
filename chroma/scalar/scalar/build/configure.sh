#!/bin/bash

ARCH=scalar
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

CC=gcc
CXX=g++

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CFLAGS="-fargument-noalias-global -O3 -fno-tree-vrp -march=nocona" CXXFLAGS="" LIBS="-lgmp" --with-gmp=/usr CC=${CC} CXX=${CXX} --enable-sse-wilson-dslash
