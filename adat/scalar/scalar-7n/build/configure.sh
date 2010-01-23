#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

#CC=gcc
#CXX=g++

CC=/home/bjoo/install_gcc4.3.0/bin/gcc
CXX=/home/bjoo/install_gcc4.3.0/bin/g++

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar-7n`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} \
   CC=$CC \
   CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron -fopenmp" \
   CXX=$CXX \
   CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron -fopenmp -DUSE_OMP" \
   LIBS="-lpthread" 

#   --enable-db-lite 

