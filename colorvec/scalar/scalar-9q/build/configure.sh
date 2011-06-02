#!/bin/bash

ARCH=scalar-9q
COLORVECDIR=../../..
ROOTDIR=../../../..
ADATDIR=${ROOTDIR}/adat

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${COLORVECDIR}/PREFIX ${COLORVECDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

ADAT_PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION ${ARCH}`

MYCC=gcc
MYCXX=g++

${COLORVECDIR}/colorvec/configure --prefix=${PREFIX} \
   --with-adat=${ADAT_PREFIX}

