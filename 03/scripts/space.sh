#!/bin/bash

source $2/data/space.sh

declare -a DF_A=()
MTAB=`cat /etc/mtab | awk -f $2/scripts/sort.awk`
FS_COUNT=`echo "$MTAB" | grep -c ''`

for ((i=0; i < $FS_COUNT; i++)) {
  MPOINT=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $2 }'`
  DF_A[$i]=`df -a -B1 | grep "${MPOINT}$"`
}

# available for user
for ((i=0; i < FS_COUNT; i++)) {
  DEVICE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $1 }'`
  FSTYPE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $3 }'`
  MPOINT=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $2 }'`
  VALUE=`echo "${DF_A[$i]}" | awk '{ print $4 }'`
  printf "%s{device=\"%s\",fstype=\"%s\",mountpoint=\"%s\"} %g\n" \
         "${NODE[0]}" "$DEVICE" "$FSTYPE" "$MPOINT" "$VALUE" >> $1
}

# size
for ((i=0; i < FS_COUNT; i++)) {
  DEVICE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $1 }'`
  FSTYPE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $3 }'`
  MPOINT=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $2 }'`
  VALUE=`echo "${DF_A[$i]}" | awk '{ print $2 }'`
  printf "%s{device=\"%s\",fstype=\"%s\",mountpoint=\"%s\"} %g\n" \
         "${NODE[1]}" "$DEVICE" "$FSTYPE" "$MPOINT" "$VALUE" >> $1
}

# free for root
for ((i=0; i < FS_COUNT; i++)) {
  DEVICE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $1 }'`
  FSTYPE=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $3 }'`
  MPOINT=`echo "$MTAB" | sed -n $(($i+1))p | awk '{ print $2 }'`
  VALUE=`printf '%s' $(($(stat -f --format='%f*%S' ${MPOINT})))`
  printf "%s{device=\"%s\",fstype=\"%s\",mountpoint=\"%s\"} %g\n" \
         "${NODE[2]}" "$DEVICE" "$FSTYPE" "$MPOINT" "$VALUE" >> $1
}
