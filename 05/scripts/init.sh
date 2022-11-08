#!/bin/bash

dirname=$1
filename=$2
filesize=$3
logfile=$4
freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
DATE=$(date +"%d%m%y")
path="/"

source scripts/dir_symArr.sh
while [ "1" ]; do
    if [ $freeSpace -lt $((1048576 + 1024 * $filesize)) ]; then break; fi
    # select random dir except *bin*
    for ((i=1; i <= $((1 + RANDOM % 10)); i++)); do
        directory=$(find "$path" -maxdepth 1 -type d -not \( -iname "bin" -o -iname "sbin" \) 2>/dev/null ! -path "$path" -printf "%f\n" | sort -R | head -n 1) 
        if [[ -z $directory ]]; then break; fi
        path=$path/$directory
    done <<< "$directory"
    path=`realpath $path`

    # generate random subdirs with files inside
    init_dir_symArr $dirname
    for ((i=0; i <= $((1 + RANDOM % 100)); i++)); do
        if [ $freeSpace -lt $((1048576 + 1024 * $filesize)) ]; then break; fi
        DNAME=`get_dir_symArr`
        path="$path/$DNAME`echo "_$DATE"`"
        mkdir $path
        printf "%s\t%s\n" "$path" "$DATE" >> $logfile
        bash scripts/gen_files.sh $path $filename $filesize $logfile
        update_dir_symArr $((${#DNAME}+1))
        freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
    done
    path="/"
done
echo "1GB of free space left on the file system."

