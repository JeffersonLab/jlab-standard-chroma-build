#!/bin/bash

QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION scalar-7n`
clean_dir ${PREFIX}

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --enable-parallel-arch=scalar --enable-sse2 CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000 -msse2 -march=opteron" CFLAGS="-fargument-noalias-global -O2 -msse -msse2 -march=opteron" CXX=g++34 CC=gcc34
