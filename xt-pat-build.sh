#! /bin/bash

#### Setup configure here
./configure --enable-parallel-make=4 \
            --enable-install-root=/ccs/proj/lgt003/Feb27-PAT \
	    --enable-qdp-version=HEAD \
	    --enable-chroma-version=HEAD

./build.sh qmt/cray_xt/xt-barcelona-pat \ 
	   libxml2/cray_xt3/xt-craypat \
	   qmp/cray_xt3/xt-craypat \
	   qdp++/cray_xt3/parscalar-xt-qmt-pat \
	   qdp++/cray_xt3/parscalar-xt-double-qmt-pat \
	   chroma/cray_xt3/parscalar-xt-qmt-pat \
	   chroma/cray_xt3/parscalar-xt-double-qmt-pat
