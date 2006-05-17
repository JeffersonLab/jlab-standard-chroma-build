. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION scalar-double`
clean_dir ${PREFIX}

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`
QMP=`make_prefix .../../../../qmp/PREFIX ../../../../qmp/VERSION single`

#
# Hack until we have with-qmp as standard
#
#
QMPSCRIPT=${QMP}/bin
DSLASH_CXXFLAGS=`${QMPSCRIPT} --cflags`
DSLASH_LDFLAGS=`${QMPSCRIPT} --ldflags`
DSLASH_LIBS=`${QMPSCRIPT} --libs`

 ../../../bagel_wilson_dslash/configure --prefix=${PREFIX} \
    --enable-target-cpu=noarch \
    --enable-comms=none \
    --enable-allocator=malloc \
    --enable-precision=single \
    --with-bagel=${BAGEL} \
     CXXFLAGS="${DSLASH_CXXFLAGS}" \
     CFLAGS="${DSLASH_LDFLAGS}" \
     ASFLAGS="" \
     LDFLAGS="${DSLASH_LIBS}"
