#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-gcc4`
clean_dir ${PREFIX}

CC=/dist/gcc-4.1.1/bin/gcc
../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE CC=${CC}
