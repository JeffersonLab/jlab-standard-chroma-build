#!/bin/bash -x

install_root="$HOME/arch/nightly"
parallel_make=4
mailto_list="bjoo@jlab.org edwards@jlab.org"

/bin/rm -rf $install_root

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-install-root=${install_root} \
  --enable-parallel-make=${parallel_make} \ 
  --enable-mailto=${mailto_list}

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

./build.sh  qmp/single/single \
            qdp++/single/parscalar-single-double \
            chroma/single/parscalar-single-double

