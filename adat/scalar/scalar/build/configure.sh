#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

CC=/dist/gcc-4.1.1/bin/gcc
CXX=/dist/gcc-4.1.1/bin/g++

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} CXX=${CXX} CC=${CC}
