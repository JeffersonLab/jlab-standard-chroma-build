#!/bin/bash

ARCH=ib-9q
QDPDIR=../../..
ROOTDIR=../../../..

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

MPI="/usr/mpi/gcc/mvapich2-1.8"
MPCC="$MPI/bin/mpicc"
MPCXX="$MPI/bin/mpicxx"

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 --enable-precision=double \
	CXXFLAGS="-O2 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops -std=c++11 " \
	CFLAGS="-std=gnu99 -O2 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2"  \
	CXX="${MPCXX}" \
	CC="${MPCC}"
