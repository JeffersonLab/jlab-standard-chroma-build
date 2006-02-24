#!/bin/tcsh

../../../chroma/configure --prefix=/usr/local/chroma/parscalar-gigE-double --with-qdp=/usr/local/qdp++/parscalar-gigE-double CFLAGS="-O2 -msse -msse2 -march=pentium4" CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash  --enable-sse-dwf-cg --with-gmp=/usr 
