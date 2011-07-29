#!/bin/bash

ARCH=parscalar-ib-9q-qmt
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-9q`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`

MPI="/usr/mpi/gcc/mvapich2-1.6"
MPCC="$MPI/bin/mpicc"
MPCXX="$MPI/bin/mpicxx"

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -march=core2 -funroll-loops -fpeel-loops" CXXFLAGS="" \
   --enable-sse-wilson-dslash  --with-gmp=/usr --enable-testcase-runner=9q_mpirun_rsh  \
   --with-qmt=${QMT_PREFIX} \
   --with-qmp=${QMP_PREFIX} CC="${CC}"  CXX="${CXX}" \
   --enable-opt-eigcg --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp" 

#   --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"
