#!/bin/bash

printf "TOP %d %s\n" $1 "files of maximum size arranged in descending order (path, size and type):"

i=0
find $2 -type f -exec du -h {} + | sort -hr | head -$1 | while read line; do
    ((i++))
    size=`echo $line | awk '{print $1}'`
    file=`echo $line | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
    type=`file --mime-type "$file" | grep -oP "(?<=\: ).*$"`
    printf "  %d - %s, %s, %s\n" $i "$file" "$size" "$type"
done
