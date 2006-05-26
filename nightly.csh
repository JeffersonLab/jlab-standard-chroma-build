#!/bin/bash -x

install_root="$HOME/arch/nightly"
mailto_list="bjoo@jlab.org"
parallel_make=4
build_name="Testbuild"

/bin/rm -rf $install_root

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-install-root=${install_root} \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto=${mailto_list} \
  --enable-build-name=${buildname}

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

./build.sh  bagel/native/bagel \
            bagel_qdp/noarch/noarch-double \
            qmp/single/single \
            qmp/single/single-gcc4 \
            qmp/ibg2-mpi/ibg2-mpi \
            bagel_wilson_dslash/ibg2-mpi/parscalar-ibg2-mpi-double \
            qdp++/scalar/scalar \
            qdp++/single/parscalar-single \
            qdp++/single/parscalar-single-gcc4 \
            qdp++/ibg2-mpi/parscalar-ibg2-mpi \
            qdp++/ibg2-mpi/parscalar-ibg2-mpi-double-bagelqdp \
            chroma/scalar/scalar \
            chroma/single/parscalar-single \
            chroma/single/parscalar-single-gcc4 \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-double-bagel

#            qmp/single/single-intel
#            qdp++/single/parscalar-single-intel
#            chroma/single/parscalar-single-intel

