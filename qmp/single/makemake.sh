# $Id: makemake.sh,v 1.1 2006-02-24 02:59:09 bjoo Exp $

# Write a simple makefile using the module's config script.

if [ $# -ne 2 ]
then 
    echo "Usage: $0 src-directory build-directory"
    exit 1
fi

module=qmp
srcdir=$1
builddir=$2

config=../install/bin/$module-config
if [ ! -f $config ] 
then
    echo "Cannot find $config"
    exit 1
fi

if [ ! -d $srcdir ]
then 
    echo "Cannot find source directory $srcdir"
    exit 1;
fi

if [ -d $builddir ] 
then
    rm -r $builddir
fi

mkdir -p $builddir


echo CC = `$config --cc`          >  $builddir/Makefile
echo LDFLAGS = `$config --ldflags`>> $builddir/Makefile
echo CPPFLAGS = `$config --cflags`>> $builddir/Makefile
echo CFLAGS = `$config --copts`   >> $builddir/Makefile
echo LIBS = `$config --libs`      >> $builddir/Makefile

echo "VPATH = $PWD/$srcdir"  	  >> $builddir/Makefile
echo 'OBJ = $(BIN).o'  	  >> $builddir/Makefile
echo '${BIN}: ${OBJ}'      	  >> $builddir/Makefile
printf "\t\${CC} -o \$@ \${OBJ} \${LDFLAGS} \${LIBS}\n" >> $builddir/Makefile

