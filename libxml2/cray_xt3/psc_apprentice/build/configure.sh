#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION libxml2_finst`
clean_dir ${PREFIX}

module unload PrgEnv-pgi
module load PrgEnv-gnu
module unload gcc/3.2.3
module load gcc-catamount/3.3

../../../libxml2/configure --prefix=${PREFIX} -host=x86_64-unknown-linux \
    --build=x86_64-suse-linux \
    CC="/opt/xt-pe/${XTOS_VERSION}/bin/snos64/qk-gcc" \
    CFLAGS="-O2 -finstrument_functions" \
    --disable-shared \
    --without-zlib \
    --without-python \
    --without-readline \
    --without-threads \
    --without-history \
    --without-reader \
    --without-writer \
    --with-output \
    --without-ftp \
    --without-http \
    --without-pattern \
    --without-catalog \
    --without-docbook \
    --without-iconv \
    --without-schemas \
    --without-schematron \
    --without-modules \
    --without-xptr \
    --without-xinclude

cp Makefile Makefile.bak
sed -e 's/runsuite\$(EXEEXT)//' Makefile | sed -e 's/runtest\$(EXEEXT)\s\\//' > Makefile.new
cp Makefile.new Makefile
