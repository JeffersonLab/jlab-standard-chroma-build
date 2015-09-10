#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION single`
clean_dir ${PREFIX}

gcc --version
../../../qmp/configure --prefix=${PREFIX} --with-qmp-comms-type=SINGLE
