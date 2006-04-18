#! /bin/bash

pushd qmp-mvia-mesh
rm -rf qmp-mvia-mesh
popd

pushd qmp 
rm -rf qmp
popd

pushd qdp++
rm -rf qdp++
popd

pushd chroma
rm -rf chroma
popd

rm -rf logs/*

