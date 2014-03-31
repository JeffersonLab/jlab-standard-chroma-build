#! /bin/bash

./configure --enable-install-root=$HOME/install \
	    --enable-bagel-qdp-version=HEAD \
	    --enable-qdp-version=HEAD \
	    --enable-chroma-version=HEAD \
	    --enable-parallel-make=4

./build.sh \
          libxml2/bgp/bgp \
	   gmp/bgp/bgp \
           bagel/native/bagel \
	   bagel_qdp/bgp/bgp-double \
	   qmp/bgp/bgp \
	   qdpxx/bgp/parscalar-bgp-double   \
           bagel_wilson_dslash/bgp/parscalar-bgp-double \
	   bagel_clover/bgp/bgp-double \
	   chroma/bgp/parscalar-bgp-double-sloppy
