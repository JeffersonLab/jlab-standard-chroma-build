#!/bin/bash
BASEARCH=parscalar-xt3-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
GMPARCH=xt3

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
GMPDIR=${ROOTDIR}/gmp
QMPDIR=${ROOTDIR}/qmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}` 
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION `
echo $QDP_PREFIX
echo $GMP_PREFIX


${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=x86_64-unknown-linux-gnu \
			     --build=x86_64-suse-linux \
			     --with-qdp=${QDP_PREFIX} \
			     CFLAGS="-O3 -march=barcelona -mtune=barcelona" CXXFLAGS="" LIBS="" \
			     CC="cc" CXX="CC" \
	 --enable-sse-wilson-dslash \
	 --with-gmp=${GMP_PREFIX} \
         --enable-cg-dwf=sse \
         --with-qmp=${QMP_PREFIX}
