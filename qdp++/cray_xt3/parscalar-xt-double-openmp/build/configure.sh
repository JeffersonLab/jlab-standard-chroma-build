#!/bin/bash

ARCH=xt-double
QDPDIR=../../..
ROOTDIR=../../../..

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-omp`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION xt-pat`
LIBXML_PREFIX=`make_prefix ${ROOTDIR}/libxml2/PREFIX ${ROOTDIR}/libxml2/VERSION libxml2`

echo $QMP_PREFIX
${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse3 CXXFLAGS="-fopenmp -O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=barcelona" CFLAGS="-std=c99 -fopenmp -O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -ftree-vectorize -march=barcelona" --enable-largefile  \
CC="cc" CXX="CC" --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux --with-libxml2=${LIBXML_PREFIX} --enable-precision=double --enable-openmp
