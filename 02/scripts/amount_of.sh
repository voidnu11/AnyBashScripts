#!/bin/bash

if [[ $1 == "dir" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c ^d`"

elif [[ $1 == "files" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c ^-`"

elif [[ $1 == "conf" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c '.*[.]conf'`"

elif [[ $1 == "txt" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c '.*[.]txt'`"

elif [[ $1 == "exe" ]] ; then

    printf "%s" "`find $2 -type f -executable | wc -l`"

elif [[ $1 == "log" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c '.*[.]log'`"

elif [[ $1 == "arch" ]] ; then

    printf "%s" "`find $2 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" -o -name "*.tar.gz" | wc -l`"

elif [[ $1 == "links" ]] ; then

    printf "%s" "`ls -lR $2 | grep -c ^l`"

fi
