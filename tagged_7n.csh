#!/bin/bash
mailto_list="bjoo@jlab.org edwards@jlab.org"
parallel_make=4
build_name="7n Site install"

echo ""
echo -n "Starting date: "
date

./build.sh  qmp/ib-7n/ib-7n \
            qdp++/scalar/scalar-7n \
            qdp++/ib-7n/parscalar-ib-7n \
            qdp++/ib-7n/parscalar-ib-7n-double \
            chroma/scalar/scalar-7n \
            chroma/ib-7n/parscalar-ib-7n \
            chroma/ib-7n/parscalar-ib-7n-double

echo ""
echo -n "Ending date: "
date

