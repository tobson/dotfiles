#!/bin/bash
function anaconda
{
    env=${1}
    [ -z ${env} ] && env=root
    activate=${HOME}/miniconda/bin/activate
    [ -f ${activate} ] && source ${activate} ${env}
}
