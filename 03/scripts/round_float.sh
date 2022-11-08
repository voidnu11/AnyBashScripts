#!/bin/bash

_round_float() {
  if ! [[ $1 =~ ^[0] ]]; then
    local digit="${2}"; [[ "${2}" =~ ^[0-9]+$ ]] || digit="0"
    LC_ALL=C printf "%.${digit}f" "${1}"
  else
    echo "0"
  fi
}
