#!/bin/bash

folders=()
date=$(date +"%d-%m-%y")

echo "|----------------------|"
echo "| 1 - Full backup      |"
echo "| 2 - Selected backup  |"
echo "| 0 - Exit             |"
echo "|----------------------|"
read -p "Enter an option: " option
if [[ $option == "1" ]];then
	echo ""
	archive="backup_all_$date"
	tar -cvzf "$archive.tar.gz" --exclude ".backup.sh" --exclude "." * 
	echo "File tar created!"
	echo ""
fi
if [[ $option == "2" ]];then
	echo ""
	echo "|-------------------------------------------------|"
	echo "|Enter the name of the folders you want to backup.|"
	echo "|-------------------------------------------------|"
	echo ""
	while true; do
		read -p "Enter folder name (or leave blank to exit): " folder
		if [[ -z "$folder" ]]; then
			break 
		fi
			folders+=("$folder")
	done
	read -p "Enter the name of the tar file: " name
	tar -czvf "$name""_""$date.tar.gz" "${folders[@]}"
	echo "File tar created"

	if [[ ${#folders[@]} -eq 0 ]]; then
	    echo "No folder entered. Closing the script..."
	    sleep 1
	    exit 0
	fi
fi
if [[ $option == "0" ]];then
	echo "Exiting..."
	sleep 1
fi
