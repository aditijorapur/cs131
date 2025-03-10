#!/bin/bash

#the directory we are using
DIRECTORY=$1

# create an array to store the counts of the files
declare -A COUNTS

# Loop through all the files in the directory
for FILE in "$DIRECTORY"/*; do
    # make sure its a file
    if [ -f "$FILE" ]; then
        # get the extention by choppping off the filename and keeping everything after the dot
        EXT="${FILE##*.}"
        # increment the count of the file
        ((COUNTS["$EXT"]++))
    fi
done

# print out the counts
echo "Counts of the file types in - $DIRECTORY:"
for EXT in "${!COUNTS[@]}"; do
    echo "$EXT: ${COUNTS[$EXT]}"
done
