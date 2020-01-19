#!/bin/bash

if [ $# != 1 ] ; then
	echo "command:" $0 [village_number]
	exit 1
fi
if [ ! -d org/$1 ] ; then
	echo "original village data " $1 "is not registered in ./org/ ."
	exit 1
fi

mkdir -p sample/$1

function create_html() {
        # $1 src file
        # $2 dst file
    if [ -s $1 ] ; then
        echo "<html>"                                                                                    > $2
        echo "<head>"                                                                                   >> $2
        echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"                  >> $2
        echo "</head>"                                                                                  >> $2
        echo "<body link=\"#ffcc00\" vlink=\"#ffcc00\" alink=\"#ffcc00\">"                              >> $2
	echo "<form action=\"$(basename $2)\" method=\"POST\" name=\"form\">"                                       >> $2
	iconv.exe -f CP932 -t UTF-8 $1 | awk '{print substr($0, index($0, ":\"")+2)}' | sed -e 's/"$//' >> $2
        echo "</form>"                                                                                  >> $2
        echo "</body>"                                                                                  >> $2
        echo "</html>"                                                                                  >> $2
    else
        echo "create $2 failed. $1 is not found."
    fi
}

for i in $( seq 1 20 ) ; do
    create_html org/$1/${i}d.txt sample/$1/${i}d.html
    create_html org/$1/${i}n.txt sample/$1/${i}n.html
done
create_html org/$1/ep.txt sample/$1/ep.html
