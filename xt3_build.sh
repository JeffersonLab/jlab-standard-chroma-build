#! /bin/bash

#### Setup configure here
./configure --enable-parallel-make=4 \
#            --enable-install-root = SET_THISUP

./build.sh libxml2/cray_xt3/psc \
	   gmp/cray_xt3/psc \
	   qmp/cray_xt3/psc \
	   qdpxx/cray_xt3/parscalar-xt3 \
	   chroma/cray_xt3/parscalar-xt3
