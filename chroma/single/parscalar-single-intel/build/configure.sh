#!/bin/bash

ARCH=parscalar-single-intel
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CC=/opt/intel/cc/9.0/bin/icc CFLAGS="-O2 -fast -msse -msse2 -march=pentium4" CXX=/opt/intel/cc/9.0/bin/icc CXXFLAGS="" LIBS="-lgmp" --with-gmp=/usr  LIBS="-static"
