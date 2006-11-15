#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} 
