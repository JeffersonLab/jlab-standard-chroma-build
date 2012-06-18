#!/bin/bash

ARCH=xt3
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-finst`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION`_finst
LIBXML_PREFIX=`make_prefix ${ROOTDIR}/libxml2/PREFIX ${ROOTDIR}/libxml2/VERSION libxml2`_finst

module unload PrgEnv-pgi
module load PrgEnv-gnu
module unload gcc/3.2.3
module load gcc-catamount/3.3

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000 -msse2 -finstrument-functions" CFLAGS="-std=c99 -fargument-noalias-global -O2 -msse2 -finstrument-functions" --enable-largefile  \
CC="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-gcc" CXX="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-g++" --host=x86_64-unknown-linux-gnu --build=x86_64-suse-linux --with-libxml2=${LIBXML_PREFIX}

