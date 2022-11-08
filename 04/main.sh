#!/bin/bash

if [[ $# != 6 ]]; then
    echo "Invalid number of parameters. Should be 6."; exit 1
fi

if [ ! -d $1 ]; then
    echo "Invalid path."; exit 1
fi
path=`realpath $1`

if ! [[ $2 =~ ^[0-9]+$ ]] || ! [[ $4 =~ ^[0-9]+$ ]]; then
    echo "Invalid input in parameter 2 or 4."
    echo "In parameters 2 4 6 allowed only numbers."; exit 1
fi

if ! [[ $3 =~ ^[a-zA-Z]{1,7}$ ]]; then
    echo "Invalid input in parameter 3."
    echo "Only Latin letters from 1 to 7 are allowed"; exit 1
fi

if ! [[ $5 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]]; then
    echo "Invalid input in parameter 5."
    echo "Only Latin letters from 1 to 7 are allowed and in extension from 1 to 3 characters"; exit 1
fi

if ! [[ $6 =~ ^[0-9]{1,3}(kb)?$ ]]; then
    echo "Invalid input in parameter 6."
    echo "Example: 100kb or 100."; exit 1
fi

size=`echo $6 | tr -dc '0-9'`
if  [ $size -gt 100 ]; then
    echo "Invalid input in parameter 6."
    echo "Size in kb must be no more than 100kb."; exit 1
fi

bash scripts/init.sh $path $2 $3 $4 $5 $size

