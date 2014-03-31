#! /bin/bash

pushd qmp-mvia-mesh
rm -rf qmp-mvia-mesh
popd

pushd qmp 
rm -rf qmp
popd

pushd qdpxx
rm -rf qdpxx
popd

pushd chroma
rm -rf chroma
popd

pushd bagel
rm -rf bagel
popd

pushd bagel_wilson_dslash
rm -rf bagel_wilson_dslash
popd

pushd bagel_qdp
rm -rf bagel_qdp
popd

./configure
rm -rf logs/*

