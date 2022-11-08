#!/bin/bash

echo "Insert >DATE< >TIME< begin"
echo "Example: >YYYY-MM-DD HH:MM<"
read from_date from_time
echo "Insert >DATE< >TIME< end"
echo "Example: >YYYY-MM-DD HH:MM<"
read to_date to_time

find / -newermt "$from_date $from_time" ! -newermt "$to_date $to_time" -delete 2>/dev/null

