setwd("/Users/nilesh.pathak/Code/coursera/week2")
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!

        if(dir.exists(file.path(".",directory))){
                csvfiles <- list.files(file.path(".",directory))

                completecases <- complete(directory)

                data <- completecases$nobs > threshold
                iddata <- completecases$id[data]

                j <- 1
                corrvector <- c()

                for(i in iddata){
                        csvdata <- read.csv(file.path(".",directory,csvfiles[i]))
                        goodvalues <- complete.cases(csvdata)
                        csvdata <- csvdata[goodvalues,]
                        corrvector[j] <- cor(csvdata$sulfate,csvdata$nitrate)
                        j <- j + 1
                }

                result <- corrvector
                return(result)
        }else{
                #NO DIRECTORY FOUND
        }

}
