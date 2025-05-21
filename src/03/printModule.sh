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

printInfo() {

column1_background=${bg_colors[$1]}
column1_font_color=${text_colors[$2]}
column2_background=${bg_colors[$3]}
column2_font_color=${text_colors[$4]}
reset="\033[0m"

data_formated=$(echo "$5" | awk -F" = " \
        -v cb1="$column1_background" \
        -v cf1="$column1_font_color" \
        -v cb2="$column2_background" \
        -v cf2="$column2_font_color" \
        -v res="$reset" '
    {
        print cb1 cf1 $1 res " = " cb2 cf2 $2 res
    }')

echo -e "$data_formated"
}
