#!/bin/bash

/bin/rm -rf qmp/qmp 
/bin/rm -rf qdp++/qdp++
/bin/rm -rf chroma/chroma

./build.sh  qmp/single/single \
            qmp/ibg2-mpi/ibg2-mpi \
            qdp++/scalar/scalar \
            qdp++/single/parscalar-single \
            qdp++/ibg2-mpi/parscalar-ibg2-mpi \
            chroma/scalar/scalar \
            chroma/single/parscalar-single \
            chroma/ibg2-mpi/parscalar-ibg2-mpi-noavp

