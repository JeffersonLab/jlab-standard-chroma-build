#! /bin/bash

#### Setup configure here
./configure --enable-parallel-make=10 \
            --enable-install-root=/ccs/proj/lgt003/May-17-2010/ \
	    --enable-qdp-version=master \
	    --enable-chroma-version=master

./build-git.sh qmt/cray_xt/xt-barcelona-pat \
	   libxml2/cray_xt3/xt-craypat \
	   qmp/cray_xt3/xt-craypat \
	   qdp++/cray_xt3/parscalar-xt-qmt-pat \
	   qdp++/cray_xt3/parscalar-xt-double-qmt-pat \
	   chroma/cray_xt3/parscalar-xt-qmt-pat \
	   chroma/cray_xt3/parscalar-xt-double-qmt-pat
