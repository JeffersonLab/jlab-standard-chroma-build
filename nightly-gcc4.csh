#!/bin/bash -x

install_root="$HOME/arch/nightly"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4

/bin/rm -rf $install_root

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-install-root=${install_root} \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto-list=${mailto_list} \ 
  --enabel-build-name="Nightly GCC 4.0 Build"

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

./build.sh  qmp/single/single-gcc4 \
            qdp++/single/parscalar-single-gcc4 \
            chroma/single/parscalar-single-gcc4

