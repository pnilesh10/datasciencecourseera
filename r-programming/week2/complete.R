setwd("/Users/nilesh.pathak/Code/coursera/week2")
complete <- function(directory, id = 1:332)  {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        if(dir.exists(file.path(".",directory))){
                completecases <- c()
                csvfiles <- list.files(file.path(".",directory))
                j <- 1
                for(i in id){
                        csvdata <- read.csv(file.path(".",directory,csvfiles[i]))
                        completecases[j] <- sum(complete.cases(csvdata))
                        j <- j + 1
                }
                result <- data.frame(id = id,nobs = completecases)
                return(result)
        }else{
                #NO DIRECTORY FOUND
        }

}
