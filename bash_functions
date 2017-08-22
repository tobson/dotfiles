#!/bin/bash

function pipupdate {
    cmd=${1:-pip}
    $cmd list --format=legacy --outdated \
        | awk '{print $1}' | xargs $cmd install -U
}

function pip23update {
    for cmd in pip3 pip2; do
        pipupdate $cmd
    done
}
