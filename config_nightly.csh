#!/bin/bash

./configure  \
  --enable-qmp-mvia-version=HEAD \
  --enable-qmp-version=HEAD \
  --enable-qdp-version=HEAD \
  --enable-chroma-version=HEAD \
  --enable-bagel-version=HEAD \
  --enable-bagel-wilson-dslash-version=HEAD \
  --enable-bagel-qdp-version=HEAD \
  --enable-install-root=$HOME/arch/nightly

