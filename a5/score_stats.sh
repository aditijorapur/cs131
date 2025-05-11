#!/bin/bash

# Output file
OUTPUT="metadata.txt"

# Append section header
echo -e "\n\n=== Score Stats ===" >> $OUTPUT

# Loop over columns for Math (6), Reading (7), Writing (8)
for i in 6 7 8; do
    case $i in
        6) subject="Math";;
        7) subject="Reading";;
        8) subject="Writing";;
    esac

    echo -e "\n--- $subject Score Stats ---" >> $OUTPUT

    tail -n +2 studentperformaceofficial.csv | awk -F',' -v col=$i '
    {
        score = $col
        sum += score
        if (NR == 1 || score < min) min = score
        if (NR == 1 || score > max) max = score
    }
    END {
        print "Mean:", sum/NR
        print "Min:", min
        print "Max:", max
    }' >> $OUTPUT
done

