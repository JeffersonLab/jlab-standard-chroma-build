#!/bin/bash
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=8
build_name="Site install"

echo ""
echo -n "Starting date: "
date

# Build standard versions and install insto standard location
./configure  \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto="${mailto_list}" \
  --enable-build-name="${build_name}"

./build-git.sh \
            adat/scalar/scalar-7n \
            qmp/single/single \
            qmp/ib-7n/ib-7n \
            qdp++/scalar/scalar-7n \
            qdp++/single/parscalar-single \
            qdp++/single/parscalar-single-double \
            qdp++/ib-7n/parscalar-ib-7n \
            qdp++/ib-7n/parscalar-ib-7n-double \
            chroma/scalar/scalar-7n \
            chroma/single/parscalar-single \
            chroma/ib-7n/parscalar-ib-7n \
            chroma/ib-7n/parscalar-ib-7n-double

echo ""
echo -n "Ending date: "
date

