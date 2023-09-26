#!/bin/bash
#check for arguments
if [ -z "$1" ]
  then
      printf "Usage: ./downloadall.sh i.supa.codes(url)\n"
    exit 1
fi

sed "s/^/$1\//g" -- *.txt | xargs wget -P downloaded