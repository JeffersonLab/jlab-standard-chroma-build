#!/bin/bash
BASEARCH=parscalar-xt-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
GMPARCH=xt-pat

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
GMPDIR=${ROOTDIR}/gmp
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-qmt-pat`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}-qmt-pat`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}` 
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION xt-pat`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION xt-barcelona-pat`
echo $QDP_PREFIX
echo $GMP_PREFIX

pushd ${CHROMADIR}/chroma ; aclocal; automake; autoconf ; popd

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=x86_64-unknown-linux-gnu \
			     --build=x86_64-suse-linux \
			     --with-qdp=${QDP_PREFIX} \
			     CFLAGS="-g -O3 -march=barcelona" CXXFLAGS="" LIBS="" \
			     CC="cc" CXX="CC" \
	 --enable-sse-wilson-dslash \
	 --enable-craypat \
	 --without-gmp \
         --with-qmp=${QMP_PREFIX} \
	 --with-qmt=${QMT_PREFIX} \
	 --enable-ssed-clover
