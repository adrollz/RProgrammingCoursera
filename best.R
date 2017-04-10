best <- function(state, outcome) {

	possible_outcomes <- c("heart attack", "heart failure", "pneumonia")

	## Read outcome data
	outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

	## Check that state and outcome are valid
	if (!(state %in% outcome_file$State)) {
		stop("Invalid State")
		}
	if (!(outcome %in% possible_outcomes)) {
		stop("Invalid Outcome")
		}

	## Return hospital name in that state with lowest 30-day death
		
	## rate
	
}
