#!/bin/bash

ARCH=parscalar-ib-7n
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-7n`

export MPICH_HOME=/usr/local/mvapich-0.9.9
${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -march=opteron -funroll-loops -fpeel-loops" CXXFLAGS="" LIBS="" \
   --enable-sse-wilson-dslash  --with-gmp=/usr --enable-testcase-runner=6n_mpirun_rsh  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC=${MPICH_HOME}/bin/mpicc  CXX=${MPICH_HOME}/bin/mpicxx
