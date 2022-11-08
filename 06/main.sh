#!/bin/bash

if ! [[ $1 =~ ^[1-3]$ ]]; then
    echo "Invalid parameter. Enter one of 1-3."; exit 1
elif [[ $1 == "1" ]]; then
    bash scripts/clean_by_log.sh
elif [[ $1 == "2" ]]; then
    bash scripts/clean_by_datetime.sh
elif [[ $1 == "3" ]]; then
    bash scripts/clean_by_namemask.sh
fi

