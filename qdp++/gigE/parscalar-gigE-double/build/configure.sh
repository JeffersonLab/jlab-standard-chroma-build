#!/bin/bash

ARCH=parscalar-gigE-double
QDPDIR=../../..
ROOTDIR=../../../..

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=/usr/local/qmp/mvia --enable-precision=double --enable-parallel-arch=parscalar --enable-sse2 CXX=${CXX} CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CC=${CC} CFLAGS="-O3 -msse -msse2 -march=pentium4"
