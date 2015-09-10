#!/bin/bash

ARCH=openmpi
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp

pushd ${CHROMADIR}/chroma
autoreconf -f
popd


. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION openmpi`

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

MPI=/usr/mpi/gcc/openmpi-1.6.3
MPCC=$MPI/bin/mpicc
MPCXX=$MPI/bin/mpiCC

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-std=gnu99 -O2 -fargument-noalias-global -fopenmp -march=core2 -funroll-loops -fpeel-loops" CXXFLAGS="-fopenmp" \
   --enable-cpp-wilson-dslash --enable-openmp --enable-sse2 --enable-sse3 \
   --enable-testcase-runner=6n_mpirun_rsh  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC="${MPCC}"  CXX="${MPCXX}" \
   --enable-sse-scalarsite-bicgstab-kernels --host=x86_64-linux-gnu --build=none
