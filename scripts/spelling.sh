#!/bin/bash
# This script is currently beign worked on
exec 2>/dev/null

# Define dictionaries
dict[0]=/usr/share/dict/american-english
dict[1]=/usr/share/dict/british-english
dict[2]=/usr/share/dict/words
dict[3]=/usr/share/dict/cracklib-small
changed="False"
# Read file
file=$1

# Place file contents into an array
file_array=( `cat "$file"` )

# Create an array of characters
new_array=()
for word in ${file_array[@]}
do
	new_array+=(${word})
done

# Array to contain spelling errors
spelling_errors=()
n=0

# Check spelling in dictionary
for word in ${new_array[@]}
do
	if grep -qEi "(^| )$word( |\$)" ${dict[0]}||grep -qEi "(^| )$word( |\$)" ${dict[1]}||grep -qEi "(^| )$word( |\$)" ${dict[2]}||grep -qEi "(^| )$word( |\$)" ${dict[3]}
	then 
		
		continue
	else
		changed="True"
		spelling_errors[$n]="$word"
		((n++))
	fi
done

# Display spelling errors if present
if [[ $changed == "True" ]]
then
	if [[ ${#spelling_errors[@]} == 1 ]]
	then
		echo "The following word is incorrectly spelt: "
	else
		echo "The following words are incorrectly spelt: "
	fi
	for word in ${spelling_errors[@]}
	do
		echo "$word"
	done
else
	echo "No spelling errors were found"
fi
exit 0
