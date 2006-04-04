
function make_prefix() {
    PREFIX_FILE=$1
    VERSION_FILE=$2
    ARCH_STRING=$3

    PREFIX_STRING=`cat ${PREFIX_FILE}`
    VERSION_STRING=`cat ${VERSION_FILE}`

    PREFIX=${PREFIX_STRING}/${ARCH_STRING}/${VERSION_STRING}
    echo ${PREFIX}
}

function clean_dir()  {
    DIR=$1

    if [ "X${DIR}X" != "XX" ];
    then 
	echo Cleaning ${DIR}
 	rm -rf ${DIR}
    	return 0;
    else
        echo NOT CLEANING
    fi

    return 1
}
