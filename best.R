best <- function(state, outcome) {

	possible_outcomes <- c("heart attack", "heart failure", "pneumonia")
	
	## Define outcome column to be used in calc
	outcome_col <- NULL
	if (outcome == "heart attack") {outcome_col = 11}
	if (outcome == "heart failure") {outcome_col = 17}
	if (outcome == "pneumonia") {outcome_col = 23}

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
	state_sub <- subset(outcome_file, State==state)	## Subset data by State
	min_sub <- aggregate(as.numeric(state_sub[,outcome_col]),state_sub["Hospital.Name"],min, na.rm = TRUE) ## Store min values
	order_list <- min_sub[with(min_sub, order(x)),] ## Sort data by lowest to highest mortality
	hosp_name <- order_list[1,]$Hospital.Name
	return(hosp_name)
	

	## rate
	
}
