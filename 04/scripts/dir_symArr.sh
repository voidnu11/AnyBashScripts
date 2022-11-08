#!/bin/bash

declare -a dir_symArr=()
dir_symArrPos=0

init_dir_symArr() {
    dir_symArr=()
    idsa_name=$1
    for ((i=0; i < ${#idsa_name}; i++)); do
        dir_symArr+=(${idsa_name:$i:1})
    done
    update_dir_symArr 4
}

get_dir_symArr() {
    echo ${dir_symArr[@]} | sed 's/ //g'
}

update_dir_symArr() {
    udsa_name=`get_dir_symArr`
    for ((i=${#udsa_name}; i < $1; i++)); do
        str=${dir_symArr[dir_symArrPos]}
        udsa_char=${str:0:1}
        dir_symArr[dir_symArrPos]="${dir_symArr[dir_symArrPos]}$udsa_char"
        ((dir_symArrPos++))
        if [ $dir_symArrPos -ge ${#dir_symArr[@]} ]; then
            dir_symArrPos=0
        fi
    done
}
