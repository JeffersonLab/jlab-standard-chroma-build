#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION bagel`
clean_dir ${PREFIX}

../../../bagel/configure --prefix=${PREFIX}
