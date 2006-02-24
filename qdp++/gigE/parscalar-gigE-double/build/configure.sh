#!/bin/sh

../../../qdp++/configure --prefix=/usr/local/qdp++/parscalar-gigE-double --with-qmp=/usr/local/qmp/mvia --enable-precision=double --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CFLAGS="-O2"
