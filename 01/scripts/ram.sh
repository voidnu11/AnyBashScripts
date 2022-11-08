#!/bin/bash

print() {
    printf "%s%s%s%s = %s%s%.3f GB%s\n"\
            "$s03_p1" "$s03_p2" "$1" "\e[0m"\
            "$s03_p3" "$s03_p4" "$2" "\e[0m"
}

if [[ $1 == "total" ]] ; then

    print "RAM_TOTAL" "`free | awk '/Mem:/{print $2/1024/1024}'`"

elif [[ $1 == "used" ]] ; then

    print "RAM_USED" "`free | awk '/Mem:/{print $3/1024/1024}'`"

elif [[ $1 == "free" ]] ; then

    print "RAM_FREE" "`free | awk '/Mem:/{print $4/1024/1024}'`"

else

    printf "Use an argument to get information.\n"
    printf "\ttotal - display total available memory\n"
    printf "\tused - display used amount of available memory\n"
    printf "\tfree - display free memory available\n"

fi
