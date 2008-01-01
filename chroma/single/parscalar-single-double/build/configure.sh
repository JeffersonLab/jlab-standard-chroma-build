#!/bin/bash

ARCH=parscalar-single-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp

CC=gcc
CXX=g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
        CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron" \
        CXXFLAGS="" LIBS="-lgmp" \
        --enable-sse-wilson-dslash  --enable-cg-dwf=sse --with-gmp=/usr \
        CC=gcc CXX=g++

