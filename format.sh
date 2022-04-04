#!/bin/bash

PS3="Select a task to perform "

echo "Input filename"
read file

# Check if file exists
if [[ -f $file ]]
then
	# Create backup
	cp $file $file.bak
else
	echo "$file does not exist as a file on your system"
	echo "Please be sure to enter the relative or absolute path to the file"
	exit 1 
fi

select opt in 'Convert comma seperated words into a list' 'Convert texts to upper or lower case' 'Check for spelling errors'
do
	if [[ $REPLY == 1 ]]
	then
		bash scripts/comma.sh $file
		exit 0
	elif [[ $REPLY == 2 ]]
	then
		bash scripts/case.sh $file
		exit 0
	elif [[ $REPLY == 3 ]]
	then
		bash scripts/spelling.sh $file
		exit 0
	else
		echo -e "You selected a wrong option. \nTry again."
	fi
done
