#!/bin/bash

ARCH=scalar-9q
REDSTARDIR=../../..
ROOTDIR=../../../..
ADATDIR=${ROOTDIR}/adat

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${REDSTARDIR}/PREFIX ${REDSTARDIR}/VERSION ${ARCH}
clean_dir ${PREFIX}

ADAT_PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION ${ARCH}`

MYCC=gcc
MYCXX=g++

${REDSTARDIR}/redstar/configure --prefix=${PREFIX} \
   --with-adat=${ADAT_PREFIX}

