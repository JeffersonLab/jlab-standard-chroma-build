#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION libxml2`
clean_dir ${PREFIX}

../../../libxml2/configure --prefix=${PREFIX} -host=x86_64-unknown-linux \
    --build=x86_64-suse-linux \
    CC="mpicc -cc=$HOME/install/gcc-4.2.3/bin/gcc" \
    CFLAGS="-O3 " \
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
