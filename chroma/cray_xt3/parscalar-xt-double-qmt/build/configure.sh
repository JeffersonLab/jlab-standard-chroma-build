#!/bin/bash
BASEARCH=parscalar-xt-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
GMPARCH=xt3

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
GMPDIR=${ROOTDIR}/gmp
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-qmt`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}-qmt`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}` 
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION `
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION xt-barcelona`
echo $QDP_PREFIX
echo $GMP_PREFIX


${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=x86_64-unknown-linux-gnu \
			     --build=x86_64-suse-linux \
			     --with-qdp=${QDP_PREFIX} \
			     CFLAGS="-O3 -march=barcelona" CXXFLAGS="" LIBS="" \
			     CC="cc" CXX="CC" \
	 --enable-sse-wilson-dslash \
	 --with-gmp=${GMP_PREFIX} \
         --with-qmp=${QMP_PREFIX} \
	 --with-qmt=${QMT_PREFIX} \
	 --enable-ssed-clover
