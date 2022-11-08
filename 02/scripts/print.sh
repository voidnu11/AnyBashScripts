#!/bin/bash

amounts=(
    "`bash scripts/amount_of.sh dir $1`"
    "`bash scripts/amount_of.sh files $1`"
    "`bash scripts/amount_of.sh conf $1`"
    "`bash scripts/amount_of.sh txt $1`"
    "`bash scripts/amount_of.sh exe $1`"
    "`bash scripts/amount_of.sh log $1`"
    "`bash scripts/amount_of.sh arch $1`"
    "`bash scripts/amount_of.sh links $1`"
)

printf "%s = %s\n" "Total number of folders (including all nested ones)" ${amounts[0]}

bash scripts/print_top_dirs.sh 5 $1

printf "%s = %s\n" "Total number of files" ${amounts[1]}
printf "%s\n" "Number of:"
printf "  %s = %s\n" "Configuration files (with the .conf extension)" ${amounts[2]}
printf "  %s = %s\n" "Text files" ${amounts[3]}
printf "  %s = %s\n" "Executable files" ${amounts[4]}
printf "  %s = %s\n" "Log files (with the extension .log)" ${amounts[5]}
printf "  %s = %s\n" "Archive files" ${amounts[6]}
printf "  %s = %s\n" "Symbolic links" ${amounts[7]}

bash scripts/print_top_maxsize_files.sh 10 $1

bash scripts/print_top_maxsize_exe.sh 10 $1
