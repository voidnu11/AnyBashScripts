#!/bin/bash

s02_begin=$(date +%s.%N)
TIME_S=$(date +"%H:%M:%S")
logfile="`realpath "."`/log_`date +"%d%m%y_%H_%M_%S"`.txt"
temp="`realpath "."`/.temp"
if [[ $# != 3 ]]; then
    echo "Invalid number of parameters. Should be 3."; exit 1
fi

if ! [[ $1 =~ ^[a-zA-Z]{1,7}$ ]]; then
    echo "Invalid input in parameter 1."
    echo "Only Latin letters from 1 to 7 are allowed"; exit 1
fi

if ! [[ $2 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]]; then
    echo "Invalid input in parameter 2."
    echo "Only Latin letters from 1 to 7 are allowed and in extension from 1 to 3 characters"; exit 1
fi

if ! [[ $3 =~ ^[0-9]{1,3}(Mb)?$ ]]; then
    echo "Invalid input in parameter 3."
    echo "Example: 100Mb or 100."; exit 1
fi

size=`echo $3 | tr -dc '0-9'`
if  [ $size -gt 100 ]; then
    echo "Invalid input in parameter 3."
    echo "Size in kb must be no more than 100Mb."; exit 1
fi

bash scripts/init.sh $1 $2 $size $temp

s02_end=`date +%s.%N`
s02_diff=`echo print $s02_end-$s02_begin | perl`
TIME_E=$(date +"%H:%M:%S")
printf "%s\n%s\n%s\n\n"\
       "Time start: $TIME_S"\
       "Time end: $TIME_E"\
       "Execution time: $s02_diff" >> $logfile
cat $temp >> $logfile && rm -f $temp
printf "Script execution time (in seconds) = %.2f\n" "$s02_diff"


