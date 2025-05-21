#!/bin/bash

source ./getInfo.sh
source ./checkParam.sh
source ./printModule.sh
source ./color.conf

cb1=${column1_background:-$default_column1_background}
cf1=${column1_font_color:-$default_column1_font_color}
cb2=${column2_background:-$default_column2_background}
cf2=${column2_font_color:-$default_column2_font_color}

current_color=(
	[1]="$cb1"
	[2]="$cf1"
	[3]="$cb2"
	[4]="$cf2"
)

default_color=(
	[1]="$default_column1_background"
	[2]="$default_column1_font_color"
	[3]="$default_column2_background"
	[4]="$default_column2_font_color"
)


checkRange "${current_color[@]}"
printInfo "${current_color[@]}" "$system_info"
printColorInfo "${current_color[@]}" "${default_color[@]}"

