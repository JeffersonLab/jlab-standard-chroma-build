#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-intel`
clean_dir ${PREFIX}

CC=/opt/intel/cc/9.1.043/bin/icc

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE CC=${CC} CFLAGS="-O2 -march=pentium4"
