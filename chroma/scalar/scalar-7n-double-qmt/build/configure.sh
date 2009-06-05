#!/bin/bash

ARCH=scalar-7n-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION amd`
${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=barcelona" \
	CXXFLAGS="" \
        --with-gmp=/usr CC=/home/bjoo/install_gcc4.3.0/bin/gcc CXX=/home/bjoo/install_gcc4.3.0/bin/g++  \
	--with-qmt=$QMT_PREFIX \
	--enable-ssed-clover \
	--enable-cpp-wilson-dslash \
	--enable-sse2 \
	--enable-generic-scalarsite-bicgstab-kernels


