#!/bin/bash

ARCH=parscalar-single-intel-double
CHROMADIR=../../..
ROOTDIR=../../../..
QDPDIR=${ROOTDIR}/qdpxx
QMPDIR=${ROOTDIR}/qmp


pushd ${CHROMADIR}/chroma
autoreconf -f
popd

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${CHROMADIR}/PREFIX ${CHROMADIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

QDP_PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION ${ARCH}`
QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION single-intel`
echo QMP_PREFIX IS $QMP_PREFIX
CC=icc
CXX=icpc

${CHROMADIR}/chroma/configure --prefix=${PREFIX} --with-qdp=${QDP_PREFIX}  \
	--enable-cpp-wilson-dslash --enable-sse2 --enable-sse3 \
	--enable-openmp \
	--with-qmp=${QMP_PREFIX} \
        --enable-sse-scalarsite-bicgstab-kernels \
	CXXFLAGS="" \
  	CFLAGS="" \
      --enable-testcase-runner=trivial_runner  \
	  CC=${CC} CXX=${CC} \
	--with-gmp=/usr \
        --enable-lapack=lapack --enable-opt-eigcg LIBS="-llapack -lblas -lgfortran -lgmp"

