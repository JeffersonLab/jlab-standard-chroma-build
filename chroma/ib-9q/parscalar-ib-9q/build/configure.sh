#!/bin/bash

ARCH=parscalar-ib-9q
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp

pushd ${CHROMADIR}/chroma
autoreconf -f
popd

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-9q`

MPI="/usr/mpi/gcc/mvapich2-1.8"
MPCC="$MPI/bin/mpicc"
MPCXX="$MPI/bin/mpicxx"

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="" CXXFLAGS="" \
   --enable-cpp-wilson-dslash \
   --enable-sse2 \
   --enable-testcase-runner=9q_mpirun_rsh  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC="${MPCC}"  CXX="${MPCXX}" \
   --enable-opt-eigcg --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp" \
   --with-gmp=/usr \
   --enable-sse-scalarsite-bicgstab-kernels
#   --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"
