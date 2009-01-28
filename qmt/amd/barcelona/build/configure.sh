#! /bin/bash

QMTDIR=../../..
. ../../../../functions.sh

PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION barcelona`
clean_dir ${PREFIX}

${QMTDIR}/qmt/configure --prefix=${PREFIX} --enable-barcelona \
	--disable-thread_affinity \
	CFLAGS="-O3 -D_REENTRANT -g" \
	CXX=g++ CC=gcc
