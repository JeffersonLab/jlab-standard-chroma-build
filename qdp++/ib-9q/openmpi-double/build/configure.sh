#!/bin/bash

ARCH=openmpi
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`
QMT_PREFIX=`make_prefix ${ROOTDIR}/qmt/PREFIX ${ROOTDIR}/qmt/VERSION intel`
CC="/usr/mpi/gcc/openmpi-1.3.2/bin/mpicc"
CXX="/usr/mpi/gcc/openmpi-1.3.2/bin/mpiCC"

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-openmp --enable-sse2 --enable-db-lite \
	CXXFLAGS="-O3 -fopenmp -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops" \
	CFLAGS="-O3 -fopenmp -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2"  \
	CXX="${CXX}" \
	CC="${CC}" \
	--host=x86_64-linux-gnu --build=none --enable-precision=double
