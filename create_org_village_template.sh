#!/bin/bash

if [ $# != 1 ] ; then
	echo "command:" $0 [village_number]
	exit 1
fi

mkdir -p org/$1

for i in $( seq 1 10 ) ; do
	touch org/$1/${i}d.txt
	touch org/$1/${i}n.txt
done
touch org/$1/ep.txt
