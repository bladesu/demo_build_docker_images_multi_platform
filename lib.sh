#!/bin/bash
declare -a log_level=( 
    "_[MAIN]__:"
    "_[ERROR]_:"
    )

function print_log {
    echo ${log_level[$1]} $2
}

function log {
    print_log 0 "$1"
}
function error {
    print_log 1 "$1"
}