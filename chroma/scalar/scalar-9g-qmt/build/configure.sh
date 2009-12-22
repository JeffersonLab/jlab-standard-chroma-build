#!/bin/bash

ARCH=scalar-9q
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
	CXXFLAGS="" \
        --enable-cpp-wilson-dslash --enable-sse2 CC=gcc CXX=g++  \
	--with-qmt=$QMT_PREFIX \
	--with-gmp=/usr LIBS="-lgmp" \
	--with-quda=/home/bjoo/Devel/QCD/quda-0.2 \
	--enable-lapack=qdp
#	--enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran -lgmp" --with-gmp=/usr
#       --with-quda=/lustre/scratch/bjoo/quda-0.1
