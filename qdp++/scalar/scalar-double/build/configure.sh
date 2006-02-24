#!/bin/sh

../../../qdp++/configure --prefix=/usr/local/qdp++/scalar-double --enable-parallel-arch=scalar --enable-sse2 CXXFLAGS="-O2 -finline-limit=50000 -msse -march=pentium4" CFLAGS="-O2" --enable-precision=double
