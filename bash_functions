#!/bin/bash

pathmunge () {
    if [[ -d $1 ]]; then
        if [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
            if [[ $2 = after ]]; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
}
