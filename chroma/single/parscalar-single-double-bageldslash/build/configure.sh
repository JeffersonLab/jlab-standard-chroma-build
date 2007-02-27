#!/bin/bash

ARCH=parscalar-single-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-bageldslash`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-bagelqdp`
BAGELDSLASHDIR=${ROOTDIR}/bagel_wilson_dslash
BAGELDSLASH_PREFIX=`make_prefix ${BAGELDSLASHDIR}/PREFIX ${BAGELDSLASHDIR}/VERSION ${ARCH}` 

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} CFLAGS="-O2 -msse -msse2 -march=pentium4" CXXFLAGS="" LIBS="-lgmp" --with-gmp=/usr --with-bagel-wilson-dslash=${BAGELDSLASH_PREFIX}