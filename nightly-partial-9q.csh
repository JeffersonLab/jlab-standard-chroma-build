#!/bin/bash -x

install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=8
build_name="9q Nightly Build"

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
./build-git.sh  \
            adat/scalar/scalar-9q \
            qmt/intel/intel \
            qmp/ib-9q/ib-9q \
            qdp++/scalar/scalar-9q \
            qdp++/scalar/scalar-9q-qmt \
            qdp++/ib-9q/parscalar-ib-9q \
            chroma/ib-9q/parscalar-ib-9q

echo ""
echo -n "Ending date: "
date
