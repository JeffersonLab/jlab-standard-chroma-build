#!/bin/tcsh

../../../chroma/configure --prefix=/usr/local/chroma/scalar --with-qdp=/usr/local/qdp++/scalar CFLAGS="-O2 -msse -msse2 -march=pentium4" CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash  --with-gmp=/usr --enable-opt-cfz-linop

