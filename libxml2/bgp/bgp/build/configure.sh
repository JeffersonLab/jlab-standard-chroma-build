#! /bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION libxml2`
clean_dir ${PREFIX}


../../../libxml2/configure --prefix=${PREFIX} \
    --host=powerpc-bgp-linux --build=none \
    CC=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-gcc \
    AR=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-ar \
    RANLIB=/bgsys/drivers/ppcfloor/gnu-linux/bin/powerpc-bgp-linux-ranlib \
    CFLAGS="-O2" \
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

