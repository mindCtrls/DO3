haveParameters() {

# Число параметров равно строго (4)
if [[ $1 -ne $2 ]] then
        if [[ $1 -eq 0 ]] then
                echo "Parameters not found"
		exit 1
        fi
	if [[ $1 -gt $2 ]] then
		echo "To many parameters"
		exit 1
	fi
	if [[ $1 -lt $2 ]] then
		echo "To few parameters"
		exit 1
	fi
fi
}


checkRange() {

for var in $@; do
	if [[ ! $var =~ ^[1-6]$ ]]; then
		echo "$var is wrong parameter"
		exit 1
	fi
done
}
