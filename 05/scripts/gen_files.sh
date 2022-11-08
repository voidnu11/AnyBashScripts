#!/bin/bash

path=$1
extension="${2##*.}"
filename="${2%.*}"
size=$3
log_file=$4
DATE=$(date +"%d%m%y")
freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`

source scripts/file_symArr.sh

init_file_symArr $filename
for ((i=0; i <= $((1 + RANDOM % 100)); i++)); do
    if [ $freeSpace -lt $((1048576 + 1024 * $size)) ]; then break; fi
    FNAME=`get_file_symArr`
    FILE="$FNAME`echo "_$DATE"`.$extension"
    if [ ${#FILE} -gt 255 ]; then break; fi
    yes "0" | head -c $((1024 * 1024 * $size)) > "$path/$FILE"
    printf "%s\t%s\t%sMb\n" "$path/$FILE" "$DATE" "$size" >> "$log_file"
    update_file_symArr $((${#FNAME}+1))
    freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
done

