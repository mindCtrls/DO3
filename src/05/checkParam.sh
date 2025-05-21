haveParameters() {

# Число параметров равно 1
if [[ $1 -ne 1 ]] then
        if [[ $1 -eq 0 ]] then
                echo "Parameters not found"
        else
                echo "To many parameters"
        fi
        exit 1
fi
}

checkFormatPath() {

if [[ ! $1 =~ /$ ]]; then
	echo "Wrong path format"
	exit 1
fi
}

isExistDirectory() {

if [[ ! -d "$1" ]]; then
	echo "Directory is not exist"
	exit 1
fi

}
