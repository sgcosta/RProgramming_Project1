#### Project: Project 1 Coursera 
#### Course: "R Programming"
#### Author: Costa, S. 
#### Date: May, 2014


pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating    
        ## MyDir = "C:\Users\BI\Documents\Coursera R\quiz2Work\Project\Project_1\specdata"
    
    ## variables defined:
    filesPath = directory
    pollutantType = pollutant
    csvFile = id
    ## the location of the CSV files
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
   
    ## CSV structure (Data Frame):
        ## "Date" date type
        ## "sulfate" numeric type
        ## "nitrate" numeric type
        ## "ID" numeric type
            ## example: "2003-01-01", NA, NA, 332
    CSVstructure <- data.frame(  Date       = as.Date(character()),
                                 sulfate    = numeric(),
                                 nitrate    = numeric(),
                                 ID         = numeric()
                               )
    ## Load Data to CSV structure Data Frame 
        ## filesSubSet = c("001.csv", "002.csv", "003.csv")
    if(length(filesSubSet) >= 1) {
        
        for (x in filesSubSet) {   
            filesSetLocation <- paste(filesPath,"/", x, sep = '')
            CSVstructure <- rbind(CSVstructure, read.csv(filesSetLocation))
        } 
    
    
    ## count the number of rows using nrow() or NROW(): count nrow(CSVstructure) or without NROW(na.omit(CSVstructure))
    ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will calculate the mean; either "sulfate" or "nitrate".
    ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
    MyDataSet <- CSVstructure[ , pollutantType] 
    mean(MyDataSet, na.rm = TRUE)
        ##summary(MyDataSet, na.rm = TRUE)
        ##max(MyDataSet, na.rm = TRUE)
        ##min(MyDataSet, na.rm = TRUE)
    } else {
       
        "Warning: Can not find a CSV File"
    
    }

}

##exec
## pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
## pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
## pollutantmean("specdata", "nitrate", 23)
## [1] 1.281
## pollutantmean("specdata", "sulfate", 70:72)
## [1] 0.9501894
## pollutantmean("specdata", "sulfate", 23)
## [1] 0.8310505
## pollutantmean("specdata", "sulfate", 1:332)
## [1] 3.189369
## pollutantmean("specdata", "sulfate",)
## [1] 3.189369
## pollutantmean("specdata", "nitrate", 1:332)
## [1] 1.702932
## pollutantmean("specdata", "nitrate",)
## [1] 1.702932
## pollutantmean("specdata", "nitrate", 0)
## [1] "Warning: Can not find a CSV File"
## pollutantmean("specdata", "nitrate", 1)
## [1] 0.5499098



