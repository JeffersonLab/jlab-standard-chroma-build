#!/bin/bash
# $Id: build.sh,v 1.4 2006-04-18 20:08:00 bjoo Exp $
#
#  Original author: Zbigniew Sroczynski
#  See README_buildtest.sh for more information.
#

cd `dirname $0`
checkdir=$PWD
logdir=$checkdir/logs

# Interpret arguments. $1 is the architecture
# The remaining arguments are module names to build for this architecture
#
if [ $# -lt 1 ];
then 
   echo "Usage: $0 -a <arch>"
   echo "or"
   echo "$0 <module list>"
   exit 1;
fi


if [ "X${1}X" == "X-aX" ];
then
    if [ $# -ne 2 ];
    then 
      echo "Usage: $0 -a <arch>"
      echo "or"
      echo "$0 <module list>"
      exit 1;
    fi
    arch=$2
    
    case $arch in
	gigE)
	  modules="\
	      qmp-mvia-mesh/qmp-mvia-mesh \
	      qdp++/${arch}/parscalar-gigE \
	      qdp++/${arch}/parscalar-gigE-double \
	      chroma/${arch}/parscalar-gigE \
	      chroma/${arch}/parscalar-gigE-double \
	      chroma/${arch}/parscalar-gigE-noavp"
	;;
	ibg2-mpi)
          modules="\
	      qmp/ibg2-mpi/ibg2-mpi \
	      qdp++/${arch}/parscalar-ibg2-mpi \
	      qdp++/${arch}/parscalar-ibg2-mpi-double \
	      chroma/${arch}/parscalar-ibg2-mpi \
	      chroma/${arch}/parscalar-ibg2-mpi-double \
	      chroma/${arch}/parscalar-ibg2-mpi-noavp"
	  ;;
	ib-mpi)
	  modules="\
	      qmp/ib-mpi/ib-mpi \
	      qdp++/${arch}/parscalar-ib-mpi \
	      qdp++/${arch}/parscalar-ib-mpi-double \
	      chroma/${arch}/parscalar-ib-mpi \
	      chroma/${arch}/parscalar-ib-mpi-double \
	      chroma/${arch}/parscalar-ib-mpi-noavp"
	  ;;
        gm)
  	  modules="\
	      qmp/gm/gm \
	      qdp++/${arch}/parscalar-gm \
	      qdp++/${arch}/parscalar-gm-double \
	      chroma/${arch}/parscalar-gm \
	      chroma/${arch}/parscalar-gm-double \
	      chroma/${arch}/parscalar-gm-noavp"
	  ;;
	single)
	  modules="\
	      qmp/single/single \
	      qdp++/${arch}/parscalar-single \
	      qdp++/${arch}/parscalar-single-double \
	      chroma/${arch}/parscalar-single \
	      chroma/${arch}/parscalar-single-double \
	      chroma/${arch}/parscalar-single-noavp"
	  ;;
	scalar)
	  modules="\
	      qdp++/${arch}/scalar \
	      qdp++/${arch}/scalar-double \
	      chroma/${arch}/scalar \
	      chroma/${arch}/scalar-double"
	  ;;
	*)
	  echo Unsupported architecture ${arch}
	  exit 1;
	  ;;
	esac
else 
    modules=""
    while [ $# != 0 ];
    do
      modules=$modules" "$1
      shift
    done
fi

echo Building Modules:  $modules


# Send mail to these addresses
# In case of failure mail everyone on this list  
failmailto="bjoo@jlab.org"

# In case of success send to archive list only
successmailto="bjoo@jlab.org"

# Send mail if something goes wrong

failmail(){
    cat $logfile | mail -s "buildtest: $module $build $1 failed" $failmailto &> /dev/null
}

# Send mail if something goes right
# NOTE: had to comment this out since the list is null. Should have a
# check instead.

successmail(){
   echo Not doing this anymore > /dev/null
}

# Send mail to indicate the tests are all done -- send to everyone
finishmail(){
    mail -s "buildtest: Build Complete" $failmailto &> /dev/null <<EOF
All tests done. 
EOF
}

# Identify the subdirectories for the different types of build

builddirs(){
    ls $moduledir/$arch/*/build/configure.sh | sed -e s,$moduledir/,, -e s,/build/configure.sh,,
}


perform_action(){

    logfile=$logdir/$package/${arch}/${build}/${action_name}_$now

    echo Performing action: $arch $package $build ${action_name}

    uname -a > $logfile
    echo '------------------------' >> $logfile

    $action >> $logfile 2>&1
    local status=$?


    if [ $status -ne 0 ]
    then
 	echo ... failed	
    	failmail $action_name 
    else
	echo ... succeeded
    	successmail $action_name 
    fi 

    gzip $logfile
    return $status 
}

for module in $modules
do
    package=`echo $module | cut -f1 -d/`
    arch=`echo $module | cut -f2 -d/`
    build=`echo $module | cut -f3 -d/`
    echo Package is: $package
    echo Aarch is $arch
    echo Build is: ${build}

    moduledir=$checkdir/$package

    # Check out new code

    srcdir=$moduledir/$package
    
    cd $moduledir
    now=`date +"%F_%H.%M_%Z"`
    if ! [ -d $logdir/${package}/${arch}/${build} ]
    then
        mkdir -p $logdir/${package}/${arch}/${build}
    fi

    # Deal with the checkout 
    if ! [ -d ${package} ]
    then 
	if [ -f ./VERSION ]
        then 
	   version_tag=`cat VERSION`
           version_flag="-r ${version_tag}"
	   echo Checking Out Version: ${version_tag}
        else 
	   version_flag=""
	   echo Checking Out Head Revision
        fi 
        action_name="checkout"
        action="cvs -d :pserver:anonymous@cvs.jlab.org:/group/lattice/cvsroot checkout -P ${version_flag} ${package} "
	perform_action
        [ $? -eq 0 ] || continue
    fi
    
    # Build the code
    # Configure

    builddir=$moduledir/$arch/$build/build
    cd $builddir

    action_name="configure"
    action="sh configure.sh"
    perform_action
    [ $? -eq 0 ] || continue

    # Build 

    action_name="build"
    action="gmake -k"
    perform_action
    [ $? -eq 0 ] || continue

    # Check
    action_name="check"
    action="gmake -k check"
    perform_action
    [ $? -eq 0 ] || continue
	
    # XCheck

    if [ $package == "chroma" ]
    then
      # Skip regressions on IB - dont know how to do the running
      # Need to generalise system to be able to launch mpi jobs
      # As regressions
	case $build in
	    scalar|scalar-double|parscalar-single|parscalar-single-double)
	    action_name="xcheck"
	    action="gmake -k xcheck"
	    perform_action
	    ;;
	    *)
	    ;;
	esac
    fi 
	
    # Install
    action_name="install"
    action="gmake install"
    perform_action
    [ $? -eq 0 ] || continue

    # Link
	
    [ ! -d ../link ] && mkdir ../link
    cd ../link

    action_name="link"
    action="perl $checkdir/link $package"
    perform_action
    [ $? -eq 0 ] || continue
    
    cd ..
    rm -r link

    cd $moduledir
    version=`cat VERSION`
    prefix=`cat PREFIX`
    install_srcdir=${prefix}/${version}/src
    if [ ! -d ${install_srcdir} ]
    then
	echo Installing source for $package in ${install_srcdir}
	mkdir -p ${install_srcdir}
	cp -r ${package} ${install_srcdir}
    else 
	echo Sources already installed
    fi
done

# Remove old logfiles

find $logdir -type f -mtime +14 -exec rm '{}' ';'
finishmail
