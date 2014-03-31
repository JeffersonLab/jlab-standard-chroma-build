#!/bin/bash

ARCH=ib-9q
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

export PATH=/dist/gcc-4.6.3/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.6.3/lib64:/dist/gcc-4.6.3/lib:$LD_LIBRARY_PATH
MPI="/usr/mpi/gcc/mvapich2-1.8"
MPCC="$MPI/bin/mpicc"
MPCXX="$MPI/bin/mpicxx"

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 \
	CXXFLAGS="-O2 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++0x" \
	CFLAGS="-O2 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2 -std=gnu99" \
 	CXX="${MPCXX}" \
 	CC="${MPCC}"
