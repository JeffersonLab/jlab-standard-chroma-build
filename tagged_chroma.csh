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
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
	      chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-noavp \
	      chroma/gigE/parscalar-gigE \
	      chroma/gigE/parscalar-gigE-double \
	      chroma/gigE/parscalar-gigE-noavp \
	      chroma/scalar/scalar \
	      chroma/scalar/scalar-double 

#	      chroma/single/parscalar-single 
#	      chroma/single/parscalar-single-double 
#	      chroma/single/parscalar-single-noavp 

#	      chroma/ib-mpi/parscalar-ib-mpi 
#	      chroma/ib-mpi/parscalar-ib-mpi-double 
#	      chroma/ib-mpi/parscalar-ib-mpi-noavp 

echo ""
echo -n "Ending date: "
date

