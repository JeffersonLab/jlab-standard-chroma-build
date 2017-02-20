#!/bin/bash

ARCH=scalar-9q
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx

pushd ${CHROMADIR}/chroma
autoreconf -f
popd

export PATH=/dist/gcc-4.8.2/bin:$PATH
export LD_LIBRARY_PATH=/dist/gcc-4.8.2/lib64:/dist/gcc-4.8.2/lib:$LD_LIBRARY_PATH

CXX=/dist/gcc-4.8.2/bin/g++
CC=/dist/gcc-4.8.2/bin/gcc

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
GMP=/dist/gmp-6.0.0


${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX} \
	CFLAGS="-O3 -fargument-noalias-global -funroll-all-loops -fpeel-loops -march=core2" \
	CXXFLAGS="" \
        --enable-sse-wilson-dslash --with-gmp=$GMP CC=$CC CXX=$CXX \
        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran ${GMP}/lib/libgmp.a"

#        --enable-sse-wilson-dslash CC=gcc CXX=g++ 
#        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran"


