#!/bin/sh

../../../qdp++/configure --prefix=/usr/local/qdp++/parscalar-single --with-qmp=/usr/local/qmp/single --enable-parallel-arch=parscalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CFLAGS="-O2"
