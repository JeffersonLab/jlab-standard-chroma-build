#!/bin/bash

ARCH=ib-7n
QDPDIR=../../..
XMLDIR=../../../../libxml2
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
XMLPREF=`make_prefix ${XMLDIR}/PREFIX ${XMLDIR}/VERSION libxml2`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar \
	--enable-sse2 -host=x86_64-linux-gnu --build=any \
	CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -ftree-vectorize -fno-tree-vrp -march=opteron" \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -ftree-vectorize -fno-tree-vrp -march=opteron"  \
	CXX="mpicxx -CC=$HOME/install/gcc-4.2.3/bin/g++" \
	CC="mpicc -cc=$HOME/install/gcc-4.2.3/bin/gcc" \
	--with-libxml2=${XMLPREF}
