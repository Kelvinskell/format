#!/bin/bash
# Convert comma-seperated words into a list

# Read filename
file=$1

# Check if file meets criteria
if $(egrep -q [a-z]+, $file)
then
	:
else
	echo -e "$file does not meet desired criteria for this action. \nExiting..."
	exit
fi

# Initialise an infinite loop
for (( ; ; ))
do
	# Cut each comma-separated word out of the file and pass to variable 'cut'
	# Delete commas from the original file, one after the other 
	cut=`cut -d ',' -f1 $file`
        sed -i "s/\,//" $file

	# Place each word on a new line in a new file
        echo $cut >> $file"1"

	# Delete word from original file
        sed -i "s/$cut//" $file

	# Delete any newline in the file
	sed -i '/^[[:space:]]*$/d' $file

	# Conditional to check if file is empty
	if [ -s $file ]
	then
		:
	else
		echo "Task Complete!"

		# Substitute new file into original file
		mv $file"1" $file
		break
	fi
done
