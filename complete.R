complete <- function(directory, id =  1:332) {
  
  compcase <- data.frame("id"=0,"nobs"=0)
  counta <- 1
  
  for(monitor in id) {
    # add one or two zeros to ID so that they match the CSV file names
    filenames <- sprintf("%03d.csv", monitor)
    
    # path to specdata folder
    # if no path is provided, default is working directory
    filedir <- file.path(directory, filenames)
    
    # get the data from selected ID or IDs from the specified path
    dataset <- read.csv(filedir, header = TRUE)
    
    # number of complete cases
    compcase[counta,1] = monitor
    compcase[counta,2] = length(which(complete.cases(dataset) == TRUE))
    
    counta = counta + 1
  }
  
  # return data frame
  compcase
  
}