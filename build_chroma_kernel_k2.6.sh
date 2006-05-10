#!/bin/bash

/bin/rm -rf chroma/chroma

./build.sh  chroma/gigE/parscalar-gigE \
            chroma/gigE/parscalar-gigE-double \
            chroma/gigE/parscalar-gigE-noavp

./build.sh  chroma/ibg2-mpi/parscalar-ibg2-mpi \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-double \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp

./build.sh  chroma/single/parscalar-single \
            chroma/single/parscalar-single-double

./build.sh  chroma/scalar/scalar \
            chroma/scalar/scalar-double

