set -a
source ./color.conf

text_colors=(
    [1]="\033[37m"  # white
    [2]="\033[31m"  # red
    [3]="\033[32m"  # green
    [4]="\033[34m"  # blue
    [5]="\033[35m"  # purple
    [6]="\033[30m"  # black
)

bg_colors=(
    [1]="\033[47m"  # white
    [2]="\033[41m"  # red
    [3]="\033[42m"  # green
    [4]="\033[44m"  # blue
    [5]="\033[45m"  # purple
    [6]="\033[40m"  # black
)

colors_text=(
    [1]="white"  # white
    [2]="red"  # red
    [3]="green"  # green
    [4]="blue"  # blue
    [5]="purple"  # purple
    [6]="black"  # black
)

printInfo() {

cb1=${bg_colors[$1]}
cf1=${text_colors[$2]}
cb2=${bg_colors[$3]}
cf2=${text_colors[$4]}
reset="\033[0m"

data_formated=$(echo "$5" | awk -F" = " \
        -v cb1="$cb1" \
        -v cf1="$cf1" \
        -v cb2="$cb2" \
        -v cf2="$cf2" \
        -v res="$reset" '
    {
        print cb1 cf1 $1 res " = " cb2 cf2 $2 res
    }')

echo -e "$data_formated""\n"
}

printColorInfo() {
	cb1=$(if [[ "$1" -eq "$5" ]]; then echo "default"; else echo "$1"; fi)
	cf1=$(if [[ "$2" -eq "$6" ]]; then echo "default"; else echo "$2"; fi)
	cb2=$(if [[ "$3" -eq "$7" ]]; then echo "default"; else echo "$3"; fi)
	cf2=$(if [[ "$4" -eq "$8" ]]; then echo "default"; else echo "$4"; fi)
	echo "Column 1 background = $cb1 (${colors_text[$1]})"
	echo "Column 1 font color = $cf1 (${colors_text[$2]})"
	echo "Column 2 background = $cb2 (${colors_text[$3]})"
	echo "Column 2 font color = $cf2 (${colors_text[$4]})"
}
