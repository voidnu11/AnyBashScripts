#!/bin/bash

lines=(
    "`bash scripts/sys.sh hostname`"
    "`bash scripts/sys.sh tz`"
    "`bash scripts/sys.sh user`"
    "`bash scripts/sys.sh os`"
    "`bash scripts/sys.sh date`"
    "`bash scripts/uptime.sh`"
    "`bash scripts/uptime.sh sec`"
    "`bash scripts/network.sh ip`"
    "`bash scripts/network.sh mask`"
    "`bash scripts/network.sh gw`"
    "`bash scripts/ram.sh total`"
    "`bash scripts/ram.sh used`"
    "`bash scripts/ram.sh free`"
    "`bash scripts/space.sh`"
    "`bash scripts/space.sh used`"
    "`bash scripts/space.sh free`"
)
lines_count=${#lines[*]}

for ((i = 0; i < lines_count; i++)) ; do
    echo -e ${lines[i]}
done

