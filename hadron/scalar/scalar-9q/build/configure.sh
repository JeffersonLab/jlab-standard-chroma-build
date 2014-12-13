#!/bin/bash

ARCH=scalar-9q
HADRONDIR=../../..
ROOTDIR=../../../..
TENSORDIR=${ROOTDIR}/tensor

pushd ${HADRONDIR}/hadron
autoreconf -f
popd

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${HADRONDIR}/PREFIX ${HADRONDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

TENSOR_PREFIX=`make_prefix ${TENSORDIR}/PREFIX ${TENSORDIR}/VERSION ${ARCH}`

MYCC=gcc
MYCXX=g++

${HADRONDIR}/hadron/configure --prefix=${PREFIX} \
   --with-tensor=${TENSOR_PREFIX} \
   CXXFLAGS="-std=c++0x -fopenmp"

