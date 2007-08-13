#!/bin/bash -x

install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="Nightly Build"

echo ""
echo -n "Starting date: "
date

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-adat-version=HEAD \
  --enable-install-root=${install_root} \
  --enable-parallel-make="${parallel_make}" \
  --enable-mailto="${mailto_list}" \
  --enable-build-name="${build_name}"

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

/bin/rm -rf ${install_root}/adat/HEAD \
            ${install_root}/bagel/HEAD \
            ${install_root}/bagel_qdp/HEAD \
            ${install_root}/qmp/HEAD \
            ${install_root}/qdp++/HEAD \
            ${install_root}/chroma/HEAD

./build.sh  adat/scalar/scalar \
            bagel/native/bagel \
            bagel_qdp/noarch/noarch-double \
            qmp/single/single \
            qmp/single/single-gcc4 \
	    qmp/ib-ofed1-mpi/ib-ofed1-mpi \
            qmp-mvia-mesh/gigE/gigE \
            qdp++/scalar/scalar \
            qdp++/single/parscalar-single \
	    qdp++/single/parscalar-single-double \
            qdp++/single/parscalar-single-gcc4 \
	    qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
	    qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
            qdp++/gigE/parscalar-gigE \
	    qdp++/gigE/parscalar-gigE-double \
            chroma/scalar/scalar \
            chroma/single/parscalar-single \
            chroma/single/parscalar-single-gcc4 \
 	    chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
 	    chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
 	    chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-noavp \
            chroma/gigE/parscalar-gigE-noavp

# RGE has no attachment to these - they are not much use at FNAL since
# kaon has its own build anyway...
#	    qmp/ib-ofed1-ompi/ib-ofed1-ompi 
#	    qdp++/ib-ofed1-ompi/parscalar-ib-ofed1-ompi
#	    qdp++/ib-ofed1-ompi/parscalar-ib-ofed1-ompi-double
#	    chroma/ib-ofed1-ompi/parscalar-ib-ofed1-ompi
#	    chroma/ib-ofed1-ompi/parscalar-ib-ofed1-ompi-double
#	    chroma/ib-ofed1-ompi/parscalar-ib-ofed1-ompi-noavp

# This is buggy at the moment
#            bagel_wilson_dslash/ib-ofed1-mpi/parscalar-ibg2-mpi-double
#            chroma/ib-ofed1-mpi/parscalar-ibg2-mpi-double-bagel

#            qmp/single/single-intel
#            qdp++/single/parscalar-single-intel
#            chroma/single/parscalar-single-intel

echo ""
echo -n "Ending date: "
date
