#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single-gcc4`
clean_dir ${PREFIX}

../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE 
