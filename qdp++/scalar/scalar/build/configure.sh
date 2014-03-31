#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar`
clean_dir ${PREFIX}

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 CXX=${CXX} CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000 -msse2 -march=pentium4" CC=${CC} CFLAGS="-fargument-noalias-global -O2 -msse2 -std=c99"
