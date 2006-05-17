. ../../../../functions.sh
PREFIX=`make_prefix ../../../PREFIX ../../../VERSION parscalar-single-double`
clean_dir ${PREFIX}

BAGEL=`make_prefix ../../../../bagel/PREFIX ../../../../bagel/VERSION bagel`
QMP=`make_prefix ../../../../qmp/PREFIX ../../../../qmp/VERSION single`

#
# Hack until we have with-qmp as standard
#
#
QMPSCRIPT=${QMP}/bin/qmp-config
DSLASH_CXXFLAGS=`${QMPSCRIPT} --cflags`
DSLASH_LDFLAGS=`${QMPSCRIPT} --ldflags`
DSLASH_LIBS=`${QMPSCRIPT} --libs`

 ../../../bagel_wilson_dslash/configure --prefix=${PREFIX} \
    --enable-target-cpu=noarch \
    --enable-comms=qmp \
    --enable-allocator=malloc \
    --enable-precision=double \
    --with-bagel=${BAGEL} \
     CXXFLAGS="${DSLASH_CXXFLAGS}" \
     CFLAGS="${DSLASH_CXXFLAGS}" \
     ASFLAGS="" \
     LDFLAGS="${DSLASH_LDFLAGS}" \
     LIBS="${DSLASH_LIBS}"
