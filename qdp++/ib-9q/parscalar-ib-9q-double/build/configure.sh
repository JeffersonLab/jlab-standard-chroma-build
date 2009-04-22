#!/bin/bash

ARCH=ib-9q
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

MPCC="/usr/bin/mpicc -cc=gcc"
MPCXX="/usr/bin/mpiCC"

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 --enable-db-lite --enable-precision=double \
	CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -march=core2 -funroll-all-loops -fpeel-loops" \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2"  \
	CXX="${MPCXX}" \
	CC="${MPCC}"
