#!/bin/bash

path=$1
fileCount=$2
extension="${3##*.}"
filename="${3%.*}"
size=$4
log_file=$5
DATE=$(date +"%d%m%y")
freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`

source scripts/file_symArr.sh

init_file_symArr $filename
while [[ $fileCount != 0 ]]; do
    if [ $freeSpace -lt $((1048576 + $size)) ]; then break; fi
    FNAME=`get_file_symArr`
    FILE="$FNAME`echo "_$DATE"`.$extension"
    if [ ${#FILE} -gt 255 ]; then break; fi
    yes "0" | head -c $((1024 * $size)) > "$path/$FILE"
    printf "%s\t%s\t%skb\n" "$path/$FILE" "$DATE" "$size" >> "$log_file"
    update_file_symArr $((${#FNAME}+1))
    ((fileCount--))
    freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
done

