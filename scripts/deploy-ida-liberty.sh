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

libertypath=$2
serversdir=$(dirname "$2")
idaserver=$(basename $libertypath)

scriptdir=$(pwd)

echo "Unzip ida-web.war in ${zippath} to script's directory."
unzip -o -j $zippath "build/ida-web.war"

echo "Goto liberty bin directory"
cd $serversdir/../../
libertydir=$(pwd)

cd bin
bindir=$(pwd)

echo "Stop liberty server"
./server stop $idaserver

warfile="${scriptdir}/ida-web.war"
appdir="${libertydir}/usr/servers/${idaserver}/apps/"

cd $appdir
if [ -f ida-web.war ]; then
	timestamp=$(date +%s)
  echo "Backup previous war file to ${appdir}ida-web.war.${timestamp}"
  mv "${appdir}ida-web.war" "${appdir}ida-web.war.${timestamp}"
fi

echo "Move new war file to liberty"
mv $warfile $appdir

echo "Start liberty server"
cd $bindir
./server start $idaserver

echo "End"