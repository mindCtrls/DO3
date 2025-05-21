checkRange() {

for var in $@; do
	if [[ ! $var =~ ^[1-6]$ ]]; then
		echo "$var is wrong parameter"
		exit 1
	fi
done
}
