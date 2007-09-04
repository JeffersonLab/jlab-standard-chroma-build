#!/bin/bash

ARCH=xt3
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION`
LIBXML_PREFIX=`make_prefix ${ROOTDIR}/libxml2/PREFIX ${ROOTDIR}/libxml2/VERSION libxml2`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-fargument-noalias-global -O3 -finline-limit=50000 -msse -msse2 -march=opteron" CFLAGS="-fargument-noalias-global -O3 -msse -msse2 -march=opteron" --enable-largefile  \
CC="cc" CXX="CC" --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux --with-libxml2=${LIBXML_PREFIX}
