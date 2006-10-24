#!/bin/bash

ARCH=ib-ofed1-ompi
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -msse2 -march=pentium4" CFLAGS="-O2" --enable-precision=double --disable-qmp-route --enable-slow-route
