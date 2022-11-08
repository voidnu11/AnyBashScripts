#!/bin/bash

print() {
    printf "%s%s%s%s = %s%s%s%s\n"\
            "$s03_p1" "$s03_p2" "$1" "\e[0m"\
            "$s03_p3" "$s03_p4" "$2" "\e[0m"
}

if [[ $1 == "hostname" ]] ; then

    print "HOSTNAME" "`hostname`"

elif [[ $1 == "tz" ]] ; then

    print "TIMEZONE" "`cat /etc/timezone && date +"UTC %Z"`"

elif [[ $1 == "os" ]] ; then

    os_distrib=`cat /etc/os-release | awk '/^ID=/' | grep -oP "(?<=ID\=).*$"`
    os_version=`cat /etc/os-release | awk '/^VERSION_ID=/' | grep -oP "(?<=VERSION_ID\=).*"`
    print "OS" "$os_distrib $os_version"

elif [[ $1 == "user" ]] ; then

    print "USER" "`whoami`"

elif [[ $1 == "date" ]] ; then

    print "DATE" "`date +"%d %b %Y %T"`"

fi
