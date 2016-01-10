#!/bin/bash

ARCH=openmpi
QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`
MPI=/usr/mpi/gcc/openmpi-1.4.3
#MPI=/usr/mpi/gcc/openmpi-1.6.3
CC="$MPI/bin/mpicc"
CXX="$MPI/bin/mpiCC"

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-openmp --enable-sse2 \
	CXXFLAGS="-O2 -fopenmp -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++11 " \
	CFLAGS="-std=gnu99 -O2 -fopenmp -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2"  \
	CXX="${CXX}" \
	CC="${CC}" \
	--host=x86_64-linux-gnu --build=none
