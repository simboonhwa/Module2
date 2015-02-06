pollutantmean <- function(directory="specdata", pollutant="sulfate", id = 1:332) {

	source("consolidateDF.R")
	MYTABLE <- consolidateDF(directory, id)
	
	# compute the mean of pollutant and round to 3 decimals place	
	round(mean(MYTABLE[[pollutant]], na.rm=TRUE), digits=3)

}
