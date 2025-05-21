#!/bin/bash

source ./checkParam.sh
source ./getInfo.sh
source ./printModule.sh

haveParameters "$#" 4
checkRange "$@"
printInfo "$@" "$system_info"

