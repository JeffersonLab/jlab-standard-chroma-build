#!/bin/bash
BASEARCH=parscalar-bgl-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
BWDARCH=${BASEARCH}
GMPARCH=bgl

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
BWDDIR=${ROOTDIR}/bagel_wilson_dslash
GMPDIR=${ROOTDIR}/gmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}`
BWD_PREFIX=`make_prefix ${BWDDIR}/PREFIX ${BWDDIR}/VERSION ${BWDARCH}`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}` 
echo $QDP_PREFIX
echo $GMP_PREFIX

echo ${BWD_PREFIX}
export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=powerpc-bgl-blrts-gnu \
			     --build=none \
			     --with-qdp=${QDP_PREFIX} \
			     --enable-testcase-runner=cobalt \
			     CFLAGS="-O2" CXXFLAGS="" LIBS="" \
	 --with-bagel-wilson-dslash=${BWD_PREFIX} \
	 --with-gmp=${GMP_PREFIX}
