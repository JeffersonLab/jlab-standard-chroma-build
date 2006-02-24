#!/bin/tcsh

../../../chroma/configure --prefix=/usr/local/chroma/parscalar-gigE-noavp --with-qdp=/usr/local/qdp++/parscalar-gigE CFLAGS="-O2 -msse -msse2 -march=pentium4" CXXFLAGS="" LIBS="-lgmp" --enable-sse-wilson-dslash --with-gmp=/usr 
