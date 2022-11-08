#!/bin/bash

declare -a filesArr=()
declare -a dirsArr=()

echo "Insert >CHARS< >DATE<"
echo "Example: oeaz 180922"
read CHARS DATE

filesArr=(`find /home/void/dev/ -regextype posix-extended -regex "^.*[$CHARS]_$DATE.*" -type f`)
dirsArr=(`find /home/void/dev/ -regextype posix-extended -regex "^.*[$CHARS]_$DATE*" -type d`)

for ((i=${#filesArr[@]}; i >= 0; i--)); do
    rm -f ${filesArr[i]} 2>/dev/null
done

for ((i=${#dirsArr[@]}; i >= 0; i--)); do
    rm -f ${dirsArr[i]} 2>/dev/null
done

