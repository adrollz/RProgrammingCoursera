pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  sumpollutant <- 0
  countpollutant <- 0
  
  for(monitor in id) {
    # add one or two zeros to ID so that they match the CSV file names
    filenames <- sprintf("%03d.csv", monitor)
    
    # path to specdata folder
    # if no path is provided, default is working directory
    filedir <- file.path(directory, filenames)
    
    # get the data from selected ID or IDs from the specified path
    dataset <- read.csv(filedir, header = TRUE)
    
    # sum on pollutant removing all NAs
    sumpollutant <- sumpollutant + sum(dataset[[pollutant]], na.rm = TRUE)
    
    # count on pollutant
    countpollutant <- countpollutant + length(which(!is.na(dataset[[pollutant]])))
  }
  
  # return mean
  sumpollutant / countpollutant
  
}