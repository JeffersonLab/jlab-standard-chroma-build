#!/bin/bash

ARCH=parscalar-ib-9q-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-9q`

CC="mpicc -cc=gcc"
CXX="mpiCC -cxx=g++"

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -march=opteron -funroll-loops -fpeel-loops" CXXFLAGS="" \
   --enable-sse-wilson-dslash  --with-gmp=/usr  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC="${CC}"  CXX="${CXX}" \
   --enable-ssed-clover

#   --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"