#!/bin/bash

ARCH=parscalar-gigE
QDPDIR=../../..
ROOTDIR=../../../..

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}


${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=/usr/local/qmp/mvia --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CFLAGS="-O2"
