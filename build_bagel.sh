#! /bin/bash

install_root=${HOME}/Devel/QCD/install
build_name="Bagel test"

# Build standard versions and install insto standard location
./configure 
  --enable-install-root=${install_root} \
  --enable-parallel-make=3

./build.sh bagel/native/bagel \
	bagel_qdp/noarch/noarch-double \
	bagel_wilson_dslash/single/parscalar-single-double \
	qmp/single/single \
	qdp++/single/parscalar-single-double-bagelqdp \
	chroma/single/parscalar-single-double-bagel
