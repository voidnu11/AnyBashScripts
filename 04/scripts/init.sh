#!/bin/bash

entryDir=$1
dirCount=$2
dirname=$3
fileCount=$4
filename=$5
filesize=$6
freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
DATE=$(date +"%d%m%y")
path=`realpath $entryDir`
logfile="`realpath "."`/log_`date +"%d%m%y_%H_%M_%S"`.txt"

source scripts/dir_symArr.sh
init_dir_symArr $dirname
while [[ $dirCount != 0 ]] && [ $freeSpace -ge $((1048576 + $size)) ]; do
    DNAME=`get_dir_symArr`
    path="$path/$DNAME`echo "_$DATE"`"
    mkdir $path
    printf "%s\t%s\n" "$path" "$DATE" >> $logfile
    bash scripts/gen_files.sh $path $fileCount $filename $filesize $logfile
    update_dir_symArr $((${#DNAME}+1))
    ((dirCount--))
    freeSpace=`df -k / | tail -n 1 | awk '{print $4;}'`
done

if [[ $dirCount != 0 ]]; then
    echo "1GB of free space left on the file system."
fi

