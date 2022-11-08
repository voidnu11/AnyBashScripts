#!/bin/bash

if [[ $# != 0 ]]; then
    echo "Invalid input. Script does not accept parameters."; exit 1
else

    default_color() {
        case $1 in
          "1") echo "2";;
          "2") echo "1";;
          "3") echo "5";;
          "4") echo "1";;
        esac
    }

    parse_variable() {
        if [[ $2 =~ ^[1-6]$ ]] ; then
            export "s04_p"$1=$2
        else
            export "s04_p"$1=`default_color $1`
            export "s04_df"$1="1" # set default flag
        fi
    }

    source color_scheme.txt
    parse_variable 1 $column1_background
    parse_variable 2 $column1_font_color
    parse_variable 3 $column2_background
    parse_variable 4 $column2_font_color

    if [[ $s04_p1 == $s04_p2 ]]; then
        export "s04_p1"=`default_color 1`
        export "s04_p2"=`default_color 2`
        export "s04_df1"="1" # set default flag
        export "s04_df2"="1" # set default flag
    fi

    if [[ $s04_p3 == $s04_p4 ]]; then
        export "s04_p3"=`default_color 3`
        export "s04_p4"=`default_color 4`
        export "s04_df3"="1" # set default flag
        export "s04_df4"="1" # set default flag
    fi

    bash scripts/color_print.sh
fi

