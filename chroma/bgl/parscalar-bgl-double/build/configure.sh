#!/bin/bash
BASEARCH=parscalar-bgl-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
BWDARCH=${BASEARCH}
GMPARCH=bgl
CLOVARCH=bgl-double

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
BWDDIR=${ROOTDIR}/bagel_wilson_dslash
GMPDIR=${ROOTDIR}/gmp
CLOVDIR=${ROOTDIR}/bagel_clover
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-sloppy`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}`
BWD_PREFIX=`make_prefix ${BWDDIR}/PREFIX ${BWDDIR}/VERSION ${BWDARCH}`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ${GMPARCH}` 
CLOV_PREFIX=`make_prefix ${CLOVDIR}/PREFIX ${CLOVDIR}/VERSION ${CLOVARCH}`
echo $QDP_PREFIX
echo $GMP_PREFIX

echo ${BWD_PREFIX}
echo ${CLOV_PREFIX}
export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=powerpc-bgl-blrts-gnu \
			     --build=none \
			     --with-qdp=${QDP_PREFIX} \
			     --enable-testcase-runner=load_leveller \
			     CFLAGS="-O2" CXXFLAGS="" LIBS="" \
	 --with-bagel-wilson-dslash=${BWD_PREFIX} \
	 --enable-bagel-wilson-dslash-sloppy=yes \
	 --with-gmp=${GMP_PREFIX} \
         --with-bagel-clover=${CLOV_PREFIX}
