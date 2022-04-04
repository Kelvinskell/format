#!/bin/bash
# This script is currently beign worked on
exec 2>/dev/null

read file

# Place file contents into an array
file_array=( `cat "$file"` )
echo ${file_array[@]}
echo ${#file_array[*]}

# Create an array of lowercase and uppercase  characters
new_array1=()
new_array2=()
new_array3=()
for word in ${file_array[@]}
do
	new_array1+=(${word,,})
	new_array2+=(${word^^})
	new_array3+=(${word^})
done

# list to contain spelling errors
spell=()
n=0

for word in ${new_array1[@]}
do
	if grep -qE "(^| )$word( |\$)" /usr/share/dict/american-english||grep -qE "(^| )$word( |\$)" /usr/share/british-english
	then 
		
		continue
	else
		spell[$n]="$word"
		((n++))
	fi
done
