#!/bin/bash
BASEARCH=parscalar-bgl-double
ARCH=${BASEARCH}
QDPARCH=${BASEARCH}
BWDARCH=${BASEARCH}

CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
BWDDIR=${ROOTDIR}/bagel_wilson_dslash

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}`
BWD_PREFIX=`make_prefix ${BWDDIR}/PREFIX ${BWDDIR}/VERSION ${BWDARCH}`
echo $QDP_PREFIX

echo ${BWD_PREFIX}
export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=powerpg-bgl-blrts-gnu \
			     --build=none \
			     --with-qdp=${QDP_PREFIX} \
			     CFLAGS="-O2" CXXFLAGS="" LIBS="" --with-bagel-wilson-dslash=${BWD_PREFIX}
