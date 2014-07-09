#!/bin/bash
function anaconda
{
    env=${1}
    [ -z ${env} ] && env=root
    source ${HOME}/anaconda/bin/activate ${env}
}
