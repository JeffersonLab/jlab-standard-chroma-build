#!/bin/bash

. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION scalar`
clean_dir ${PREFIX}

../../../adat/configure --prefix=${PREFIX}
