#!/bin/bash

ARCH=bgp
QDPDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${QDPDIR}/PREFIX ${QDPDIR}/VERSION parscalar-${ARCH}-double`
clean_dir ${PREFIX}

QMP_PREFIX=`make_prefix ${ROOTDIR}/qmp/PREFIX ${ROOTDIR}/qmp/VERSION ${ARCH}`
BAGEL_QDP_PREFIX=`make_prefix ${ROOTDIR}/bagel_qdp/PREFIX ${ROOTDIR}/bagel_qdp/VERSION bgp-double`
LIBXML2_PREFIX=`make_prefix ${ROOTDIR}/libxml2/PREFIX ${ROOTDIR}/libxml2/VERSION libxml2`

echo $LIBXML2_PREFIX

${QDPDIR}/qdpxx/configure --prefix=${PREFIX} \
			  --host=powerpc-bgp-linux \
			  --build=none \
			  --with-libxml2=${LIBXML2_PREFIX} \
			  --with-qmp=${QMP_PREFIX} \
			  --with-bagel-qdp=${BAGEL_QDP_PREFIX} \
			  --enable-largefile \
			  --enable-parallel-arch=parscalar \
			  --enable-precision=double \
			  --disable-qmp-route \
			  --enable-slow-route \
			   CXXFLAGS="-O2 -finline-limit=50000" \
			   CFLAGS="-O2 -std=c99" \
 	                   CC=/bgsys/drivers/ppcfloor/comm/bin/mpicc \
 			   CXX=/bgsys/drivers/ppcfloor/comm/bin/mpicxx
