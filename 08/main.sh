#!/bin/bash

if [ $# != 1 ]; then
	echo "Script takes 1 parameter."; exit 1
fi

if ! [[ $1 =~ ^[1-4]$ ]]; then
	echo "Invalid parameter. Enter one of 1-4"; exit 1
fi

declare -a logs=(`find ../04 -iname "access_log*.log" -type f`)

logs_count=${#logs[@]}
if [[ $1 == "1" ]]; then
    for ((i = 0; i < $logs_count; i++)); do awk -f scripts/sort1.awk "${logs[$i]}" >> "sorted_1_`basename ${logs[$i]}`"; done
elif [[ $1 == "2" ]]; then
    for ((i = 0; i < $logs_count; i++)); do awk -f scripts/sort2.awk "${logs[$i]}" >> "sorted_2_`basename ${logs[$i]}`"; done
elif [[ $1 == "3" ]]; then
    for ((i = 0; i < $logs_count; i++)); do awk -f scripts/sort3.awk "${logs[$i]}" >> "sorted_3_`basename ${logs[$i]}`"; done
elif [[ $1 == "4" ]]; then
    for ((i = 0; i < $logs_count; i++)); do awk -f scripts/sort4.awk "${logs[$i]}" >> "sorted_4_`basename ${logs[$i]}`"; done
fi

