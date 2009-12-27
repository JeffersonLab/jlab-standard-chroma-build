#!/bin/bash

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION scalar-9q-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-9q-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`
${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-g -O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
	CXXFLAGS="" \
        --enable-sse-wilson-dslash --with-gmp=/usr CC=gcc CXX=g++  \
	--with-qmt=$QMT_PREFIX \
        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran -lgmp"


