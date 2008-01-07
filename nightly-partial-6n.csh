#!/bin/bash -x

install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="6n Nightly Build"

echo ""
echo -n "Starting date: "
date

# These builds assume the directories have been configured by a previous 7n build.
./build.sh  \
	    qmp/ib-ofed1-mpi/ib-ofed1-mpi \
            qmp-mvia-mesh/gigE/gigE \
	    qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
	    qdp++/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
            qdp++/gigE/parscalar-gigE \
	    qdp++/gigE/parscalar-gigE-double \
 	    chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi \
 	    chroma/ib-ofed1-mpi/parscalar-ib-ofed1-mpi-double \
            chroma/gigE/parscalar-gigE

#            qdp++/single/parscalar-single-intel
#            chroma/single/parscalar-single-intel

echo ""
echo -n "Ending date: "
date
