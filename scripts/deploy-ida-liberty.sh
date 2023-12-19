#!/bin/bash
echo "Input parameters, IDA zip path: $1, Liberty path(till server name): $2"
#verify input parameters
if [ ! -f $1 ]; then
	echo "Error: Input parameter IDA zip $1 doesn't exist, please check."
	exit 1
fi

if [ ! -d $2 ]; then
    echo "Error: Input parameter Liberty path(till server name) $2 doesn't exist, please check."
	exit 1
fi

#process input parameters
zippath=$1
filename=$(basename $zippath)
filenamenoext="${filename%.*}"
zipdir=$(dirname "$1")

if [[ "$zippath" = /* ]];then
  targetdir="${zipdir}/${filenamenoext}"
else
  targetdir="$(pwd)/$filenamenoext"
fi

libertypath=$2
serversdir=$(dirname "$2")
idaserver=$(basename $libertypath)

if [ -d "$targetdir" ]; then
  echo "$targetdir already exists, deleting it."
  rm -Rf $targetdir;
fi

echo "Unzip $zippath to $targetdir."
unzip -q $zippath -d $targetdir

echo "Goto liberty bin directory"
cd $serversdir/../../
libertydir=$(pwd)

cd bin
bindir=$(pwd)

echo "Stop liberty server"
./server stop ${idaserver}

wardir="${targetdir}/build/ida-web.war"
appdir="${libertydir}/usr/servers/${idaserver}/apps/"

cd $appdir
timestamp=$(date +%s)
echo "Backup previous war file to ${appdir}ida-web.war.${timestamp}"
mv "$appdir/ida-web.war" "$appdir/ida-web.war.$timestamp"

echo "Copy new war file to liberty"
cp $wardir $appdir

echo "Start liberty server"
cd $bindir
./server start $idaserver

echo "End"