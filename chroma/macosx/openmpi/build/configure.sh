#!/bin/bash

ARCH=openmpi
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION openmpi`

MPCC=mpicc
MPCXX=mpicxx

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -fargument-noalias-global -fopenmp -march=core2 -funroll-loops -fpeel-loops" CXXFLAGS="" \
   --enable-cpp-wilson-dslash --enable-openmp --enable-sse2 --enable-sse3 \
   --enable-testcase-runner=6n_mpirun_rsh  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC="${MPCC}"  CXX="${MPCXX}" \
   --enable-sse-scalarsite-bicgstab-kernels --host=x86_64-apple-darwin --build=none\
   --with-quda=/Users/bjoo/QCD/cuda/branches/quda-0.2-qmp \
   LDFLAGS="-L/usr/local/cuda/lib"
