#! /bin/bash
. ../../../../functions.sh

PREFIX=`make_prefix ../../../PREFIX ../../../VERSION noarch`

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`

clean_dir ${PREFIX}


../../../bagel_qdp/configure --prefix=${PREFIX} \
    --enable-target-cpu=noarch \
    --enable-precision=single \
    --with-bagel=${BAGEL} \
    CFLAGS="-O2" \
    CXXFLAGS="-O2"

