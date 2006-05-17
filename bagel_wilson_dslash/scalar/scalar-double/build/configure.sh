
. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION scalar-double`
clean_dir ${PREFIX}

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`
 ../../../bagel_wilson_dslash/configure --prefix=${PREFIX} \
    --enable-target-cpu=noarch \
    --enable-comms=none \
    --enable-allocator=malloc \
    --enable-precision=double \
    --with-bagel=${BAGEL}
    
