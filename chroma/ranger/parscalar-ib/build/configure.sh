#!/bin/bash

ARCH=parscalar-ib-7n
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
GMPDIR=${ROOTDIR}/gmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-7n`
GMP_PREFIX=`make_prefix ${GMPDIR}/PREFIX ${GMPDIR}/VERSION ib`
${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -funroll-loops -march=opteron" CXXFLAGS="" LIBS="" \
   --enable-sse-wilson-dslash --enable-cg-dwf=sse --with-gmp=$GMP_PREFIX --enable-testcase-runner=6n_mpirun_rsh  \
   --with-qmp=${QMP_PREFIX} CC="mpicc -cc=$HOME/gnu/bin/gcc"  CXX="mpicc -cc=$HOME/gnu/bin/g++"
