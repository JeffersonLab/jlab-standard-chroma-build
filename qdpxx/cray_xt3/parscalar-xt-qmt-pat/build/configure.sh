#!/bin/bash

ARCH=xt
QDPDIR=../../..
ROOTDIR=../../../..
QMTDIR=${ROOTDIR}/qmt

. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-qmt-pat`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION xt-pat`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION xt-barcelona-pat`
LIBXML_PREFIX=`make_prefix ${ROOTDIR}/libxml2/PREFIX ${ROOTDIR}/libxml2/VERSION libxml2-pat`

pushd ${QDPDIR}/qdpxx ; aclocal; automake; autoconf; popd

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse3 CXXFLAGS="-O3 -g -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -ftree-vectorize -march=barcelona" CFLAGS="-std=c99 -O3 -g -fargument-noalias-global -funroll-all-loops -fpeel-loops -ftree-vectorize -march=barcelona" --enable-largefile  \
CC="cc" CXX="CC" --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux --with-libxml2=${LIBXML_PREFIX} --with-qmt=${QMT_PREFIX}
