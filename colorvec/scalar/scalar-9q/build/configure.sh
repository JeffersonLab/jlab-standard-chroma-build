#!/bin/bash

ARCH=scalar-9q
COLORVECDIR=../../..
ROOTDIR=../../../..
ADATDIR=${ROOTDIR}/adat
HADRONDIR=${ROOTDIR}/hadron

pushd ${COLORVECDIR}/colorvec
autoreconf -f
popd

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${COLORVECDIR}/PREFIX ${COLORVECDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

ADAT_PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION ${ARCH}`
HADRON_PREFIX=`make_prefix ${HADRONDIR}/PREFIX ${HADRONDIR}/VERSION ${ARCH}`

MYCC=gcc
MYCXX=g++

${COLORVECDIR}/colorvec/configure --prefix=${PREFIX} \
   --with-hadron=${HADRON_PREFIX} \
   --with-adat=${ADAT_PREFIX}

