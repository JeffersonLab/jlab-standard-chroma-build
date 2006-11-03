#!/bin/bash -x

install_root="/home/hwlin/install"
parallel_make=4
build_name="Test  Build"

echo ""
echo -n "Starting date: "
date

./configure  \
  --enable-chroma-version=HEAD \
  --enable-install-root=${install_root} \
  --enable-parallel-make="${parallel_make}" \
  --enable-build-name="${build_name}"


./build.sh qdp++/scalar/scalar \
            chroma/scalar/scalar

echo ""
echo -n "Ending date: "
date
