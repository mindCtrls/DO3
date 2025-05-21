#!/bin/bash

source ./checkParam.sh
source ./getInfo.sh

start_time=$(date +%s)

haveParameters "$#"
checkFormatPath "$1"
isExistDirectory "$1"
getInformation "$1" "$start_time"

