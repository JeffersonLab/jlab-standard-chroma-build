#!/bin/bash
BASEARCH=parscalar-bgp-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
BWDARCH=${BASEARCH}
GMPARCH=bgp
CLOVARCH=bgp-double

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

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=powerpc-bgp-linux \
			     --build=none \
			     --with-qdp=${QDP_PREFIX} \
			     --enable-testcase-runner=load_leveller \
			     CFLAGS="-O2" CXXFLAGS="" LIBS="" \
	 --with-bagel-wilson-dslash=${BWD_PREFIX} \
	 --enable-bagel-wilson-dslash-sloppy=yes \
	 --with-gmp=${GMP_PREFIX} \
         --with-bagel-clover=${CLOV_PREFIX} \
         CXX=/bgsys/drivers/ppcfloor/comm/bin/mpicxx \
         CC=/bgsys/drivers/ppcfloor/comm/bin/mpicc
