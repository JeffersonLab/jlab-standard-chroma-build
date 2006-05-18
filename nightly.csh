#!/bin/bash

set install_root="$HOME/arch/nightly"

/bin/rm -rf $install_root

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-install-root=${install_root}

#  --enable-bagel-version=HEAD
#  --enable-bagel-wilson-dslash-version=HEAD 

./build.sh  bagel/native/bagel \
            bagel_qdp/noarch/noarch-double

./build.sh  qmp/single/single \
            qmp/ibg2-mpi/ibg2-mpi 

./build.sh  bagel_wilson_dslash/ibg2-mpi/parscalar-ibg2-mpi-double

./build.sh  qdp++/scalar/scalar \
            qdp++/single/parscalar-single \
            qdp++/ibg2-mpi/parscalar-ibg2-mpi

./build.sh  chroma/scalar/scalar \
            chroma/single/parscalar-single \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-double-bagel

