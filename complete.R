#### Project: Project 1 Coursera 
#### Course: "R Programming"
#### Author: Costa, S. 
#### Date: May, 2014

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating    
    ## MyDir = "C:\Users\BI\Documents\Coursera R\quiz2Work\Project\Project_1\specdata"
    
    ## variables defined:
    ## the location of the CSV files
    filesPath = directory
    pollutantType = pollutant
    csvFile = id
    nobs = c()    
        ## directory = "specdata"
        ## pollutant = "sulfate"
        ## id = 1
    filesSet <- list.files(filesPath)
    ## get a vector of complete file paths in the given 'directory'
    ## filesSetLocation <- dir(filePath, full.names = TRUE)[csvFile]
    ## SubSet based ID
    ## id = 1:2
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    filesSubSet <- filesSet[csvFile]
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
    if(length(filesSubSet) >= 1) {
        
        for (x in filesSubSet) {   
           
            filesSetLocation <- paste(filesPath, "/", x, sep = '')
            myDataSet <- read.csv(filesSetLocation, header = TRUE)
            nobs <- c(nobs, dim(myDataSet[complete.cases(myDataSet),])[1])  
            
        }                      
            myResultSet = data.frame(id,nobs)  
            myResultSet
    
        } else {
           
            "Warning: Can not find a CSV File"
        }
   
}


## EXEC
## complete("specdata", 1)

##   id nobs
## 1  1  117

## complete("specdata", c(2, 4, 8, 10, 12))

##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

## complete("specdata", 30:25)

##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

## complete("specdata", 3)

##   id nobs
## 1  3  243

## complete("specdata", )
##   id nobs

## complete("specdata", 291)

