#! /bin/bash

./configure --enable-install-root=/scratch/bjoo/install

./build.sh libxml2/bgl/bgl \
           bagel/native/bagel \
	   bagel_qdp/bgl/bgl-double \
	   qmp/bgl/bgl \
	   bagel_wilson_dslash/bgl/parscalar-bgl-double \
	   qdp++/bgl/parscalar-bgl-double \
	   chroma/bgl/parscalar-bgl-double
