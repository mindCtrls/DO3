#!/bin/bash

source ./checkParam.sh

haveParameters "$#"
paramIsText "$1"

param_value=$1
echo $param_value
