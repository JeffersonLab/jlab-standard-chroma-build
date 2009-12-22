#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

CC=gcc
CXX=g++

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar-9q`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} \
   CC=$CC \
   CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=core2 -fopenmp" \
   CXX=$CXX \
   CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=core2 -fopenmp -DUSE_OMP" \
   LIBS="-lpthread" 

#   --enable-db-lite 

