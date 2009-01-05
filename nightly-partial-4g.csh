#!/bin/bash -x

install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="4g Nightly Build"

echo ""
echo -n "Starting date: "
date

#./configure  \
#  --enable-qmp-mvia-version=HEAD \
#  --enable-qmp-version=HEAD \
#  --enable-qdp-version=HEAD \
#  --enable-chroma-version=HEAD \
#  --enable-bagel-qdp-version=HEAD \
#  --enable-adat-version=HEAD \
#  --enable-install-root=${install_root} \
#  --enable-parallel-make="${parallel_make}" \
#  --enable-mailto="${mailto_list}" \
#  --enable-build-name="${build_name}"

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2


# No directories are removed. It is expected the 7n build has cleaned the /dist/*/HEAD 
# directories.

# These builds assume the directories have been configured by a previous 7n build.
./build.sh  \
            qmp-mvia-mesh/gigE/gigE \
            qdp++/gigE/parscalar-gigE \
	    qdp++/gigE/parscalar-gigE-double \
            chroma/gigE/parscalar-gigE

#            qdp++/single/parscalar-single-intel
#            chroma/single/parscalar-single-intel

echo ""
echo -n "Ending date: "
date
