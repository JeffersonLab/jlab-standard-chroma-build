#!/bin/bash

/bin/rm -rf qmp/qmp 
/bin/rm -rf qdp++/qdp++
/bin/rm -rf chroma/chroma

./build.sh  bagel/native/bagel \
            bagel_qdp/noarch/noarch-double

./build.sh  qmp/single/single \
            qmp/ibg2-mpi/ibg2-mpi 

./build.sh  bagel_wilson_dslash/ibg2-mpi/parscalar-ibg2-mpi-double

./build.sh  qdp++/scalar/scalar \
            qdp++/single/parscalar-single \
            qdp++/ibg2-mpi/parscalar-ibg2-mpi

./build.sh  chroma/scalar/scalar \
            chroma/single/parscalar-single \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-double-bagel

