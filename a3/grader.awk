awk 
BEGIN { FS="," }

# $1 -> student id
# $2 -> name
# $3 and on -> grades in the classes

# ignore the header row
NR > 1 {
	# second column is student name
	name = $2
	# initialize the scores to 0
	totalScores[name] = 0
	# add all the scores up
	for (i = 3; i <= NF; i++) {
	totalScores[name] += $i
	}
	
	#put the average scores in its own array
	averageScore[name] = avg(totalScores[name], NF - 2)
	
	#checks to see if they are passing or failing
	if( averageScore[name] >= 70){
		finalGrade[name] = "Pass"
	}
	else {
		finalGrade[name] = "Fail"
	}
	
	#highest and lowest scoring students
	
	#set the first student
	if(NR == 2){
		minScore = totalScores[name]
		maxScore = totalScores[name]
		highest = name
		lowest = name
	} #check the rest of the students
	else {
		if(totalScores[name] > maxScore) {
				maxScore = totalScores[name]
				highest = name
		}
		if(totalScores[name] < minScore) {
				minScore = totalScores[name]
				lowest = name
		}
	}
}

END {
	for (student in totalScores){
		print "Student name: ", student
		print "Total Score: ", totalScores[student]
		print "Average Score: ", averageScore[student]
		print "Status: ", finalGrade[student]
		print ""
	}
	print "Highest Scoring Student: ", highest
	print "Lowest Scoring Student: ", lowest
}

#calculate the average
function avg(sum, count) {
	return sum / count
}

