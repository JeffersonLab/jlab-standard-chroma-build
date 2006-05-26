#!/bin/bash

mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="Chroma site install"

echo ""
echo -n "Starting date: "
date

# Build standard versions and install insto standard location
./configure  \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto=${mailto_list} \
  --enable-build-name="${build_name}"

/bin/rm -rf chroma/chroma

./build.sh  chroma/gigE/parscalar-gigE \
            chroma/gigE/parscalar-gigE-double \
            chroma/gigE/parscalar-gigE-noavp \
            chroma/ibg2-mpi/parscalar-ibg2-mpi \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-double \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp \
            chroma/single/parscalar-single \
            chroma/single/parscalar-single-double \
            chroma/scalar/scalar \
            chroma/scalar/scalar-double

echo ""
echo -n "Ending date: "
date

