#!/bin/bash

source $2/data/memory.sh

MEMINFO="`cat /proc/meminfo | sort -n`"
NODES=${#NODE[@]}
for ((i=0; i < NODES; i++)) {
  value=`echo "$MEMINFO" | sed -n $((i+1))p | awk -F'[^0-9]*' '$0=$2'`
  printf "%s %.7g\n" "${NODE[$i]}" $((value * 1024)) >> $1
}
