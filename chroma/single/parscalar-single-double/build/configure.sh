#!/bin/tcsh

../../../chroma/configure --prefix=/usr/local/chroma/parscalar-single-double --with-qdp=/usr/local/qdp++/parscalar-single-double CFLAGS="-O2 -msse -msse2 -march=pentium4" CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash  --enable-sse-dwf-cg --with-gmp=/usr 
