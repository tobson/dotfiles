#!/bin/bash
function anaconda
{
    env=${1}
    [ -z ${env} ] && env=root
    activate=${HOME}/anaconda/bin/activate
    [ -f ${activate} ] && source ${activate} ${env}
}
