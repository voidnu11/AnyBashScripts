#!/bin/bash

print() {
    printf "%s%s%s%s = %s%s%s%s\n"\
            "$s03_p1" "$s03_p2" "$1" "\e[0m"\
            "$s03_p3" "$s03_p4" "$2" "\e[0m"
}

if [[ $1 == "ip" ]] ; then

    print "IP" "`hostname -I | awk '{print $1}'`"

elif [[ $1 == "mask" ]] ; then

    print "MASK" "`netstat -rn | awk 'NR==4{print $3}'`"

elif [[ $1 == "gw" ]] ; then

    print "GATEWAY" "`ip r | awk '/default via / {print $3}'`"

else

    printf "Use an argument to get information.\n"
    printf "\tip - display on any of the network interfaces\n"
    printf "\tmask - display network mask of any of the network interfaces\n"
    printf "\tgw - display dafault gateway\n"

fi
