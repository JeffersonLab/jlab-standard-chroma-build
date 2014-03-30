#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar-9q`
clean_dir ${PREFIX}

MYCC=gcc
MYCXX=g++

${ADATDIR}/adat/configure --prefix=${PREFIX} \
   CC=${MYCC} \
   CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=core2 -fopenmp" \
   CXX=${MYCXX} \
   CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=core2 -fopenmp -DUSE_OMP -std=c++0x" \
   LIBS="-lpthread" 
