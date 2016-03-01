#!/bin/bash

pipupdate () {
    for cmd in pip3 pip2; do
        $cmd list --outdated | awk '{print $1}' | xargs $cmd install -U
    done
}
