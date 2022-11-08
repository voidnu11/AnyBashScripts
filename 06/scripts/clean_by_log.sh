#!/bin/bash

declare -a pathsArr=(`cat ../02/log*.txt | awk '{print $1}'`)

for ((i=${#pathsArr[@]}; i >= 0; i--)); do
    if [[ -f ${pathsArr[i]} ]]; then
        rm -f ${pathsArr[i]} 2>/dev/null
    elif [[ -d ${pathsArr[i]} ]]; then
        rm -rf ${pathsArr[i]} 2>/dev/null
    fi
done

rm -f ../02/log*.txt
