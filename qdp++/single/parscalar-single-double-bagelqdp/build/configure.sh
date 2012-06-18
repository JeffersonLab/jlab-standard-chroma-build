#!/bin/bash

ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp
BAGELQDPDIR=${ROOTDIR}/bagel_qdp

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double-bagelqdp`
clean_dir ${PREFI}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`
BAGELQDP_PREFIX=`make_prefix ${BAGELQDPDIR}/PREFIX ${BAGELQDPDIR}/VERSION noarch-double`

${QDPDIR}/qdp++/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-parallel-arch=parscalar CXXFLAGS="-fargument-noalias-global -O2 -finline-limit=50000" CFLAGS="-O2 -std=c99" --with-bagel-qdp=${BAGELQDP_PREFIX} --enable-precision=double
