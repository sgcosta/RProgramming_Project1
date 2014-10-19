#### Project: Project 1 Coursera 
#### Course: "R Programming"
#### Author: Costa, S. 
#### Date: May, 2014


corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    ## Return a numeric vector of correlations
    
    filesPath = directory
    filesSet <- list.files(filesPath)
    
    numCorr <- c() 
    
    for( x in filesSet ){
        
        filesSetLocation <- paste( filesPath, "/", x, sep = '' )
        myDataSet <- read.csv( filesSetLocation, header = TRUE )
        
        ## use complete function
        myDataSet <- myDataSet[complete.cases(myDataSet),]
        
        sulfate <- myDataSet[,2]
        nitrate <- myDataSet[,3]
        
        if ( nrow(myDataSet) > threshold ) {
            
            numCorr <- c(numCorr, cor(sulfate, nitrate) ) 
        }
    }
    
    return( numCorr )
}