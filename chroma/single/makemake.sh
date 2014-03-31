# $Id: makemake.sh,v 1.1 2006-02-24 02:59:08 bjoo Exp $

# Write a simple makefile using the module's config script.

if [ $# -ne 2 ]
then 
    echo "Usage: $0 src-directory build-directory"
    exit 1
fi

module=chroma
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

[ -d $builddir ] && rm -r $builddir


mkdir -p $builddir


echo CXX = `$config --cxx`          >  $builddir/Makefile
echo LDFLAGS = `$config --ldflags`>> $builddir/Makefile
echo CXXFLAGS = `$config --cxxflags`>> $builddir/Makefile
echo CFLAGS = `$config --cxxflags`>> $builddir/Makefile
echo LIBS = `$config --libs`      >> $builddir/Makefile

echo "VPATH = $PWD/$srcdir" 	  >> $builddir/Makefile
echo 'OBJ = $(BIN).o'  	  >> $builddir/Makefile
echo '${BIN}: ${OBJ} '      	  >> $builddir/Makefile
printf "\t\${CXX} -o \$@ \${OBJ}  \${LDFLAGS} \${LIBS}\n" >> $builddir/Makefile



