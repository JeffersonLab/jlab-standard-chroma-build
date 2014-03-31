#!/bin/bash

ARCH=ib-7n
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

export MPICH_HOME=/usr/local/mvapich-0.9.9
${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 \
	CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -march=opteron -funroll-all-loops -fpeel-loops" \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron"  \
	CXX=${MPICH_HOME}/bin/mpicxx \
	CC=${MPICH_HOME}/bin/mpicc
