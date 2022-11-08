#!/bin/bash

declare -a METHODS=(
    "GET"
    "POST"
    "PUT"
    "DELETE"
    "PATCH"
)

get_random_method() {
    metid=$((RANDOM % ${#METHODS[@]}))
    echo ${METHODS[$metid]}
}
