#!/bin/bash

s05_begin=$(date +%s.%N)

if [[ $# != 1 ]]; then
	echo "Invalid input. Enter the path with one parameter."
	exit 1
fi

if [ ! -d $1 ] || [[ "${1: -1}" != "/" ]]; then
	echo "Invalid input. Wrong path!"
	exit 1
fi

bash scripts/print.sh $1

s05_end=`date +%s.%N`
s05_diff=`echo print $s05_end-$s05_begin | perl`
printf "Script execution time (in seconds) = %.2f\n" "$s05_diff"

