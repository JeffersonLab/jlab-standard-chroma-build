#!/bin/bash
# $Id: build.sh,v 1.2 2006-02-24 16:24:59 bjoo Exp $
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
   echo "Usage: $0 <arch>"
   exit 1;
fi

arch=$1
modules=""
shift
while [ $# != 0 ];
do
  modules=$modules" "$1
  shift
done

echo $arch
if [ "X${modules}X" == "XX" ];
then
#
#  No list of modules given select defaults
  case $arch in
  gigE)
	modules="qmp-mvia-mesh qdp++ chroma"
	;;
  gm|ib-mpi|single)
	modules="qmp qdp++ chroma"
	;;
  scalar)
	modules="qdp++ chroma"
 	;;
  *)
	echo Unsupported architecture ${arch}
	exit 1;
 	;;
  esac
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

    logfile=$logdir/$module/$build/${action_name}_$now

    echo Performing action: $arch $module $build ${action_name}

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

    moduledir=$checkdir/$module

    # Check out new code

    srcdir=$moduledir/$module
    
    cd $moduledir
    now=`date +"%F_%H.%M_%Z"`
    if ! [ -d $logdir/${module} ]
    then
        mkdir -p $logdir/${module}
    fi

    # Deal with the checkout 
    if ! [ -d ${module} ]
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
        action="cvs -d :pserver:anonymous@cvs.jlab.org:/group/lattice/cvsroot checkout -P ${version_flag} ${module} "
        build=""
        perform_action
        [ $? -eq 0 ] || continue
    fi
    
    # Build the code
    for build in `builddirs`
    do

        # Configure

        builddir=$moduledir/$build/build
        cd $builddir

        if ! [ -d $logdir/$module/$build ] 
	then	
	    mkdir -p $logdir/$module/$build
        fi

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

        if [ $module == "chroma" ]
        then
	    # Skip regressions on IB - dont know how to do the running
	    # Need to generalise system to be able to launch mpi jobs
	    # As regressions
	    case $build in
		scalar|scalar-double|parscalar-single|parscalar-double)
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
	action="perl $checkdir/link $module"
	perform_action
	[ $? -eq 0 ] || continue

	cd ..
	rm -r link

    done	# loop over builds
		
done   # loop over modules


# Tidy up - but do not uninstall.

for module in $modules
do
    moduledir=$checkdir/$module
    for build in `builddirs`
    do
       cd $moduledir/$build/build
       gmake -k distclean &> /dev/null	
       rm -rf $moduledir/$module
    done
done

# Remove old logfiles

find $logdir -type f -mtime +14 -exec rm '{}' ';'
finishmail
