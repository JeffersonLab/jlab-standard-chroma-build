#!/bin/bash

ARCH=scalar-9q
TENSORDIR=../../..
ROOTDIR=../../../..

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${TENSORDIR}/PREFIX ${TENSORDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

MYCC=gcc
MYCXX=g++

# Build auto-files
pushd ${TENSORDIR}/tensor
./autogen.sh
popd

# Configure it
${TENSORDIR}/tensor/configure --prefix=${PREFIX} \
  --with-arpack \
  --without-fftw  \
  F77="gfortran" \
  CFLAGS="-I /dist/scidac/atlas/include" \
  CXXFLAGS="-I /dist/scidac/atlas/include" \
  LDFLAGS="-L /dist/scidac/atlas/lib"  LIBS="-lptlapack -lptcblas -latlas"

#  --without-libsci 

