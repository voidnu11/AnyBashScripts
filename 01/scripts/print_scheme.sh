#!/bin/bash

color_num() {
    if [[ $2 == "1" ]]; then
        echo "default"
    else
        echo $1
    fi
}

color_name() {
    case $1 in
        "1") echo "white";;
        "2") echo "red";;
        "3") echo "green";;
        "4") echo "blue";;
        "5") echo "purple";;
        "6") echo "black";;
    esac
}

printf "\n%s %s %s\n%s %s %s\n%s %s %s\n%s %s %s\n" \
        "Column 1 background =" "`color_num $s04_p1 $s04_df1`" "(`color_name $s04_p1`)" \
        "Column 1 font color =" "`color_num $s04_p2 $s04_df2`" "(`color_name $s04_p2`)" \
        "Column 2 background =" "`color_num $s04_p3 $s04_df3`" "(`color_name $s04_p3`)" \
        "Column 2 font color =" "`color_num $s04_p4 $s04_df4`" "(`color_name $s04_p4`)"

