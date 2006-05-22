#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-intel`
clean_dir ${PREFIX}

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE CC=/opt/intel/cc/9.0/bin/icc LIBS="-static"
