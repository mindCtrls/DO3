#!/bin/bash

source ./getInfo.sh
source ./saveModule.sh

echo -e "$system_info \n"

echo "Are you wanna save it in file? (Y/N)"
read vote

isSave "$vote" "$system_info"

