#! /bin/bash

#### Setup configure here
./configure --enable-parallel-make=4 \
            --enable-install-root=$HOME/install

./build.sh libxml2/ranger/ranger \
	   gmp/ranger/ranger \
	   qmp/ranger/ranger \
	   qdp++/ranger/parscalar-ib \
	   chroma/ranger/parscalar-ib
