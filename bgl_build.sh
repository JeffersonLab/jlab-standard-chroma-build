#! /bin/bash

configure --enable-install-prefix=/scratch/bjoo/install

./build.sh bagel/native/bagel \
	   bagel_qdp/bgl/bgl-double \
	   qmp/bgl/bgl

