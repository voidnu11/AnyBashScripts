#!/bin/bash

declare -a file_symArr=()
file_symArrPos=0

init_file_symArr() {
    file_symArr=()
    ifsa_name=$1
    for ((i=0; i < ${#ifsa_name}; i++)); do
        file_symArr+=(${ifsa_name:$i:1})
    done
    update_file_symArr 5
}

get_file_symArr() {
    echo ${file_symArr[@]} | sed 's/ //g'
}

update_file_symArr() {
    ufsa_name=`get_file_symArr`
    for ((i=${#ufsa_name}; i < $1; i++)); do
        str=${file_symArr[file_symArrPos]}
        ufsa_char=${str:0:1}
        file_symArr[file_symArrPos]="${file_symArr[file_symArrPos]}$ufsa_char"
        ((file_symArrPos++))
        if [ $file_symArrPos -ge ${#file_symArr[@]} ]; then
            file_symArrPos=0
        fi
    done
}
