#!/bin/bash

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION scalar-9g-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-9q-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
	CXXFLAGS="" \
        --enable-cpp-wilson-dslash --enable-sse2 CC=gcc CXX=g++  \
	--with-qmt=$QMT_PREFIX \
	--with-gmp=/usr LIBS="-lgmp" \
	--with-quda=/home/bjoo/Devel/QCD/quda-0.2 \
	--enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran -lgmp" --with-gmp=/usr \
	--enable-sse-scalarsite-bicgstab-kernels
#       --with-quda=/lustre/scratch/bjoo/quda-0.1

