#!/bin/bash
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="Site install"

echo ""
echo -n "Starting date: "
date

# Build standard versions and install insto standard location
./configure  \
  --enable-parallel-make=${parallel_make} \
  --enable-mailto=${mailto_list} \
  --enable-build-name="${build_name}"

./build.sh -a ibg2-mpi
./build.sh -a gigE
./build.sh -a scalar
./build.sh -a ib-mpi
./build.sh -a single

echo ""
echo -n "Ending date: "
date

