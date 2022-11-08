#!/bin/bash

if [ $# != 0 ]; then
	echo "Script does not accept parameters"; exit 1
fi

source data/response_codes.sh
source data/methods.sh
source data/agents.sh
source data/urls.sh

for ((day=1; day < 6; day++ )); do
    log_lines=`shuf -n1 -i 100-1000`
    day_begin=`date -u -d "2022-06-0$day 00:15:00" +"%s"`
    day_end=`date -u -d "2022-06-0$day 23:59:59" +"%s"`
    log_step=$(( (day_end - day_begin) / log_lines ))
    logfile="`realpath "."`/access_log_`date -u -d @$day_begin +"%d_%m_%y"`.log"
    while [ $log_lines -ge 0 ]; do
        day_begin=$(( day_begin + (log_step - (RANDOM % 15)) ))
        printf "%s - - [%s +0000] \"%s %s HTTP/2\" %s %s \"-\" %s\n"\
            "`shuf -n1 -i 1-255`.`shuf -n1 -i 1-255`.`shuf -n1 -i 1-255`.`shuf -n1 -i 1-255`"\
            "`date -u -d @$day_begin +"%d/%b/%Y:%H:%M:%S"`"\
            "`get_random_method`" "`get_random_url`" "`get_random_code`" "`shuf -n1 -i 10-25500`"\
            "`get_random_agent`" >> $logfile
        ((log_lines--))
    done
done

