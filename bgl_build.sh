#! /bin/bash

./configure --enable-install-root=/scratch/bjoo/install

./build.sh bagel/native/bagel \
	   bagel_qdp/bgl/bgl-double \
	   qmp/bgl/bgl

