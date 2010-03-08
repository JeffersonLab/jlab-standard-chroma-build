#!/bin/bash

ARCH=parscalar-ib-9q
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdp++
QMPDIR=${ROOTDIR}/qmp
. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ib-9q`

#CC="/usr/mpi/gcc/mvapich-1.1.0/bin/mpicc -cc=gcc" 
#CXX="/usr/mpi/gcc/mvapich-1.1.0/bin/mpiCC -cc=g++" 

MPCC=/usr/local/mvapich-1.1/bin/mpicc
MPCXX=/usr/local/mvapich-1.1/bin/mpiCC

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
   CFLAGS="-O3 -march=opteron -funroll-loops -fpeel-loops" CXXFLAGS="" \
   --enable-sse-wilson-dslash \
   --enable-testcase-runner=9q_mpirun_rsh  \
   --enable-cg-dwf=sse --with-qmp=${QMP_PREFIX} CC="${MPCC}"  CXX="${MPCXX}"

#   LDFLAGS="-L/usr/mpi/gcc/mvapich-1.1.0/lib -L/usr/mpi/gcc/mvapich-1.1.0/lib/shared"

#   --enable-opt-eigcg --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp" 
#   --with-gmp=/usr 
#   --enable-lapack=lapack LIBS="-llapack -lblas -lgfortran -lgmp"
