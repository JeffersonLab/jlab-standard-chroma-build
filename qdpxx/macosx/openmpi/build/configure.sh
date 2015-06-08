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

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`
CC="mpicc"
CXX="mpicxx"

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-openmp --enable-sse2 \
	CXXFLAGS="-O3 -fopenmp -fargument-noalias-global -finline-limit=50000 -march=core2" \
	CFLAGS="-std=c99 -O3 -fopenmp -fargument-noalias-global -march=core2"  \
	CXX="${CXX}" \
	CC="${CC}" \
	--host=x86_64-apple-darwin --build=none
