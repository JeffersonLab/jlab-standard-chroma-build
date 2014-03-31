#! /bin/bash

install_root="$HOME/install/new"
mailto_list="edwards@jlab.org"
parallel_make=8
build_name="Ranger Build"

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
  --enable-install-root="${install_root}" \
  --enable-parallel-make="${parallel_make}" \
  --enable-mailto="${mailto_list}" \
  --enable-build-name="${build_name}"

./build.sh libxml2/ranger/ranger \
	   gmp/ranger/ranger \
	   qmp/ranger/ranger \
	   qdpxx/ranger/parscalar-ib \
	   chroma/ranger/parscalar-ib

echo ""
echo -n "Ending date: "
date

