#!/bin/bash

printf "TOP %d %s\n" $1 "folders of maximum size arranged in descending order (path and size):"

i=0
du -h $2 | sort -hr | head -$(($1+1)) | while read line; do
    ((i++))
    if [[ $i == 1 ]]; then
        continue
    fi
    size=`echo $line | awk '{print $1}'`
    dir=`echo $line | awk '{$1=""; print $0}'`
    printf "  %d -%s, %s\n" $((i-1)) "$dir" "$size"
done
