#!/bin/bash

ADATDIR=../../..
ROOTDIR=../../../..
. ${ROOTDIR}/functions.sh

CC=gcc
CXX=g++

PREFIX=`make_prefix ${ADATDIR}/PREFIX ${ADATDIR}/VERSION scalar`
clean_dir ${PREFIX}

${ADATDIR}/adat/configure --prefix=${PREFIX} CXX=${CXX} CC=${CC} \
   --enable-db-lite 
