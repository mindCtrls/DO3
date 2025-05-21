isSave() {

if [[ $1 == "Y" || $1 == "y" ]]; then
	name_file=$(date +"%d_%m_%y_%H_%M_%S")
	name_file="$name_file.status"
	echo "$2" >> "$name_file"
fi	
	
}
