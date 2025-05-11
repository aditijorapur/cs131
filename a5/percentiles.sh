#!/bin/bash

# Output file
OUTPUT="metadata.txt"
INPUT="studentperformaceofficial.csv"

# Add section header
echo -e "\n\n Score Percentiles" >> $OUTPUT

# Score columns: 6 = math, 7 = reading, 8 = writing
declare -A subjects=([6]="Math" [7]="Reading" [8]="Writing")

# Generate percentiles for each subject
for i in 6 7 8; do
    subject=${subjects[$i]}
    scores_file="${subject,,}_scores.txt" 

    # sort the file
    tail -n +2 "$INPUT" | awk -F',' -v col=$i '{print $col}' | sort -n > $scores_file

    # Append percentiles to metadata
    echo -e "\n--- $subject Score Percentiles ---" >> $OUTPUT
    awk '{
        scores[NR] = $1
    }
    END {
        n = asort(scores)
        p25 = scores[int(0.25 * n + 0.5)]
        p50 = scores[int(0.50 * n + 0.5)]
        p75 = scores[int(0.75 * n + 0.5)]
        print "25th percentile:", p25
        print "50th percentile:", p50
        print "75th percentile:", p75
    }' $scores_file >> $OUTPUT
done
