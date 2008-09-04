#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

CC=gcc
CXX=g++

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} \
   CFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron" \
   CXXFLAGS="-O3 -fargument-noalias-global -finline-limit=50000 -funroll-all-loops -fpeel-loops -march=opteron" \
   --enable-db-lite 
