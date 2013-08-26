#!/bin/bash

ARCH=openmpi
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}
export PATH=/dist/gcc-4.6.3/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH
export MPI=/usr/mpi/gcc/openmpi-1.6.3
QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`
CC=${MPI}/bin/mpicc
CXX=${MPI}/bin/mpicxx

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-openmp --enable-sse2 --enable-db-lite \
	CXXFLAGS="-O2 -fopenmp -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++0x" \
	CFLAGS="-std=gnu99 -O2 -fopenmp -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2"  \
	CXX="${CXX}" \
	CC="${CC}" \
	--host=x86_64-linux-gnu --build=none --enable-precision=double
