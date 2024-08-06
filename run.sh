#!/usr/bin/env bash
#

if [ true ]
then
  while [ true ]
  do 
    sleep 5
    echo still running
  done
fi
CMDDEF="/openvibe-3.5.0-src/dist/Release/openvibe-designer.sh"

if [ -z $1 ]
then
  CMD=$CMDDEF
else
  CMD=$1
fi

$CMD


