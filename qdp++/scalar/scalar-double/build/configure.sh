#!/bin/sh

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-double`
clean_dir ${PREFIX}

${QDPDIR}/qdp++/configure --prefix=${PREFX} --enable-parallel-arch=scalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CFLAGS="-O2" --enable-precision=double
