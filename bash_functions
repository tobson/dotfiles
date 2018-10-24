#!/bin/bash

function pipupdate {
    cmd=${1:-pip}
    $cmd install -U pip
    $cmd list --format=freeze --outdated \
        | awk -F '=' '{print $1}' | xargs $cmd install -U
}

function pip23update {
    for cmd in pip3 pip2; do
        pipupdate $cmd
    done
}
