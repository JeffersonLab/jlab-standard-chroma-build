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
	      qmp/ibg2-mpi/ibg2-mpi \
	      qdp++/ibg2-mpi/parscalar-ibg2-mpi \
	      qdp++/ibg2-mpi/parscalar-ibg2-mpi-double \
	      chroma/ibg2-mpi/parscalar-ibg2-mpi \
	      chroma/ibg2-mpi/parscalar-ibg2-mpi-double \
	      chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp \
	      qmp-mvia-mesh/gigE/gigE \
	      qdp++/gigE/parscalar-gigE \
	      qdp++/gigE/parscalar-gigE-double \
	      chroma/gigE/parscalar-gigE \
	      chroma/gigE/parscalar-gigE-double \
	      chroma/gigE/parscalar-gigE-noavp \
	      qdp++/scalar/scalar \
	      qdp++/scalar/scalar-double \
	      chroma/scalar/scalar \
	      chroma/scalar/scalar-double 

#	      qmp/single/single 
#	      qdp++/single/parscalar-single 
#	      qdp++/single/parscalar-single-double 
#	      chroma/single/parscalar-single 
#	      chroma/single/parscalar-single-double 
#	      chroma/single/parscalar-single-noavp 

#	      qmp/ib-mpi/ib-mpi 
#	      qdp++/ib-mpi/parscalar-ib-mpi 
#	      qdp++/ib-mpi/parscalar-ib-mpi-double 
#	      chroma/ib-mpi/parscalar-ib-mpi 
#	      chroma/ib-mpi/parscalar-ib-mpi-double 
#	      chroma/ib-mpi/parscalar-ib-mpi-noavp 

echo ""
echo -n "Ending date: "
date

