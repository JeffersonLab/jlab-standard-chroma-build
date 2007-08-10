#!/bin/bash -x
#
# Tag 7n builds onto the standard 6n builds
#
install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="Nightly Build for 7n"

echo ""
echo -n "Starting date: "
date

# It is assumed that the configure script has already been run
# Do not remove any directories

./build.sh  qmp/ib-7n/ib-7n \
            qdp++/scalar/scalar-7n \
	    qdp++/ib-7n/parscalar-ib-7n \
	    chroma/ib-7n/scalar-7n \
	    chroma/ib-7n/parscalar-ib-7n

echo ""
echo -n "Ending date: "
date
