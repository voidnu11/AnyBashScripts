#!/bin/bash

print() {
    printf "%s%s%s%s = %s%s%s%s\n"\
            "$s03_p1" "$s03_p2" "$1" "\e[0m"\
            "$s03_p3" "$s03_p4" "$2" "\e[0m"
}

if [[ $1 == "sec" ]] ; then

    print "UPTIME_SEC" "`cat /proc/uptime | awk '{print int ($1)}'`"
    exit 1

fi

print "UPTIME" "`uptime -p | awk '{$1=""; print $0}'`"
