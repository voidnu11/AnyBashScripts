#!/bin/bash

printf "TOP %d %s\n" $1 "executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

i=0
find $2 -type f -executable -exec du -h {} + | sort -hr | head -$1 | while read line; do
    ((i++))
    size=`echo $line | awk '{print $1}'`
    file=`echo $line | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
    md5=`md5sum "$file" | awk '{print $1}'`
    printf "  %d - %s, %s, %s\n" $i "$file" "$size" "$md5"
done
