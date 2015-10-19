setwd("/Users/nilesh.pathak/Code/coursera/week2")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

        if(dir.exists(file.path(".",directory))){
                meanvector <- c()
                csvfiles <- list.files(file.path(".",directory))
                for(i in id){
                        csvdata <- read.csv(file.path(".",directory,csvfiles[i]))
                        goodvalues <- complete.cases(csvdata)
                        meanvector <- c(meanvector,csvdata[goodvalues,c(pollutant)])
                }
                result <- mean(meanvector)
                result
        }else{
                #NO DIRECTORY FOUND
        }

}
