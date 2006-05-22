#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-gcc4`
clean_dir ${PREFIX}

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE CC=/usr/local/gcc-4.0.2/bin/gcc
