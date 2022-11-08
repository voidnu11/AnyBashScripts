#!/bin/bash

source $2/data/cpu.sh
source $2/scripts/round_float.sh

STAT="`cat /proc/stat`"
CPUs=`echo "$STAT" | grep -c 'cpu*'`
for ((i=1; i < CPUs; i++)) {
  CPU=`echo "$STAT" | sed -n $((i+1))p`

  for ((n=0,col=9; n < 2; n++, col++)) {
    value=`echo $CPU | awk -v i="$col" '{ print $i }'`
    printf "node_cpu_guest_seconds_total{cpu=\"%d\",mode=\"%s\"} %s\n" \
           $((i-1)) "${MODE[$n]}" `_round_float $value\e-2 2` >> $1
  }
  for ((n=0,col=2; n < 8; n++, col++)) {
    value=`echo $CPU | awk -v i="$col" '{ print $i }'`
    printf "node_cpu_seconds_total{cpu=\"%d\",mode=\"%s\"} %s\n" \
           $((i-1)) "${MODE[$n]}" `_round_float $value\e-2 2` >> $1
  }
}
