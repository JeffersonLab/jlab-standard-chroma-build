
#!/bin/bash -x
install_root="/dist/scidac"
mailto_list="edwards@jlab.org"
parallel_make=16
build_name="9q Nightly Build"

echo ""
echo -n "Starting date: "
date

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
  --enable-mailto="${mailto_list}" 

/bin/rm -rf \
    ${install_root}/qdp++/master \
    ${install_root}/chroma/master

./build-git.sh  \
    qdp++/scalar/scalar-9q \
    qdp++/ib-9q/parscalar-ib-9q \
    chroma/scalar/scalar-9q \
    chroma/ib-9q/parscalar-ib-9q 

echo ""
echo -n "Ending date: "
date
