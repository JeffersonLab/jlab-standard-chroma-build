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

TOOLS=/share/home/00496/tg457586

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -funroll-all-loops -fpeel-loops -ftree-vectorize -fno-tree-vrp " CXXFLAGS="" LIBS="" \
   --enable-sse-wilson-dslash --with-gmp=$GMP_PREFIX --enable-testcase-runner=6n_mpirun_rsh  \
   --with-qmp=${QMP_PREFIX} \
CXX="mpicxx -CC=$TOOLS/install/gcc-4.2.3/bin/g++" \
CC="mpicc -cc=$TOOLS/install/gcc-4.2.3/bin/gcc"
