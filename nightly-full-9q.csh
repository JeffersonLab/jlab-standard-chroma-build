#!/bin/bash -x
install_root="/dist/scidac"
mailto_list="bjoo@jlab.org edwards@jlab.org fwinter@jlab.org"
parallel_make=16
build_name="9q Nightly Build"

echo ""
echo -n "Starting date: "
date

/bin/rm -rf ${install_root}/adat/master \
    ${install_root}/colorvec/master \
    ${install_root}/sfpcac/master \
    ${install_root}/redstar/master \
    ${install_root}/bagel/master \
    ${install_root}/bagel_qdp/master \
    ${install_root}/qmp/master \
    ${install_root}/qmt/master \
    ${install_root}/qdpxx/master \
    ${install_root}/chroma/master

./configure  \
    --enable-qmp-version=master \
    --enable-qmt-version=master \
    --enable-qdp-version=master \
    --enable-chroma-version=master \
    --enable-bagel-qdp-version=master \
    --enable-adat-version=master \
    --enable-colorvec-version=master \
    --enable-sfpcac-version=master \
    --enable-redstar-version=master \
    --enable-install-root=${install_root} \
    --enable-parallel-make="${parallel_make}" \
    --enable-build-name="${build_name}" \
    --enable-mailto="${mailto_list}" \
    --enable-git-root="git@github.com:usqcd-software"

#  --enable-bagel-version=1.4.0
#  --enable-bagel-wilson-dslash-version=1.4.2

./build-git.sh  \
    qmp/single/single \
    qmp/ib-9q/ib-9q \
    qmp/ib-9q/openmpi \
    qdpxx/scalar/scalar-9q \
    qdpxx/single/parscalar-single \
    qdpxx/single/parscalar-single-double \
    qdpxx/ib-9q/parscalar-ib-9q \
    qdpxx/ib-9q/parscalar-ib-9q-double \
    qdpxx/ib-9q/openmpi \
    qdpxx/ib-9q/openmpi-double

# Not a public intel compiler
#    qmp/single/single-intel
#    qdpxx/single/parscalar-single-intel 
#    qdpxx/single/parscalar-single-intel-double 

./configure  \
    --enable-qmp-version=master \
    --enable-qmt-version=master \
    --enable-qdp-version=master \
    --enable-chroma-version=master \
    --enable-bagel-qdp-version=master \
    --enable-adat-version=master \
    --enable-colorvec-version=master \
    --enable-sfpcac-version=master \
    --enable-redstar-version=master \
    --enable-install-root=${install_root} \
    --enable-parallel-make="${parallel_make}" \
    --enable-build-name="${build_name}" \
    --enable-mailto="${mailto_list}" \
    --enable-git-root="https://github.com/JeffersonLab"

./build-git.sh  \
    chroma/scalar/scalar-9q \
    chroma/single/parscalar-single \
    chroma/single/parscalar-single-double \
    chroma/ib-9q/parscalar-ib-9q \
    chroma/ib-9q/parscalar-ib-9q-double \
    chroma/ib-9q/openmpi \
    chroma/ib-9q/openmpi-double

# Not a public intel compiler
#    chroma/single/parscalar-single-intel 
#    chroma/single/parscalar-single-intel-double 

./configure  \
    --enable-qmp-version=master \
    --enable-qmt-version=master \
    --enable-qdp-version=master \
    --enable-chroma-version=master \
    --enable-bagel-qdp-version=master \
    --enable-adat-version=master \
    --enable-colorvec-version=master \
    --enable-sfpcac-version=master \
    --enable-redstar-version=master \
    --enable-install-root=${install_root} \
    --enable-parallel-make="${parallel_make}" \
    --enable-build-name="${build_name}" \
    --enable-mailto="${mailto_list}" \
    --enable-git-root="git@github.com:JeffersonLab"

./build-git.sh \
    adat/scalar/scalar-9q \
    colorvec/scalar/scalar-9q \
    redstar/scalar/scalar-9q

echo ""
echo -n "Ending date: "
date
