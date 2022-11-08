#!/bin/bash

set_bg_color() {
    case $1 in
        "1") export $2="\033[107m";; # white
        "2") export $2="\033[41m";;  # red
        "3") export $2="\033[42m";;  # green
        "4") export $2="\033[44m";;  # blue
        "5") export $2="\033[45m";;  # purple
        "6") export $2="\033[40m";;  # black
    esac
}

set_font_color() {
    case $1 in
        "1") export $2="\033[97m";;  # white
        "2") export $2="\033[31m";;  # red
        "3") export $2="\033[32m";;  # green
        "4") export $2="\033[34m";;  # blue
        "5") export $2="\033[35m";;  # purple
        "6") export $2="\033[30m";;  # black
    esac
}

set_bg_color $s04_p1 "s03_p1"
set_bg_color $s04_p3 "s03_p3"
set_font_color $s04_p2 "s03_p2"
set_font_color $s04_p4 "s03_p4"

bash scripts/print.sh
bash scripts/print_scheme.sh

