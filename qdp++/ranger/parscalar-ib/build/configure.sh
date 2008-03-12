#!/bin/bash

ARCH=ib-7n
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 -host=x86_64-linux-gnu --build=any \
	CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron" \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=opteron"  \
	CXX="mpicc -cc=$HOME/gnu/bin/g++" \
	CC="mpicc -cc=$HOME/gnu/bin/gcc"
