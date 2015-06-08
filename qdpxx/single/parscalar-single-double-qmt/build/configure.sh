#!/bin/bash
ARCH=single
QDPDIR=../../..
ROOTDIR=../../../..
QMPDIR=${ROOTDIR}/qmp
QMTDIR=${ROOTDIR}/qmt

pushd ${QDPDIR}/qdpxx
autoreconf -f
popd

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double-qmt`
QMT_PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${QMPDIR}/PREFIX ${QMPDIR}/VERSION ${ARCH}`

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} --with-qmp=${QMP_PREFIX} --enable-precision=double \
        --enable-parallel-arch=parscalar --enable-sse2 --enable-largefile \
        CXXFLAGS="-O2 -finline-limit=50000 -msse -msse2" \
        CFLAGS="-O3 -msse -msse2 -std=c99" \
	--with-qmt=${QMT_PREFIX}
