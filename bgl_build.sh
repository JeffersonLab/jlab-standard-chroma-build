#! /bin/bash

./configure --enable-install-root=/project2/teraflop/bjoo/install \
	    --enable-bagel-qdp-version=HEAD \
	    --enable-qdp-version=HEAD \
	    --enable-chroma-version=HEAD \
	    --enable-parallel-make=4

#./build.sh \
          libxml2/bgl/bgl \
	   gmp/bgl/bgl \
           bagel/native/bagel \
	   bagel_qdp/bgl/bgl-double \
	   qmp/bgl/bgl \
	   qdpxx/bgl/parscalar-bgl-double   \
           bagel_wilson_dslash/bgl/parscalar-bgl-double \
	   bagel_clover/bgl/bgl-double \
	   chroma/bgl/parscalar-bgl-double
