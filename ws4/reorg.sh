#!/bin/bash

#time and date
time=$(date "+%F-%T")

> "ws4.txt"

#go through each vendorid and store data in a file
for vendorid in 1.0 2.0 4.0; do
	#output file 
	output="${time}-${vendorid}.csv"
	#get the data: enteries corresponding to the vendorid
	grep -E "^$vendorid," "2019-01-h1.csv" > "$output"

	#make sure to put all the files in gitignore
	echo "$output" >> .gitignore
done

#add line count, word count, character count to ws4.txt
for vendorid in 1.0 2.0 4.0; do
	#define the name of the file
	output="${time}-${vendorid}.csv"
	#find the word count and other infornmation 
	wc "$output" >> "ws4.txt"
done

#add all the contents of gitignore
echo -e "\ngitignore contents:" >> "ws4.txt"
cat .gitignore >> "ws4.txt"
