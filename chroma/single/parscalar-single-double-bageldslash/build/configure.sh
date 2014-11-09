#!/bin/bash

ARCH=parscalar-single-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp

pushd ${CHROMADIR}/chroma
autoreconf -f
popd

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-bageldslash`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}-bagelqdp`
BAGELDSLASHDIR=${ROOTDIR}/bagel_wilson_dslash
BAGELDSLASH_PREFIX=`make_prefix ${BAGELDSLASHDIR}/PREFIX ${BAGELDSLASHDIR}/VERSION ${ARCH}` 

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O2 -msse -msse2 -march=pentium4" \
   CXXFLAGS="" LIBS="-lgmp" --with-gmp=/usr  --enable-testcase-runner=trivial_runner  \
   --with-qmp=${QMP_PREFIX} --with-bagel-wilson-dslash=${BAGELDSLASH_PREFIX} 
   CC=${CC} CXX=${CXX}
