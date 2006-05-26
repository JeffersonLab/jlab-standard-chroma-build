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
  --enable-mailto-list=${mailto_list}

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

./build.sh  qmp/single/single-intel \
            qdp++/single/parscalar-single-intel \
            chroma/single/parscalar-single-intel

