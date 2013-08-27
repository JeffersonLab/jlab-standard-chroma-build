#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-intel`
clean_dir ${PREFIX}

source /opt/intel/composerxe/bin/compilervars.sh intel64
CC=icc

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE CC=${CC} CFLAGS="-O2 -xhost -std=gnu99"
