#!/bin/bash

print() {
    printf "%s%s%s%s = %s%s%.2f MB%s\n"\
            "$s03_p1" "$s03_p2" "$1" "\e[0m"\
            "$s03_p3" "$s03_p4" "$2" "\e[0m"
}

if [[ $1 == "used" ]] ; then

    print "SPACE_ROOT_USED" "`df / | awk '/\/$/ {print $3/1024}'`"

elif [[ $1 == "free" ]] ; then

    print "SPACE_ROOT_FREE" "`df / | awk '/\/$/ {print $4/1024}'`"

else

    print "SPACE_ROOT" "`df / | awk '/\/$/ {print $2/1024}'`"

fi

