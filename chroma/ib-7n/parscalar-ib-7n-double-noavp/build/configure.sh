#!/bin/bash

ARCH=parscalar-ib-7n-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}-noavp`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-7n`

MPICH_HOME=/usr/local/mvapich-0.9.9
CC=${MPICH_HOME}/bin/mpicc
CXX=${MPICH_HOME}/bin/mpicxx

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
  CFLAGS="-O2 -msse -msse2 -march=opteron -m64" \
  CXXFLAGS="-march=opteron -m64" \
  --enable-sse-wilson-dslash --with-gmp=/usr --enable-testcase-runner=6n_mpirun_rsh \
  --with-qmp=${QMP_PREFIX} \
  LIBS="-lgmp" CC=${CC} CXX=${CXX}

#  --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"

