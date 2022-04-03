#!/bin/bash
# Convert comma-seperated words into a list

n=1
# Read filename
echo "Input file name"
read file

# Initialise an infinite loop
for (( ; ; ))
do
	echo $n
	((n++))
	# Cut each comma-separated word out of the file
	# Delete commas from the file, one after the other
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
		echo "Not done"
	else
		echo "done"

		# Substitute new file into original file
		mv $file"1" $file
		exit
	fi
done

