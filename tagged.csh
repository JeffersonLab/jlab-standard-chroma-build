#!/bin/bash
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="Site install"

echo ""
echo -n "Starting date: "
date

# Build standard versions and install insto standard location
./configure  \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto="${mailto_list}" \
  --enable-build-name="${build_name}"

./build.sh \
	      qmp/ib-ofed1-mpi/ib-ofed1-mpi \
	      qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
	      qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-noavp \
	      qmp-mvia-mesh/gigE/gigE \
	      qdp++/gigE/parscalar-gigE \
	      qdp++/gigE/parscalar-gigE-double \
	      chroma/gigE/parscalar-gigE \
	      chroma/gigE/parscalar-gigE-double \
	      chroma/gigE/parscalar-gigE-noavp \
	      qdp++/scalar/scalar \
	      qdp++/scalar/scalar-double \
	      chroma/scalar/scalar \
	      chroma/scalar/scalar-double \
	      qmp/single/single \
	      qdp++/single/parscalar-single \
	      qdp++/single/parscalar-single-double \
	      chroma/single/parscalar-single \
	      chroma/single/parscalar-single-double \
	      chroma/single/parscalar-single-noavp 

echo ""
echo -n "Ending date: "
date

