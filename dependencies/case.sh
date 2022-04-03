#!/bin/bash

# Read file
file=$1
new_file=$file.bk
sleep 1

PS3="Change text to upper or lowercase "
select option in uppercase lowercase
do
	if (( $REPLY == 1 ))
	then
		tr '[:lower:]' '[:upper:]' < $file >$new_file
		mv $new_file $file
		sleep 1
		echo "Task Complete!"
		exit 0
	elif (( $REPLY == 2 ))
	then
		tr '[:upper:]' '[:lower:]' < $file >$new_file
		mv $new_file $file
		echo "Task Comcplete!"
		exit 0
	else
		echo -e "Invalid option \nExiting program..."
		exit 1
	fi
done
