#! /bin/bash

QMTDIR=../../..
. ../../../../functions.sh

PREFIX=`make_prefix ${QMTDIR}/PREFIX ${QMTDIR}/VERSION xt-barcelona-pat`
clean_dir ${PREFIX}

${QMTDIR}/qmt/configure --prefix=${PREFIX} --enable-barcelona \
	--disable-thread_affinity \
	CFLAGS="-O3 -D_REENTRANT -march=barcelona -g" \
	CXX=CC CC=cc \
	--host=x86_64-unknown-linux --build=x86_64-suse-linux-gnu