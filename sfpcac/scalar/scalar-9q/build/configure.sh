#!/bin/bash

ARCH=scalar-9q
SFPCACDIR=../../..
ROOTDIR=../../../..
ADATDIR=${ROOTDIR}/adat

. ${ROOTDIR}/functions.sh
PREFIX=`make_prefix ${SFPCACDIR}/PREFIX ${SFPCACDIR}/VERSION ${ARCH}`
clean_dir ${PREFIX}

ADAT_PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION ${ARCH}`

MYCC=gcc
MYCXX=g++

${SFPCACDIR}/sfpcac/configure --prefix=${PREFIX} \
   --with-adat=${ADAT_PREFIX}

