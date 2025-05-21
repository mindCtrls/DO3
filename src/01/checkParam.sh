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


paramIsText() {

# Проверка на число ли это	
if [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] then
	echo "Parameter is number"
	exit 1
fi
}

