#!/bin/bash -x

install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=8
build_name="9q Nightly Build"

echo ""
echo -n "Starting date: "
date

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qmt-version=HEAD \
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
            ${install_root}/qmt/HEAD \
            ${install_root}/qdp++/HEAD \
            ${install_root}/chroma/HEAD

./build-git.sh  \
            adat/scalar/scalar-9q \
            qmt/intel/intel \
            qmt/amd/barcelona \
            qmp/single/single \
	    qmp/ib-9q/ib-9q \
            bagel/native/bagel \
            bagel_qdp/noarch/noarch-double \
            qdp++/scalar/scalar-9q \
            qdp++/scalar/scalar-9q-qmt \
            qdp++/single/parscalar-single \
	    qdp++/single/parscalar-single-double \
	    qdp++/ib-9q/parscalar-ib-9q \
	    qdp++/ib-9q/parscalar-ib-9q-double \
            chroma/scalar/scalar-9q \
            chroma/scalar/scalar-9q-qmt \
            chroma/single/parscalar-single \
	    chroma/single/parscalar-single-double \
	    chroma/ib-9q/parscalar-ib-9q \
	    chroma/ib-9q/parscalar-ib-9q-double

#           bagel_wilson_dslash/single/parscalar-single-double
#           chroma/single/parscalar-single-double-bageldslash

# We don't have an intel compiler on 9q?
#            qmp/single/single-intel
#            qdp++/single/parscalar-single-intel
#            chroma/single/parscalar-single-intel

echo ""
echo -n "Ending date: "
date
