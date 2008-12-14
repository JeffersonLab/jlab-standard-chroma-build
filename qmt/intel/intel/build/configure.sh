#! /bin/bash

QMTDIR=../../..
. ../../../../functions.sh

PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION intel`
clean_dir ${PREFIX}

${QMTDIR}/qmt/configure --prefix=${PREFIX} --enable-xeon \
	--disable-thread_affinity \
	CFLAGS="-O3 -D_REENTRANT" \
	CXX=g++ CC=gcc
