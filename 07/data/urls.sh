#!/bin/bash

declare -a URLS=(
    "/"
    "/index.php"
    "/index.php?qwerty=123"
    "/index.php/thread?id=55"
    "/index/"
    "/index/blog"
    "/index/blog/7/1"
    "/index/blog/105/42"
    "/index/blog/54/30"
    "/index/blog/16/5"
    "/questions/11150452/"
    "/questions/11044601/"
    "/questions/104441/"
    "/questions/211494/"
    "/questions/711424408/"
    "/questions/41144345408/"
    "/questions/5141708/"
    "/questions/1145418/"
    "/questions/1111845308/"
    "/about"
    "/test.php"
    "/dashboard"
    "/admin"
    "/news"
    "/news/124/1"
    "/news/526/52"
    "/news/10/6"
    "/forum/index.php?thread=1002"
)

get_random_url() {
    urid=$((RANDOM % ${#URLS[@]}))
    echo ${URLS[$urid]}
}

