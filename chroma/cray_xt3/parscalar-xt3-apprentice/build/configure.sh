#!/bin/bash
BASEARCH=parscalar-xt3
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
GMPARCH=xt3

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
GMPDIR=${ROOTDIR}/gmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-finst`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}-finst`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}`_finst
echo $QDP_PREFIX
echo $GMP_PREFIX

module unload PrgEnv-pgi
module load PrgEnv-gnu
module unload gcc/3.2.3
module load gcc-catamount/3.3

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=x86_64-unknown-linux-gnu \
			     --build=x86_64-suse-linux \
			     --with-qdp=${QDP_PREFIX} \
			     CFLAGS="-O2 -finstrument-functions" CXXFLAGS="-finstrument-functions" LIBS="" \
			     CC="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-gcc" CXX="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-g++" \
	 --enable-sse-wilson-dslash \
	 --with-gmp=${GMP_PREFIX}
