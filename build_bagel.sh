#! /bin/bash

./build.sh bagel/native/bagel \
	bagel_qdp/noarch/noarch-double \
	qmp/ibg2-mpi/ibg2-mpi \
	bagel_wilson_dslash/ibg2-mpi/parscalar-ibg2-mpi-double \
	qdp++/ibg2-mpi/parscalar-ibg2-mpi-double-bagelqdp \
	chroma/ibg2-mpi/parscalar-ibg2-mpi-double-bagel
