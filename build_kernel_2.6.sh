#!/bin/bash
./build.sh gigE qmp-mvia-mesh qdp++
./build.sh ibg2-mpi qmp qdp++
./build.sh scalar qdp++
./build.sh ib-mpi qmp qdp++
./build.sh single qmp qdp++

./build.sh gigE chroma
./build.sh ibg2-mpi chroma
./build.sh scalar chroma
./build.sh ib-mpi chroma
./build.sh single chroma

