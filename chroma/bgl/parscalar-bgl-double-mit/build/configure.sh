#!/bin/bash
BASEARCH=parscalar-bgl-double
ARCH=${BASEARCH}-mit
QDPARCH=${BASEARCH}
BWDARCH=${BASEARCH}
QMPARCH=bgl
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
BWDDIR=${ROOTDIR}/bagel_wilson_dslash

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${QDPARCH}`
BWD_PREFIX=`make_prefix ${BWDDIR}/PREFIX ${BWDDIR}/VERSION ${BWDARCH}`
QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${QMPARCH}`
echo $QDP_PREFIX

echo ${BWD_PREFIX}
export PATH=/bgl/BlueLight/ppcfloor/blrts-gnu/bin:$PATH

${CHROMADIR}/chroma/configure --prefix=${PREFIX} \
			     --host=powerpc-bgl-blrts-gnu \
			     --build=none \
			     --with-qdp=${QDP_PREFIX} \
			     CXXFLAGS="" LIBS="" \
			     --enable-cg-dwf=bluelight \
			     --with-qmp=${QMP_PREFIX} \
			     CC=/opt/MITBGL/bin/bgl-gcc \
			     CFLAGS="-O3"

